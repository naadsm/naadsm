/** @file exposure-monitor.c
 * Tracks the cause of exposures.
 *
 * @author Neil Harvey <neilharvey@gmail.com><br>
 *   Department of Computing & Information Science, University of Guelph<br>
 *   Guelph, ON N1G 2W1<br>
 *   CANADA
 * @version 0.1
 * @date August 2004
 *
 * Copyright &copy; University of Guelph, 2004-2010
 * 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option)
 * any later version.
 */

#if HAVE_CONFIG_H
#  include <config.h>
#endif

/* To avoid name clashes when multiple modules have the same interface. */
#define new exposure_monitor_new
#define run exposure_monitor_run
#define reset exposure_monitor_reset
#define events_listened_for exposure_monitor_events_listened_for
#define is_listening_for exposure_monitor_is_listening_for
#define has_pending_actions exposure_monitor_has_pending_actions
#define to_string exposure_monitor_to_string
#define local_printf exposure_monitor_printf
#define local_fprintf exposure_monitor_fprintf
#define local_free exposure_monitor_free
#define handle_before_any_simulations_event exposure_monitor_handle_before_any_simulations_event
#define handle_new_day_event exposure_monitor_handle_new_day_event
#define handle_declaration_of_exposure_causes_event exposure_monitor_handle_declaration_of_exposure_causes_event
#define handle_exposure_event exposure_monitor_handle_exposure_event

#include "model.h"

#if STDC_HEADERS
#  include <string.h>
#endif

#include "exposure-monitor.h"

/** This must match an element name in the DTD. */
#define MODEL_NAME "exposure-monitor"



#define NEVENTS_LISTENED_FOR 4
EVT_event_type_t events_listened_for[] =
  { EVT_BeforeAnySimulations, EVT_NewDay, EVT_DeclarationOfExposureCauses, EVT_Exposure };



extern const char *RPT_frequency_name[];



/** Specialized information for this model. */
typedef struct
{
  GPtrArray *production_types;
  RPT_reporting_t *num_units_exposed;
  RPT_reporting_t *num_units_exposed_by_cause;
  RPT_reporting_t *num_units_exposed_by_prodtype;
  RPT_reporting_t *num_units_exposed_by_cause_and_prodtype;
  RPT_reporting_t *cumul_num_units_exposed;
  RPT_reporting_t *cumul_num_units_exposed_by_cause;
  RPT_reporting_t *cumul_num_units_exposed_by_prodtype;
  RPT_reporting_t *cumul_num_units_exposed_by_cause_and_prodtype;
  RPT_reporting_t *num_animals_exposed;
  RPT_reporting_t *num_animals_exposed_by_cause;
  RPT_reporting_t *num_animals_exposed_by_prodtype;
  RPT_reporting_t *num_animals_exposed_by_cause_and_prodtype;
  RPT_reporting_t *cumul_num_animals_exposed;
  RPT_reporting_t *cumul_num_animals_exposed_by_cause;
  RPT_reporting_t *cumul_num_animals_exposed_by_prodtype;
  RPT_reporting_t *cumul_num_animals_exposed_by_cause_and_prodtype;
  RPT_reporting_t *num_adequate_exposures;
  RPT_reporting_t *cumul_num_adequate_exposures;
}
local_data_t;



/**
 * Before any simulations, this module announces the output variables it is
 * recording.
 *
 * @param self this module.
 * @param queue for any new events this function creates.
 */
void
handle_before_any_simulations_event (struct naadsm_model_t_ *self,
                                     EVT_event_queue_t *queue)
{
  unsigned int n, i;
  RPT_reporting_t *output;
  GPtrArray *outputs = NULL;

  n = self->outputs->len;
  for (i = 0; i < n; i++)
    {
      output = (RPT_reporting_t *) g_ptr_array_index (self->outputs, i);
      if (output->frequency != RPT_never)
        {
          if (outputs == NULL)
            outputs = g_ptr_array_new();
          g_ptr_array_add (outputs, output);
        }
    }

  if (outputs != NULL)
    EVT_event_enqueue (queue, EVT_new_declaration_of_outputs_event (outputs));
  /* We don't free the pointer array, that will be done when the event is freed
   * after all interested modules have processed it. */

  return;
}



/**
 * On each new day, zero the daily counts of exposures.
 *
 * @param self the model.
 */
void
handle_new_day_event (struct naadsm_model_t_ *self)
{
  local_data_t *local_data;

#if DEBUG
  g_debug ("----- ENTER handle_new_day_event (%s)", MODEL_NAME);
#endif

  local_data = (local_data_t *) (self->model_data);

  /* Zero the daily counts. */
  RPT_reporting_zero (local_data->num_units_exposed);
  RPT_reporting_zero (local_data->num_units_exposed_by_cause);
  RPT_reporting_zero (local_data->num_units_exposed_by_prodtype);
  RPT_reporting_zero (local_data->num_units_exposed_by_cause_and_prodtype);
  RPT_reporting_zero (local_data->num_animals_exposed);
  RPT_reporting_zero (local_data->num_animals_exposed_by_cause);
  RPT_reporting_zero (local_data->num_animals_exposed_by_prodtype);
  RPT_reporting_zero (local_data->num_animals_exposed_by_cause_and_prodtype);
  RPT_reporting_zero (local_data->num_adequate_exposures);

#if DEBUG
  g_debug ("----- EXIT handle_new_day_event (%s)", MODEL_NAME);
#endif
}



/**
 * Responds to a declaration of exposure causes by recording the potential
 * causes of exposure.
 *
 * @param self the model.
 * @param event a declaration of exposure causes event.
 */
void
handle_declaration_of_exposure_causes_event (struct naadsm_model_t_ *self,
                                             EVT_declaration_of_exposure_causes_event_t * event)
{
  local_data_t *local_data;
  unsigned int n, i, j;
  char *cause;
  const char *drill_down_list[3] = { NULL, NULL, NULL };

#if DEBUG
  g_debug ("----- ENTER handle_declaration_of_exposure_causes_event (%s)", MODEL_NAME);
#endif

  local_data = (local_data_t *) (self->model_data);

  /* If any potential cause is not already present in our reporting variables,
   * add it, with an initial count of 0 exposures. */
  n = event->causes->len;
  for (i = 0; i < n; i++)
    {
      cause = (char *) g_ptr_array_index (event->causes, i);
      RPT_reporting_add_integer1 (local_data->num_units_exposed_by_cause, 0, cause);
      RPT_reporting_add_integer1 (local_data->cumul_num_units_exposed_by_cause, 0, cause);
      RPT_reporting_add_integer1 (local_data->num_animals_exposed_by_cause, 0, cause);
      RPT_reporting_add_integer1 (local_data->cumul_num_animals_exposed_by_cause, 0, cause);

      drill_down_list[0] = cause;
      for (j = 0; j < local_data->production_types->len; j++)
        {
          drill_down_list[1] = (char *) g_ptr_array_index (local_data->production_types, j);
          RPT_reporting_add_integer (local_data->num_units_exposed_by_cause_and_prodtype, 0, drill_down_list);
          RPT_reporting_add_integer (local_data->cumul_num_units_exposed_by_cause_and_prodtype, 0,
                                     drill_down_list);
          RPT_reporting_add_integer (local_data->num_animals_exposed_by_cause_and_prodtype, 0,
                                     drill_down_list);
          RPT_reporting_add_integer (local_data->cumul_num_animals_exposed_by_cause_and_prodtype, 0,
                                     drill_down_list);
        }
    }

#if DEBUG
  g_debug ("----- EXIT handle_declaration_of_exposure_causes_event (%s)", MODEL_NAME);
#endif
}



/**
 * Responds to an exposure event by recording it.
 *
 * @param self the model.
 * @param event an exposure event.
 */
void
handle_exposure_event (struct naadsm_model_t_ *self, EVT_exposure_event_t * event)
{
  local_data_t *local_data;
  HRD_herd_t *exposing_herd, *exposed_herd;
  const char *drill_down_list[3] = { NULL, NULL, NULL };
  
#if DEBUG
  g_debug ("----- ENTER handle_exposure_event (%s)", MODEL_NAME);
#endif

  local_data = (local_data_t *) (self->model_data);

  if (event->traceable)
    {
      exposing_herd = event->exposing_herd;
      exposed_herd = event->exposed_herd;
      g_assert (exposing_herd != NULL && exposed_herd != NULL);

      /* Update the counts of exposures. */
      RPT_reporting_add_integer  (local_data->num_units_exposed, 1, NULL);
      RPT_reporting_add_integer1 (local_data->num_units_exposed_by_cause, 1, event->cause);
      RPT_reporting_add_integer1 (local_data->num_units_exposed_by_prodtype, 1, exposed_herd->production_type_name);
      RPT_reporting_add_integer  (local_data->num_animals_exposed, exposed_herd->size, NULL);
      RPT_reporting_add_integer1 (local_data->num_animals_exposed_by_cause, exposed_herd->size, event->cause);
      RPT_reporting_add_integer1 (local_data->num_animals_exposed_by_prodtype, exposed_herd->size, exposed_herd->production_type_name);
      RPT_reporting_add_integer  (local_data->cumul_num_units_exposed, 1, NULL);
      RPT_reporting_add_integer1 (local_data->cumul_num_units_exposed_by_cause, 1, event->cause);
      RPT_reporting_add_integer1 (local_data->cumul_num_units_exposed_by_prodtype, 1, exposed_herd->production_type_name);
      RPT_reporting_add_integer  (local_data->cumul_num_animals_exposed, exposed_herd->size, NULL);
      RPT_reporting_add_integer1 (local_data->cumul_num_animals_exposed_by_cause, exposed_herd->size,
                                  event->cause);
      RPT_reporting_add_integer1 (local_data->cumul_num_animals_exposed_by_prodtype, exposed_herd->size,
                                  exposed_herd->production_type_name);
      drill_down_list[0] = event->cause;
      drill_down_list[1] = exposed_herd->production_type_name;
      if (local_data->num_units_exposed_by_cause_and_prodtype->frequency != RPT_never)
        RPT_reporting_add_integer (local_data->num_units_exposed_by_cause_and_prodtype, 1, drill_down_list);
      if (local_data->num_animals_exposed_by_cause_and_prodtype->frequency != RPT_never)
        RPT_reporting_add_integer (local_data->num_animals_exposed_by_cause_and_prodtype, exposed_herd->size,
                                   drill_down_list);
      if (local_data->cumul_num_units_exposed_by_cause_and_prodtype->frequency != RPT_never)
        RPT_reporting_add_integer (local_data->cumul_num_units_exposed_by_cause_and_prodtype, 1, drill_down_list);
      if (local_data->cumul_num_animals_exposed_by_cause_and_prodtype->frequency != RPT_never)
        RPT_reporting_add_integer (local_data->cumul_num_animals_exposed_by_cause_and_prodtype,
                                   exposed_herd->size, drill_down_list);
    }
  if (event->adequate)
    {
      RPT_reporting_add_integer (local_data->num_adequate_exposures, 1, NULL);
      RPT_reporting_add_integer (local_data->cumul_num_adequate_exposures, 1, NULL);
    }

#if DEBUG
  g_debug ("----- EXIT handle_exposure_event (%s)", MODEL_NAME);
#endif
}



/**
 * Runs this model.
 *
 * @param self the model.
 * @param herds a herd list.
 * @param zones a zone list.
 * @param event the event that caused the model to run.
 * @param rng a random number generator.
 * @param queue for any new events the model creates.
 */
void
run (struct naadsm_model_t_ *self, HRD_herd_list_t * herds, ZON_zone_list_t * zones,
     EVT_event_t * event, RAN_gen_t * rng, EVT_event_queue_t * queue)
{
#if DEBUG
  g_debug ("----- ENTER run (%s)", MODEL_NAME);
#endif

  switch (event->type)
    {
    case EVT_BeforeAnySimulations:
      handle_before_any_simulations_event (self, queue);
      break;
    case EVT_NewDay:
      handle_new_day_event (self);
      break;
    case EVT_DeclarationOfExposureCauses:
      handle_declaration_of_exposure_causes_event (self,
                                                   &(event->u.declaration_of_exposure_causes));
      break;
    case EVT_Exposure:
      handle_exposure_event (self, &(event->u.exposure));
      break;
    default:
      g_error
        ("%s has received a %s event, which it does not listen for.  This should never happen.  Please contact the developer.",
         MODEL_NAME, EVT_event_type_name[event->type]);
    }

#if DEBUG
  g_debug ("----- EXIT run (%s)", MODEL_NAME);
#endif
}



/**
 * Resets this model after a simulation run.
 *
 * @param self the model.
 */
void
reset (struct naadsm_model_t_ *self)
{
  local_data_t *local_data;

#if DEBUG
  g_debug ("----- ENTER reset (%s)", MODEL_NAME);
#endif

  local_data = (local_data_t *) (self->model_data);
  RPT_reporting_zero (local_data->cumul_num_units_exposed);
  RPT_reporting_zero (local_data->cumul_num_units_exposed_by_cause);
  RPT_reporting_zero (local_data->cumul_num_units_exposed_by_prodtype);
  RPT_reporting_zero (local_data->cumul_num_units_exposed_by_cause_and_prodtype);
  RPT_reporting_zero (local_data->cumul_num_animals_exposed);
  RPT_reporting_zero (local_data->cumul_num_animals_exposed_by_cause);
  RPT_reporting_zero (local_data->cumul_num_animals_exposed_by_prodtype);
  RPT_reporting_zero (local_data->cumul_num_animals_exposed_by_cause_and_prodtype);
  RPT_reporting_zero (local_data->cumul_num_adequate_exposures);

#if DEBUG
  g_debug ("----- EXIT reset (%s)", MODEL_NAME);
#endif
}



/**
 * Reports whether this model is listening for a given event type.
 *
 * @param self the model.
 * @param event_type an event type.
 * @return TRUE if the model is listening for the event type.
 */
gboolean
is_listening_for (struct naadsm_model_t_ *self, EVT_event_type_t event_type)
{
  int i;

  for (i = 0; i < self->nevents_listened_for; i++)
    if (self->events_listened_for[i] == event_type)
      return TRUE;
  return FALSE;
}



/**
 * Reports whether this model has any pending actions to carry out.
 *
 * @param self the model.
 * @return TRUE if the model has pending actions.
 */
gboolean
has_pending_actions (struct naadsm_model_t_ * self)
{
  return FALSE;
}



/**
 * Returns a text representation of this model.
 *
 * @param self the model.
 * @return a string.
 */
char *
to_string (struct naadsm_model_t_ *self)
{
  GString *s;
  char *chararray;

  s = g_string_new (NULL);
  g_string_sprintf (s, "<%s>", MODEL_NAME);

  /* don't return the wrapper object */
  chararray = s->str;
  g_string_free (s, FALSE);
  return chararray;
}



/**
 * Prints this model to a stream.
 *
 * @param stream a stream to write to.
 * @param self the model.
 * @return the number of characters printed (not including the trailing '\\0').
 */
int
local_fprintf (FILE * stream, struct naadsm_model_t_ *self)
{
  char *s;
  int nchars_written;

  s = to_string (self);
  nchars_written = fprintf (stream, "%s", s);
  free (s);
  return nchars_written;
}



/**
 * Prints this model.
 *
 * @param self the model.
 * @return the number of characters printed (not including the trailing '\\0').
 */
int
local_printf (struct naadsm_model_t_ *self)
{
  return local_fprintf (stdout, self);
}



/**
 * Frees this model.
 *
 * @param self the model.
 */
void
local_free (struct naadsm_model_t_ *self)
{
  local_data_t *local_data;

#if DEBUG
  g_debug ("----- ENTER free (%s)", MODEL_NAME);
#endif

  /* Free the dynamically-allocated parts. */
  local_data = (local_data_t *) (self->model_data);
  RPT_free_reporting (local_data->num_units_exposed);
  RPT_free_reporting (local_data->num_units_exposed_by_cause);
  RPT_free_reporting (local_data->num_units_exposed_by_prodtype);
  RPT_free_reporting (local_data->num_units_exposed_by_cause_and_prodtype);
  RPT_free_reporting (local_data->cumul_num_units_exposed);
  RPT_free_reporting (local_data->cumul_num_units_exposed_by_cause);
  RPT_free_reporting (local_data->cumul_num_units_exposed_by_prodtype);
  RPT_free_reporting (local_data->cumul_num_units_exposed_by_cause_and_prodtype);
  RPT_free_reporting (local_data->num_animals_exposed);
  RPT_free_reporting (local_data->num_animals_exposed_by_cause);
  RPT_free_reporting (local_data->num_animals_exposed_by_prodtype);
  RPT_free_reporting (local_data->num_animals_exposed_by_cause_and_prodtype);
  RPT_free_reporting (local_data->cumul_num_animals_exposed);
  RPT_free_reporting (local_data->cumul_num_animals_exposed_by_cause);
  RPT_free_reporting (local_data->cumul_num_animals_exposed_by_prodtype);
  RPT_free_reporting (local_data->cumul_num_animals_exposed_by_cause_and_prodtype);
  RPT_free_reporting (local_data->num_adequate_exposures);
  RPT_free_reporting (local_data->cumul_num_adequate_exposures);

  g_free (local_data);
  g_ptr_array_free (self->outputs, TRUE);
  g_free (self);

#if DEBUG
  g_debug ("----- EXIT free (%s)", MODEL_NAME);
#endif
}



/**
 * Returns a new exposure monitor.
 */
naadsm_model_t *
new (scew_element * params, HRD_herd_list_t * herds, projPJ projection,
     ZON_zone_list_t * zones)
{
  naadsm_model_t *m;
  local_data_t *local_data;
  scew_element *e, **ee;
  unsigned int n;
  const XML_Char *variable_name;
  RPT_frequency_t freq;
  gboolean success;
  gboolean broken_down;
  unsigned int i;      /* loop counter */
  char *prodtype_name;

#if DEBUG
  g_debug ("----- ENTER new (%s)", MODEL_NAME);
#endif

  m = g_new (naadsm_model_t, 1);
  local_data = g_new (local_data_t, 1);

  m->name = MODEL_NAME;
  m->events_listened_for = events_listened_for;
  m->nevents_listened_for = NEVENTS_LISTENED_FOR;
  m->outputs = g_ptr_array_new ();
  m->model_data = local_data;
  m->run = run;
  m->reset = reset;
  m->is_listening_for = is_listening_for;
  m->has_pending_actions = has_pending_actions;
  m->to_string = to_string;
  m->printf = local_printf;
  m->fprintf = local_fprintf;
  m->free = local_free;

  /* Make sure the right XML subtree was sent. */
  g_assert (strcmp (scew_element_name (params), MODEL_NAME) == 0);

  local_data->num_units_exposed =
    RPT_new_reporting ("expnUAll", RPT_integer, RPT_never);
  local_data->num_units_exposed_by_cause =
    RPT_new_reporting ("expnU", RPT_group, RPT_never);
  local_data->num_units_exposed_by_prodtype =
    RPT_new_reporting ("expnU", RPT_group, RPT_never);
  local_data->num_units_exposed_by_cause_and_prodtype =
    RPT_new_reporting ("expnU", RPT_group, RPT_never);
  local_data->cumul_num_units_exposed =
    RPT_new_reporting ("expcUAll", RPT_integer, RPT_never);
  local_data->cumul_num_units_exposed_by_cause =
    RPT_new_reporting ("expcU", RPT_group, RPT_never);
  local_data->cumul_num_units_exposed_by_prodtype =
    RPT_new_reporting ("expcU", RPT_group, RPT_never);
  local_data->cumul_num_units_exposed_by_cause_and_prodtype =
    RPT_new_reporting ("expcU", RPT_group, RPT_never);
  local_data->num_animals_exposed =
    RPT_new_reporting ("expnAAll", RPT_integer, RPT_never);
  local_data->num_animals_exposed_by_cause =
    RPT_new_reporting ("expnA", RPT_group, RPT_never);
  local_data->num_animals_exposed_by_prodtype =
    RPT_new_reporting ("expnA", RPT_group, RPT_never);
  local_data->num_animals_exposed_by_cause_and_prodtype =
    RPT_new_reporting ("expnA", RPT_group, RPT_never);
  local_data->cumul_num_animals_exposed =
    RPT_new_reporting ("expcAAll", RPT_integer, RPT_never);
  local_data->cumul_num_animals_exposed_by_cause =
    RPT_new_reporting ("expcA", RPT_group, RPT_never);
  local_data->cumul_num_animals_exposed_by_prodtype =
    RPT_new_reporting ("expcA", RPT_group, RPT_never);
  local_data->cumul_num_animals_exposed_by_cause_and_prodtype =
    RPT_new_reporting ("expcA", RPT_group, RPT_never);
  local_data->num_adequate_exposures =
    RPT_new_reporting ("adqnUAll", RPT_integer, RPT_never);
  local_data->cumul_num_adequate_exposures =
    RPT_new_reporting ("adqcUAll", RPT_integer, RPT_never);
  g_ptr_array_add (m->outputs, local_data->num_units_exposed);
  g_ptr_array_add (m->outputs, local_data->num_units_exposed_by_cause);
  g_ptr_array_add (m->outputs, local_data->num_units_exposed_by_prodtype);
  g_ptr_array_add (m->outputs, local_data->num_units_exposed_by_cause_and_prodtype);
  g_ptr_array_add (m->outputs, local_data->cumul_num_units_exposed);
  g_ptr_array_add (m->outputs, local_data->cumul_num_units_exposed_by_cause);
  g_ptr_array_add (m->outputs, local_data->cumul_num_units_exposed_by_prodtype);
  g_ptr_array_add (m->outputs, local_data->cumul_num_units_exposed_by_cause_and_prodtype);
  g_ptr_array_add (m->outputs, local_data->num_animals_exposed);
  g_ptr_array_add (m->outputs, local_data->num_animals_exposed_by_cause);
  g_ptr_array_add (m->outputs, local_data->num_animals_exposed_by_prodtype);
  g_ptr_array_add (m->outputs, local_data->num_animals_exposed_by_cause_and_prodtype);
  g_ptr_array_add (m->outputs, local_data->cumul_num_animals_exposed);
  g_ptr_array_add (m->outputs, local_data->cumul_num_animals_exposed_by_cause);
  g_ptr_array_add (m->outputs, local_data->cumul_num_animals_exposed_by_prodtype);
  g_ptr_array_add (m->outputs, local_data->cumul_num_animals_exposed_by_cause_and_prodtype);
  g_ptr_array_add (m->outputs, local_data->num_adequate_exposures);
  g_ptr_array_add (m->outputs, local_data->cumul_num_adequate_exposures);

  /* Set the reporting frequency for the output variables. */
  ee = scew_element_list (params, "output", &n);
#if DEBUG
  g_debug ("%u output variables", n);
#endif
  for (i = 0; i < n; i++)
    {
      e = ee[i];
      variable_name = scew_element_contents (scew_element_by_name (e, "variable-name"));
      freq = RPT_string_to_frequency (scew_element_contents
                                      (scew_element_by_name (e, "frequency")));
      broken_down = PAR_get_boolean (scew_element_by_name (e, "broken-down"), &success);
      if (!success)
      	broken_down = FALSE;
      if (strcmp (variable_name, "expnU") == 0)
        {
          RPT_reporting_set_frequency (local_data->num_units_exposed, freq);
          if (broken_down)
            {
              RPT_reporting_set_frequency (local_data->num_units_exposed_by_cause, freq);
              RPT_reporting_set_frequency (local_data->num_units_exposed_by_prodtype, freq);
              RPT_reporting_set_frequency (local_data->num_units_exposed_by_cause_and_prodtype, freq);
            }
        }
      else if (strcmp (variable_name, "expcU") == 0)
        {
          RPT_reporting_set_frequency (local_data->cumul_num_units_exposed, freq);
          if (broken_down)
            {
              RPT_reporting_set_frequency (local_data->cumul_num_units_exposed_by_cause, freq);
              RPT_reporting_set_frequency (local_data->cumul_num_units_exposed_by_prodtype, freq);
              RPT_reporting_set_frequency (local_data->cumul_num_units_exposed_by_cause_and_prodtype, freq);
            }
        }
      else if (strcmp (variable_name, "expnA") == 0)
        {
          RPT_reporting_set_frequency (local_data->num_animals_exposed, freq);
          if (broken_down)
            {
              RPT_reporting_set_frequency (local_data->num_animals_exposed_by_cause, freq);
              RPT_reporting_set_frequency (local_data->num_animals_exposed_by_prodtype, freq);
              RPT_reporting_set_frequency (local_data->num_animals_exposed_by_cause_and_prodtype, freq);
            }
        }
      else if (strcmp (variable_name, "expcA") == 0)
        {
          RPT_reporting_set_frequency (local_data->cumul_num_animals_exposed, freq);
          if (broken_down)
            {
              RPT_reporting_set_frequency (local_data->cumul_num_animals_exposed_by_cause, freq);
              RPT_reporting_set_frequency (local_data->cumul_num_animals_exposed_by_prodtype, freq);
              RPT_reporting_set_frequency (local_data->cumul_num_animals_exposed_by_cause_and_prodtype, freq);
            }
        }
      else if (strcmp (variable_name, "adqnU") == 0)
        {
          RPT_reporting_set_frequency (local_data->num_adequate_exposures, freq);
        }
      else if (strcmp (variable_name, "adqcU") == 0)
        {
          RPT_reporting_set_frequency (local_data->cumul_num_adequate_exposures, freq);
        }
      else
        g_warning ("no output variable named \"%s\", ignoring", variable_name);        
    }
  free (ee);

  /* Initialize the output variables we already know about. */
  local_data->production_types = herds->production_type_names;
  n = local_data->production_types->len;
  for (i = 0; i < n; i++)
    {
      prodtype_name = (char *) g_ptr_array_index (local_data->production_types, i);
      RPT_reporting_add_integer1 (local_data->num_units_exposed_by_prodtype, 0, prodtype_name);
      RPT_reporting_add_integer1 (local_data->cumul_num_units_exposed_by_prodtype, 0, prodtype_name);
      RPT_reporting_add_integer1 (local_data->num_animals_exposed_by_prodtype, 0, prodtype_name);
      RPT_reporting_add_integer1 (local_data->cumul_num_animals_exposed_by_prodtype, 0, prodtype_name);
    }

#if DEBUG
  g_debug ("----- EXIT new (%s)", MODEL_NAME);
#endif

  return m;
}

/* end of file exposure-monitor.c */

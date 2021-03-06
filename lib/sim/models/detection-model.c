/** @file detection-model.c
 * Module that simulates a farmer or veterinarian detecting signs of disease.
 *
 * On each day, this module follows these steps:
 * <ol>
 *   <li>
 *     Look up the probability <i>p</i><sub>1</sub> that a farmer or
 *     veterinarian will detect signs of disease based on the number of days
 *     since a public announcement of an outbreak.
 *   <li>
 *     For each InfectiousClinical herd,
 *     <ol>
 *       <li>
 *         Look up the probability <i>p</i><sub>2</sub> that a farmer or
 *         veterinarian will detect signs of disease based on the number of
 *         days the herd has been InfectiousClinical.
 *       <li>
 *         If the unit is not inside a zone focus,
 *         <ol>
 *           <li>
 *             Compute the probability of detection <i>P</i> =
 *             <i>p</i><sub>1</sub> \htmlonly &times; \endhtmlonly
 *             \latexonly $\times$ \endlatexonly <i>p</i><sub>2</sub>.
 *         </ol>
 *       <li>
 *         If the unit is inside a zone focus,
 *         <ol>
 *           <li>
 *             Compute the probability of detection <i>P</i> =
 *             <i>p</i><sub>2</sub> \htmlonly &times; \endhtmlonly
 *             \latexonly $\times$ \endlatexonly zone multiplier.
 *         </ol>
 *       <li>
 *         Generate a random number <i>r</i> in [0,1).
 *       <li>
 *         If <i>r</i> < <i>P</i>, report a detection to the authorities.
 *     </ol>
 * </ol>
 *
 * @author Neil Harvey <neilharvey@gmail.com><br>
 *   Grid Computing Research Group<br>
 *   Department of Computing & Information Science, University of Guelph<br>
 *   Guelph, ON N1G 2W1<br>
 *   CANADA
 * @version 0.1
 * @date June 2003
 *
 * Copyright &copy; University of Guelph, 2003-2006
 * 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option)
 * any later version.
 *
 * @todo Reset detected flag when herd goes naturally immune.
 */

#if HAVE_CONFIG_H
#  include <config.h>
#endif

/* To avoid name clashes when dlpreopening multiple modules that have the same
 * global symbols (interface).  See sec. 18.4 of "GNU Autoconf, Automake, and
 * Libtool". */
#define interface_version detection_model_LTX_interface_version
#define is_singleton detection_model_LTX_is_singleton
#define new detection_model_LTX_new
#define set_params detection_model_LTX_set_params
#define run detection_model_LTX_run
#define reset detection_model_LTX_reset
#define events_listened_for detection_model_LTX_events_listened_for
#define is_listening_for detection_model_LTX_is_listening_for
#define has_pending_actions detection_model_LTX_has_pending_actions
#define has_pending_infections detection_model_LTX_has_pending_infections
#define to_string detection_model_LTX_to_string
#define local_printf detection_model_LTX_printf
#define local_fprintf detection_model_LTX_fprintf
#define local_free detection_model_LTX_free
#define handle_new_day_event detection_model_LTX_handle_new_day_event
#define handle_detection_event detection_model_LTX_handle_detection_event
#define handle_public_announcement_event detection_model_LTX_handle_public_announcement_event
#define events_created detection_model_LTX_events_created

#include "model.h"
#include "model_util.h"

#if STDC_HEADERS
#  include <string.h>
#endif

#if HAVE_STRINGS_H
#  include <strings.h>
#endif

#include "guilib.h"

#include "detection-model.h"

extern const char *HRD_status_name[];
extern const char *RPT_frequency_name[];

/** This must match an element name in the DTD. */
#define MODEL_NAME "detection-model"

#define MODEL_DESCRIPTION "\
A module to simulate a farmer or veterinarian reporting signs of a disease.\n\
\n\
Neil Harvey <neilharvey@gmail.com>\n\
v0.1 June 2003\
"

#define MODEL_INTERFACE_VERSION "0.93"



#define NEVENTS_CREATED 1
EVT_event_type_t events_created[] = { EVT_Detection };

#define NEVENTS_LISTENED_FOR 3
EVT_event_type_t events_listened_for[] = { EVT_NewDay, EVT_Detection, EVT_PublicAnnouncement };



/* Specialized information for this model. */
typedef struct
{
  REL_chart_t *prob_report_vs_days_clinical;
  REL_chart_t *prob_report_vs_days_since_outbreak;
}
param_block_t;



typedef struct
{
  GPtrArray *production_types; /**< Each item in the list is a char *. */
  ZON_zone_list_t *zones;
  param_block_t **param_block; /**< Blocks of parameters.  Use an expression
    of the form param_block[production_type] to get a pointer to a particular
    param_block. */
  double **zone_multiplier; /**< A 2D array of multipliers.  Use an expression
    of the form zone_multiplier[zone->level-1][production_type] to get a
    particular multiplier. */
  gboolean outbreak_known;
  unsigned short int public_announcement_day;
  gboolean *detected;
  unsigned int nherds; /**< Number of herds.  Stored here because it is also
    the length of the detected flag array. */
  double *prob_report_from_awareness; /**< An array with the probability of
    reporting due to one value per production type.  The array is initialized
    in the reset function, and the values are re-calculated each day once an
    outbreak is known. */
}
local_data_t;



/**
 * Responds to a new day event by stochastically generating detections.
 *
 * @param self the model.
 * @param herds a herd list.
 * @param zones a zone list.
 * @param event a new day event.
 * @param rng a random number generator.
 * @param queue for any new events the model creates.
 */
void
handle_new_day_event (struct ergadm_model_t_ *self, HRD_herd_list_t * herds,
                      ZON_zone_list_t * zones, EVT_new_day_event_t * event,
                      RAN_gen_t * rng, EVT_event_queue_t * queue)
{
  local_data_t *local_data;
  unsigned int lookup_day;
  unsigned int nprod_types;
  param_block_t *param_block;
  HRD_herd_t *herd;
  unsigned int nherds;
  unsigned int prod_type;
  ZON_zone_fragment_t *background_zone, *fragment;
  ZON_zone_t *zone;
  double prob_report_from_signs, *prob_report_from_awareness;
  double P, r;
  unsigned int i;

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER handle_new_day_event (%s)", MODEL_NAME);
#endif

  local_data = (local_data_t *) (self->model_data);

  /* For each production type, compute the probability that the disease would 
   * be noticed, based on community awareness of an outbreak. */
  prob_report_from_awareness = local_data->prob_report_from_awareness;
  nprod_types = local_data->production_types->len;
  if (local_data->outbreak_known)
    {
      lookup_day = event->day - local_data->public_announcement_day;
      for (i = 0; i < nprod_types; i++)
        {
          param_block = local_data->param_block[i];

          if (param_block == NULL)
            continue;

          prob_report_from_awareness[i] =
            REL_chart_lookup (lookup_day, param_block->prob_report_vs_days_since_outbreak);
        }
    }

  background_zone = ZON_zone_list_get_background (zones);

  nherds = HRD_herd_list_length (herds);
  for (i = 0; i < nherds; i++)
    {
      herd = HRD_herd_list_get (herds, i);

      /* Check whether the herd is showing clinical signs of disease and is a
       * production type we're interested in.  If not, go on to the next
       * herd. */
      prod_type = herd->production_type;
      param_block = local_data->param_block[prod_type];
      if (herd->status != InfectiousClinical || param_block == NULL)
        continue;

      /* Find which zone the herd is in. */
      fragment = zones->membership[herd->index];
      zone = fragment->parent;

#if DEBUG
      g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG,
             "unit \"%s\" is %s, in zone \"%s\", state is %s, %s detected",
             herd->official_id,
             herd->production_type_name,
             zone->name,
             HRD_status_name[herd->status], local_data->detected[i] ? "already" : "not");
#endif
      /* Check whether the herd has already been detected.  If so, go on to the
       * next herd. */
      if (local_data->detected[i])
        continue;

      /* Compute the probability that the disease would be noticed, based
       * on clinical signs.  This is multiplied with the probability
       * computed above. */
      prob_report_from_signs =
        REL_chart_lookup (herd->days_in_status, param_block->prob_report_vs_days_clinical);

      if (ZON_same_zone (background_zone, fragment))
        {
          P = prob_report_from_signs * prob_report_from_awareness[prod_type];
#if DEBUG
          g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "P = %g * %g",
                 prob_report_from_signs, prob_report_from_awareness[prod_type]);
#endif
        }
      else
        {
          P = prob_report_from_signs * local_data->zone_multiplier[zone->level - 1][prod_type];
#if DEBUG
          g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "P = %g * %g",
                 prob_report_from_signs, local_data->zone_multiplier[zone->level - 1][prod_type]);
#endif
        }
      r = RAN_num (rng);
      if (r < P)
        {
#if DEBUG
          g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "r (%g) < P (%g)", r, P);
#endif
#if INFO
          g_log (G_LOG_DOMAIN, G_LOG_LEVEL_INFO,
                 "unit \"%s\" detected and reported", herd->official_id);
#endif

          EVT_event_enqueue (queue, EVT_new_detection_event (herd, event->day));
        }
      else
        {
#if DEBUG
          g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "r (%g) >= P (%g), not detected", r, P);
#endif
          ;
        }
    }                           /* end of loop over herds */

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- EXIT handle_new_day_event (%s)", MODEL_NAME);
#endif
}



/**
 * Records which herds have been detected (by this or other sub-models).
 *
 * @param self the model.
 * @param event a detection event.
 */
void
handle_detection_event (struct ergadm_model_t_ *self, EVT_detection_event_t * event)
{
  local_data_t *local_data;

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER handle_detection_event (%s)", MODEL_NAME);
#endif

  local_data = (local_data_t *) (self->model_data);
  local_data->detected[event->herd->index] = TRUE;

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- EXIT handle_detection_event (%s)", MODEL_NAME);
#endif
}



/**
 * Records the day on which the outbreak is publically announced.  This is
 * important because the probability of detection increases with community
 * awareness of an outbreak.
 *
 * @param self the model.
 * @param event a public announcement event.
 */
void
handle_public_announcement_event (struct ergadm_model_t_ *self,
                                  EVT_public_announcement_event_t * event)
{
  local_data_t *local_data;

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG,
         "----- ENTER handle_public_announcement_event (%s)", MODEL_NAME);
#endif

  local_data = (local_data_t *) (self->model_data);
  if (local_data->outbreak_known == FALSE)
    {
      local_data->outbreak_known = TRUE;
      local_data->public_announcement_day = event->day;
#if INFO
      g_log (G_LOG_DOMAIN, G_LOG_LEVEL_INFO,
             "community is now aware of outbreak, detection more likely");
#endif
    }

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG,
         "----- EXIT handle_public_announcement_event (%s)", MODEL_NAME);
#endif
}



/**
 * Runs this model.
 *
 * Side effects: may change the state of one or more herds in list.
 *
 * @param self the model.
 * @param herds a herd list.
 * @param zones a zone list.
 * @param event the event that caused the model to run.
 * @param rng a random number generator.
 * @param queue for any new events the model creates.
 */
void
run (struct ergadm_model_t_ *self, HRD_herd_list_t * herds, ZON_zone_list_t * zones,
     EVT_event_t * event, RAN_gen_t * rng, EVT_event_queue_t * queue)
{
#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER run (%s)", MODEL_NAME);
#endif
  if( NULL != guilib_printf ) {
    char guilog[1024];
    sprintf( guilog, "ENTER run %s", MODEL_NAME); 
    //guilib_printf( guilog );
  }

  switch (event->type)
    {
    case EVT_NewDay:
      handle_new_day_event (self, herds, zones, &(event->u.new_day), rng, queue);
      break;
    case EVT_Detection:
      handle_detection_event (self, &(event->u.detection));
      break;
    case EVT_PublicAnnouncement:
      handle_public_announcement_event (self, &(event->u.public_announcement));
      break;
    default:
      g_error
        ("%s has received a %s event, which it does not listen for.  This should never happen.  Please contact the developer.",
         MODEL_NAME, EVT_event_type_name[event->type]);
    }

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- EXIT run (%s)", MODEL_NAME);
#endif
  if( NULL != guilib_printf ) {
    char guilog[1024];
    sprintf( guilog, "EXIT run %s", MODEL_NAME); 
    //guilib_printf( guilog );
  }
}



/**
 * Resets this model after a simulation run.
 *
 * @param self the model.
 */
void
reset (struct ergadm_model_t_ *self)
{
  local_data_t *local_data;
  int nprod_types, i;
  param_block_t *param_block;

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER reset (%s)", MODEL_NAME);
#endif

  local_data = (local_data_t *) (self->model_data);
  for (i = 0; i < local_data->nherds; i++)
    local_data->detected[i] = FALSE;
  local_data->outbreak_known = FALSE;
  local_data->public_announcement_day = 0;

  nprod_types = local_data->production_types->len;
  for (i = 0; i < nprod_types; i++)
    {
      param_block = local_data->param_block[i];
      if (param_block == NULL)
        continue;

      local_data->prob_report_from_awareness[i] =
        REL_chart_lookup (0, param_block->prob_report_vs_days_since_outbreak);
    }

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- EXIT reset (%s)", MODEL_NAME);
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
is_listening_for (struct ergadm_model_t_ *self, EVT_event_type_t event_type)
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
has_pending_actions (struct ergadm_model_t_ * self)
{
  return FALSE;
}



/**
 * Reports whether this model has any pending infections to cause.
 *
 * @param self the model.
 * @return TRUE if the model has pending infections.
 */
gboolean
has_pending_infections (struct ergadm_model_t_ * self)
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
to_string (struct ergadm_model_t_ *self)
{
  GString *s;
  local_data_t *local_data;
  unsigned int nprod_types, nzones, i, j;
  param_block_t *param_block;
  char *substring, *chararray;
  ZON_zone_t *zone;

  local_data = (local_data_t *) (self->model_data);
  s = g_string_new (NULL);
  g_string_printf (s, "<%s", MODEL_NAME);

  /* Add the parameter block for each production type. */
  nprod_types = local_data->production_types->len;
  nzones = ZON_zone_list_length (local_data->zones);
  for (i = 0; i < nprod_types; i++)
    {
      param_block = local_data->param_block[i];
      if (param_block == NULL)
        continue;

      g_string_append_printf (s, "\n  for %s",
                              (char *) g_ptr_array_index (local_data->production_types, i));

      substring = REL_chart_to_string (param_block->prob_report_vs_days_clinical);
      g_string_append_printf (s, "\n    prob-report-vs-days-clinical=%s", substring);
      free (substring);

      substring = REL_chart_to_string (param_block->prob_report_vs_days_since_outbreak);
      g_string_append_printf (s, "\n    prob-report-vs-days-since-outbreak=%s", substring);
      free (substring);

      for (j = 0; j < nzones; j++)
        {
          zone = ZON_zone_list_get (local_data->zones, j);
          g_string_append_printf (s, "\n    prob-multiplier for \"%s\" zone=%g",
                                  zone->name, local_data->zone_multiplier[j][i]);
        }
    }
  g_string_append_c (s, '>');

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
local_fprintf (FILE * stream, struct ergadm_model_t_ *self)
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
local_printf (struct ergadm_model_t_ *self)
{
  return local_fprintf (stdout, self);
}



/**
 * Frees this model.  Does not free the production type name.
 *
 * @param self the model.
 */
void
local_free (struct ergadm_model_t_ *self)
{
  local_data_t *local_data;
  unsigned int nprod_types, nzones, i;
  param_block_t *param_block;

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER free (%s)", MODEL_NAME);
#endif

  local_data = (local_data_t *) (self->model_data);

  /* Free each of the parameter blocks. */
  nprod_types = local_data->production_types->len;
  for (i = 0; i < nprod_types; i++)
    {
      param_block = local_data->param_block[i];
      if (param_block == NULL)
        continue;

      REL_free_chart (param_block->prob_report_vs_days_clinical);
      REL_free_chart (param_block->prob_report_vs_days_since_outbreak);
      g_free (param_block);
    }
  g_free (local_data->param_block);

  /* Free the 2D array of zone multipliers. */
  nzones = ZON_zone_list_length (local_data->zones);
  for (i = 0; i < nzones; i++)
    g_free (local_data->zone_multiplier[i]);
  g_free (local_data->zone_multiplier);

  g_free (local_data->detected);
  g_free (local_data->prob_report_from_awareness);
  g_free (local_data);
  g_ptr_array_free (self->outputs, TRUE);
  g_free (self);

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- EXIT free (%s)", MODEL_NAME);
#endif
}



/**
 * Returns the version of the interface this model conforms to.
 */
char *
interface_version (void)
{
  return MODEL_INTERFACE_VERSION;
}



/**
 * Returns whether this model is a singleton or not.
 */
gboolean
is_singleton (void)
{
  return TRUE;
}



/**
 * Adds a set of parameters to a detection model.
 */
void
set_params (struct ergadm_model_t_ *self, scew_element * params)
{
  local_data_t *local_data;
  param_block_t t;
  scew_element const *e;
  gboolean success;
  double zone_multiplier;
  gboolean *production_type;
  gboolean *zone;
  unsigned int nprod_types, nzones, i, j;

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER set_params (%s)", MODEL_NAME);
#endif

  /* Make sure the right XML subtree was sent. */
  g_assert (strcmp (scew_element_name (params), MODEL_NAME) == 0);

  local_data = (local_data_t *) (self->model_data);

  /* Read the parameters and store them in a temporary param_block_t
   * structure. */

  e = scew_element_by_name (params, "prob-report-vs-time-clinical");
  if (e != NULL)
    {
      t.prob_report_vs_days_clinical = PAR_get_relationship_chart (e);
    }
  else
    {
      /* Default to 0 = no detection. */
      t.prob_report_vs_days_clinical = REL_new_point_chart (0);
    }

  e = scew_element_by_name (params, "prob-report-vs-time-since-outbreak");
  if (e != NULL)
    {
      t.prob_report_vs_days_since_outbreak = PAR_get_relationship_chart (e);
    }
  else
    {
      /* Default to 1 = public knowledge of outbreak has o effect. */
      t.prob_report_vs_days_since_outbreak = REL_new_point_chart (1);
    }

  e = scew_element_by_name (params, "zone-prob-multiplier");
  if (e != NULL)
    {
      zone_multiplier = PAR_get_unitless (e, &success);
      if (success == FALSE)
        {
          g_warning ("%s: setting zone multiplier to 1 (no effect)", MODEL_NAME);
          zone_multiplier = 1;
        }
      if (zone_multiplier < 0)
        {
          g_warning ("%s: zone multiplier cannot be negative, setting to 1 (no effect)",
                     MODEL_NAME);
          zone_multiplier = 1;
        }
    }
  else
    {
      zone_multiplier = 1;
    }

  /* Find out which production types, or which production type-zone
   * combinations, these parameters apply to. */
  production_type =
    ergadm_read_prodtype_attribute (params, "production-type", local_data->production_types);
  if (scew_attribute_by_name (params, "zone") != NULL)
    zone = ergadm_read_zone_attribute (params, local_data->zones);
  else
    zone = NULL;

  /* Copy the parameters to the appropriate place. */
  nprod_types = local_data->production_types->len;
  nzones = ZON_zone_list_length (local_data->zones);
  if (zone == NULL)
    {
      /* These parameters are detection charts by production type. */

      param_block_t *param_block;

      for (i = 0; i < nprod_types; i++)
        {
          if (production_type[i] == FALSE)
            continue;

          /* Create a parameter block for this production type, or overwrite
           * the existing one. */
          param_block = local_data->param_block[i];
          if (param_block == NULL)
            {
#if DEBUG
              g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG,
                     "setting parameters for %s",
                     (char *) g_ptr_array_index (local_data->production_types, i));
#endif
              param_block = g_new (param_block_t, 1);
              local_data->param_block[i] = param_block;
            }
          else
            {
              g_warning ("overwriting previous parameters for %s",
                         (char *) g_ptr_array_index (local_data->production_types, i));
              REL_free_chart (param_block->prob_report_vs_days_clinical);
              REL_free_chart (param_block->prob_report_vs_days_since_outbreak);
            }
          param_block->prob_report_vs_days_clinical =
            REL_clone_chart (t.prob_report_vs_days_clinical);
          param_block->prob_report_vs_days_since_outbreak =
            REL_clone_chart (t.prob_report_vs_days_since_outbreak);
        }
    }
  else
    {
      /* These parameters are the multiplier by production type-zone. */

      for (i = 0; i < nzones; i++)
        {
          if (zone[i] == FALSE)
            continue;

          for (j = 0; j < nprod_types; j++)
            {
              if (production_type[j] == FALSE)
                continue;

#if DEBUG
              g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG,
                     "setting multiplier for %s in \"%s\" zone",
                     (char *) g_ptr_array_index (local_data->production_types, j),
                     ZON_zone_list_get (local_data->zones, i)->name);
#endif
              local_data->zone_multiplier[i][j] = zone_multiplier;
            }
        }
    }

  g_free (production_type);
  if (zone != NULL)
    g_free (zone);
  REL_free_chart (t.prob_report_vs_days_clinical);
  REL_free_chart (t.prob_report_vs_days_since_outbreak);

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- EXIT set_params (%s)", MODEL_NAME);
#endif

  return;
}



/**
 * Returns a new detection model.
 */
ergadm_model_t *
new (scew_element * params, HRD_herd_list_t * herds, ZON_zone_list_t * zones)
{
  ergadm_model_t *self;
  local_data_t *local_data;
  unsigned int nprod_types, nzones, i, j;

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER new (%s)", MODEL_NAME);
#endif

  self = g_new (ergadm_model_t, 1);
  local_data = g_new (local_data_t, 1);

  self->name = MODEL_NAME;
  self->description = MODEL_DESCRIPTION;
  self->events_created = events_created;
  self->nevents_created = NEVENTS_CREATED;
  self->events_listened_for = events_listened_for;
  self->nevents_listened_for = NEVENTS_LISTENED_FOR;
  self->outputs = g_ptr_array_new ();
  self->model_data = local_data;
  self->set_params = set_params;
  self->run = run;
  self->reset = reset;
  self->is_listening_for = is_listening_for;
  self->has_pending_actions = has_pending_actions;
  self->has_pending_infections = has_pending_infections;
  self->to_string = to_string;
  self->printf = local_printf;
  self->fprintf = local_fprintf;
  self->free = local_free;

  /* local_data->param_block holds an array of parameter blocks, where each
   * block holds the parameters for one production type.  Initially, all
   * pointers are NULL.  Blocks will be created as needed in the set_params
   * function. */
  local_data->production_types = herds->production_type_names;
  nprod_types = local_data->production_types->len;
  local_data->param_block = g_new0 (param_block_t *, nprod_types);

  /* local_data->zone_multiplier is a 2D array of detection multipliers.  The
   * first level of indexing is by zone (rows), then by production type
   * (columns).  The values are initialized to 1. */
  local_data->zones = zones;
  nzones = ZON_zone_list_length (zones);
  local_data->zone_multiplier = g_new (double *, nzones);

  for (i = 0; i < nzones; i++)
    {
      local_data->zone_multiplier[i] = g_new (double, nprod_types);
      for (j = 0; j < nprod_types; j++)
        local_data->zone_multiplier[i][j] = 1.0;
    }

  /* Initialize the array of detected flags (one per herd) to all FALSE. */
  local_data->nherds = HRD_herd_list_length (herds);
  local_data->detected = g_new0 (gboolean, local_data->nherds);
  /* No outbreak has been announced yet. */
  local_data->outbreak_known = FALSE;
  local_data->public_announcement_day = 0;

  /* Allocate an array for the probability of reporting due to community
   * awareness of an outbreak.  It will be initialized in the reset
   * function. */
  local_data->prob_report_from_awareness = g_new (double, nprod_types);

  /* Send the XML subtree to the init function to read the production type
   * combination specific parameters. */
  self->set_params (self, params);

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- EXIT new (%s)", MODEL_NAME);
#endif

  return self;
}


char *
detection_model_interface_version (void)
{
  return interface_version ();
}


ergadm_model_t *
detection_model_new (scew_element * params, HRD_herd_list_t * herds, ZON_zone_list_t * zones)
{
  return new (params, herds, zones);
}



gboolean
detection_model_is_singleton (void)
{
  return is_singleton ();
}

/* end of file detection-model.c */



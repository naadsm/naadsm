/** @file quarantine-model.c
 * Module that simulates a policy of quarantining diseased herds and herds that
 * are going to be destroyed.
 *
 * When a diseased herd is reported to the authorities, or a herd is requested
 * destroyed, this module quarantines the herd.
 *
 * @author Neil Harvey <neilharvey@gmail.com><br>
 *   Grid Computing Research Group<br>
 *   Department of Computing & Information Science, University of Guelph<br>
 *   Guelph, ON N1G 2W1<br>
 *   CANADA
 * @version 0.1
 * @date November 2003
 *
 * Copyright &copy; University of Guelph, 2003-2006
 * 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option)
 * any later version.
 */

#if HAVE_CONFIG_H
#  include <config.h>
#endif

/* To avoid name clashes when dlpreopening multiple modules that have the same
 * global symbols (interface).  See sec. 18.4 of "GNU Autoconf, Automake, and
 * Libtool". */
#define interface_version quarantine_model_LTX_interface_version
#define new quarantine_model_LTX_new
#define run quarantine_model_LTX_run
#define reset quarantine_model_LTX_reset
#define events_listened_for quarantine_model_LTX_events_listened_for
#define is_listening_for quarantine_model_LTX_is_listening_for
#define has_pending_actions quarantine_model_LTX_has_pending_actions
#define has_pending_infections quarantine_model_LTX_has_pending_infections
#define to_string quarantine_model_LTX_to_string
#define local_printf quarantine_model_LTX_printf
#define local_fprintf quarantine_model_LTX_fprintf
#define local_free quarantine_model_LTX_free
#define handle_detection_event quarantine_model_LTX_handle_detection_event
#define handle_request_for_destruction_event quarantine_model_LTX_handle_request_for_destruction_event
#define events_created quarantine_model_LTX_events_created

#include "model.h"

#if STDC_HEADERS
#  include <string.h>
#endif

#include "guilib.h"

#include "quarantine-model.h"

/** This must match an element name in the DTD. */
#define MODEL_NAME "quarantine-model"

#define MODEL_DESCRIPTION "\
A module to simulate a policy of quarantining diseased herds and herds that\n\
are going to be destroyed.\n\
\n\
Neil Harvey <neilharvey@gmail.com>\n\
v0.1 November 2003\
"

#define MODEL_INTERFACE_VERSION "0.93"



#define NEVENTS_CREATED 0
EVT_event_type_t events_created[] = { 0 };

#define NEVENTS_LISTENED_FOR 2
EVT_event_type_t events_listened_for[] = { EVT_Detection,
  EVT_RequestForDestruction
};



/** Specialized information for this model. */
typedef struct
{
  int dummy;                    /* to prevent "struct has no members" warnings */
}
local_data_t;



/**
 * Responds to a detection by quarantining the herd.
 *
 * @param self the model.
 * @param event a detection event.
 */
void
handle_detection_event (struct ergadm_model_t_ *self, EVT_detection_event_t * event)
{
#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER handle_detection_event (%s)", MODEL_NAME);
#endif

#if INFO
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_INFO, "quarantining herd %s", event->herd->official_id);
#endif
  HRD_quarantine (event->herd);

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- EXIT handle_detection_event (%s)", MODEL_NAME);
#endif
}



/**
 * Responds to a request for destruction event by quarantining the herd.
 *
 * @param self the model.
 * @param event a request for destruction event.
 */
void
handle_request_for_destruction_event (struct ergadm_model_t_ *self,
                                      EVT_request_for_destruction_event_t * event)
{
#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG,
         "----- ENTER handle_request_for_destruction_event (%s)", MODEL_NAME);
#endif

#if INFO
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_INFO, "quarantining herd %s", event->herd->official_id);
#endif
  HRD_quarantine (event->herd);

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG,
         "----- EXIT handle_request_for_destruction_event (%s)", MODEL_NAME);
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
    case EVT_Detection:
      handle_detection_event (self, &(event->u.detection));
      break;
    case EVT_RequestForDestruction:
      handle_request_for_destruction_event (self, &(event->u.request_for_destruction));
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
#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER reset (%s)", MODEL_NAME);
#endif

  /* Nothing to do. */

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
  char *chararray;
  local_data_t *local_data;

  local_data = (local_data_t *) (self->model_data);
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
 * Frees this model.
 *
 * @param self the model.
 */
void
local_free (struct ergadm_model_t_ *self)
{
  local_data_t *local_data;

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER free (%s)", MODEL_NAME);
#endif

  /* Free the dynamically-allocated parts. */
  local_data = (local_data_t *) (self->model_data);
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
 * Returns a new quarantine model.
 */
ergadm_model_t *
new (scew_element * params, HRD_herd_list_t * herds, ZON_zone_list_t * zones)
{
  ergadm_model_t *m;
  local_data_t *local_data;

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER new (%s)", MODEL_NAME);
#endif

  m = g_new (ergadm_model_t, 1);
  local_data = g_new (local_data_t, 1);

  m->name = MODEL_NAME;
  m->description = MODEL_DESCRIPTION;
  m->events_created = events_created;
  m->nevents_created = NEVENTS_CREATED;
  m->events_listened_for = events_listened_for;
  m->nevents_listened_for = NEVENTS_LISTENED_FOR;
  m->outputs = g_ptr_array_new ();
  m->model_data = local_data;
  m->run = run;
  m->reset = reset;
  m->is_listening_for = is_listening_for;
  m->has_pending_actions = has_pending_actions;
  m->has_pending_infections = has_pending_infections;
  m->to_string = to_string;
  m->printf = local_printf;
  m->fprintf = local_fprintf;
  m->free = local_free;

  /* Make sure the right XML subtree was sent. */
  g_assert (strcmp (scew_element_name (params), MODEL_NAME) == 0);

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- EXIT new (%s)", MODEL_NAME);
#endif

  return m;
}


char *
quarantine_model_interface_version (void)
{
  return interface_version ();
}

ergadm_model_t *
quarantine_model_new (scew_element * params, HRD_herd_list_t * herds, ZON_zone_list_t * zones)
{
  return new (params, herds, zones);
}

/* end of file quarantine-model.c */

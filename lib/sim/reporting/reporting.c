/** @file reporting.c
 * Functions for creating, destroying, printing, and manipulating reporting
 * variables.
 *
 * @author Neil Harvey <neilharvey@gmail.com><br>
 *   Grid Computing Research Group<br>
 *   Department of Computing & Information Science, University of Guelph<br>
 *   Guelph, ON N1G 2W1<br>
 *   CANADA
 * @version 0.1
 * @date February 2004
 *
 * Copyright &copy; University of Guelph, 2004-2007
 * 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option)
 * any later version.
 */

#if HAVE_CONFIG_H
#  include <config.h>
#endif

#include "reporting.h"

#if STDC_HEADERS
#  include <stdlib.h>
#  include <string.h>
#endif

#if HAVE_STRINGS_H
#  include <strings.h>
#endif



/**
 * Names for the possible output variable types, terminated with a NULL
 * sentinel.
 *
 * @sa RPT_type_t
 */
const char *RPT_type_name[] = {
  "integer", "real", "text", "group", "unknown_type", NULL
};



/**
 * Names for the possible reporting frequencies for an output variable,
 * terminated with a NULL sentinel.
 *
 * @sa RPT_frequency_t
 */
const char *RPT_frequency_name[] = {
  "never", "once", "daily", "weekly", "monthly", "yearly", NULL
};



/**
 * The number of days between reporting, corresponding to the possible
 * reporting frequencies for an output variable.
 *
 * @sa RPT_frequency_t
 */
const int RPT_frequency_day[] = {
  0, 0, 1, 7, 30, 365
};



/**
 * Creates a new output variable structure.
 *
 * @param name the variable's name.  Should not contain commas, single quotes
 *   ('), double quotes ("), newlines, or carriage returns.  The text is copied
 *   so the original string can be freed after calling this function.
 * @param data an existing variable to wrap.  If NULL, a new variable of the
 *   appropriate type will be allocated.
 * @param type the variable's data type.
 * @param frequency how often the variable is reported.
 * @param cumulative FALSE if the variable should be reset to 0 whenever it is
 *   reported, TRUE otherwise.
 * @return a pointer to a newly-created, initialized RPT_reporting_t structure.
 */
RPT_reporting_t *
RPT_new_reporting (char *name, void *data, RPT_type_t type,
                   RPT_frequency_t frequency, gboolean cumulative)
{
  RPT_reporting_t *reporting;

  reporting = g_new (RPT_reporting_t, 1);

  if (name != NULL
      && (strchr (name, ',') != NULL
          || strchr (name, '\'') != NULL
          || strchr (name, '"') != NULL
          || strchr (name, '\n') != NULL || strchr (name, '\r') != NULL))
    g_warning
      ("variable name \"%s\" contains a comma, quote, or newline; this may cause problems when parsing the simulation output",
       name);
  reporting->name = g_strdup (name);
  reporting->type = type;
  if (data != NULL)
    reporting->data = data;
  else
    switch (type)
      {
      case RPT_integer:
        reporting->data = g_new0 (long, 1);
        break;
      case RPT_real:
        reporting->data = g_new0 (double, 1);
        break;
      case RPT_text:
        reporting->data = g_string_new ("");
        break;
      case RPT_group:
        g_datalist_init ((GData **) (&reporting->data));
        break;
      default:
        g_assert_not_reached ();
      }
  reporting->frequency = frequency;
  reporting->days = RPT_frequency_day[frequency];
  reporting->cumulative = cumulative;

  return reporting;
}



/**
 * A structure for use with the function stitch, below.
 */
typedef struct
{
  GPtrArray *strings;
  char *format;
}
RPT_stitch_t;



/**
 * This function is meant to be used with the foreach function of a GLib Keyed
 * Data List, specifically, the Keyed Data List used in "group" output
 * variables.  It adds strings of the form "'variable-name':value" to a Pointer
 * Array.
 *
 * @param key_id the key.  Resolved to a string, the name of an output
 *   variable.
 * @param data an output variable, cast to a gpointer.
 * @param user_data a pointer to an RPT_stitch_t structure, cast to a gpointer.
 */
void
stitch (GQuark key_id, gpointer data, gpointer user_data)
{
  RPT_stitch_t *to_pass;
  RPT_reporting_t *reporting;
  GString *s;
  char *substring, *chararray;

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER stitch");
#endif

  reporting = (RPT_reporting_t *) data;
  to_pass = (RPT_stitch_t *) user_data;

  /* Append the variable name, in single quotes, to the string we're
   * building. */
  s = g_string_new (NULL);
  g_string_printf (s, "'%s'", g_quark_to_string (key_id));

  /* Append a colon and the value to the string we're building. */
  substring = RPT_reporting_value_to_string (reporting, to_pass->format);
  g_string_sprintfa (s, ":%s", substring);
  free (substring);

  /* Append the completed string, but not the wrapper object, to the list. */
  chararray = s->str;
  g_string_free (s, FALSE);
  g_ptr_array_add (to_pass->strings, chararray);

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- EXIT stitch");
#endif
}



/**
 * Returns a text representation of the current value of an output variable.
 *
 * @param reporting an output variable.
 * @param format a printf-style format string.  If NULL, will default to "%i"
 *   for integer variables, "%g" for real variables, and ""%s"" for text
 *   variables.
 * @return a string.
 */
char *
RPT_reporting_value_to_string (RPT_reporting_t * reporting, char *format)
{
  GString *s;
  char *substring, *chararray;
  RPT_stitch_t to_pass;
  unsigned int i;

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER RPT_reporting_value_to_string");
#endif

  s = g_string_new (NULL);
  switch (reporting->type)
    {
    case RPT_integer:
      if (format == NULL)
        format = "%i";
      g_string_printf (s, format, *((long *) reporting->data));
      break;
    case RPT_real:
      if (format == NULL)
        format = "%g";
      g_string_printf (s, format, *((double *) reporting->data));
      break;
    case RPT_text:
      if (format == NULL)
        format = "'%s'";
      /* A kludge so that zone polygons are not in single quotes and therefore
       * don't count as strings when the output filters are parsing the output.
       * lex has a fixed-size buffer for a single token so unlimited-size
       * strings aren't good. */
      if (strncmp (((GString *) reporting->data)->str, "POLYGON", 7) == 0)
        format = "%s";
      g_string_printf (s, format, ((GString *) reporting->data)->str);
      break;
    case RPT_group:
      g_string_append_c (s, '{');
      to_pass.strings = g_ptr_array_new ();
      to_pass.format = format;
      g_datalist_foreach ((GData **) (&reporting->data), stitch, &to_pass);
      /* Append the string for each variable in the group, separated by commas,
       * to the string we're building.  Free the substrings as we go. */
      for (i = 0; i < to_pass.strings->len; i++)
        {
          substring = (char *) g_ptr_array_index (to_pass.strings, i);
          g_string_append_printf (s, i > 0 ? ",%s" : "%s", substring);
          free (substring);
        }
      g_ptr_array_free (to_pass.strings, TRUE);
      g_string_append_c (s, '}');
      break;
    default:
      g_assert_not_reached ();
    }
  /* don't return the wrapper object */
  chararray = s->str;
  g_string_free (s, FALSE);

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- EXIT RPT_reporting_value_to_string");
#endif

  return chararray;
}



/**
 * Returns a text representation of an output variable.
 *
 * @param reporting an output variable.
 * @return a string.
 */
char *
RPT_reporting_to_string (RPT_reporting_t * reporting)
{
  GString *s;
  char *chararray;

  s = g_string_new (NULL);
  g_string_printf (s, "<%s output variable \"%s\"",
                   RPT_type_name[reporting->type], reporting->name);

  g_string_append_printf (s, " \n reported %s ", RPT_frequency_name[reporting->frequency]);

  g_string_append_c (s, '>');

  /* don't return the wrapper object */
  chararray = s->str;
  g_string_free (s, FALSE);
  return chararray;
}



/**
 * Prints an output variable to a stream.
 *
 * @param stream an output stream to write to.  If NULL, defaults to stdout.
 * @param reporting an output variable.
 * @return the number of characters written.
 */
int
RPT_fprintf_reporting (FILE * stream, RPT_reporting_t * reporting)
{
  char *s;
  int nchars_written;

  s = RPT_reporting_to_string (reporting);
  nchars_written = fprintf (stream ? stream : stdout, "%s", s);
  free (s);
  return nchars_written;
}



/**
 * Deletes an output variable structure from memory.
 *
 * @param reporting an output variable.  If NULL, nothing is deleted.
 * @param free_segment if TRUE, also frees the dynamically-allocated parts of
 *   the output variable structure.
 */
void
RPT_free_reporting (RPT_reporting_t * reporting, gboolean free_segment)
{
#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER RPT_free_reporting");
#endif

  if (reporting == NULL)
    goto end;

  if (free_segment == TRUE)
    {
      g_free (reporting->name);
      switch (reporting->type)
        {
        case RPT_integer:
        case RPT_real:
          g_free (reporting->data);
          break;
        case RPT_text:
          g_string_free ((GString *) reporting->data, TRUE);
          break;
        case RPT_group:
          g_datalist_clear ((GData **) (&reporting->data));
          break;
        default:
          g_assert_not_reached ();
        }
    }
  g_free (reporting);

end:
#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- EXIT RPT_free_reporting");
#endif
  return;
}



/**
 * Wraps RPT_free_reporting so that it can be used as the destroy function in
 * a keyed data list.
 */
void
RPT_free_reporting_as_GDestroyNotify (gpointer data)
{
  RPT_free_reporting ((RPT_reporting_t *) data, TRUE);
}



/**
 * Sets the reporting frequency for an output variable.
 *
 * @param reporting an output variable.
 * @param frequency how often the variable is reported.
 */
void
RPT_reporting_set_frequency (RPT_reporting_t * reporting, RPT_frequency_t frequency)
{
  reporting->frequency = frequency;
  reporting->days = RPT_frequency_day[frequency];
}



/**
 * Sets the value of an integer output variable.
 *
 * @param reporting an output variable.
 * @param value the new value. 
 * @param subelement_name a null-terminated array of strings used to "drill
 *   down" through group output variables.  If NULL, <i>reporting</i> is
 *   assumed to be an integer output variable.
 */
void
RPT_reporting_set_integer (RPT_reporting_t * reporting, long value, char **subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;

  if (subelement_name == NULL || subelement_name[0] == NULL)
    {
      g_assert (reporting->type == RPT_integer);
      *((long *) reporting->data) = value;
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name[0]));
      /* If there isn't already a subelement by this name, create one. */
      if (subelement == NULL)
        {
          if (subelement_name[1] == NULL)
            /* The current subelement name is the last one in the list; the
             * next output variable down will be an integer variable. */
            subelement = RPT_new_reporting (subelement_name[0], NULL,
                                            RPT_integer,
                                            reporting->frequency, reporting->cumulative);
          else
            /* There are more subelement names in the list; the next output
             * variable down will be another group variable. */
            subelement = RPT_new_reporting (subelement_name[0], NULL,
                                            RPT_group, reporting->frequency, reporting->cumulative);
          g_datalist_set_data_full (group, subelement_name[0], subelement,
                                    RPT_free_reporting_as_GDestroyNotify);
        }
      RPT_reporting_set_integer (subelement, value, &(subelement_name[1]));
    }
}



/**
 * Sets the value of an integer output variable (alternate version for group
 * variables only 1 level deep).
 *
 * @param reporting an output variable.
 * @param value the new value. 
 * @param subelement_name a string used to choose one element from a group
 *   output variable.  If NULL, <i>reporting</i> is assumed to be an integer
 *   output variable.
 */
void
RPT_reporting_set_integer1 (RPT_reporting_t * reporting, long value, char *subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;

  if (subelement_name == NULL)
    {
      g_assert (reporting->type == RPT_integer);
      *((long *) reporting->data) = value;
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name));
      /* If there isn't already a subelement by this name, create one. */
      if (subelement == NULL)
        {
          subelement = RPT_new_reporting (subelement_name, NULL,
                                          RPT_integer, reporting->frequency, reporting->cumulative);
          g_datalist_set_data_full (group, subelement_name, subelement,
                                    RPT_free_reporting_as_GDestroyNotify);
        }
      RPT_reporting_set_integer (subelement, value, NULL);
    }
}



/**
 * Adds to the value of an integer output variable.
 *
 * @param reporting an output variable.
 * @param value the amount to add. 
 * @param subelement_name a null-terminated array of strings used to "drill
 *   down" through group output variables.  If NULL, <i>reporting</i> is
 *   assumed to be an integer output variable.
 */
void
RPT_reporting_add_integer (RPT_reporting_t * reporting, long value, char **subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;

  if (subelement_name == NULL || subelement_name[0] == NULL)
    {
      g_assert (reporting->type == RPT_integer);
      *((long *) reporting->data) += value;
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name[0]));
      /* If there isn't already a subelement by this name, create one. */
      if (subelement == NULL)
        {
          if (subelement_name[1] == NULL)
            /* The current subelement name is the last one in the list; the
             * next output variable down will be an integer variable. */
            subelement = RPT_new_reporting (subelement_name[0], NULL,
                                            RPT_integer,
                                            reporting->frequency, reporting->cumulative);
          else
            /* There are more subelement names in the list; the next output
             * variable down will be another group variable. */
            subelement = RPT_new_reporting (subelement_name[0], NULL,
                                            RPT_group, reporting->frequency, reporting->cumulative);
          g_datalist_set_data_full (group, subelement_name[0], subelement,
                                    RPT_free_reporting_as_GDestroyNotify);
        }
      RPT_reporting_add_integer (subelement, value, &(subelement_name[1]));
    }
}



/**
 * Adds to the value of an integer output variable (alternate version for group
 * variables only 1 level deep).
 *
 * @param reporting an output variable.
 * @param value the amount to add. 
 * @param subelement_name a string used to choose one element from a group
 *   output variable.  If NULL, <i>reporting</i> is assumed to be an integer
 *   output variable.
 */
void
RPT_reporting_add_integer1 (RPT_reporting_t * reporting, long value, char *subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;

  if (subelement_name == NULL)
    {
      g_assert (reporting->type == RPT_integer);
      *((long *) reporting->data) += value;
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name));
      /* If there isn't already a subelement by this name, create one. */
      if (subelement == NULL)
        {
          subelement = RPT_new_reporting (subelement_name, NULL,
                                          RPT_integer, reporting->frequency, reporting->cumulative);
          g_datalist_set_data_full (group, subelement_name, subelement,
                                    RPT_free_reporting_as_GDestroyNotify);
        }
      RPT_reporting_add_integer (subelement, value, NULL);
    }
}



/**
 * Retrieves the value of an integer output variable.
 *
 * @param reporting an output variable.
 * @param subelement_name a null-terminated array of strings used to "drill
 *   down" through group output variables.  If NULL, <i>reporting</i> is
 *   assumed to be an integer output variable.
 * @returns the value, or 0 if a non-existent subelement was specified.
 */
long
RPT_reporting_get_integer (RPT_reporting_t * reporting, char **subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;
  long value = 0;

  if (subelement_name == NULL || subelement_name[0] == NULL)
    {
      g_assert (reporting->type == RPT_integer);
      value = *((long *) reporting->data);
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name[0]));
      if (subelement != NULL)
        value = RPT_reporting_get_integer (subelement, &(subelement_name[1]));
    }

  return value;
}



/**
 * Retrieves the value of an integer output variable (alternate version for
 * group variables only 1 level deep).
 *
 * @param reporting an output variable.
 * @param subelement_name a string used to choose one element from a group
 *   output variable.  If NULL, <i>reporting</i> is assumed to be an integer
 *   output variable.
 * @returns the value, or 0 if a non-existent subelement was specified.
 */
long
RPT_reporting_get_integer1 (RPT_reporting_t * reporting, char *subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;
  long value = 0;

  if (subelement_name == NULL)
    {
      g_assert (reporting->type == RPT_integer);
      value = *((long *) reporting->data);
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name));
      if (subelement != NULL)
        value = RPT_reporting_get_integer (subelement, NULL);
    }

  return value;
}



/**
 * Sets the value of a real output variable.
 *
 * @param reporting an output variable.
 * @param value the new value. 
 * @param subelement_name a null-terminated array of strings used to "drill
 *   down" through group output variables.  If NULL, <i>reporting</i> is
 *   assumed to be a real output variable.
 */
void
RPT_reporting_set_real (RPT_reporting_t * reporting, double value, char **subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;

  if (subelement_name == NULL || subelement_name[0] == NULL)
    {
      g_assert (reporting->type == RPT_real);
      *((double *) reporting->data) = value;
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name[0]));
      /* If there isn't already a subelement by this name, create one. */
      if (subelement == NULL)
        {
          if (subelement_name[1] == NULL)
            /* The current subelement name is the last one in the list; the
             * next output variable down will be an real variable. */
            subelement = RPT_new_reporting (subelement_name[0], NULL,
                                            RPT_real, reporting->frequency, reporting->cumulative);
          else
            /* There are more subelement names in the list; the next output
             * variable down will be another group variable. */
            subelement = RPT_new_reporting (subelement_name[0], NULL,
                                            RPT_group, reporting->frequency, reporting->cumulative);
          g_datalist_set_data_full (group, subelement_name[0], subelement,
                                    RPT_free_reporting_as_GDestroyNotify);
        }
      RPT_reporting_set_real (subelement, value, &(subelement_name[1]));
    }
}



/**
 * Sets the value of a real output variable (alternate version for group
 * variables only 1 level deep).
 *
 * @param reporting an output variable.
 * @param value the new value. 
 * @param subelement_name a string used to choose one element from a group
 *   output variable.  If NULL, <i>reporting</i> is assumed to be a real output
 *   variable.
 */
void
RPT_reporting_set_real1 (RPT_reporting_t * reporting, double value, char *subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;

  if (subelement_name == NULL)
    {
      g_assert (reporting->type == RPT_real);
      *((double *) reporting->data) = value;
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name));
      /* If there isn't already a subelement by this name, create one. */
      if (subelement == NULL)
        {
          subelement = RPT_new_reporting (subelement_name, NULL,
                                          RPT_real, reporting->frequency, reporting->cumulative);
          g_datalist_set_data_full (group, subelement_name, subelement,
                                    RPT_free_reporting_as_GDestroyNotify);
        }
      RPT_reporting_set_real (subelement, value, NULL);
    }
}



/**
 * Adds to the value of a real output variable.
 *
 * @param reporting an output variable.
 * @param value the amount to add. 
 * @param subelement_name a null-terminated array of strings used to "drill
 *   down" through group output variables.  If NULL, <i>reporting</i> is
 *   assumed to be a real output variable.
 */
void
RPT_reporting_add_real (RPT_reporting_t * reporting, double value, char **subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;

  if (subelement_name == NULL || subelement_name[0] == NULL)
    {
      g_assert (reporting->type == RPT_real);
      *((double *) reporting->data) += value;
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name[0]));
      /* If there isn't already a subelement by this name, create one. */
      if (subelement == NULL)
        {
          if (subelement_name[1] == NULL)
            /* The current subelement name is the last one in the list; the
             * next output variable down will be an integer variable. */
            subelement = RPT_new_reporting (subelement_name[0], NULL,
                                            RPT_real, reporting->frequency, reporting->cumulative);
          else
            /* There are more subelement names in the list; the next output
             * variable down will be another group variable. */
            subelement = RPT_new_reporting (subelement_name[0], NULL,
                                            RPT_group, reporting->frequency, reporting->cumulative);
          g_datalist_set_data_full (group, subelement_name[0], subelement,
                                    RPT_free_reporting_as_GDestroyNotify);
        }
      RPT_reporting_add_real (subelement, value, &(subelement_name[1]));
    }
}



/**
 * Adds to the value of a real output variable (alternate version for group
 * variables only 1 level deep).
 *
 * @param reporting an output variable.
 * @param value the amount to add. 
 * @param subelement_name a string used to choose one element from a group
 *   output variable.  If NULL, <i>reporting</i> is assumed to be a real output
 *   variable.
 */
void
RPT_reporting_add_real1 (RPT_reporting_t * reporting, double value, char *subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;

  if (subelement_name == NULL)
    {
      g_assert (reporting->type == RPT_real);
      *((double *) reporting->data) += value;
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name));
      /* If there isn't already a subelement by this name, create one. */
      if (subelement == NULL)
        {
          subelement = RPT_new_reporting (subelement_name, NULL,
                                          RPT_real, reporting->frequency, reporting->cumulative);
          g_datalist_set_data_full (group, subelement_name, subelement,
                                    RPT_free_reporting_as_GDestroyNotify);
        }
      RPT_reporting_add_real (subelement, value, NULL);
    }
}



/**
 * Retrieves the value of a real output variable.
 *
 * @param reporting an output variable.
 * @param subelement_name a null-terminated array of strings used to "drill
 *   down" through group output variables.  If NULL, <i>reporting</i> is
 *   assumed to be an real output variable.
 * @returns the value, or 0 if a non-existent subelement was specified.
 */
double
RPT_reporting_get_real (RPT_reporting_t * reporting, char **subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;
  double value = 0;

  if (subelement_name == NULL || subelement_name[0] == NULL)
    {
      g_assert (reporting->type == RPT_real);
      value = *((long *) reporting->data);
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name[0]));
      if (subelement != NULL)
        value = RPT_reporting_get_real (subelement, &(subelement_name[1]));
    }

  return value;
}



/**
 * Retrieves the value of a real output variable (alternate version for group
 * variables only 1 level deep).
 *
 * @param reporting an output variable.
 * @param subelement_name a string used to choose one element from a group
 *   output variable.  If NULL, <i>reporting</i> is assumed to be a real
 *   output variable.
 * @returns the value, or 0 if a non-existent subelement was specified.
 */
double
RPT_reporting_get_real1 (RPT_reporting_t * reporting, char *subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;
  double value = 0;

  if (subelement_name == NULL)
    {
      g_assert (reporting->type == RPT_real);
      value = *((double *) reporting->data);
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name));
      if (subelement != NULL)
        value = RPT_reporting_get_real (subelement, NULL);
    }

  return value;
}



/**
 * Sets the value of a text output variable.
 *
 * @param reporting an output variable.
 * @param value the new value.  The text is copied so the original string can
 *   be freed after calling this function.
 * @param subelement_name a null-terminated array of strings used to "drill
 *   down" through group output variables.  If NULL, <i>reporting</i> is
 *   assumed to be a text output variable.
 */
void
RPT_reporting_set_text (RPT_reporting_t * reporting, char *value, char **subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;

  if (subelement_name == NULL || subelement_name[0] == NULL)
    {
      g_assert (reporting->type == RPT_text);
      g_string_printf ((GString *) reporting->data, "%s", value);
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name[0]));
      /* If there isn't already a subelement by this name, create one. */
      if (subelement == NULL)
        {
          if (subelement_name[1] == NULL)
            /* The current subelement name is the last one in the list; the
             * next output variable down will be a text variable. */
            subelement = RPT_new_reporting (subelement_name[0], NULL,
                                            RPT_text, reporting->frequency, reporting->cumulative);
          else
            /* There are more subelement names in the list; the next output
             * variable down will be another group variable. */
            subelement = RPT_new_reporting (subelement_name[0], NULL,
                                            RPT_group, reporting->frequency, reporting->cumulative);
          g_datalist_set_data_full (group, subelement_name[0], subelement,
                                    RPT_free_reporting_as_GDestroyNotify);
        }
      RPT_reporting_set_text (subelement, value, &(subelement_name[1]));
    }
}



/**
 * Sets the value of a text output variable (alternate version for group
 * variables only 1 level deep).
 *
 * @param reporting an output variable.
 * @param value the new value.  The text is copied so the original string can
 *   be freed after calling this function. 
 * @param subelement_name a string used to choose one element from a group
 *   output variable.  If NULL, <i>reporting</i> is assumed to be a text output
 *   variable.
 */
void
RPT_reporting_set_text1 (RPT_reporting_t * reporting, char *value, char *subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;

  if (subelement_name == NULL)
    {
      g_assert (reporting->type == RPT_text);
      g_string_printf ((GString *) reporting->data, "%s", value);
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name));
      /* If there isn't already a subelement by this name, create one. */
      if (subelement == NULL)
        {
          subelement = RPT_new_reporting (subelement_name, NULL,
                                          RPT_text, reporting->frequency, reporting->cumulative);
          g_datalist_set_data_full (group, subelement_name, subelement,
                                    RPT_free_reporting_as_GDestroyNotify);
        }
      RPT_reporting_set_text (subelement, value, NULL);
    }
}



/**
 * Appends to a text output variable.
 *
 * @param reporting an output variable.
 * @param value the text to append. 
 * @param subelement_name a null-terminated array of strings used to "drill
 *   down" through group output variables.  If NULL, <i>reporting</i> is
 *   assumed to be a text output variable.
 */
void
RPT_reporting_append_text (RPT_reporting_t * reporting, char *value, char **subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;

  if (subelement_name == NULL || subelement_name[0] == NULL)
    {
      g_assert (reporting->type == RPT_text);
      g_string_append_printf ((GString *) reporting->data, "%s", value);
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name[0]));
      /* If there isn't already a subelement by this name, create one. */
      if (subelement == NULL)
        {
          if (subelement_name[1] == NULL)
            /* The current subelement name is the last one in the list; the
             * next output variable down will be a text variable. */
            subelement = RPT_new_reporting (subelement_name[0], NULL,
                                            RPT_text, reporting->frequency, reporting->cumulative);
          else
            /* There are more subelement names in the list; the next output
             * variable down will be another group variable. */
            subelement = RPT_new_reporting (subelement_name[0], NULL,
                                            RPT_group, reporting->frequency, reporting->cumulative);
          g_datalist_set_data_full (group, subelement_name[0], subelement,
                                    RPT_free_reporting_as_GDestroyNotify);
        }
      RPT_reporting_append_text (subelement, value, &(subelement_name[1]));
    }
}



/**
 * Appends to a text output variable (alternate version for group variables
 * only 1 level deep).
 *
 * @param reporting an output variable.
 * @param value the text to append.
 * @param subelement_name a string used to choose one element from a group
 *   output variable.  If NULL, <i>reporting</i> is assumed to be a text output
 *   variable.
 */
void
RPT_reporting_append_text1 (RPT_reporting_t * reporting, char *value, char *subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;

  if (subelement_name == NULL)
    {
      g_assert (reporting->type == RPT_text);
      g_string_append_printf ((GString *) reporting->data, "%s", value);
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name));
      /* If there isn't already a subelement by this name, create one. */
      if (subelement == NULL)
        {
          subelement = RPT_new_reporting (subelement_name, NULL,
                                          RPT_text, reporting->frequency, reporting->cumulative);
          g_datalist_set_data_full (group, subelement_name, subelement,
                                    RPT_free_reporting_as_GDestroyNotify);
        }
      RPT_reporting_append_text (subelement, value, NULL);
    }
}



/**
 * Retrieves the value of a text output variable.
 *
 * @param reporting an output variable.
 * @param subelement_name a null-terminated array of strings used to "drill
 *   down" through group output variables.  If NULL, <i>reporting</i> is
 *   assumed to be a text output variable.
 * @returns the value, or NULL if a non-existent subelement was specified.
 */
char *
RPT_reporting_get_text (RPT_reporting_t * reporting, char **subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;
  char *value = NULL;

  if (subelement_name == NULL || subelement_name[0] == NULL)
    {
      g_assert (reporting->type == RPT_text);
      value = ((GString *) reporting->data)->str;
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name[0]));
      if (subelement != NULL)
        value = RPT_reporting_get_text (subelement, &(subelement_name[1]));
    }

  return value;
}



/**
 * Retrieves the value of a text output variable (alternate version for group
 * variables only 1 level deep).
 *
 * @param reporting an output variable.
 * @param subelement_name a string used to choose one element from a group
 *   output variable.  If NULL, <i>reporting</i> is assumed to be a text output
 *   variable.
 * @returns the value, or NULL if a non-existent subelement was specified.
 */
char *
RPT_reporting_get_text1 (RPT_reporting_t * reporting, char *subelement_name)
{
  GData **group;
  RPT_reporting_t *subelement;
  char *value = NULL;

  if (subelement_name == NULL)
    {
      g_assert (reporting->type == RPT_text);
      value = ((GString *) reporting->data)->str;
    }
  else
    {
      g_assert (reporting->type == RPT_group);
      group = (GData **) (&reporting->data);
      subelement = (RPT_reporting_t *) (g_datalist_get_data (group, subelement_name));
      if (subelement != NULL)
        value = RPT_reporting_get_text (subelement, NULL);
    }

  return value;
}



/**
 * Splices an existing output variable into another as a sub-variable.
 *
 * @param reporting an output variable.
 * @param subvar another output variable, to be added to <i>reporting</i> as a
 *   child.
 */
void
RPT_reporting_splice (RPT_reporting_t * reporting, RPT_reporting_t * subvar)
{
  GData **group;
  RPT_reporting_t *tmp;

  if (subvar == NULL)
    return;

  if (reporting->type != RPT_group)
    {
      g_error
        ("attempting to insert reporting variable \"%s\" into reporting variable \"%s\", which is of type %s, not group.",
         subvar->name, reporting->name, RPT_type_name[reporting->type]);
    }
  group = (GData **) (&reporting->data);

  /* Check for an existing sub-variable with the same name.  If one exists,
   * destroy it. */
  tmp = (RPT_reporting_t *) (g_datalist_get_data (group, subvar->name));
  if (tmp != NULL)
    RPT_free_reporting (tmp, TRUE);

  g_datalist_set_data_full (group, subvar->name, subvar, RPT_free_reporting_as_GDestroyNotify);

  return;
}



/**
 * Resets an output variable.  Integer and real output variables are set to 0.
 * Text variables are set to an empty string.  Group output variables have all
 * sub-variables cleared.  Contrast this with RPT_reporting_zero(), which sets
 * sub-variables to 0/empty string rather than removing them entirely.
 *
 * @sa RPT_reporting_zero
 *
 * @param reporting an output variable.
 */
void
RPT_reporting_reset (RPT_reporting_t * reporting)
{
#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER RPT_reporting_reset");
#endif

  switch (reporting->type)
    {
    case RPT_integer:
      *((long *) reporting->data) = 0;
      break;
    case RPT_real:
      *((double *) reporting->data) = 0;
      break;
    case RPT_text:
      g_string_truncate ((GString *) reporting->data, 0);
      break;
    case RPT_group:
      g_datalist_clear ((GData **) (&reporting->data));
      break;
    default:
      g_assert_not_reached ();
    }

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- EXIT RPT_reporting_reset");
#endif
}



/**
 * Wraps RPT_reporting_zero so that it can be used with the foreach function of
 * a GLib Keyed Data List, specifically, the Keyed Data List used in "group"
 * output variables.
 *
 * @param key_id the key.  Resolved to a string, the name of an output
 *   variable.
 * @param data an output variable, cast to a gpointer.
 * @param user_data not used, pass NULL.
 */
void
RPT_reporting_zero_as_GDataForeachFunc (GQuark key_id, gpointer data, gpointer user_data)
{
#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER RPT_reporting_zero_as_GDataForeachFunc");
#endif

  RPT_reporting_zero ((RPT_reporting_t *) data);

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- EXIT RPT_reporting_zero_as_GDataForeachFunc");
#endif
}



/**
 * Zeroes an output variable.  Integer and real output variables are set to 0.
 * Text variables are set to an empty string.  Group output variables have all
 * sub-variables (and sub-sub-variables, etc.) set to 0/empty string.  Contrast
 * this with RPT_reporting_reset(), which removes sub-variables entirely rather
 * than setting them to 0/empty string.
 *
 * @sa RPT_reporting_reset
 *
 * @param reporting an output variable.
 */
void
RPT_reporting_zero (RPT_reporting_t * reporting)
{
#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER RPT_reporting_zero");
#endif

  switch (reporting->type)
    {
    case RPT_integer:
      *((long *) reporting->data) = 0;
      break;
    case RPT_real:
      *((double *) reporting->data) = 0;
      break;
    case RPT_text:
      g_string_truncate ((GString *) reporting->data, 0);
      break;
    case RPT_group:
      g_datalist_foreach ((GData **) (&reporting->data),
                          RPT_reporting_zero_as_GDataForeachFunc, NULL);
      break;
    default:
      g_assert_not_reached ();
    }

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- EXIT RPT_reporting_zero");
#endif
}



/**
 * Returns the RPT_frequency_t matching a given string.
 *
 * @param s a string.
 * @return the RPT_frequency_t enumeration value matching <i>s</i>, or
 *   RPT_never if s does not match any enumeration value.
 */
RPT_frequency_t
RPT_string_to_frequency (char *s)
{
  RPT_frequency_t type;

  for (type = RPT_once; type < RPT_NFREQUENCIES; type++)
    if (strcmp (RPT_frequency_name[type], s) == 0)
      return type;

  return RPT_never;
}



/**
 * Reports whether an output variable should be reported on the given day,
 * FALSE otherwise.
 *
 * @param reporting an output variable.
 * @param day a day.
 * @return TRUE if the variable should be reported on the given day, FALSE
 *   otherwise.
 */
gboolean
RPT_reporting_due (RPT_reporting_t * reporting, unsigned int day)
{
  return (reporting->days) > 0 && (day % reporting->days == 0);
}



/**
 * This function is meant to be used with the foreach function of a GLib Keyed
 * Data List, specifically, the Keyed Data List used to store output variables
 * with sub-variables.  The function receives an output variable.  If the
 * output variable has a simple type (RPT_integer or RPT_real), this function
 * returns that; if the output variable is an RPT_group type, this function
 * recursively calls RPT_reporting_get_type to drill down to the base type.
 */
void
find_type (GQuark key_id, gpointer data, gpointer user_data)
{
  RPT_reporting_t *reporting;
  RPT_type_t *type;

  type = (RPT_type_t *) user_data;
  if (*type != RPT_unknown_type)
    return;

  reporting = (RPT_reporting_t *) data;
#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG,
         "find_type checking sub-variable \"%s\"", reporting->name);
#endif
  *type = RPT_reporting_get_type (reporting);
}



/**
 * Returns the base type of an output variable.
 *
 * @param reporting an output variable.
 * @return the type.
 */
RPT_type_t
RPT_reporting_get_type (RPT_reporting_t * reporting)
{
  RPT_type_t type;
  GData **group;

#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- ENTER RPT_reporting_get_type");
#endif

  if (reporting == NULL)
    goto end;

  type = reporting->type;
  if (type != RPT_group)
    goto end;

  type = RPT_unknown_type;
  group = (GData **) (&reporting->data);
  /* A GLib Keyed Data List provides only one way to get at items if you don't
   * know the keys: a foreach function.  So we use a foreach to drill down into
   * the sub-variables to find the base type.  You can see from the "find_type"
   * function above that it stops after finding the base type -- it doesn't
   * actually go through each sub-variable. */
  g_datalist_foreach (group, find_type, &type);

end:
#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "----- EXIT RPT_reporting_get_type");
#endif
  return type;
}

/* end of file reporting.c */

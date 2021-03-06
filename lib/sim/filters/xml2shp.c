/** @file xml2shp.c
 *
 * A filter that turns a SHARCSpread xml herd file into an ArcView file.
 *
 * call it as
 *
 * <code>xml2shp HERD-FILE [SHP-FILE]</code>
 *
 * SHP-FILE is the base name for the 3 ArcView files.  For example, if SHP-FILE
 * is "herddata", this program will output files named herddata.shp,
 * herddata.shx, and herddata.dbf.  If SHP-FILE is omitted, the output files
 * will have the same name as the herd file, but with .shp, .shx, and .dbf
 * extensions.
 *
 * @author Neil Harvey <neilharvey@gmail.com><br>
 *   Grid Computing Research Group<br>
 *   Department of Computing & Information Science, University of Guelph<br>
 *   Guelph, ON N1G 2W1<br>
 *   CANADA
 * @version 0.1
 * @date October 2005
 *
 * Copyright &copy; University of Guelph, 2005-2006
 * 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option)
 * any later version.
 */

#if HAVE_CONFIG_H
#  include <config.h>
#endif

#include <stdio.h>
#include <popt.h>
#include "herd.h"
#include <shapefil.h>

#if STDC_HEADERS
#  include <stdlib.h>
#  include <string.h>
#endif
#if HAVE_STRINGS_H
#  include <strings.h>
#endif



#define NATTRIBUTES 5



extern const char *HRD_status_name[];



/**
 * A log handler that simply discards messages.
 */
void
silent_log_handler (const gchar * log_domain, GLogLevelFlags log_level,
                    const gchar * message, gpointer user_data)
{
  ;
}



/**
 * Returns the length of the longest herd status name.
 */
int
max_status_name_length (void)
{
  int i;
  int len;
  int max = 0;

  for (i = 0; i < HRD_NSTATES; i++)
    {
      len = strlen (HRD_status_name[i]);
      if (len > max)
        max = len;
    }
  return max;
}



/**
 * Returns the length of the longest production type name.
 */
int
max_prod_type_length (HRD_herd_list_t * herds)
{
  int i, n;
  GPtrArray *names;
  int len;
  int max = 0;

  names = herds->production_type_names;
  n = names->len;
  for (i = 0; i < n; i++)
    {
      len = strlen ((char *) g_ptr_array_index (names, i));
      if (len > max)
        max = len;
    }
  return max;
}



/**
 * Returns the length of the longest herd ID string.
 */
int
max_herd_id_length (HRD_herd_list_t * herds)
{
  unsigned int i, n;
  HRD_herd_t *herd;
  int len;
  int max = 0;

  n = HRD_herd_list_length (herds);
  for (i = 0; i < n; i++)
    {
      herd = HRD_herd_list_get (herds, i);
      len = (herd->official_id != NULL) ? strlen (herd->official_id) : 0;
      if (len > max)
        max = len;
    }
  return max;
}



void
write_herds (SHPHandle shape_file, DBFHandle attribute_file, int *attribute_id,
             HRD_herd_list_t * herds, double *minbound, double *maxbound)
{
  HRD_herd_t *herd;
  SHPObject *herd_shape;
  int shape_id;
  double x, y;
  unsigned int n, i;

  /* The 1 in the argument list is the number of points. */
  herd_shape = SHPCreateSimpleObject (SHPT_POINT, 1, &x, &y, NULL);

  n = HRD_herd_list_length (herds);
  for (i = 0; i < n; i++)
    {
      herd = HRD_herd_list_get (herds, i);
      x = (double) herd->lon;
      y = (double) herd->lat;

      /* Keep track of the minimum and maximum x and y values, in case the
       * shapefile library gets them wrong. */
      if (i == 0)
        {
          minbound[0] = maxbound[0] = x;
          minbound[1] = maxbound[1] = y;
        }
      else
        {
          if (x < minbound[0])
            minbound[0] = x;
          else if (x > maxbound[0])
            maxbound[0] = x;
          if (y < minbound[1])
            minbound[1] = y;
          else if (y > maxbound[1])
            maxbound[1] = y;
        }

      herd_shape->padfX[0] = x;
      herd_shape->padfY[0] = y;
      SHPComputeExtents (herd_shape);
      /* The -1 is the library's code for creating a new object in the
       * shapefile as opposed to overwriting an existing one. */
      shape_id = SHPWriteObject (shape_file, -1, herd_shape);
      /* Sequence number */
      DBFWriteIntegerAttribute (attribute_file, shape_id, attribute_id[0], i);
      /* Herd ID */
      if (herd->official_id != NULL)
        DBFWriteStringAttribute (attribute_file, shape_id, attribute_id[1], herd->official_id);
      else
        DBFWriteStringAttribute (attribute_file, shape_id, attribute_id[1], "");
      /* Production type */
      DBFWriteStringAttribute (attribute_file, shape_id, attribute_id[2],
                               herd->production_type_name);
      /* Number of animals */
      DBFWriteIntegerAttribute (attribute_file, shape_id, attribute_id[3], herd->size);
      /* Number of status */
      DBFWriteStringAttribute (attribute_file, shape_id, attribute_id[4],
                               HRD_status_name[herd->initial_status]);
    }
  SHPDestroyObject (herd_shape);
}



int
main (int argc, char *argv[])
{
  poptContext option;
  struct poptOption options[2];
  const char *herd_file_name = NULL;    /* name of the herd file */
  char *arcview_file_name = NULL;       /* base name of the ArcView files */
  char *attribute_file_name;
  int verbosity = 0;
  HRD_herd_list_t *herds;
  unsigned int nherds;
  SHPHandle shape_file;
  DBFHandle attribute_file;
  int attribute_id[NATTRIBUTES];
  double minbound[2], maxbound[2];

  /* Get the command-line options and arguments.  There should be two command-
   * line argument, the name of the herd file and the base name for the ArcView
   * output files. */
  options[0].longName = "verbosity";
  options[0].shortName = 'V';
  options[0].argInfo = POPT_ARG_INT;
  options[0].arg = &verbosity;
  options[0].val = 0;
  options[0].descrip =
    "Message verbosity level (0 = simulation output only, 1 = + informational messages, 2 = + all debugging output)";
  options[0].argDescrip = "verbosity";

  options[1].longName = NULL;
  options[1].shortName = '\0';
  options[1].argInfo = 0;
  options[1].arg = NULL;
  options[1].val = 0;
  options[1].descrip = NULL;
  options[1].argDescrip = NULL;

  option = poptGetContext (NULL, argc, (const char **) argv, options, 0);

  /* Set the verbosity level. */
  if (verbosity < 2)
    {
      g_log_set_handler (NULL, G_LOG_LEVEL_DEBUG, silent_log_handler, NULL);
      g_log_set_handler ("herd", G_LOG_LEVEL_DEBUG, silent_log_handler, NULL);
    }
  if (verbosity < 1)
    {
      g_log_set_handler (NULL, G_LOG_LEVEL_INFO, silent_log_handler, NULL);
      g_log_set_handler ("herd", G_LOG_LEVEL_INFO, silent_log_handler, NULL);
    }
#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "verbosity = %i", verbosity);
#endif

  poptGetNextOpt (option);
  herd_file_name = poptGetArg (option);
  if (herd_file_name == NULL)
    g_error ("Need the name of a herd file.");

  poptGetNextOpt (option);
  arcview_file_name = g_strdup (poptGetArg (option));
  if (arcview_file_name == NULL)
    {
      char *herd_file_base_name;
      char *dot_location;

      /* Construct the ArcView file name based on the herd file name. */
      herd_file_base_name = g_path_get_basename (herd_file_name);
      dot_location = rindex (herd_file_base_name, '.');
      if (dot_location == NULL)
        arcview_file_name = g_strdup (herd_file_base_name);
      else
        arcview_file_name = g_strndup (herd_file_base_name, dot_location - herd_file_base_name);
#if DEBUG
      g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG,
             "using base name \"%s\" for ArcView files", arcview_file_name);
#endif
      g_free (herd_file_base_name);
    }
  poptFreeContext (option);

  herds = HRD_load_herd_list (herd_file_name);
  nherds = HRD_herd_list_length (herds);

#if INFO
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_INFO, "%i units read", nherds);
#endif
  if (nherds == 0)
    g_error ("no units in file %s", herd_file_name);

  /* Initialize the shape and DBF (attribute) files for writing. */
  shape_file = SHPCreate (arcview_file_name, SHPT_POINT);
  attribute_file_name = g_new (char, strlen (arcview_file_name) + 4 + 1);
  sprintf (attribute_file_name, "%s.dbf", arcview_file_name);
  attribute_file = DBFCreate (attribute_file_name);
#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG,
         "longest herd status name = %i chars", max_status_name_length ());
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG,
         "longest production type name = %i chars", max_prod_type_length (herds));
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "longest herd ID = %i chars", max_herd_id_length (herds));
#endif
  attribute_id[0] = DBFAddField (attribute_file, "seq", FTInteger, 9, 0);
  attribute_id[1] =
    DBFAddField (attribute_file, "id", FTString, MAX (1, max_herd_id_length (herds)), 0);
  attribute_id[2] =
    DBFAddField (attribute_file, "prodtype", FTString, max_prod_type_length (herds), 0);
  attribute_id[3] = DBFAddField (attribute_file, "size", FTInteger, 9, 0);
  attribute_id[4] = DBFAddField (attribute_file, "status", FTString, max_status_name_length (), 0);

  write_herds (shape_file, attribute_file, attribute_id, herds, minbound, maxbound);

  /* Check the computed extents against the ones cached in the SHPHandle
   * object. */
  if (minbound[0] != shape_file->adBoundsMin[0])
    {
      g_warning ("minimum x in SHPHandle (%g) != computed min (%g)", shape_file->adBoundsMin[0],
                 minbound[0]);
      shape_file->adBoundsMin[0] = minbound[0];
    }
  if (maxbound[0] != shape_file->adBoundsMax[0])
    {
      g_warning ("maximum x in SHPHandle (%g) != computed max (%g)", shape_file->adBoundsMax[0],
                 maxbound[0]);
      shape_file->adBoundsMax[0] = maxbound[0];
    }
  if (minbound[1] != shape_file->adBoundsMin[1])
    {
      g_warning ("minimum y in SHPHandle (%g) != computed min (%g)", shape_file->adBoundsMin[1],
                 minbound[1]);
      shape_file->adBoundsMin[1] = minbound[1];
    }
  if (maxbound[1] != shape_file->adBoundsMax[1])
    {
      g_warning ("maximum y in SHPHandle (%g) != computed max (%g)", shape_file->adBoundsMax[1],
                 maxbound[1]);
      shape_file->adBoundsMax[1] = maxbound[1];
    }

  /* Clean up. */
  HRD_free_herd_list (herds);
  SHPClose (shape_file);
  g_free (arcview_file_name);
  g_free (attribute_file_name);
  DBFClose (attribute_file);

  return EXIT_SUCCESS;
}

/* end of file xml2shp.c */

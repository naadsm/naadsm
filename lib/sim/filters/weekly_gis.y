%{
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
#elif HAVE_STRINGS_H
#  include <strings.h>
#endif

#include <assert.h>

/** @file filters/weekly_gis.c
 * A filter that takes a state table (output from state_table_filter) and an
 * ArcView file (output from xml2shp) and creates new ArcView files giving
 * weekly snapshots of the status of each herd for the first Monte Carlo trial.
 *
 * Call it as
 *
 * <code>weekly_gis_filter ARCVIEW-SHP-FILE < STATE-TABLE-FILE</code>
 *
 * Weekly ArcView files are written to the current working directory.  Their
 * names are the same as the base ArcView file but with _dayxxxx appended.
 *
 * @author Neil Harvey <neilharvey@gmail.com><br>
 *   Grid Computing Research Group<br>
 *   Department of Computing & Information Science, University of Guelph<br>
 *   Guelph, ON N1G 2W1<br>
 *   CANADA
 * @version 0.1
 * @date October 2005
 *
 * Copyright &copy; University of Guelph, 2005-2007
 * 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option)
 * any later version.
 */

#define YYERROR_VERBOSE
#define BUFFERSIZE 2048
#define COPY_BUFFERSIZE 8192

/* Prototype mysteriously not in <stdio.h> like the manpage says */
int snprintf (char *str, size_t size, const char *format, ...);

/* int yydebug = 1; must also compile with --debug to use this */
char errmsg[BUFFERSIZE];

extern const char *HRD_status_name[];

unsigned int nherds;
unsigned int last_day; /**< The most recent run number we have seen in the
  table. */
GArray *last_day_states; /**< Each item is of type HRD_status_t. */
const char *arcview_shp_filename = NULL;
char *arcview_base_name;
char *arcview_shx_filename = NULL;
char *arcview_dbf_filename = NULL;
gboolean done;



void
copy (char *src_filename, char *dest_filename)
{
  FILE *src, *dest;
  static char buffer [COPY_BUFFERSIZE];
  size_t len = 1;

  src = fopen (src_filename, "r");
  dest = fopen (dest_filename, "w");
  while (!feof (src))
    {
      len = fread (buffer, sizeof(char), COPY_BUFFERSIZE, src);
      if (len > 0)
        fwrite (buffer, sizeof(char), len, dest);    
    }
  fclose (dest);
  fclose (src);

  return;
}



/**
 * Creates ArcView files showing the herds in the given states.
 */
void
make_arcview (GArray *states, unsigned int day)
{
  char *tmp_shp_filename;
  char *tmp_shx_filename;
  char *tmp_dbf_filename;
  DBFHandle dbf_file;
  int status_field;
  unsigned int i;
  HRD_status_t status;

  tmp_shp_filename = g_strdup_printf ("%s_day%04u.shp", arcview_base_name, day);
  tmp_shx_filename = g_strdup_printf ("%s_day%04u.shx", arcview_base_name, day);
  tmp_dbf_filename = g_strdup_printf ("%s_day%04u.dbf", arcview_base_name, day);

  copy (arcview_shp_filename, tmp_shp_filename);
  copy (arcview_shx_filename, tmp_shx_filename);
  copy (arcview_dbf_filename, tmp_dbf_filename);

  /* Write the herd states into the DBF file. */
  dbf_file = DBFOpen (tmp_dbf_filename, "rb+");
  status_field = DBFGetFieldIndex (dbf_file, "status");
  for (i = 0; i < nherds; i++)
    {
      status = g_array_index (states, HRD_status_t, i);
      DBFWriteStringAttribute (dbf_file, i, status_field,
			       HRD_status_name[status]);
    }
  DBFClose (dbf_file);

  /* Clean up. */
  g_free (tmp_shp_filename);
  g_free (tmp_shx_filename);
  g_free (tmp_dbf_filename);

  return;
}

%}

%union {
  int ival;
  float fval;
  char *sval;
  GArray *lval;
}

%token NODE RUN DAY POLYGON
%token COMMA COLON EQ LBRACE RBRACE LPAREN RPAREN DQUOTE NEWLINE
%token <ival> INT
%token <fval> FLOAT
%token <sval> VARNAME STRING
%type <ival> herd_seqs
%type <lval> state_codes
%%
state_table:
    header_line NEWLINE data_lines NEWLINE
    { }
  ;

header_line:
    RUN COMMA DAY COMMA herd_seqs
    {
      nherds = $5;
#if DEBUG
      g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG, "# herds = %u", nherds);      
#endif
    }
  ;

herd_seqs:
    herd_seqs COMMA INT
    {
      /* Increment the count of herds. */
      $$ = $1 + 1;
    }
  | INT
    {
      /* Initialize the count of herds. */
      $$ = 1;
    }
  ;

data_lines:
    data_lines NEWLINE data_line
    { }
  | data_line
    { }
  ;

data_line:
    INT COMMA INT COMMA state_codes
    {
      unsigned int run, day;
      
      run = $1;

      /* We only create ArcView files for the first Monte Carlo run.  If we're
       * onto the second run, check whether the final day of the last run needs
       * to be written out.  After that, abort the parse. */
      if (run > 1)
	{
	  done = TRUE;
	  YYACCEPT;
	}

      /* Output an ArcView file for day 1, 8, 15, etc. */
      day = $3;
      if (day % 7 == 1)
	make_arcview ($5, day);

      if (last_day_states != NULL)
	g_array_free (last_day_states, TRUE);
      last_day_states = $5;
      last_day = day;
    }
  ;

state_codes:
    state_codes COMMA INT
    {
      $$ = $1;
      g_array_append_val ($$, $3);
    }
  | INT
    {
      /* Initialize an array of state codes. */
      $$ = g_array_sized_new (FALSE, FALSE, sizeof(HRD_status_t), nherds);
      g_array_append_val ($$, $1);
    }
  ;

%%
extern FILE *yyin;
extern int yylineno, tokenpos;
extern char linebuf[];

/* Simple yyerror from _lex & yacc_ by Levine, Mason & Brown. */
int
yyerror (char *s, int fatal)
{
  fprintf (stderr, "Error in output (line %d): %s:\n%s\n", yylineno, s, linebuf);
  fprintf (stderr, "%*s\n", 1+tokenpos, "^");
  if (fatal) exit (EXIT_FAILURE);
  return 0;
}



/**
 * A log handler that simply discards messages.
 */
void
silent_log_handler (const gchar * log_domain, GLogLevelFlags log_level,
		    const gchar * message, gpointer user_data)
{
  ;
}



int
main (int argc, char *argv[])
{
  poptContext option;
  struct poptOption options[2];
  int verbosity = 0;

  /* Get the command-line options and arguments.  There should be one command-
   * line argument, the name of the ArcView .shp file. */
  options[0].longName = "verbosity";
  options[0].shortName = 'V';
  options[0].argInfo = POPT_ARG_INT;
  options[0].arg = &verbosity;
  options[0].val = 0;
  options[0].descrip = "Message verbosity level (0 = simulation output only, 1 = + informational messages, 2 = + all debugging output)";
  options[0].argDescrip = "verbosity";

  options[1].longName = NULL;
  options[1].shortName = '\0';
  options[1].argInfo = 0;
  options[1].arg = NULL;
  options[1].val = 0;
  options[1].descrip = NULL;
  options[1].argDescrip = NULL;

  option = poptGetContext (NULL, argc, (const char **)argv, options, 0);
  poptGetNextOpt (option);
  arcview_shp_filename = poptGetArg (option);
  if (arcview_shp_filename == NULL
      || !g_str_has_suffix (arcview_shp_filename, ".shp"))
    g_error ("Need the name of an ArcView shape (.shp) file.");
  poptFreeContext (option);

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

  /* Get the base part (without the .shp) of the ArcView file name. */
  arcview_base_name = g_strndup (arcview_shp_filename,
				 strlen(arcview_shp_filename) - 4);
#if DEBUG
  g_log (G_LOG_DOMAIN, G_LOG_LEVEL_DEBUG,
	 "base part of ArcView file name = \"%s\"", arcview_base_name);
#endif  
  arcview_shx_filename = g_strdup_printf ("%s.shx", arcview_base_name);
  arcview_dbf_filename = g_strdup_printf ("%s.dbf", arcview_base_name);

  nherds = 0;
  done = FALSE;
  last_day_states = NULL;

  /* Call the parser. */
  if (yyin == NULL)
    yyin = stdin;
  while (!feof(yyin) && !done)
    yyparse();

  /* We want ArcView files for the final day.  If the final day was 1 plus a
   * multiple of 7, then the files have already been made.  If not, make
   * them. */
  if (last_day % 7 != 1)
    make_arcview (last_day_states, last_day);

  /* Clean up. */
  g_free (arcview_base_name);
  g_free (arcview_shx_filename);
  g_free (arcview_dbf_filename);
  if (last_day_states != NULL)
    g_array_free (last_day_states, TRUE);

  return EXIT_SUCCESS;
}

/* end of file weekly_gis.y */

/** @file model.h
 * Common interface for sub-models.
 *
 * The simulator design treats sub-models as interchangeable, mix-and-match
 * parts &mdash; "building blocks" &mdash; that are loaded on demand.  A
 * "simulation" is then the sum of the actions of the included sub-models.
 *
 * @image html building_blocks.png
 * @image latex building_blocks.eps width=4in
 *
 * <small>(Image copyright information below)</small>
 *
 * The interface is designed for the sub-models to be loaded at runtime.  The
 * dynamic loading mechanism needs to discover three functions in a module that
 * it loads.  The first, "interface_version", returns the version of model.h
 * the module conforms to.  This is a safeguard against loading out-of-date
 * modules.  The second function, "is_singleton", returns TRUE if just one
 * instance of the module can exist in memory, or FALSE if multiple instances
 * of the module can exist in memory.  The third function, "new", creates and
 * initializes an instance of the module.  The new function must fill in a set
 * of function pointers so that the module's functions can be called in an
 * object-oriented style, e.g., <code>model->printf(model)</code>.  See the
 * ergadm_model_t_ structure for a list of these functions.
 *
 * <b>Singleton modules</b>
 *
 * Originally, the idea was that elements in the XML parameter file would map
 * neatly onto module instances in memory.  For example, each disease-model
 * element in the parameter file &mdash; one per production type &mdash; would
 * cause one instance of the module defined in disease-model.c to be created.
 *
 * "Singleton" modules were added to address some problems with that initial
 * idea.
 *
 * First, there are cases where information should be shared among all
 * instances of a module.  For example, airborne spread calculations use a
 * histogram of herd sizes.  It doesn't make sense to keep multiple copies of
 * the histogram in memory, one stored with the parameters for spread from
 * production type A to production type B, one stored with the parameters for
 * spread from production type B to production type C, and so on.  This problem
 * is solved by making airborne spread a "singleton" module where a single
 * object in memory stores both the herd size histogram (global data)
 * <i>and</i> blocks of parameters for each production type combination.
 *
 * Second, the introduction of zones has complicated the parameterization of
 * some modules.  Before zones, the parameters for direct and indirect contact
 * spread depended on source and recipient production type.  Now, there are
 * some parameters that depend on source and recipient production type, and
 * some parameters that depend on source production type and zone.  By making
 * contact spread a singleton module, it is possible to read in different forms
 * of contact-spread-model elements and store the parameters correctly.  See
 * the test cases
 * <a href="test-xml-zones-movement_control_1.html">zones/movement_control_1</a>
 * and
 * <a href="test-xml-zones-detect_1_zones.html">zones/detect_1_zones.xml</a>
 * for examples of how this looks.
 *
 * <small>Image copyright information:
 *  - disease image (virus) is "Bluetongue virus" by Flickr user AJC1.
 *    Released under a Creative Commons Attribution-Noncommercial 2.0 Generic
 *    license.
 *  - airborne spread image (sky) is "Landscape Under a Stormy Sky" by Vincent
 *    Van Gogh.  Public domain image (copyright expired).
 *  - direct contact image (cow) is "When bovines attack" by Flickr user tricky.
 *    Released under a Creative Commons Attribution-Noncommercial-Share Alike
 *    2.0 Generic license.
 *  - indirect contact image (truck) is "truck" by Flickr user rickabbo.
 *    Released under a Creative Commons Attribution 2.0 Generic license.
 *  - detection image (Sherlock Holmes items) is by Wikimedia Commons user
 *    Alterego.  Released under the GNU Free Documentation License.
 *  - vaccination image (vials) is "Let me stabilize you" by Flickr user
 *    Pulpolux.  Released under a Creative Commons Attribution-Noncommercial
 *    2.0 Generic license.
 *  - destruction image (guillotine) is "Death Hangs in the Air" by Flickr user
 *    buck82.  Released under a Creative Commons Attribution-Noncommercial 2.0
 *    Generic license.
 * </small>
 *
 * @author Neil Harvey <neilharvey@gmail.com><br>
 *   Grid Computing Research Group<br>
 *   Department of Computing & Information Science, University of Guelph<br>
 *   Guelph, ON N1G 2W1<br>
 *   CANADA
 * @version 0.93
 * @date March 2003
 *
 * Copyright &copy; University of Guelph, 2003-2008
 * 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option)
 * any later version.
 */

#ifndef MODEL_H
#define MODEL_H

#include "herd.h"
#include "event.h"
#include "parameter.h"
#include "reporting.h"
#include "zone.h"
#include "rng.h"

#ifndef NO_MODEL_LIBS
#include <ltdl.h>
#endif


struct ergadm_model_t_;



/** Type of a function that checks the interface a model conforms to. */
typedef char *(*ergadm_model_interface_version_t) (void);



/** 
 * Type of a function that returns whether a model is a singleton (only one
 * instance should ever exist in memory) or not.
 */
typedef gboolean (*ergadm_model_is_singleton_t) (void);



/** Type of a function that creates and sets parameters for a model. */
typedef struct ergadm_model_t_ *(*ergadm_model_new_t) (PAR_parameter_t *,
                                                       HRD_herd_list_t *, ZON_zone_list_t *);



/** Type of a function that sets parameters for a model. */
typedef void (*ergadm_model_set_params_t) (struct ergadm_model_t_ *, PAR_parameter_t *);



/** Type of a function that frees a model. */
typedef void (*ergadm_model_free_t) (struct ergadm_model_t_ *);



/** Type of a function that runs a model. */
typedef void (*ergadm_model_run_t) (struct ergadm_model_t_ *,
                                    HRD_herd_list_t *, ZON_zone_list_t *,
                                    EVT_event_t *, RAN_gen_t *, EVT_event_queue_t *);



/** Type of a function that resets a model after one simulation run. */
typedef void (*ergadm_model_reset_t) (struct ergadm_model_t_ *);



/**
 * Type of a function that reports whether a model is listening for a given
 * event type.
 */
typedef gboolean (*ergadm_model_is_listening_for_t) (struct ergadm_model_t_ *, EVT_event_type_t);



/**
 * Type of a function that reports whether a model has any pending actions to
 * carry out.
 */
typedef gboolean (*ergadm_model_has_pending_actions_t) (struct ergadm_model_t_ *);



/**
 * Type of a function that reports whether a model has any pending infections
 * to cause.
 */
typedef gboolean (*ergadm_model_has_pending_infections_t) (struct ergadm_model_t_ *);



/** Type of a function that returns a string representation of a model. */
typedef char *(*ergadm_model_to_string_t) (struct ergadm_model_t_ *);



/** Type of a function that prints a model. */
typedef int (*ergadm_model_printf_t) (struct ergadm_model_t_ *);



/** Type of a function that prints a model to a stream. */
typedef int (*ergadm_model_fprintf_t) (FILE *, struct ergadm_model_t_ *);



/** A sub-model. */
typedef struct ergadm_model_t_
{
#ifndef NO_MODEL_LIBS
  lt_dlhandle handle; /**< A handle for the model's dynamic library.  This is used internally by the model loader and should not be modified. */
#endif
  char *name; /**< A short name for the model. */
  char *description; /**< A longer text description of the model. */
  EVT_event_type_t *events_created; /**< A list of events the model can announce. */
  unsigned int nevents_created; /**< Length of events_created. */
  EVT_event_type_t *events_listened_for; /**< A list of events the model listens for. */
  unsigned int nevents_listened_for; /**< Length of events_listened_for. */
  GPtrArray *outputs; /**< A list of the model's output variables. */
  void *model_data; /**< Specialized information for the particular model. */
  ergadm_model_set_params_t set_params; /**< A function that sets parameters
    for the model. */
  ergadm_model_run_t run; /**< A function that runs the model. */
  ergadm_model_reset_t reset; /**< A function that resets the model after one simulation run. */
  ergadm_model_is_listening_for_t is_listening_for; /**< A function that reports whether the model is listening for a given event type.*/
  ergadm_model_has_pending_actions_t has_pending_actions; /**< A function that reports whether the model has any pending actions to carry out.*/
  ergadm_model_has_pending_infections_t has_pending_infections; /**< A function
    that reports whether the model has any pending infections to cause. */
  ergadm_model_to_string_t to_string; /**< A function that returns a string representation of the model. */
  ergadm_model_printf_t printf; /**< A function that prints the model. */
  ergadm_model_fprintf_t fprintf; /**< A function that prints the model to a stream. */
  ergadm_model_free_t free; /**< A function that frees the model. */
}
ergadm_model_t;

#endif /* !MODEL_H */

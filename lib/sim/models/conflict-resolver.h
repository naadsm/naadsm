/** @file conflict-resolver.h
 *
 * @author Aaron Reeves <Aaron.Reeves@colostate.edu><br>
 *   Animal Population Health Institute<br>
 *   College of Veterinary Medicine and Biomedical Sciences<br>
 *   Colorado State University<br>
 *   Fort Collins, CO 80523<br>
 *   USA
 * @version 0.1
 * @date June 2005
 *
 * Copyright &copy; 2005 Animal Population Health Institute, Colorado State University
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option)
 * any later version.
 */

#ifndef CONFLICT_RESOLVER_H
#define CONFLICT_RESOLVER_H

char *conflict_resolver_interface_version (void);
ergadm_model_t *conflict_resolver_new (scew_element * params, HRD_herd_list_t * herds,
                                       ZON_zone_list_t * zones);

#endif

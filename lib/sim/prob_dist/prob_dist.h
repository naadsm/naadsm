/** @file prob_dist.h
 * Probability distributions.
 *
 * Symbols from this module begin with PDF_.
 *
 * Note to maintainer: I intended to use the random number distributions from
 * the GNU Scientific Library.  However, the GSL
 * <ol>
 *   <li>doesn't have a triangular distribution or a generic distribution built
 *     piecewise from trapezoids
 *   <li>assumes the use of a GSL random number generator
 *   <li>doesn't provide any way to pre-compute and store information to speed
 *     up sampling many values from a distribution
 * </ol>
 * hence this module.  However, the GSL has a wealth of distributions that may
 * be needed here in the future, so the Gaussian and Poisson distributions are
 * included here as examples of how to wrap GSL distributions.
 *
 * @author Neil Harvey <neilharvey@gmail.com><br>
 *   Grid Computing Research Group<br>
 *   Department of Computing & Information Science, University of Guelph<br>
 *   Guelph, ON N1G 2W1<br>
 *   CANADA
 * @version 0.1
 * @date February 2003
 *
 * Copyright &copy; University of Guelph, 2003-2006
 * 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option)
 * any later version.
 */
#ifndef PROB_DIST_H
#define PROB_DIST_H


#if defined(DLL_EXPORTS)
#	define DLL_API __declspec( dllexport )
#elif defined(DLL_IMPORTS)
# define DLL_API __declspec( dllimport )
#else
# define DLL_API
#endif

#include <stdio.h>
#include <glib.h>
#include <gsl/gsl_histogram.h>
#include <rng.h>



/**
 * A point probability distribution.
 */
typedef struct
{
  double value; /**< the number that the distribution will always return */
}
PDF_point_dist_t;



/**
 * A uniform probability distribution.
 */
typedef struct
{
  double a, b, range;
}
PDF_uniform_dist_t;



/**
 * A triangular probability distribution.  The structure also stores some
 * values to speed up functions for the distribution.
 *
 * @image html triangular.png
 * @image latex triangular.eps width=5cm
 */
typedef struct
{
  double a, b, c;
  double range; /**< b - a */
  double width_1; /**< width of the first triangle */
  double rw1; /**< range * width_1 */
  double P; /**< area under first triangle */
  double width_2; /**< width of the second triangle */
  double rw2; /**< range * width_2 */
  double one_minus_P; /**< area under second triangle */
}
PDF_triangular_dist_t;



/**
 * A piecewise probability distribution.  The structure also stores some values
 * to speed up drawing many random variates from the distribution.
 */
typedef struct
{
  unsigned int n; /**< number of points on the curve */
  double *x; /**< x-coordinates of points on the curve */
  double first_x; /**< lowest x-coordinate */
  double last_x; /**< highest x-coordinate */
  double *y; /**< y-coordinates of points on the curve */
  double *slope; /**< slopes of segments of the curve */
  double *cumul; /**< cumulative probability at each x-coordinate */
}
PDF_piecewise_dist_t;



/**
 * A histogram used as a probability distribution.
 */
typedef struct
{
  gsl_histogram *histo;
  gsl_histogram_pdf *pdf;
  double first_x; /**< lowest x-coordinate */
  double last_x; /**< highest x-coordinate */
}
PDF_histogram_dist_t;



/**
 * A Gaussian probability distribution.
 */
typedef struct
{
  double mu; /**< mean */
  double sigma; /**< standard deviation */
}
PDF_gaussian_dist_t;



/**
 * A Poisson probability distribution.
 */
typedef struct
{
  double mu; /**< mean */
}
PDF_poisson_dist_t;



/**
 * A beta probability distribution.
 */
typedef struct
{
  double alpha, beta;
  double location, scale;
  double width;
}
PDF_beta_dist_t;



/**
 * A gamma probability distribution.
 */
typedef struct
{
  double alpha, beta;
}
PDF_gamma_dist_t;



/**
 * A Weibull probability distribution.
 */
typedef struct
{
  double alpha, beta;
}
PDF_weibull_dist_t;



/**
 * An exponential probability distribution.
 */
typedef struct
{
  double mean;
}
PDF_exponential_dist_t;



/**
 * An Pearson Type V probability distribution.
 */
typedef struct
{
  double alpha, beta, one_over_beta, loggamma_alpha;
}
PDF_pearson5_dist_t;



/**
 * A logistic probability distribution.
 */
typedef struct
{
  double location, scale;
}
PDF_logistic_dist_t;



/**
 * A loglogistic (a.k.a. Fisk) probability distribution.
 */
typedef struct
{
  double location, scale, shape;
  double shape_over_scale;
}
PDF_loglogistic_dist_t;



/**
 * A lognormal probability distribution.
 */
typedef struct
{
  double zeta, sigma;
}
PDF_lognormal_dist_t;



/** Probability distributions in this module. */
typedef enum
{
  PDF_Point, PDF_Uniform, PDF_Triangular, PDF_Piecewise, PDF_Histogram,
  PDF_Gaussian, PDF_Poisson, PDF_Beta, PDF_Gamma, PDF_Weibull, PDF_Exponential,
  PDF_Pearson5, PDF_Logistic, PDF_LogLogistic, PDF_Lognormal
}
PDF_dist_type_t;



/** A supertype for all probability distributions. */
typedef struct
{
  PDF_dist_type_t type;
  union
  {
    PDF_point_dist_t point;
    PDF_uniform_dist_t uniform;
    PDF_triangular_dist_t triangular;
    PDF_piecewise_dist_t piecewise;
    PDF_histogram_dist_t histogram;
    PDF_gaussian_dist_t gaussian;
    PDF_poisson_dist_t poisson;
    PDF_beta_dist_t beta;
    PDF_gamma_dist_t gamma;
    PDF_weibull_dist_t weibull;
    PDF_exponential_dist_t exponential;
    PDF_pearson5_dist_t pearson5;
    PDF_logistic_dist_t logistic;
    PDF_loglogistic_dist_t loglogistic;
    PDF_lognormal_dist_t lognormal;
  }
  u;
  gboolean has_inf_lower_tail, has_inf_upper_tail;
}
PDF_dist_t;



/* Prototypes. */
PDF_dist_t *PDF_new_point_dist (double);
PDF_dist_t *PDF_new_uniform_dist (double a, double b);
PDF_dist_t *PDF_new_triangular_dist (double a, double c, double b);
PDF_dist_t *PDF_new_piecewise_dist (unsigned int, double *xy);
PDF_dist_t *PDF_new_histogram_dist (gsl_histogram *);
PDF_dist_t *PDF_new_gaussian_dist (double mu, double sigma);
PDF_dist_t *PDF_new_poisson_dist (double mu);
PDF_dist_t *PDF_new_beta_dist (double alpha, double beta, double location, double scale);
PDF_dist_t *PDF_new_beta_pert_dist (double min, double mode, double max);
PDF_dist_t *PDF_new_gamma_dist (double alpha, double beta);
PDF_dist_t *PDF_new_weibull_dist (double alpha, double beta);
PDF_dist_t *PDF_new_exponential_dist (double mean);
PDF_dist_t *PDF_new_pearson5_dist (double alpha, double beta);
PDF_dist_t *PDF_new_logistic_dist (double location, double scale);
PDF_dist_t *PDF_new_loglogistic_dist (double location, double scale, double shape);
PDF_dist_t *PDF_new_lognormal_dist (double zeta, double sigma);

void PDF_free_dist (PDF_dist_t *);
PDF_dist_t *PDF_clone_dist (PDF_dist_t *);
char *PDF_dist_to_string (PDF_dist_t *);
int PDF_fprintf_dist (FILE *, PDF_dist_t *);

#define PDF_printf_dist(D) PDF_fprintf_dist(stdout,D)

double PDF_random (PDF_dist_t *, RAN_gen_t * rng);
double PDF_pdf (double, PDF_dist_t *);
double PDF_cdf (double, PDF_dist_t *);
double PDF_inverse_cdf (double, PDF_dist_t *);


/* These functions may be called from a library to calculate various values from different distributions */
DLL_API double ar_triangular_pdf (double x, double min, double mode, double max);
DLL_API double ar_triangular_cdf (double x, double min, double mode, double max);
DLL_API double ar_triangular_inverse_cdf (double area, double min, double mode, double max);

DLL_API double ar_poisson_pdf (double x, double mean);
DLL_API double ar_poisson_cdf (double x, double mean);

DLL_API double ar_beta_pdf (double x, double alpha, double beta, double location, double scale);
DLL_API double ar_beta_cdf (double x, double alpha, double beta, double location, double scale);
DLL_API double ar_beta_inverse_cdf (double area, double alpha, double beta, double location,
                                    double scale);

DLL_API double ar_beta_pert_pdf (double x, double min, double mode, double max);
DLL_API double ar_beta_pert_cdf (double x, double min, double mode, double max);
DLL_API double ar_beta_pert_inverse_cdf (double area, double min, double mode, double max);

DLL_API double ar_pearson5_pdf (double x, double alpha, double beta);
DLL_API double ar_pearson5_cdf (double x, double alpha, double beta);
DLL_API double ar_pearson5_inverse_cdf (double area, double alpha, double beta);

DLL_API double ar_loglogistic_pdf (double x, double location, double scale, double shape);
DLL_API double ar_loglogistic_cdf (double x, double location, double scale, double shape);
DLL_API double ar_loglogistic_inverse_cdf (double area, double location, double scale,
                                           double shape);


#endif /* !PROB_DIST_H */

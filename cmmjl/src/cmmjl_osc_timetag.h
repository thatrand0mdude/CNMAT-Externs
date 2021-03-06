/** 	@file cmmjl_osc_timetag.h Utilities for manipulating OSC timetags
	@authors Andy Schmeder, John MacCallum
	@addtogroup 	OSC 
@{
*/
/*
Copyright (c) 2008.  The Regents of the University of California (Regents).
All Rights Reserved.

Permission to use, copy, modify, and distribute this software and its
documentation for educational, research, and not-for-profit purposes, without
fee and without a signed licensing agreement, is hereby granted, provided that
the above copyright notice, this paragraph and the following two paragraphs
appear in all copies, modifications, and distributions.  Contact The Office of
Technology Licensing, UC Berkeley, 2150 Shattuck Avenue, Suite 510, Berkeley,
CA 94720-1620, (510) 643-7201, for commercial licensing opportunities.

Written by Andy Schmeder and John MacCallum, The Center for New Music and 
Audio Technologies, University of California, Berkeley.

     IN NO EVENT SHALL REGENTS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT,
     SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS,
     ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF
     REGENTS HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

     REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT
     LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
     FOR A PARTICULAR PURPOSE. THE SOFTWARE AND ACCOMPANYING
     DOCUMENTATION, IF ANY, PROVIDED HEREUNDER IS PROVIDED "AS IS".
     REGENTS HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES,
     ENHANCEMENTS, OR MODIFICATIONS.

*/

#ifndef __CMMJL_OSC_TIMETAG_H__
#define __CMMJL_OSC_TIMETAG_H__

#include "cmmjl.h"

#define TIME_NULL       0 
#define TIME_NOW        1
#define TIME_IMMEDIATE  2
#define TIME_STAMP      3

typedef struct _ntptime {
  unsigned long int sec;
  unsigned long int frac_sec;
  int sign;
  int type;
} ntptime;

// conversions 
void cmmjl_osc_timetag_iso8601_to_ntp(char* s, ntptime* n);
void cmmjl_osc_timetag_ntp_to_iso8601(ntptime* n, char* s);

void cmmjl_osc_timetag_float_to_ntp(double d, ntptime* n);
double cmmjl_osc_timetag_ntp_to_float(ntptime* n);

void cmmjl_osc_timetag_ut_to_ntp(long int ut, ntptime* n);
long int cmmjl_osc_timetag_ntp_to_ut(ntptime* n);

// operations
void cmmjl_osc_timetag_add(ntptime* a, ntptime* b, ntptime* r);
int cmmjl_osc_timetag_cmp(ntptime* a, ntptime* b);

int cmmjl_osc_timetag_is_immediate(char *buf);

// generation
void cmmjl_osc_timetag_now_to_ntp(ntptime* n);

/**	Get the timetag out of the OSC bundle

	@param	n	The length of the OSC data
	@param	ptr	A pointer to the OSC data
	@param	r	A pointer to an ntptime struct where the timetag will be stored.
	@returns	An error if one occured, or #CMMJL_SUCCESS;
	@retval		#CMMJL_SUCCESS
	@retval 	#CMMJL_OSC_EBADBNDL
*/
t_cmmjl_error cmmjl_osc_timetag_get(long n, long ptr, ntptime *r);
t_cmmjl_error cmmjl_osc_timetag_set(long n, long ptr, ntptime *r);

#endif

/**@}*/

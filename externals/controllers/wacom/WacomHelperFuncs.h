/*----------------------------------------------------------------------------
NAME

 WacomHelperFuncs.h -- Helper functions youcan use when creating a tablet
							  aware application.

 ABOUT:
	These functions where taken out of the "Next Generation Tablet Software
	ImplementerŐs Guide, MacOS X" which can be found on Wacom's dev web site
	<http://www.wacomeng.com/devsupport/mac.html>.

 COPYRIGHT

 Copyright WACOM Technologies, Inc. 2002
 All rights reserved.

 -----------------------------------------------------------------------------*/

#if __MWERKS__
#include <Carbon.h>
#else
#include <Carbon/Carbon.h>
#endif

#ifndef WACOMHELPERFUNCS_H
#define WACOMHELPERFUNCS_H

typedef UInt16 WacomTrackingResult;
enum {
	kWacomTrackingMouseDown			= 1,
	kWacomTrackingMouseUp			= 2,
	kWacomTrackingMouseExited		= 3,
	kWacomTrackingMouseEntered		= 4,
	kWacomTrackingMouseDragged		= 5,
	kWacomTrackingKeyModifiersChanged = 6,
	kWacomTrackingUserCancelled	= 7,
	kWacomTrackingTimedOut			= 8,
	kWacomPureTabletEvent			= 9,
};


OSStatus WacomTrackMouseLocationUsingHandlers(GrafPtr						inPort,	/* can be NULL */
															 HIPoint *					outPt,
															 WacomTrackingResult *  outResult);
OSStatus WacomTrackMouseReturnEvent(EventRef *eventRef);

#endif

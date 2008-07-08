/*----------------------------------------------------------------------------
NAME

 WacomHelperFuncs.c -- Helper functions youcan use when creating a tablet
							  aware application.
 
 ABOUT:
	These functions where taken out of the "Next Generation Tablet Software
	Implementer�s Guide, MacOS X" which can be found on Wacom's dev web site
	<http://www.wacomeng.com/devsupport/mac.html>.

 COPYRIGHT

 Copyright WACOM Technologies, Inc. 2002
 All rights reserved.

 -----------------------------------------------------------------------------*/

#include "WacomHelperFuncs.h"

//////////////////////////////////////////////////////////////////////////////
/*
*  WacomTrackMouseLocationUsingHandlers
*
*  This function is similar to Apple's TrackMouseLocation. The difference is
*  that this function will call your Carbon Event Handlers for the mouse and
*  tablet events. Also, the mouse locatin is returned in a HIPoint that is
*  local to inPort as oppossed to a Point (typeQDPoint).
*
*  inPort can be NULL, if so the current port is used.
*/
OSStatus WacomTrackMouseLocationUsingHandlers(GrafPtr						inPort,
															 HIPoint *				 	outPt,
															 WacomTrackingResult *  outResult)
{
	// List of events we want to track
	const EventTypeSpec	events[ 5 ] = { { kEventClassMouse, kEventMouseDown },
													 { kEventClassMouse, kEventMouseUp },
													 { kEventClassMouse, kEventMouseDragged },
													 { kEventClassTablet, kEventTabletPointer },
													 { kEventClassTablet, kEventTabletProximity } };
	
	// Function Variables
	EventRef	eventRef;
	GrafPtr	oldPort;
	GrafPtr	curPort;
	HIPoint	locHIPoint;
	HIPoint	deltaHIPoint;
	Point		aQDPoint;
	Rect		portRect;
	OSStatus	result = noErr;
	
	*outResult = kWacomTrackingTimedOut;
	
	// Look for tablet & mouse events.
	result = ReceiveNextEvent( 5,
										events,
										kEventDurationForever,
										true,
										&eventRef );
	if ( result == noErr )
	{
		// Initially guess as result type.
		if (GetEventClass(eventRef) == kEventClassMouse)
		{
			switch (GetEventKind(eventRef))
			{
				case kEventMouseDown:
					*outResult = kWacomTrackingMouseDown;
				break;
		
				case kEventMouseUp:
					*outResult = kWacomTrackingMouseUp;
				break;
		
				case kEventMouseDragged:
					*outResult = kWacomTrackingMouseDragged;
				break;
		
				default:
				break;
			}
		}
		else
		{
			// If this is not a mouse event then it must be a tablet event
			// in which case the outPt will not be valid.
			*outResult = kWacomPureTabletEvent;
		}
	
		// Make sure outPt is not NULL or else a crash will occur
		if (outPt != NULL)
		{
			GetPort(&oldPort);
	
			// Set the current grafPort to inPort. If inPort == NULL then use
			// the current grafPort.
			if ( inPort != NULL )
			{
				SetPort(inPort);
				curPort = inPort;
			}
			else
			{
				curPort = oldPort;
			}
	
			// Get the mouse location of the event as a HIPoint, so that we
			// get sub-pixel information. If this is not a mouse event (ie
			// tablet event) then GetEventParameter will return an error and
			// we ignore trying to return the mouse loc.
			if(noErr == GetEventParameter(eventRef,
													kEventParamMouseLocation,
													typeHIPoint, NULL,
													sizeof(HIPoint), NULL,
													(void *)&locHIPoint))
			{
				// Must convert the point from Global to Local coordinates
				// but we must be careful and maintain the sub-pixel information.
				aQDPoint.h = locHIPoint.x;
				aQDPoint.v = locHIPoint.y;
		
				GlobalToLocal(&aQDPoint);
		
				locHIPoint.x = (locHIPoint.x - trunc(locHIPoint.x)) +
									(double)aQDPoint.h;
				locHIPoint.y = (locHIPoint.y - trunc(locHIPoint.y)) + 
									(double)aQDPoint.v;
		
				// return the local mouse location, however, if outPt is NULL,
				// we do not want to crash. But, we still need to current mouse
				// location to determine if this really be called an enter or
				// exit result.
				if ( outPt != NULL )
				{
					*outPt = locHIPoint;
				}
	
				// If we can get a mouse delta then we can determine the mouse
				// location of the mouse event before this one and can thus check
				// if this an enter or exit or plain drag event.
				// GetEventParameter will return an error if this is not a mouse
				// move or drag. But in such a case, the track result should not
				// be Enter or Exit and was thus handled above properly.
				if(noErr == GetEventParameter(eventRef,
														kEventParamMouseDelta,
														typeHIPoint, NULL,
														sizeof(HIPoint), NULL,
														(void *)&deltaHIPoint))
				{
					Boolean oldPointInBounds;
					Boolean newPointInBounds;
		
					GetPortBounds(curPort, &portRect);
			
					// Check to see if the mouse loc for this event is inside
					// the window�s bounds.
					newPointInBounds = MacPtInRect(aQDPoint, &portRect);
			
					// Calculate the previous mouse location using the delta info
					aQDPoint.h = (locHIPoint.x - deltaHIPoint.x);
					aQDPoint.v = (locHIPoint.y - deltaHIPoint.y);
			
					// Check to see if the previous mouse loc for this event is
					// inside the window�s bounds.
					oldPointInBounds = MacPtInRect(aQDPoint, &portRect);
			
					// If both mouse locations are inside the window, or both mouse
					// locations are outside the window then the tracking result is 
					// neither Enter nor Exit. The initial tracking guess was
					// correct.
					if ( oldPointInBounds != newPointInBounds)
					{
						// One mouse location is in the window and the other
						// is outside the window. If the current mouse loc is in
						// the window then this must be an Enter event, else it
						// must be an exit event.
						if (newPointInBounds)
						{
							*outResult = kWacomTrackingMouseEntered;
						}
						else
						{
							*outResult = kWacomTrackingMouseExited;
						}
					}
		
				}
			}
	
			// Don�t forget to set the current port back to what it was before
			// we changed it.
			SetPort(oldPort);
		}
	
		// If there was an event, invoke the application's event handlers for it.
		SendEventToEventTarget ( eventRef, GetEventDispatcherTarget() );
		
		// Since we pulled the event off the queue, we have to release it.
		ReleaseEvent( eventRef );
	}
	
	return result;
}

//////////////////////////////////////////////////////////////////////////////
/*
*	WacomTrackMouseReturnEvent
*
*  Once entered this function waits for a mouse event or tablet event. When
*  one of these events occur, the function returns the EventRef containing
*  the mouse or tablet event to the caller. It is the caller's responsibility
*  to dispose of the event. While there is no activity, the current event loop
*  is run, effectively blocking the current thread (save for any timers that
*  fire). This helps to minimize CPU usage when there is nothing going on.
*
*  IMPORTANT:
*  It is the caller's responsibility to dispose of the returned event using
*  ReleaseEvent( eventRef );
*/
OSStatus WacomTrackMouseReturnEvent(EventRef *eventRef)
{
	const EventTypeSpec	events[ 6 ] = { { kEventClassMouse, kEventMouseDown },
													 { kEventClassMouse, kEventMouseUp },
													 { kEventClassMouse, kEventMouseMoved },
													 { kEventClassMouse, kEventMouseDragged },
													 { kEventClassTablet, kEventTabletPointer },
													 { kEventClassTablet, kEventTabletProximity } };
	OSStatus		result = noErr;
	
	// Check make sure eventRef exists. Avoid crashing.
	if(eventRef == NULL)
	{
		return paramErr;
	}
	// Look for tablet & mouse events.
	result = ReceiveNextEvent( 6,
										events,
										kEventDurationForever,
										true,
										eventRef );
	return result;
}

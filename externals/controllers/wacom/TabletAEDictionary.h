/*----------------------------------------------------------------------------

NAME

TabletAEDictionary.h -- Tablet Apple Event Constants


COPYRIGHT

Copyright WACOM Technologies, Inc. 2002
All rights reserved.

-----------------------------------------------------------------------------*/
#ifndef TABLETAEDICTIONARY_H
#define TABLETAEDICTIONARY_H


#define kEndOfList			nil			// Nil terminator for variable argument list.

#define kWacomDriverSig		'WaCM'

#define cWTDDriver			'Drvr'
#define cWTDTablet			'Tblt'
#define cWTDCustomizedApp	'Tcap'
#define cWTDTransducer		'Tran'
#define cWTDButton			'Butn'
#define cWTDWheel				'Whel'
#define cWTDRoller			'Roll'
#define cWTDMenuItem			'Mitm'
#define cWTDPopItem			'Pitm'

// Driver Properties
/////// pVersion							// typeVersion r/o
#define pRate					'Drat'	// typeShortInteger r/o
#define pTabletDriverPrefs 'Tprf'	// used with a save event

// Tablet Properties
/////// pVersion							// typeVersion r/o
/////// pName								// typeChar r/o
#define pXDimension			'Xdim'	// typeLongInteger r/o
#define pYDimension			'Ydim'	// typeLongInteger r/o
#define pResolution			'Resl'	// typeLongInteger r/o
#define pSize					'Tsiz'	// typeLongRectangle r/w
#define pOrientation			'Oren'	// typeEnumerated r/o
#define pTiltLevels			'Tlvl'	// typeShortInteger r/o

// Application Properties
#define pAppID					'Cacc'	// typeChar r/o
#define pAppName				pName		// typeUInt32 r/o (4 char code)

// Transducer Properties
/////// pName								// typeChar r/o
#define pTiltSens				'Tsen'	// typeShortInteger r/w
#define pClickAssist			'Cass'	// typeBoolean r/w
#define pAssistDistance		'Dcad'	// typeLongInteger r/w
#define pAssistTime			'Dctm'	// typeLongInteger r/w
#define pType					'Type'	// typeLongInteger r/o
#define pSerialNumber		'tSSN'	// typeLongInteger r/o
#define UniqueID				'UqId'	// typeLongPoint r/o
#define DeviceID				'DvId'	// does not exist yet
#define pPositioningMode	'Pmde'	// typeEnumerated r/w
#define pMapScreenArea		'Smap'	// typeQDRectangle r/w
#define pMapTabletArea		'Tmap'	// typeLongRectangle r/w
#define pMapDisplayNum		'MpTp'	// typeLongInteger w/o (write only)


// Button Properties
/////// pName								// typeChar r/o
#define pButtonFunction		'Bfcn'	// typeEnumerated r/w
#define pPressLevels			'Plvl'	// typeShortInteger r/o
#define pClickPressure		'Cprs'	// typeShortInteger r/w
#define pPressureSen			'Psen'	// typeEnumerated r/w
#define pForceRange			'Frng'	// typeShortInteger r/w
#define pForceMin				'Fmin'	// typeShortInteger r/w
#define pForceMax				'Fmax'	// typeShortInteger r/w
#define pButtonKeys			'Bkey'	// typeChar r/w
#define pButtonRun			'Brun'	// typeChar r/w
#define pButtonModifiers	'Bmod'	// typeLongInteger r/w
#define pButtonMacro			'Bmac'	// does not exist yet

// Wheel Properties
#define pWheelFunction				'Wfcn'	// typeEnumerated r/w
#define pWheelReverseDirection	'Wrvd'	// typeBoolean r/w
#define pWheelLinesPerNotch		'WLpN'	// typeSInt32 r/w
#define pWheelKeysUp					'Wkyu'	// typeChar r/w
#define pWheelKeysDown				'Wkyd'	// typeChar r/w

// Roller Properties
#define pRollerFunction				'Rfcn'	// typeEnumerated r/w
#define pRollerSen					'Rsen'	// typeEnumerated r/w
#define pRollerReverseDirection	'Wrvd'	// typeBoolean r/w
#define pRollerKeysUp				'Rkyu'	// typeChar r/w
#define pRollerKeysDown				'Rkyd'	// typeChar r/w

// Menu Strip Properties
/////// pName										// typeChar r/o
#define pMenuFunction		'Mfcn'			// typeEnumerated r/w
#define pMenuKeys				'Mkey'			// typeChar r/w
#define pMenuMacro			pButtonMacro	// does not exist yet
#define pMenuRun				pButtonRun		// typeChar r/w

// Popup menu Properties
#define pPopupFunction		'Pfcn'			// typeEnumerated r/w
#define pPopupKeys			'Pkey'			// typeChar r/w
#define pPopupMacro			pButtonMacro	// does not exist yet
#define pPopupRun				pButtonRun		// typeChar r/w

#pragma mark
#pragma mark *** Enums ***
// Tablet Orentation Enums
#define eOrientation			'Ornt'
#define eOrientLandscape	'Land'
#define eOrientPortrait		'Port'
#define eOrientLandscapeFlipped	'Lflp'
#define eOrientPortraitFlipped	'Pflp'

// Cursor Positiioning Mode Enums
#define ePositioningMode			'Pmod'
#define ePositioningAbsolute		'Absl'
#define ePositioningRelative		'Rela'

// Tip Pressure Sensitivity Enums
#define ePressureRange				'Pcrv'
#define ePressureSoftest			'Pc00'
#define ePressureSofter				'Pc02'
#define ePressureSoft				'Pc03'
#define ePressureNormal				'Pc04'
#define ePressureFirm				'Pc05'
#define ePressureFirmer				'Pc06'
#define ePressureFirmest			'Pc08'

// Button Function Enums
#define eButtonFunction				'Bfcs'
#define eButtonFuncIgnore			'Ignr'
#define eButtonLeftClick			'Clic'
#define eButtonMiddleClick 		'Mclk'
#define eButtonRightClick			'Rclk'
#define eButtonLeftDoubleClick	'Dclk'
#define eButtonMiddleDoubleClick	'??B3'
#define eButtonRightDoubleClick	'??B4'
#define eButtonLeftClickLock		'Clok'
#define eButtonKeystrokes			'Keys'
#define eButtonModifiers			'Mods'
#define eButtonPressureHold 		'Phld'
#define eButtonModeToggle			'Mtgl'
#define eButtonMacro					'Mkro'
#define eButtonScreenMacro			'Smkr'
#define eButtonAutoErase			'Aers'
#define eButtonBumbleFree			'Eras'
#define eButtonEraseKeystroke 	'Ekey'
#define eButtonEraseModifier 		'Emod'
#define eButtonEraseMacro			'Emac'
#define eButtonButton4Click 		'4clk'
#define eButtonButton5Click 		'5clk'
#define eButtonMiddleClickLock 	'??B7'
#define eButtonRightClickLock 	'??B8'
#define eButtonRunApplication		'Runa'
#define eButtonToggleInkAnywhere 'InkT'

// Wheel Function Enums
#define eWheelFunction				'Wfcs'
#define eWheelLineScroll			'Lscr'
#define eWheelPagecroll				'Pscr'
#define eWheelKeyScroll				'Kscr'
#define eWheelIgnored				'Ignr'

// Roller Function Enums
#define eRollerFunction				'Rfcs'
#define eRollerZAxis					'Zee '
#define eRollerPressure				'Psur'
#define eRollerScroll				'Scrl'
#define eRoller15Button				'W15b'

// Roller Sensitivity Range Enums
#define eRollerRange					'Rcrv'
#define eRangeMax						'Max '
#define eRangeMed						'Med '
#define eRangeMin						'Min '

// Tablet Menu Function Enums
#define eMenuFunction				'Mact'
#define eMenuFuncIgnored			eButtonFuncIgnore
#define eMenuKeystrokes				eButtonKeystrokes
#define eMenuMacro					eButtonMacro
#define eMenuRunApplication		eButtonRunApplication
#define eMenuAbsolute				ePositioningAbsolute
#define eMenuRelative				ePositioningRelative
#define eMenuQuickPoint				'Qpnt'
#define eMenuToggleInkAnywhere	eButtonToggleInkAnywhere
#define eMenuSoftPressure			ePressureSoft
#define eMenuNormalPressure		ePressureNormal
#define eMenuFirmPressure			ePressureFirm

// Popup Menu Function Enums
#define ePopupFunction			'Pfcs'
#define ePopupKeystrokes		eButtonKeystrokes
#define ePopupMacro				eButtonMacro
#define ePopupRunApplication	eButtonRunApplication
#define ePopupAbsolute			ePositioningAbsolute
#define ePopupRelative			ePositioningRelative

#define typeOSType			'OSTp'

///////////////////////////////////////////////////////////////////////////
// Application Specific objects and events

#define cTabletEvent			'TblE'
#define cContext				'CTxt'

#define kAEWacomSuite		'Wacm'
#define eSendTabletEvent	'WSnd'
#define eEventProximity		'WePx'
#define eEventPointer		'WePt'

#pragma mark 
#pragma mark *** Context Attributes ***
#define pContextPositiongMode			pPositioningMode	// does not exist yet
#define pContextMapScreenArea			pMapScreenArea		// typeQDRectangle
#define pContextMapTabletInputArea	pMapTabletArea 	// typeLongRectangle
#define pContextMapTabletOutputArea	'Tomp'				// typeLongRectangle
#define pContextMovesSystemCursor	'Mvsc'				// typeBoolean
#define pContextEnabled					'Cenb'				// typeBoolean
#define pContextTransducerType		'Ctdt' 				// does not exist yet
#define pContextTransducerSN			'Ctd#' 				// does not exist yet

#endif // TABLETAEDICTIONARY_H

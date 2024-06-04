Class {
	#name : #MWTheWorldMainDockingBar,
	#superclass : #Object,
	#classVars : [
		'Instance',
		'ShowSecondsInClock',
		'TS',
		'TwentyFourHourClock'
	],
	#category : #MensaWidget
}

{
	#category : #preferences,
	#'squeak_changestamp' : 'mt 7/10/2016 12:33'
}
MWTheWorldMainDockingBar class >> applyUserInterfaceTheme [

	self updateInstances.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'fbs 4/17/2013 17:16'
}
MWTheWorldMainDockingBar class >> cleanUp [
	self updateInstances.
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:11'
}
MWTheWorldMainDockingBar class >> disableMenuPreference: aPreferenceSymbol [

	self setMenuPreference: aPreferenceSymbol to: false.
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:11'
}
MWTheWorldMainDockingBar class >> enableMenuPreference: aPreferenceSymbol [

	self setMenuPreference: aPreferenceSymbol to: true.
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:22'
}
MWTheWorldMainDockingBar class >> getMenuPreference: aPreferenceSymbol [

	^ self getMenuPreference: aPreferenceSymbol ifAbsent: [true]
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:22'
}
MWTheWorldMainDockingBar class >> getMenuPreference: aPreferenceSymbol ifAbsent: aBlock [

	| project |
	^ (project := Project current) isMorphic
		ifTrue: [project projectPreferenceFlagDictionary at: aPreferenceSymbol ifAbsent: aBlock]
		ifFalse: aBlock

]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'mt 1/28/2022 10:50'
}
MWTheWorldMainDockingBar class >> initialize [
	"self initialize"
	
	self updateInstances.
]

{
	#category : #access,
	#'squeak_changestamp' : 'cmm 11/16/2010 19:14'
}
MWTheWorldMainDockingBar class >> instance [
	"Answer the receiver's instance"
	^ Instance ifNil: [ Instance := self new ]
]

{
	#category : #access,
	#'squeak_changestamp' : 'cmm 11/16/2010 19:15'
}
MWTheWorldMainDockingBar class >> instance: aTheWorldMainDockingBar [
	Instance := aTheWorldMainDockingBar.
	self updateInstances
]

{
	#category : #events,
	#'squeak_changestamp' : 'kb 11/19/2009 18:48'
}
MWTheWorldMainDockingBar class >> localeChanged [
	self updateInstances
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'mt 10/15/2020 14:06'
}
MWTheWorldMainDockingBar class >> setMenuPreference: aPreferenceSymbol to: aBooleanOrNil [
	| project |
	(project := Project current) isMorphic ifTrue: [
		aBooleanOrNil
			ifNil: ["Reset to default value."
				(Preferences preferenceAt: aPreferenceSymbol) ifNotNil: [:pref | pref restoreDefaultValue]]
			ifNotNil: [
				project projectPreferenceFlagDictionary at: aPreferenceSymbol  put: aBooleanOrNil].
				(aBooleanOrNil ~= (Preferences preferenceAt: aPreferenceSymbol))
					ifTrue: [Preferences setPreference: aPreferenceSymbol toValue: aBooleanOrNil]].
	self updateInstances.
]

{
	#category : #timestamping,
	#'squeak_changestamp' : 'kb 11/19/2009 18:48'
}
MWTheWorldMainDockingBar class >> setTimeStamp [
	"Change the receiver's timeStamp"
	TS := UUID new
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:26'
}
MWTheWorldMainDockingBar class >> showAppsMenuInWorldMainDockingBar [
	
	<preference: 'Show ''Apps'' menu in world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should show the ''Apps'' menu.'
		type: #Boolean>
	^ self getMenuPreference: #showAppsMenuInWorldMainDockingBar ifAbsent: [true]

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:23'
}
MWTheWorldMainDockingBar class >> showAppsMenuInWorldMainDockingBar: aBoolean [
	
	self
		setMenuPreference: #showAppsMenuInWorldMainDockingBar
		to: aBoolean.

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'mt 5/14/2016 09:44'
}
MWTheWorldMainDockingBar class >> showDoMenuInWorldMainDockingBar [
	
	<preference: 'Show ''Do'' menu in world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should show the ''Do'' menu.'
		type: #Boolean>
	^ self getMenuPreference: #showDoMenuInWorldMainDockingBar ifAbsent: [true]

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'mt 5/14/2016 09:44'
}
MWTheWorldMainDockingBar class >> showDoMenuInWorldMainDockingBar: aBoolean [
	
	self
		setMenuPreference: #showDoMenuInWorldMainDockingBar
		to: aBoolean.

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:26'
}
MWTheWorldMainDockingBar class >> showExtrasMenuInWorldMainDockingBar [
	
	<preference: 'Show ''Extras'' menu in world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should show the ''Extras'' menu.'
		type: #Boolean>
	^ self getMenuPreference: #showExtrasMenuInWorldMainDockingBar ifAbsent: [true]

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:23'
}
MWTheWorldMainDockingBar class >> showExtrasMenuInWorldMainDockingBar: aBoolean [
	
	self
		setMenuPreference: #showExtrasMenuInWorldMainDockingBar
		to: aBoolean.

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:26'
}
MWTheWorldMainDockingBar class >> showHelpMenuInWorldMainDockingBar [
	
	<preference: 'Show ''Help'' menu in world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should show the ''Help'' menu.'
		type: #Boolean>
	^ self getMenuPreference: #showHelpMenuInWorldMainDockingBar ifAbsent: [true]

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:24'
}
MWTheWorldMainDockingBar class >> showHelpMenuInWorldMainDockingBar: aBoolean [
	
	self
		setMenuPreference: #showHelpMenuInWorldMainDockingBar
		to: aBoolean.

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:26'
}
MWTheWorldMainDockingBar class >> showMainMenuInWorldMainDockingBar [
	
	<preference: 'Show ''Main'' menu in world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should show the ''Main'' menu.'
		type: #Boolean>
	^ self getMenuPreference: #showMainMenuInWorldMainDockingBar ifAbsent: [true]

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:24'
}
MWTheWorldMainDockingBar class >> showMainMenuInWorldMainDockingBar: aBoolean [
	
	self
		setMenuPreference: #showMainMenuInWorldMainDockingBar
		to: aBoolean.

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'Louis Christ 6/4/2024 15:24'
}
MWTheWorldMainDockingBar class >> showMensaMenuInWorldMainDockingBar [
	
	<preference: 'Show ''Mensa'' menu in world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should show the ''Mensa'' menu.'
		type: #Boolean>
	^ self getMenuPreference: #showMensaMenuInWorldMainDockingBar ifAbsent: [true]

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'Louis Christ 6/4/2024 14:13'
}
MWTheWorldMainDockingBar class >> showMensaMenuInWorldMainDockingBar: aBoolean [
	
	self
		setMenuPreference: #showMensaMenuInWorldMainDockingBar
		to: aBoolean.

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:26'
}
MWTheWorldMainDockingBar class >> showProjectsMenuInWorldMainDockingBar [
	
	<preference: 'Show ''Projects'' menu in world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should show the ''Projects'' menu.'
		type: #Boolean>
	^ self getMenuPreference: #showProjectsMenuInWorldMainDockingBar ifAbsent: [true]

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:23'
}
MWTheWorldMainDockingBar class >> showProjectsMenuInWorldMainDockingBar: aBoolean [
	
	self
		setMenuPreference: #showProjectsMenuInWorldMainDockingBar
		to: aBoolean.

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'mt 1/18/2016 08:27'
}
MWTheWorldMainDockingBar class >> showSecondsInClock [
	<preference: 'Show seconds in clock'
		category: 'docking bars'
		description: 'Whether the clock in the world''s main docking bar should display seconds.'
		type: #Boolean>
	^ ShowSecondsInClock ifNil: [ true ]
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'mt 1/18/2016 08:27'
}
MWTheWorldMainDockingBar class >> showSecondsInClock: boolean [

	ShowSecondsInClock := boolean.
	self updateInstances.
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:27'
}
MWTheWorldMainDockingBar class >> showToolsMenuInWorldMainDockingBar [
	
	<preference: 'Show ''Tools'' menu in world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should show the ''Tools'' menu.'
		type: #Boolean>
	^ self getMenuPreference: #showToolsMenuInWorldMainDockingBar ifAbsent: [true]

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:23'
}
MWTheWorldMainDockingBar class >> showToolsMenuInWorldMainDockingBar: aBoolean [
	
	self
		setMenuPreference: #showToolsMenuInWorldMainDockingBar
		to: aBoolean.

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:26'
}
MWTheWorldMainDockingBar class >> showWindowsMenuInWorldMainDockingBar [
	
	<preference: 'Show ''Windows'' menu in world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should show the ''Windows'' menu.'
		type: #Boolean>
	^ self getMenuPreference: #showWindowsMenuInWorldMainDockingBar ifAbsent: [true]

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'topa 10/9/2014 23:23'
}
MWTheWorldMainDockingBar class >> showWindowsMenuInWorldMainDockingBar: aBoolean [
	
	self
		setMenuPreference: #showWindowsMenuInWorldMainDockingBar
		to: aBoolean.

]

{
	#category : #preferences,
	#'squeak_changestamp' : 'kb 11/19/2009 18:48'
}
MWTheWorldMainDockingBar class >> showWorldMainDockingBar [
	
	<preference: 'Show world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should be shown or not.'
		type: #Boolean>
	^Project current showWorldMainDockingBar
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'kb 11/19/2009 18:48'
}
MWTheWorldMainDockingBar class >> showWorldMainDockingBar: aBoolean [
	
	Project current showWorldMainDockingBar: aBoolean
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'mt 7/10/2016 13:01'
}
MWTheWorldMainDockingBar class >> themeProperties [

	^ {
		{ #textColor. 'Colors'. 'The color for the clock and other labels.' }.
		{ #font. 'Fonts'. 'The font for the clock and other labels.' }.
		{ #logoColor. 'Colors'. 'The color of the Squeak logo.' }.
		{ #selectionLogoColor. 'Colors'. 'The color of the Squeak logo when it is selected.' }.
	}
]

{
	#category : #timestamping,
	#'squeak_changestamp' : 'kb 11/19/2009 18:48'
}
MWTheWorldMainDockingBar class >> timeStamp [
	"Answer the receiver's timeStamp"
	^ TS
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'cmm 5/10/2015 18:03'
}
MWTheWorldMainDockingBar class >> twentyFourHourClock [
	<preference: '24-hour Time Clock'
		category: 'docking bars'
		description: 'Whether the clock in the world''s main docking bar should present the time in 24-hour format.'
		type: #Boolean>
	^ TwentyFourHourClock ifNil: [ true ]
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'cmm 5/10/2015 18:05'
}
MWTheWorldMainDockingBar class >> twentyFourHourClock: aBoolean [
	TwentyFourHourClock := aBoolean.
	self updateInstances
]

{
	#category : #events,
	#'squeak_changestamp' : 'topa 10/20/2015 08:46:31'
}
MWTheWorldMainDockingBar class >> updateInstances [
	"The class has changed, time to update the instances"

	self setTimeStamp.
	Project current in: [:project |
		project isMorphic ifTrue: [
			project assureMainDockingBarPresenceMatchesPreference]].
]

{
	#category : #events,
	#'squeak_changestamp' : 'kb 11/19/2009 18:48'
}
MWTheWorldMainDockingBar class >> updateInstances: anEvent [ 
	"The class has changed, time to update the instances"
	(anEvent itemClass == self
			or: [anEvent itemClass == self class])
		ifFalse: [^ self].
	""
	self updateInstances
]

{
	#category : #'submenu - squeak',
	#'squeak_changestamp' : 'mt 3/29/2022 09:12'
}
MWTheWorldMainDockingBar >> aboutMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'About Squeak...' translated;
			help: 'SystemReporter status of the image and runtime environment' translated;
			target: self;
			selector: #aboutSqueak ]
]

{
	#category : #'menu actions',
	#'squeak_changestamp' : 'mt 8/2/2016 13:17'
}
MWTheWorldMainDockingBar >> aboutSqueak [
	
	| m |
	 m := SystemReporter open.
	 m label: 'About Squeak' translated.
]

{
	#category : #'submenu - windows',
	#'squeak_changestamp' : 'laza 3/3/2010 05:18'
}
MWTheWorldMainDockingBar >> allOtherWindowsLike: window [
	^ self allVisibleWindows reject: [:each |
		each model name ~= window model name or: [each = window]]
]

{
	#category : #'submenu - windows',
	#'squeak_changestamp' : 'mt 12/13/2021 15:18'
}
MWTheWorldMainDockingBar >> allVisibleWindows [
	^ self allVisibleWindowsIn: Project current world
]

{
	#category : #'submenu - windows',
	#'squeak_changestamp' : 'mt 12/13/2021 15:18'
}
MWTheWorldMainDockingBar >> allVisibleWindowsIn: world [
	^SystemWindow windowsIn: world satisfying: [ :w | w visible ]
]

{
	#category : #'submenu - windows',
	#'squeak_changestamp' : 'laza 3/3/2010 05:04'
}
MWTheWorldMainDockingBar >> allWindowsLike: window [
	^ self allVisibleWindows reject: [:each | each model ~= window model or: [each = window]]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'mt 7/10/2016 12:33'
}
MWTheWorldMainDockingBar >> applyUserInterfaceTheme [
	"Do it on the class-side."
]

{
	#category : #'submenu - apps',
	#'squeak_changestamp' : 'ar 8/6/2010 23:40'
}
MWTheWorldMainDockingBar >> appsMenuOn: aDockingBar [
	"Create a menu with the registered apps"

	aDockingBar addItem: [ :item |
		item
			contents: 'Apps' translated;
			subMenuUpdater: self
			selector: #listAppsOn: ]

]

{
	#category : #'submenu - changes',
	#'squeak_changestamp' : 'mt 4/30/2021 09:50'
}
MWTheWorldMainDockingBar >> browseChangeSet [

	ChangeSetBrowser openOnCurrent.
]

{
	#category : #'submenu - changes',
	#'squeak_changestamp' : 'mt 4/30/2021 09:56'
}
MWTheWorldMainDockingBar >> browseChangedMethods [

	ChangedMessageSet openFor: ChangeSet current.
]

{
	#category : #'submenu - changes',
	#'squeak_changestamp' : 'mt 9/25/2019 11:05'
}
MWTheWorldMainDockingBar >> browseChanges [

	ChangeSorter open.
]

{
	#category : #'submenu - changes',
	#'squeak_changestamp' : 'mt 4/30/2021 10:02'
}
MWTheWorldMainDockingBar >> browseChangesDual [

	DualChangeSorter open.
]

{
	#category : #'submenu - changes',
	#'squeak_changestamp' : 'mt 9/25/2019 11:04'
}
MWTheWorldMainDockingBar >> browseChangesLabel [
	"The project name is the same as the current change set."
	
	^ Project current name
]

{
	#category : #'submenu - tools',
	#'squeak_changestamp' : 'mt 7/10/2016 12:08'
}
MWTheWorldMainDockingBar >> browserMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'Browser' translated;
			help: 'Open a browser' translated;
			icon: (self colorIcon: Browser basicNew windowColorToUse);
			target: StandardToolSet;
			selector: #openClassBrowser ]
]

{
	#category : #'submenu - projects',
	#'squeak_changestamp' : 'mt 9/23/2019 14:16'
}
MWTheWorldMainDockingBar >> canCloseProject [

	^ self canEnterParentProject
]

{
	#category : #'submenu - projects',
	#'squeak_changestamp' : 'mt 9/23/2019 14:12'
}
MWTheWorldMainDockingBar >> canEnterParentProject [
	
	^ Project current isTopProject not
]

{
	#category : #'submenu - projects',
	#'squeak_changestamp' : 'mt 9/23/2019 14:09'
}
MWTheWorldMainDockingBar >> canEnterPreviousProject [

	^ Project current previousProject notNil
]

{
	#category : #'submenu - changes',
	#'squeak_changestamp' : 'mt 4/18/2021 15:05'
}
MWTheWorldMainDockingBar >> changesMenuOn: aDockingBar [
	
	aDockingBar addUpdatingItem: [:item |
		item
			help: 'Browse this project''s changes' translated;
			wordingProvider: self
			wordingSelector: #browseChangesLabel;
			subMenuUpdater: self
			selector: #listChangesOn:].
]

{
	#category : #'submenu - extras',
	#'squeak_changestamp' : 'mt 12/23/2021 14:42'
}
MWTheWorldMainDockingBar >> chooseCustomScaleFactor [

	| result |
	result := Project uiManager request: 'Please enter a scale factor in %' translated initialAnswer: '350'.
	result ifEmpty: [^ self].
	[result := result asInteger abs] ifError: [^ self].
	result < 100 ifTrue: [^ self].
	Display relativeUiScaleFactor: result / 100.
]

{
	#category : #'right side',
	#'squeak_changestamp' : 'mt 7/10/2016 12:44'
}
MWTheWorldMainDockingBar >> clockOn: aDockingBar [ 
	aDockingBar 
		addMorphBack: (ClockMorph new
			font: self fontToUse;
			color: self colorToUse;
			show24hr: self class twentyFourHourClock;
			showSeconds: self class showSecondsInClock;
			yourself);
		addDefaultSpace
]

{
	#category : #'submenu - windows',
	#'squeak_changestamp' : 'mt 3/6/2015 08:24'
}
MWTheWorldMainDockingBar >> closeAllWindows [
	self allVisibleWindows do: [:each |
		each model canDiscardEdits ifTrue: [each delete]]
]

{
	#category : #'submenu - windows',
	#'squeak_changestamp' : 'laza 3/3/2010 05:18'
}
MWTheWorldMainDockingBar >> closeAllWindowsBut: window [
	(self allOtherWindowsLike: window) do: [:each |
		each model canDiscardEdits ifTrue: [each delete]]
]

{
	#category : #'submenu - windows',
	#'squeak_changestamp' : 'mt 3/6/2015 08:40'
}
MWTheWorldMainDockingBar >> closeAllWindowsButWorkspaces [

	(UserDialogBoxMorph
		confirm: 'There might be unsaved changes.\Do you really want to close all windows\that are no workspaces?' withCRs
		title: 'Only keep workspaces') ifTrue: [
			self allVisibleWindows
				reject: [:each | each model isKindOf: Workspace]
				thenDo: [:each | [each delete] valueSupplyingAnswer: true]].
]

{
	#category : #'submenu - windows',
	#'squeak_changestamp' : 'laza 3/3/2010 05:17'
}
MWTheWorldMainDockingBar >> closeAllWindowsLike: window [
	self closeAllWindowsBut: window.
	window model canDiscardEdits ifTrue: [window delete]
]

{
	#category : #'submenu - windows',
	#'squeak_changestamp' : 'mt 3/6/2015 08:39'
}
MWTheWorldMainDockingBar >> closeAllWindowsUnsafe [

	(UserDialogBoxMorph
		confirm: 'There might be unsaved changes.\Do you really want to close all windows?' withCRs
		title: 'Close All Windows') ifTrue: [
			self allVisibleWindows do: [:each | [each delete] valueSupplyingAnswer: true]].
]

{
	#category : #'submenu - projects',
	#'squeak_changestamp' : 'mt 9/23/2019 14:16'
}
MWTheWorldMainDockingBar >> closeProject [

	Project current close.
]

{
	#category : #'submenu - projects',
	#'squeak_changestamp' : 'mt 9/23/2019 14:18'
}
MWTheWorldMainDockingBar >> closeProjectMenuItemOn: menu [

	menu addUpdatingItem: [ :item |
		item
			contents: 'Close This Project' translated;
			help: 'Close this project and return to parent one' translated;
			target: self;
			selector: #closeProject;
			enablementSelector: #canCloseProject ]
]

{
	#category : #private,
	#'squeak_changestamp' : 'mt 2/14/2020 15:32'
}
MWTheWorldMainDockingBar >> colorIcon: aColor [

	"Guess if 'uniform window colors' are used and avoid all icons to be just gray"
	(aColor = (UserInterfaceTheme current get: #uniformWindowColor for: Model) or: [Preferences tinyDisplay]) ifTrue: [ ^nil ].
	^(aColor iconOrThumbnailOfSize: (14 * RealEstateAgent scaleFactor) truncated)
		borderWidth: 3 color: ((UserInterfaceTheme current get: #color for: #MenuMorph) ifNil: [(Color r: 0.9 g: 0.9 b: 0.9)]) muchDarker;
		borderWidth: 2 color: Color transparent
]

{
	#category : #private,
	#'squeak_changestamp' : 'mt 7/10/2016 12:44'
}
MWTheWorldMainDockingBar >> colorToUse [

	^ self userInterfaceTheme textColor ifNil: [Color black]
]

{
	#category : #'submenu - help',
	#'squeak_changestamp' : 'tpr 6/5/2018 14:04'
}
MWTheWorldMainDockingBar >> commandKeyHelp [
	"Open a window giving command key help."

	self
		openHelp: #SqueakTutorialsCommandKey
		topic: nil
]

{
	#category : #construction,
	#'squeak_changestamp' : 'mt 9/25/2019 11:18'
}
MWTheWorldMainDockingBar >> createDockingBar [
	"Create a docking bar from the receiver's representation"
	
	| dockingBar |
	dockingBar := DockingBarMorph new
		adhereToTop;
		borderWidth: 0.
	self fillDockingBar: dockingBar.
	"self labelIfNeeded: dockingBar."
	^ dockingBar
]

{
	#category : #construction,
	#'squeak_changestamp' : 'mt 5/14/2016 09:47'
}
MWTheWorldMainDockingBar >> doMenuOn: aDockingBar [ 

	aDockingBar addItem: [ :item |
		item
			contents: 'Do' translated;
			subMenuUpdater: self
			selector: #listCommonRequestsOn: ]
]

{
	#category : #'submenu - tools',
	#'squeak_changestamp' : 'mt 7/10/2016 12:08'
}
MWTheWorldMainDockingBar >> dualChangeSorterMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'Dual Change Sorter' translated;
			help: 'Open a Dual Change Sorter' translated;
			icon: (self colorIcon: ChangeSorter basicNew windowColorToUse);
			target: DualChangeSorter;
			selector: #open ]
]

{
	#category : #'submenu - extras',
	#'squeak_changestamp' : 'mt 7/2/2016 11:06'
}
MWTheWorldMainDockingBar >> editCurrentTheme [

	UserInterfaceTheme current explore.
]

{
	#category : #'submenu - projects',
	#'squeak_changestamp' : 'mt 9/23/2019 14:14'
}
MWTheWorldMainDockingBar >> enterParentProject [
	
	^ Project returnToParentProject
]

{
	#category : #'submenu - projects',
	#'squeak_changestamp' : 'mt 9/23/2019 14:10'
}
MWTheWorldMainDockingBar >> enterPreviousProject [

	^ Project returnToPreviousProject
]

{
	#category : #'submenu - help',
	#'squeak_changestamp' : 'tpr 6/5/2018 14:04'
}
MWTheWorldMainDockingBar >> extendingTheSystem [
	
	self
		openHelp: #SqueakProjectHelp
		topic: #extendingTheSystem
]

{
	#category : #'submenu - extras',
	#'squeak_changestamp' : 'mt 12/19/2021 09:11'
}
MWTheWorldMainDockingBar >> extrasMenuOn: aDockingBar [ 

	aDockingBar addItem: [ :it|
		it 	contents: 'Extras' translated;
			addSubMenu: [:menu|
				menu addItem:[:item|
					item
						contents: 'Recover Changes' translated;
						help: 'Recover changes after a crash' translated;
						icon: MenuIcons smallDocumentClockIcon;
						target: ChangeList;
						selector: #browseRecentLog].
				menu addItem:[:item|
					item
						contents: 'Recover Method Versions' translated;
						help: 'Recover versions of deleted methods' translated;
						target: ChangeList;
						selector: #browseMethodVersions].				
				menu addLine.
				menu addItem:[:item|
					item
						contents: 'Themes & Colors' translated;
						subMenuUpdater: self
						selector: #themesAndWindowColorsOn: ].
				menu addItem:[:item|
					item
						contents: 'Scale Factor' translated;
						subMenuUpdater: self
						selector: #scaleFactorsOn:].
				menu addItem:[:item|
					item
						contents: 'Language' translated;
						subMenuUpdater: self
						selector: #languageTranslatorsOn: ].
				menu addItem:[:item|
					item
						contents: 'Set Author Initials' translated;
						help: 'Sets the author initials' translated;
						icon: MenuIcons smallUserQuestionIcon;
						target: Utilities;
						selector: #setAuthorInitials].
				menu addItem:[:item|
					item
						contents: 'Restore Display (r)' translated;
						help: 'Redraws the entire display' translated;
						target: Project current;
						selector: #restoreDisplay].
				menu addItem:[:item|
					item
						contents: 'Rebuild Menus' translated;
						help: 'Rebuilds the menu bar' translated;
						target: TheWorldMainDockingBar;
						selector: #updateInstances].
				menu addLine.
				menu addItem:[:item|
					item
						contents: 'Start Profiler' translated;
						help: 'Starts the profiler' translated;
						icon: MenuIcons smallTimerIcon;
						target: self;
						selector: #startMessageTally].
				menu addItem:[:item|
					item
						contents: 'Collect Garbage' translated;
						help: 'Run the garbage collector and report space usage' translated;
						target: Utilities;
						selector: #garbageCollectAndReport].
				menu addItem:[:item|
					item
						contents: 'Purge Undo Records' translated;
						help: 'Save space by removing all the undo information remembered in all projects' translated;
						target: CommandHistory;
						selector: #resetAllHistory].
				menu addItem:[:item|
					item
						contents: 'VM statistics' translated;
						help: 'Virtual Machine information' translated;
						target: self;
						selector: #vmStatistics].
				menu addLine.
				menu addItem:[:item|
					item
						contents: 'Graphical Imports' translated;
						help: 'View the global repository called ImageImports; you can easily import external graphics into ImageImports via the FileList' translated;
						target: (Imports default);
						selector: #viewImages].
				menu addItem:[:item|
					item
						contents: 'Standard Graphics Library' translated;
						help: 'Lets you view and change the system''s standard library of graphics' translated;
						target: ScriptingSystem;
						selector: #inspectFormDictionary].
				menu addItem:[:item|
					item
						contents: 'Annotation Setup' translated;
						help: 'Click here to get a little window that will allow you to specify which types of annotations, in which order, you wish to see in the annotation panes of browsers and other tools' translated;
						target: Preferences;
						selector: #editAnnotations].
				menu addItem:[:item|
					item
						contents: 'Browse My Changes' translated;
						help: 'Browse all of my changes since the last time #condenseSources was run.' translated;
						target: SystemNavigation new;
						selector: #browseMyChanges].
			] ]
]

{
	#category : #'submenu - squeak',
	#'squeak_changestamp' : 'mt 3/29/2022 09:10'
}
MWTheWorldMainDockingBar >> feedbackMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'Send Feedback...' translated;
			help: 'Report bugs, requests, and other issues' translated;
			target: self;
			selector: #sendFeedback ]
]

{
	#category : #'submenu - tools',
	#'squeak_changestamp' : 'mt 7/10/2016 12:08'
}
MWTheWorldMainDockingBar >> fileListMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'File List' translated;
			help: 'Open a file list' translated;
			icon: (self colorIcon: FileList basicNew windowColorToUse);
			target: StandardToolSet;
			selector: #openFileList ]
]

{
	#category : #construction,
	#'squeak_changestamp' : 'mt 4/18/2021 15:03'
}
MWTheWorldMainDockingBar >> fillDockingBar: aDockingBar [ 
	"Private - fill the given docking bar"
	
	self menusOn: aDockingBar.
	aDockingBar addSpacer.
	self changesMenuOn: aDockingBar.
	aDockingBar addSpacer.
	self rightSideOn: aDockingBar.
	aDockingBar
		setProperty: #mainDockingBarTimeStamp 
		toValue: self class timeStamp.
]

{
	#category : #'submenu - windows',
	#'squeak_changestamp' : 'mt 6/3/2022 15:52'
}
MWTheWorldMainDockingBar >> findWorkspace [

	| allWorkspaces labels values |
	allWorkspaces := Set new.
	Project allMorphicProjects do:
		[:project|
		(self allVisibleWindowsIn: project world) do:
			[:window|
			(window model isKindOf: Workspace) ifTrue:
				[allWorkspaces add:
					{	window model.
						window.
						project.
						window model contents ifEmpty:
							[(window model dependents detect: [:d| d isTextView] ifNone: nil) textMorph contents] }]]].
	allWorkspaces isEmpty ifTrue:
		[^ self inform: 'No workspaces found.' translated].
	"Sort workspaces with non-empty ones first..."
	labels := OrderedCollection new.
	values := OrderedCollection new.
	(allWorkspaces sorted:
		[:t1 :t2|
		t1 last isEmpty == t2 last isEmpty
			ifTrue: [t1 second label <= t2 second label]
			ifFalse: [t1 last notEmpty]]) do:
		[:tuple|
		labels add: tuple second label, ': ', ((tuple last asString contractTo: 512) ifEmpty: ['(empty)']).
		values add: (MessageSend receiver: self selector: #selectWorkspace:window:inProject:contents: arguments: tuple)].
	(Project uiManager
		chooseFrom: labels
		values: values
		title: 'Find Workspace' translated) value.
]

{
	#category : #'submenu - help',
	#'squeak_changestamp' : 'tpr 6/5/2018 14:04'
}
MWTheWorldMainDockingBar >> fontSizeSummary [
	
	self
		openHelp: #SqueakToolsHelp
		topic: #fontSizeSummary
]

{
	#category : #private,
	#'squeak_changestamp' : 'mt 7/10/2016 12:44'
}
MWTheWorldMainDockingBar >> fontToUse [

	^ self userInterfaceTheme font ifNil: [TextStyle defaultFont]
]

{
	#category : #'submenu - tools',
	#'squeak_changestamp' : 'mt 8/26/2019 15:46'
}
MWTheWorldMainDockingBar >> gitInfrastructureMenuItemOn: menu [

	menu addItem: [:item |
			item
				contents: ((Smalltalk hasClassNamed: #SquitBrowser)
					ifTrue: ['Git Browser' translated]
					ifFalse: ['Git Browser (click to install)' translated]);
				help: 'Browse repositories on github.com' translated;
				icon: (self colorIcon: ((Smalltalk classNamed: #SquitBrowser) ifNil: Model)
										basicNew windowColorToUse);			
				target: self;
				selector: #installAndOpenGitBrowser]
]

{
	#category : #'submenu - help',
	#'squeak_changestamp' : 'mt 3/29/2022 09:13'
}
MWTheWorldMainDockingBar >> helpMenuOn: aDockingBar [

	aDockingBar addItem: [ :it |
		it	contents: 'Help' translated;
			addSubMenu: [ :menu | 
				menu addItem: [:item |
						item
							contents: 'Squeak Help' translated;
							help: 'Integrated Help System' translated;
							target: self;
							selector: #squeakHelp].
				self feedbackMenuItemOn: menu.
				
				menu addLine.
				
				menu addItem:[:item|
					item
						contents: 'Online Resources' translated;
						help: 'Online resources for Squeak' translated;
						target: self;
						icon: MenuIcons smallHelpIcon;
						selector: #squeakOnlineResources].
				menu addItem:[:item|
					item
						contents: 'Squeak Swiki' translated;
						help: 'A very simple way to access Squeak Swiki resources in the image' translated;
						target: self;
						selector: #swiki].
				menu addItem:[:item|
					item
						contents: 'Keyboard Shortcuts' translated;
						help: 'Keyboard bindings used in Squeak' translated;
						target: self;
						selector: #commandKeyHelp ].
				menu addItem:[:item|
					item
						contents: 'Font Size Summary' translated;
						help: 'Font size summary.' translated;
						target: self;
						selector: #fontSizeSummary ].
				menu addItem:[:item|
					item
						contents: 'Useful Expressions' translated;
						help: 'Useful expressions' translated;
						target: self;
						selector: #usefulExpressions ].
				menu addLine.
				menu addItem:[:item|
					item
						contents: 'Terse Guide to Squeak' translated;
						help: 'Concise information about language and environment' translated;
						target: self;
						selector: #terseGuideToSqueak].
				menu addItem:[:item|
					item
						contents: 'Extending the system' translated;
						help: 'Includes code snippets to evaluate for extending the system' translated;
						target: self;
						icon: MenuIcons smallHelpIcon;
						selector: #extendingTheSystem].
				menu addLine.
				
			menu addItem:[:item|
				item
					contents: 'Release Notes' translated;
					help: 'Changes in this release' translated ;
					target: self;
					selector: #releaseNotes].
			menu addItem:[:item|
				item
					contents: 'Working With Squeak' translated;
					help: 'Information for new users' ;
					target: self;
					selector: #workingWithSqueak].
			menu addItem:[:item|
				item
					contents: 'The Squeak User Interface' translated;
					help: 'Descriptions of some of the more-unusual UI elements in Squeak' ;
					target: self;
					selector: #squeakUserInterface].
			menu addItem:[:item|
				item
					contents: 'License Information' translated;
					help: String empty ;
					target: self;
					selector: #licenseInformation].				
				
		
			menu addLine.
			self aboutMenuItemOn: menu.
		]]
]

{
	#category : #'menu actions',
	#'squeak_changestamp' : 'mt 3/14/2022 16:13'
}
MWTheWorldMainDockingBar >> installAndOpenGitBrowser [ 
	
	(Smalltalk hasClassNamed: #SquitBrowser)
		ifFalse: [ (UIManager default
					confirm: 'The Git infrastructure and browser is not yet installed.\\Do you want to install the Git Browser?\\(Note that this step requires an internet connection and may take several minutes.)' translated withCRs
					title: 'Confirm Installation Request' )
			ifTrue: [ Installer
						ensureRecentMetacello;
						installGitInfrastructure.
					TheWorldMainDockingBar updateInstances ]
			ifFalse: [ ^self ] ].
	(Smalltalk classNamed: #SquitBrowser) open.

]

{
	#category : #'menu actions',
	#'squeak_changestamp' : 'mt 3/14/2022 11:22'
}
MWTheWorldMainDockingBar >> installAndOpenSqueakInboxTalk [
	
	(Smalltalk hasClassNamed: #TalkInboxBrowser)
		ifFalse: [ (Project uiManager
					confirm: 'Squeak Inbox Talk is not yet installed.\\Do you want to install it?\\(Note that this step requires an internet connection and may take several minutes.)' withCRs translated
					title: 'Confirm Installation Request' )
			ifTrue: [ Installer
						ensureRecentMetacello;
						installSqueakInboxTalk.
					TheWorldMainDockingBar updateInstances ]
			ifFalse: [ ^self ] ].
	(Smalltalk classNamed: #TalkInboxBrowser) open.

]

{
	#category : #'submenu - projects',
	#'squeak_changestamp' : 'mt 9/23/2019 13:53'
}
MWTheWorldMainDockingBar >> jumpToProjectMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'Enter Project' translated;
			icon: MenuIcons smallProjectJumpIcon;
			subMenuUpdater: self
			selector: #updateJumpToProjectSubMenu: ]
]

{
	#category : #'submenu - extras',
	#'squeak_changestamp' : 'mt 3/8/2022 11:26'
}
MWTheWorldMainDockingBar >> languageTranslatorsOn: menu [

	| availableLanguages |
	availableLanguages := NaturalLanguageTranslator availableLanguageLocaleIDs
		sorted:[:x :y | x displayName < y displayName].
	
	availableLanguages do: [:localeID |
		menu addUpdating: #stringForLanguageNameIs: target: Locale selector:  #switchToID: argumentList: {localeID}].

]

{
	#category : #'submenu - help',
	#'squeak_changestamp' : 'tpr 6/5/2018 14:04'
}
MWTheWorldMainDockingBar >> licenseInformation [
	
	self
		openHelp: #SqueakLicenseHelp
		topic: #officialLicense
]

{
	#category : #'submenu - apps',
	#'squeak_changestamp' : 'ar 8/6/2010 23:44'
}
MWTheWorldMainDockingBar >> listAppsOn: menu [
	"Update the apps list in the menu"

	| args |
	TheWorldMenu registeredOpenCommands do:[:spec|
		args := spec second.
		menu addItem: [ :item |
			item
				contents: spec first translated;
				target: args first;
				selector: args second].
	].

]

{
	#category : #'submenu - changes',
	#'squeak_changestamp' : 'ct 12/15/2021 17:42'
}
MWTheWorldMainDockingBar >> listChangesOn: menu [

	| fetchChangesBlock |
	{
		'Browse current change set' translated. #browseChangeSet. nil.
		'Browse changed methods' translated. #browseChangedMethods. nil.
		nil. nil. nil.
		'Simple Change Sorter' translated.	#browseChanges. ChangeSorter.
		'Dual Change Sorter' translated. #browseChangesDual. DualChangeSorter.
		nil. nil. nil.
	} groupsDo: [:label :selector :modelClass |
		label ifNil: [menu addLine] ifNotNil: [
			menu addItem: [:item |
				item
					contents: label;
					icon: ((modelClass ifNotNil: [self colorIcon: modelClass basicNew windowColorToUse])
						ifNil: [MenuIcons blankIcon]);
					target: self;
					selector: selector]] ].

	fetchChangesBlock := [ | latestMethodChanges latestClassChanges updateBlock |
		self flag: #concurrency. "mt: Is this safe enough given the current update frequency of change sets and when this code is executed?"
		latestMethodChanges := (Array streamContents: [:s |
			ChangeSet current changedMethodsDo: [:method :changeType :dateAndTime :category |
				s nextPut: { dateAndTime. method. changeType. category }]])
				sorted: [:a :b | a first >= b first].
		latestClassChanges := (Array streamContents: [:s |
			ChangeSet current changedClassesDo: [:class :changeTypes :dateAndTime :category |
				"We are not interested in classes whose method's did only change."
				changeTypes ifNotEmpty: [s nextPut: { dateAndTime. class. changeTypes. category }]]])
				sorted: [:a :b | a first >= b first].
		updateBlock := [self listMethodChanges: latestMethodChanges andClassChanges: latestClassChanges on: menu].
		Project current uiProcess == Processor activeProcess
			ifTrue: updateBlock
			ifFalse: [Project current addDeferredUIMessage: [
				menu isInWorld ifTrue: [menu lastItem delete. updateBlock value]] ]].

	ChangeSet current numberOfChanges <= 30
		ifTrue: fetchChangesBlock ifFalse: [
			"We have too much data to process. Do it in the background to keep the UI responsive."
			menu add: '... fetching changes ...' translated action: nil.
			menu lastItem isEnabled: false.
			fetchChangesBlock forkAt: Processor userBackgroundPriority].
]

{
	#category : #'submenu - do',
	#'squeak_changestamp' : 'ct 10/4/2021 17:02'
}
MWTheWorldMainDockingBar >> listCommonRequestsOn: aMenu [

	| strings |
	aMenu add: 'edit this list' translated target: Utilities action: #editCommonRequestStrings.
	aMenu addLine.
	
	strings := Utilities commonRequestStrings contents.
	strings asString linesDo: [:aString |
		aString = '-'
			ifTrue: [aMenu addLine]
			ifFalse: [aMenu add: (aString ifEmpty: [' ']) target: Utilities selector: #eval: argument: aString]].
]

{
	#category : #'submenu - changes',
	#'squeak_changestamp' : 'mt 12/10/2021 13:37'
}
MWTheWorldMainDockingBar >> listMethodChanges: methodChanges andClassChanges: classChanges on: menu [
	
	| latestMethodChanges latestClassChanges |
	latestMethodChanges := methodChanges.
	
	1 to: (10 min: latestMethodChanges size) do: [:index | | spec method |
		spec := latestMethodChanges at: index.
		method := spec second.
		menu addItem: [:item |
			item
				contents: ('{1} {2} \{{3}\} \{{4}\}' format: {method methodClass. method selector. spec fourth. method methodClass category}) ;
				target: ToolSet;
				balloonText: spec third asString;
				icon: ((#(remove addedThenRemoved) includes: spec third) ifTrue: [MenuIcons smallDeleteIcon] ifFalse: [
					spec third = #add ifTrue: [MenuIcons smallNewIcon] ifFalse: [MenuIcons blankIcon]]);
				selector: (method isInstalled ifTrue: [#browseMethod:] ifFalse: [#browseMethodVersion:]);
				arguments: {method}]].
				
	latestClassChanges := classChanges.

	latestClassChanges ifNotEmpty: [menu addLine].
	1 to: (10 min: latestClassChanges size) do: [:index | | spec class |
		spec := latestClassChanges at: index.
		class := spec second.
		menu addItem: [:item |
			item
				contents: ('{1} \{{2}\}' format: {class name. spec fourth }) ;
				target: ToolSet;
				balloonText: (spec third sorted joinSeparatedBy: Character space);
				icon: ((spec third includesAnyOf: #(remove addedThenRemoved))
					ifTrue: [MenuIcons smallDeleteIcon]
					ifFalse: [
						(spec third includes: #add)
							ifTrue: [MenuIcons smallNewIcon]
							ifFalse: [MenuIcons blankIcon]]);
				selector: ((spec third includes: #remove) ifTrue: [#inspect:] ifFalse: [#browseClass:]);
				arguments: {class}]]
]

{
	#category : #'submenu - windows',
	#'squeak_changestamp' : 'mt 6/3/2022 15:51'
}
MWTheWorldMainDockingBar >> listWindowsOn: menu [

	| windows |
	menu
		addLine;
		add: 'Collapse all windows' target: (Project current world) selector: #collapseAllWindows;
		addItem: [:item | item 
			contents: 'Find Workspace...';
			target: self;
			selector: #findWorkspace];
		addLine;
		add: 'Close all windows' target: self selector: #closeAllWindowsUnsafe;
		addItem: [:item | item
			contents: 'Close all windows without changes';
			target: self;
			icon: MenuIcons smallBroomIcon;
			selector: #closeAllWindows];
		add: 'Close all windows but workspaces' target: self selector: #closeAllWindowsButWorkspaces;
		addLine.
					
	windows := self allVisibleWindows sorted: [:winA :winB |
		((winA model isNil or: [winB model isNil]) or: [winA model name = winB model name])
			ifTrue: [winA label < winB label]
			ifFalse: [winA model name < winB model name]].
	windows ifEmpty: [ 
		menu addItem: [ :item | 
			item
				contents: 'No Windows' translated;
				isEnabled: false ] ].
	windows do: [ :each |
		| windowColor |
		windowColor := (each model respondsTo: #windowColorToUse)
			ifTrue: [each model windowColorToUse]
			ifFalse: [UserInterfaceTheme current get: #uniformWindowColor for: Model]. 
		menu addItem: [ :item |
			item 
				contents: (self windowMenuItemLabelFor: each);
				icon: (self colorIcon: windowColor);
				target: each;
				selector: #comeToFront;
				subMenuUpdater: self
				selector: #windowMenuFor:on:
				arguments: { each };
				action: [ each beKeyWindow; expand ] ] ].
]

{
	#category : #'menu actions',
	#'squeak_changestamp' : 'dtl 11/14/2017 22:26'
}
MWTheWorldMainDockingBar >> loadProject [

	Project current world worldMenu loadProject
]

{
	#category : #'submenu - projects',
	#'squeak_changestamp' : 'mt 9/23/2019 13:57'
}
MWTheWorldMainDockingBar >> loadProjectMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'Load Project' translated;
			help: 'Load a project from a file and enter it on success' translated;
			target: self;
			selector: #loadProject ]
]

{
	#category : #'submenu - mensa',
	#'squeak_changestamp' : 'Louis Christ 6/4/2024 15:20'
}
MWTheWorldMainDockingBar >> mensaMenuOn: aDockingBar [
	"Create a menu with the registered apps"

	aDockingBar addItem: [ :item |
		item
			contents: '';
			icon: ((GitAssetLoader for: 'MensaWidget') loadForm: '/icons/mensa_icon.png');
			addSubMenu: [ :menu | 
				menu addItem: [:itemy |
						itemy
							contents: 'Potsdam' translated;
							help: 'open mensa widget' translated;
							target: self;
							selector: #openMensaWidget].
				menu addItem: [:itemy |
						itemy
							contents: 'Other citys' translated;
							help: 'open mensa widget location picker' translated;
							target: self";
							selector: #openMensaWidget"].
				menu addItem: [:itemy |
						itemy
							contents: 'Setting' translated;
							help: 'open mensa widget settings' translated;
							target: self";
							selector: #openMensaWidget"]]]

]

{
	#category : #construction,
	#'squeak_changestamp' : 'Louis Christ 6/4/2024 14:41'
}
MWTheWorldMainDockingBar >> menusOn: aDockingBar [

	self class showMainMenuInWorldMainDockingBar ifTrue: [
		self squeakMenuOn: aDockingBar].

	self class showProjectsMenuInWorldMainDockingBar ifTrue: [
		self projectsMenuOn: aDockingBar].

	self class showToolsMenuInWorldMainDockingBar ifTrue: [
		self toolsMenuOn: aDockingBar].

	self class showAppsMenuInWorldMainDockingBar ifTrue: [
		self appsMenuOn: aDockingBar].

	self class showDoMenuInWorldMainDockingBar ifTrue: [
		self doMenuOn: aDockingBar].

	self class showExtrasMenuInWorldMainDockingBar ifTrue: [
		self extrasMenuOn: aDockingBar].

	self class showWindowsMenuInWorldMainDockingBar ifTrue: [
		self windowsMenuOn: aDockingBar].

	self class showHelpMenuInWorldMainDockingBar ifTrue: [
		self helpMenuOn: aDockingBar].
	
	self class showMensaMenuInWorldMainDockingBar ifTrue: [
		self mensaMenuOn: aDockingBar].
]

{
	#category : #'submenu - tools',
	#'squeak_changestamp' : 'kfr 6/24/2018 14:01'
}
MWTheWorldMainDockingBar >> messageNamesMenuItemOn: menu [ 

	menu addItem: [:item | 
		item 
			contents: 'Message Names' translated;
			help: 'Open the Message Names tool' translated;
			icon: (self colorIcon: MessageNames basicNew windowColorToUse);
			target: StandardToolSet;
			selector: #openMessageNames]
]

{
	#category : #'submenu - tools',
	#'squeak_changestamp' : 'mt 7/10/2016 12:08'
}
MWTheWorldMainDockingBar >> methodFinderMenuItemOn: menu [ 

	menu addItem: [:item | 
		item 
			contents: 'Method Finder' translated;
			help: 'Open the Method Finder' translated;
			icon: (self colorIcon: SelectorBrowser basicNew windowColorToUse);
			target: StandardToolSet;
			selector: #openSelectorBrowser]
]

{
	#category : #'submenu - tools',
	#'squeak_changestamp' : 'mt 7/10/2016 12:08'
}
MWTheWorldMainDockingBar >> monticelloBrowserMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'Monticello Browser' translated;
			help: 'Open a Monticello Browser' translated;
			icon: (self colorIcon: MCTool basicNew windowColorToUse);
			target: MCWorkingCopyBrowser;
			selector: #open ]
]

{
	#category : #'submenu - tools',
	#'squeak_changestamp' : 'mt 7/10/2016 12:08'
}
MWTheWorldMainDockingBar >> monticelloConfigurationsMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'Monticello Configurations' translated;
			help: 'Open a Monticello Configurations Editor' translated;
			icon: (self colorIcon: MCConfigurationBrowser basicNew windowColorToUse);
			target: MCConfigurationBrowser;
			selector: #open ]
]

{
	#category : #'menu actions',
	#'squeak_changestamp' : 'kfr 2/28/2019 15:59'
}
MWTheWorldMainDockingBar >> newProject: projectClass [
	"Create a new project of the given type"
	| newProject |
	"Allow the project to return nil from #new to indicate that it was canceled."
	newProject := projectClass new ifNil:[^self].
	ProjectViewMorph openOn: newProject.
	
]

{
	#category : #'submenu - projects',
	#'squeak_changestamp' : 'mt 9/23/2019 13:52'
}
MWTheWorldMainDockingBar >> newProjectMenuItemOn: menu [

	Project allSubclasses do: [ :each |
		menu addItem: [ :item | 
			item
				contents: ('Create ', each name) translated;
				help: ('Create a new ', each name, ' and open a viewer for it.') translated;
				target: self;
				selector: #newProject:;
				arguments: { each } ] ] 
]

{
	#category : #'submenu - help',
	#'squeak_changestamp' : 'mt 8/13/2019 13:43'
}
MWTheWorldMainDockingBar >> openHelp: bookSymbol topic: topicSymbol [
	"If a suitable seeming class named bookSymbol exists in the image we open it on the given topic, or on the first page should topic be nil"
	(Smalltalk classNamed: 'HelpBrowser')
		ifNil: [self inform: 'Sorry, there is no help system installed.' translated]
		ifNotNil: [:helpClass |
			(Smalltalk classNamed: bookSymbol)
				ifNil: [self inform: 'Sorry, the help book you requested does not exist.']
				ifNotNil: [:book |
					topicSymbol
						ifNil: [(helpClass openOn: book) model showFirstTopic]
						ifNotNil: [(helpClass openOn: book) model showTopicNamed: topicSymbol]]]
]

{
	#category : #'submenu - mensa',
	#'squeak_changestamp' : 'Louis Christ 6/4/2024 14:28'
}
MWTheWorldMainDockingBar >> openMensaWidget [
	"Update the apps list in the menu"

	MWFrame new openInWorld.

]

{
	#category : #'submenu - projects',
	#'squeak_changestamp' : 'mt 9/23/2019 14:12'
}
MWTheWorldMainDockingBar >> parentProjectMenuItemOn: menu [

	menu addUpdatingItem: [ :item |
		item
			contents: 'Enter Parent Project' translated;
			help: 'Return to the parent project' translated;
			target: self;
			selector: #enterParentProject;
			enablementSelector: #canEnterParentProject ]
]

{
	#category : #'submenu - tools',
	#'squeak_changestamp' : 'mt 7/10/2016 12:08'
}
MWTheWorldMainDockingBar >> preferenceBrowserMenuItemOn: menu [
	Smalltalk at: #PreferenceBrowser ifPresent:[:pb|
		menu addItem: [ :item |
			item
				contents: 'Preferences' translated;
				help: 'Open a Preferences Browser' translated;
				icon: (self colorIcon: pb basicNew windowColorToUse);
				target: pb;
				selector: #open ]
	].
]

{
	#category : #'submenu - projects',
	#'squeak_changestamp' : 'mt 9/23/2019 14:10'
}
MWTheWorldMainDockingBar >> previousProjectMenuItemOn: menu [

	menu addUpdatingItem: [ :item |
		item
			contents: 'Enter Previous Project' translated;
			help: 'Return to the most-recently-visited project' translated;
			target: self;
			selector: #enterPreviousProject;
			enablementSelector: #canEnterPreviousProject ]
]

{
	#category : #'submenu - tools',
	#'squeak_changestamp' : 'mt 7/10/2016 12:09'
}
MWTheWorldMainDockingBar >> processBrowserMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'Process Browser' translated;
			help: 'Open a Process Browser' translated;
			icon: (self colorIcon: ProcessBrowser basicNew windowColorToUse);
			target: ProcessBrowser;
			selector: #open ]
]

{
	#category : #construction,
	#'squeak_changestamp' : 'mt 9/23/2019 14:13'
}
MWTheWorldMainDockingBar >> projectsMenuOn: aDockingBar [

	aDockingBar addItem: [ :item |
		item
			contents: 'Projects' translated;
			addSubMenu: [ :menu | 
				self newProjectMenuItemOn: menu.
				menu addLine.
				self
					saveProjectMenuItemOn: menu;
					loadProjectMenuItemOn: menu.
				menu addLine.
				self
					parentProjectMenuItemOn: menu;
					previousProjectMenuItemOn: menu;
					jumpToProjectMenuItemOn: menu.
				menu addLine.
				self closeProjectMenuItemOn: menu ] ]

]

{
	#category : #'submenu - squeak',
	#'squeak_changestamp' : 'MAD 12/22/2010 00:11'
}
MWTheWorldMainDockingBar >> quitMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'Quit' translated;
			help: 'Quit out of Squeak' translated;
			icon: MenuIcons smallQuitNoSaveIcon;
			target: self;
			selector: #quitSqueak ]
]

{
	#category : #'menu actions',
	#'squeak_changestamp' : 'dtl 11/14/2017 22:24'
}
MWTheWorldMainDockingBar >> quitSqueak [

	^Smalltalk
		snapshot: (
			UserDialogBoxMorph 
				confirm: 'Save changes before quitting?' translated 
				orCancel: [ ^self ]
				at: Project current world center)
		andQuit: true

	
]

{
	#category : #'submenu - help',
	#'squeak_changestamp' : 'tpr 6/5/2018 14:04'
}
MWTheWorldMainDockingBar >> releaseNotes [
	
	self
		openHelp: #SqueakReleaseNotes
		topic: nil
]

{
	#category : #'submenu - extras',
	#'squeak_changestamp' : 'mt 3/14/2022 11:22'
}
MWTheWorldMainDockingBar >> resetAllThemes [

	(Project uiManager confirm: 'Do you want to reset all UI themes to their original state?\\(The current theme and scale factor will be restored if possible.)' translated withCRs title: 'Reset All Themes')
		ifTrue: [UserInterfaceTheme cleanUpAndReset].
]

{
	#category : #'submenu - extras',
	#'squeak_changestamp' : 'mt 8/12/2016 16:51'
}
MWTheWorldMainDockingBar >> restoreThemeBackground [

	Project current world removeProperty: #hasCustomBackground.
	UserInterfaceTheme current applyTo: {Project current}.
]

{
	#category : #construction,
	#'squeak_changestamp' : 'rhi 5/18/2010 21:04'
}
MWTheWorldMainDockingBar >> rightSideOn: aDockingBar [

	self
		searchBarOn: aDockingBar;
		clockOn: aDockingBar;
		toggleFullScreenOn: aDockingBar.
]

{
	#category : #'menu actions',
	#'squeak_changestamp' : 'fbs 7/25/2013 07:20'
}
MWTheWorldMainDockingBar >> save [

	Smalltalk snapshot: true andQuit: false
]

{
	#category : #'submenu - squeak',
	#'squeak_changestamp' : 'mt 5/10/2015 13:16'
}
MWTheWorldMainDockingBar >> saveAndQuitMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'Save And Quit' translated;
			help: 'Save the current state of Squeak on disk, and quit out of Squeak' translated;
			target: self;
			selector: #saveAndQuitSqueak ]
]

{
	#category : #'menu actions',
	#'squeak_changestamp' : 'fbs 7/25/2013 07:20'
}
MWTheWorldMainDockingBar >> saveAndQuitSqueak [

	Smalltalk snapshot: true andQuit: true
]

{
	#category : #'submenu - squeak',
	#'squeak_changestamp' : 'mt 5/10/2015 13:30'
}
MWTheWorldMainDockingBar >> saveAsMenuItemOn: menu [

	menu addItem: [ :item |	
		item
			contents: 'Save As...' translated;
			help: 'Save the current state of Squeak on disk under a new name' translated;
			target: self;
			selector: #saveImageAs ]
]

{
	#category : #'menu actions',
	#'squeak_changestamp' : 'fbs 7/25/2013 07:20'
}
MWTheWorldMainDockingBar >> saveAsNewVersion [

	Smalltalk saveAsNewVersion
]

{
	#category : #'submenu - squeak',
	#'squeak_changestamp' : 'mt 5/10/2015 13:16'
}
MWTheWorldMainDockingBar >> saveAsNewVersionMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'Save As New Version' translated;
			help: 'Save the current state of Squeak on disk under a version-stamped name' translated;
			target: self;
			selector: #saveAsNewVersion ]
]

{
	#category : #'menu actions',
	#'squeak_changestamp' : 'fbs 7/25/2013 07:21'
}
MWTheWorldMainDockingBar >> saveImage [

	Smalltalk saveSession
]

{
	#category : #'menu actions',
	#'squeak_changestamp' : 'fbs 7/25/2013 07:21'
}
MWTheWorldMainDockingBar >> saveImageAs [

	Smalltalk saveAs
]

{
	#category : #'submenu - squeak',
	#'squeak_changestamp' : 'mt 5/10/2015 13:31'
}
MWTheWorldMainDockingBar >> saveMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'Save' translated;
			help: 'Save the current state of Squeak on disk' translated;
			icon: MenuIcons smallSaveIcon;
			target: self;
			selector: #saveImage ]
]

{
	#category : #'submenu - projects',
	#'squeak_changestamp' : 'dtl 11/14/2017 22:25'
}
MWTheWorldMainDockingBar >> saveProjectMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'Save Project' translated;
			help: 'Save this project on a file' translated;
			target: Project current world;
			selector: #saveOnFile ]
]

{
	#category : #'submenu - extras',
	#'squeak_changestamp' : 'mt 4/25/2022 10:43'
}
MWTheWorldMainDockingBar >> scaleFactorsOn: menu [

	| showsRelative presets currentScaleFactor currentPlatformScaleFactor |
	showsRelative := DisplayScreen relativeScaleFactorEnabled.
	currentScaleFactor := (Display relativeUiScaleFactor * 100) rounded.
	currentPlatformScaleFactor := Display platformScaleFactorKnown
		ifTrue: [(Display platformScaleFactor * 100) rounded].
	showsRelative
		ifFalse: [presets := 75 to: 300 by: 25]
		ifTrue: [presets := 100 to: 200 by: 25].
	
	presets do: [:scale |
		showsRelative ifFalse: [
			scale = 100 ifTrue: [menu addLine]. "Normal scales."
			scale = 175 ifTrue: [menu addLine]. "TTCFont used after this line..."].
		menu addItem: [:item|
			item
				contents: ('{1}{2}%{3}' format: {
					currentScaleFactor = scale ifTrue: ['<yes>'] ifFalse: ['<no>'].
					scale.
					showsRelative ifTrue: [''] ifFalse: [
						scale = currentPlatformScaleFactor
							ifTrue: [' (recommended)' translated] ifFalse: ['']] });
				target: Display;
				selector: #relativeUiScaleFactor:;
				arguments: {scale / 100}]].
		
	menu addLine.
	menu addItem: [:item |
		item
			contents: ((presets includes: currentScaleFactor) not ifTrue: ['<yes>' , 'Custom: ' translated, currentScaleFactor, '% ...'] ifFalse: ['<no>' , 'Other scale factor...' translated]);
			target: self;
			selector: #chooseCustomScaleFactor].
]

{
	#category : #'right side',
	#'squeak_changestamp' : 'mt 2/7/2022 16:21'
}
MWTheWorldMainDockingBar >> searchBarOn: aDockingBar [

	aDockingBar 
		addMorphBack: (SearchBar build
			hResizing: #rigid; vResizing: #rigid;
			width: (TextStyle defaultFont widthOf: $x) * 30; "Optimized for #scaleFactor * (1024@764) -- thus not full-screen mode..."
			height: ToolBuilder default inputFieldHeight;
			yourself);
		addDefaultSpace
]

{
	#category : #'submenu - windows',
	#'squeak_changestamp' : 'eem 11/4/2021 12:33'
}
MWTheWorldMainDockingBar >> selectWorkspace: aWorkspace window: aSystemWindow inProject: aMorphicProject contents: contents [
	aMorphicProject
		addDeferredUIMessage: [aSystemWindow comeToFront];
		enter "Does nothing if already the current project..."
	
]

{
	#category : #'menu actions',
	#'squeak_changestamp' : 'mt 3/29/2022 09:42'
}
MWTheWorldMainDockingBar >> sendFeedback [

	| url os vm hash image |
	url := 'https://github.com/squeak-smalltalk/squeak-object-memory/issues'.
	([Smalltalk vm platformSourceVersion] on: Warning do: ["Ignore"])
		ifNotNil: [:info | | tokens |
			tokens := info findTokens.
			vm := tokens at: 2.
			hash := tokens atLast: 4].
	os := Smalltalk os platformName, ' ', Smalltalk os osVersion, ' ', Smalltalk os platformSubtype.
	image := SystemVersion current version, ' #', SystemVersion current highestUpdate.

	self inform: ('Please visit the following website to report on bugs, requests, and other issues:<br><br>	<a href="{1}">{1}</a><br><br>Make sure that you always include information about your current environment such as:<br><br>	OS: {2}<br>	VM: {3} ({4})<br>	SQ: {5} ({6} bit)<br><br>You can find more in the <a href="code://SystemReporter open">System Reporter</a>.' translated format: {url. os. vm. hash. image. Smalltalk image wordSize * 8}) asTextFromHtml
]

{
	#category : #'submenu - tools',
	#'squeak_changestamp' : 'mt 7/10/2016 12:09'
}
MWTheWorldMainDockingBar >> simpleChangeSorterMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'Simple Change Sorter' translated;
			help: 'Open a Change Sorter' translated;
			icon: (self colorIcon: ChangeSorter basicNew windowColorToUse);
			target: ChangeSorter;
			selector: #open ]
]

{
	#category : #'submenu - help',
	#'squeak_changestamp' : 'mt 8/2/2016 13:27'
}
MWTheWorldMainDockingBar >> squeakHelp [

	(Smalltalk classNamed: 'HelpBrowser')
		ifNil: [self inform: 'Sorry, there is no help system installed.' translated]
		ifNotNil: [:helpClass | helpClass open].
]

{
	#category : #'submenu - tools',
	#'squeak_changestamp' : 'mt 1/31/2022 12:29'
}
MWTheWorldMainDockingBar >> squeakInboxTalkMenuItemOn: menu [

	menu addItem: [:item |
			item
				contents: ((Smalltalk hasClassNamed: #TalkInboxBrowser)
					ifTrue: ['Squeak Inbox Talk' translated]
					ifFalse: ['Squeak Inbox Talk (click to install)' translated]);
				help: 'Engage with our community from within Squeak using tools that integrate our mailing lists such as squeak-dev and vm-dev' translated;
				icon: (self colorIcon: ((Smalltalk classNamed: #TalkInboxBrowser) ifNil: Model)
										basicNew windowColorToUse);			
				target: self;
				selector: #installAndOpenSqueakInboxTalk]
]

{
	#category : #construction,
	#'squeak_changestamp' : 'mt 3/29/2022 09:15'
}
MWTheWorldMainDockingBar >> squeakMenuOn: aDockingBar [ 
	"Private - fill the given docking bar"
	
	aDockingBar addItem: [ :item |
		item
			contents: '';
			icon: (MenuIcons squeakLogoIcon dyed:
				(self userInterfaceTheme logoColor ifNil: [Color black]));
			selectedIcon: (MenuIcons squeakLogoIcon dyed:
				(self userInterfaceTheme selectionLogoColor ifNil: [Color white]));
			addSubMenu: [ :menu | 
				self
					aboutMenuItemOn: menu;
					updateMenuItemOn: menu.
				menu addLine.
				self feedbackMenuItemOn: menu.
				menu addLine.
				self 
					saveMenuItemOn: menu;
					saveAsMenuItemOn: menu;
					saveAsNewVersionMenuItemOn: menu.
				menu addLine.
				self
					saveAndQuitMenuItemOn: menu;
					quitMenuItemOn: menu ] ]
]

{
	#category : #'submenu - help',
	#'squeak_changestamp' : 'tpr 6/5/2018 14:04'
}
MWTheWorldMainDockingBar >> squeakOnlineResources [
	
	self
		openHelp: #SqueakProjectHelp
		topic: #squeakResourcesOnline
]

{
	#category : #'submenu - help',
	#'squeak_changestamp' : 'tpr 6/5/2018 14:04'
}
MWTheWorldMainDockingBar >> squeakUserInterface [
	
	self
		openHelp: #SqueakProjectHelp
		topic: #squeakUserInterface
]

{
	#category : #'menu actions',
	#'squeak_changestamp' : 'dtl 11/11/2017 15:21'
}
MWTheWorldMainDockingBar >> startMessageTally [
	| world |
	world := Project current world.
	(self confirm: 'MessageTally will start now,
and stop when the cursor goes
to the top of the screen') ifTrue:
		[MessageTally spyOn:
			[[Sensor peekPosition y > 0] whileTrue: [world doOneCycle]]]
]

{
	#category : #'submenu - help',
	#'squeak_changestamp' : 'tpr 6/5/2018 14:04'
}
MWTheWorldMainDockingBar >> swiki [
	
	self
		openHelp: #SWikiHelp
		topic: nil
]

{
	#category : #'submenu - help',
	#'squeak_changestamp' : 'tpr 6/5/2018 14:04'
}
MWTheWorldMainDockingBar >> terseGuideToSqueak [

	self
		openHelp: #TerseGuideHelp
		topic: nil
]

{
	#category : #'submenu - tools',
	#'squeak_changestamp' : 'mt 7/10/2016 12:09'
}
MWTheWorldMainDockingBar >> testRunnerMenuItemOn: menu [
	Smalltalk at: #TestRunner ifPresent:[:aClass|
		menu addItem: [ :item |
			item
				contents: 'Test Runner' translated;
				help: 'Open the Test Runner' translated;
				icon: (self colorIcon: aClass basicNew windowColorToUse);
				target: aClass;
				selector: #open ]
	].
]

{
	#category : #'submenu - extras',
	#'squeak_changestamp' : 'mt 2/10/2022 14:44'
}
MWTheWorldMainDockingBar >> themesAndWindowColorsOn: menu [
	| themes |
	menu addItem:[:item|
		item
			contents: 'Fonts' translated;
			subMenuUpdater: Preferences
			selector: #fontConfigurationMenu:;
			icon: MenuIcons smallFontsIcon].
	menu addLine.
	menu addItem:[:item|
		item
			contents: (Model useColorfulWindows ifTrue: ['<yes>'] ifFalse: ['<no>']), 'Colorful Windows' translated;
			target: self;
			selector: #toggleColorfulWindows].
	menu addItem:[:item|
		item
			contents: (SystemWindow gradientWindow not ifTrue: ['<yes>'] ifFalse: ['<no>']), 'Flat Widget Look' translated;
			target: self;
			selector: #toggleGradients].
	menu addLine.
	menu addItem:[:item |
		item
			contents: (((Preferences valueOfFlag: #menuAppearance3d ifAbsent: [false]) and: [Morph useSoftDropShadow]) ifTrue: ['<yes>'] ifFalse: ['<no>']), 'Soft Shadows' translated;
			target: self;
			selector: #toggleSoftShadows].
	menu addItem:[:item |
		item
			contents: (((Preferences valueOfFlag: #menuAppearance3d ifAbsent: [false]) and: [Morph useSoftDropShadow not]) ifTrue: ['<yes>'] ifFalse: ['<no>']), 'Hard Shadows' translated;
			target: self;
			selector: #toggleHardShadows].
	menu addLine.
	menu addItem:[:item |
		item
			contents: (SystemWindow roundedWindowCorners ifTrue: ['<yes>'] ifFalse: ['<no>']), 'Rounded Window/Dialog Look' translated;
			target: self;
			selector: #toggleRoundedWindowLook].
	menu addItem:[:item |
		item
			contents: (PluggableButtonMorph roundedButtonCorners ifTrue: ['<yes>'] ifFalse: ['<no>']), 'Rounded Button/Scrollbar/Menu Look' translated;
			target: self;
			selector: #toggleRoundedButtonLook].
	menu addLine.
	themes := UserInterfaceTheme allThemes asArray sort: #name ascending.
	themes := themes select: [ :each | each isGenuine].
	themes ifEmpty: [ 
		menu addItem: [ :item | 
			item
				contents: '(No UI themes found.)' translated;
				isEnabled: false ] ].
	themes do: [ :each |
		menu addItem: [ :item |
			item 
				contents: (UserInterfaceTheme current name = each name ifTrue: ['<yes>'] ifFalse: ['<no>']), each name;
				target: each;
				selector: #applyScaled ] ].
	menu	
		addLine;
		add: 'Set Etoys Mode' translated target: ReleaseBuilderSqueakland selector: #setEtoysMode.
	menu
		addLine;
		add: 'Restore UI theme background' translated target: self selector: #restoreThemeBackground;
		add: 'Reset all UI themes' translated target: self selector: #resetAllThemes;
		add: 'Edit current UI theme...' translated target: self selector: #editCurrentTheme.
]

{
	#category : #'submenu - extras',
	#'squeak_changestamp' : 'mt 7/24/2016 09:31'
}
MWTheWorldMainDockingBar >> toggleColorfulWindows [

	Model useColorfulWindows: Model useColorfulWindows not.
]

{
	#category : #'right side',
	#'squeak_changestamp' : 'mt 2/10/2022 10:21'
}
MWTheWorldMainDockingBar >> toggleFullScreenOn: aDockingBar [ 
	
	| toggleMorph onIcon offIcon box bgColor |
	offIcon := (MenuIcons fullscreenWireframeIcon dyed:
					(self userInterfaceTheme logoColor ifNil: [Color black])) scaleIconToDisplay.
	onIcon := (MenuIcons fullscreenWireframeIcon dyed:
					(self userInterfaceTheme selectionLogoColor ifNil: [Color white])) scaleIconToDisplay.
	bgColor := (UserInterfaceTheme current get: #selectionColor for: #DockingBarItemMorph) ifNil: [Color blue].
	
	toggleMorph := offIcon asMorph.
	
	box := Morph new
		color: Color transparent;
		hResizing: #shrinkWrap;
		vResizing: #spaceFill;
		balloonText: 'toggle full screen mode' translated;
		changeTableLayout;
		listCentering: #center;
		layoutInset: (ToolBuilder default inputFieldHeight "searchBar" - toggleMorph width // 2);

		addMorph: toggleMorph.
		
	toggleMorph setToAdhereToEdge: #rightCenter. 
		
	box
		on: #mouseUp
		send: #value
		to:
			[ DisplayScreen toggleFullScreen. 
			"toggleMorph image: MenuIcons smallFullscreenOffIcon" ] ;

		on: #mouseEnter
		send: #value
		to: [
			toggleMorph image: onIcon.
			box color: bgColor; borderColor: bgColor];
		
		on: #mouseLeave
		send: #value
		to: [
			toggleMorph image: offIcon.
			box color: Color transparent; borderColor: Color transparent].
				
	aDockingBar addMorphBack: box
]

{
	#category : #'submenu - extras',
	#'squeak_changestamp' : 'mt 7/25/2016 14:41'
}
MWTheWorldMainDockingBar >> toggleGradients [

	| switch |
	switch := SystemWindow gradientWindow not.
	
	SystemWindow gradientWindow: switch.
	DialogWindow gradientDialog: switch.
	MenuMorph gradientMenu: switch.
	ScrollBar gradientScrollBar: switch.
	PluggableButtonMorph gradientButton: switch.
]

{
	#category : #'submenu - extras',
	#'squeak_changestamp' : 'mt 8/15/2016 18:25'
}
MWTheWorldMainDockingBar >> toggleHardShadows [

	((Preferences valueOfFlag: #menuAppearance3d ifAbsent: [false]) and: [Morph useSoftDropShadow])
		ifFalse: [Preferences toggle: #menuAppearance3d].
	Morph useSoftDropShadow: false.
	
	SystemWindow refreshAllWindows; reconfigureWindowsForFocus.
	self class updateInstances.
	SystemProgressMorph reset.
]

{
	#category : #'submenu - extras',
	#'squeak_changestamp' : 'mt 2/10/2022 14:44'
}
MWTheWorldMainDockingBar >> toggleRoundedButtonLook [

	| switch |
	switch := PluggableButtonMorph roundedButtonCorners not.
	
	PluggableButtonMorph roundedButtonCorners: switch.
	ScrollBar roundedScrollBarLook: switch.
	MenuMorph roundedMenuCorners: switch.
]

{
	#category : #'submenu - extras',
	#'squeak_changestamp' : 'mt 2/10/2022 14:45'
}
MWTheWorldMainDockingBar >> toggleRoundedWindowLook [

	| switch |
	switch := SystemWindow roundedWindowCorners not.
	
	SystemWindow roundedWindowCorners: switch.
	DialogWindow roundedDialogCorners: switch.
]

{
	#category : #'submenu - extras',
	#'squeak_changestamp' : 'mt 8/15/2016 18:24'
}
MWTheWorldMainDockingBar >> toggleSoftShadows [

	((Preferences valueOfFlag: #menuAppearance3d ifAbsent: [false]) and: [Morph useSoftDropShadow not])
		ifFalse: [Preferences toggle: #menuAppearance3d].
	Morph useSoftDropShadow: true.
	
	SystemWindow refreshAllWindows; reconfigureWindowsForFocus.
	self class updateInstances.
	SystemProgressMorph reset.
]

{
	#category : #construction,
	#'squeak_changestamp' : 'mt 12/7/2021 12:39'
}
MWTheWorldMainDockingBar >> toolsMenuOn: aDockingBar [ 

	aDockingBar addItem: [ :item |
		item
			contents: 'Tools' translated;
			addSubMenu: [ :menu | 
				self
					browserMenuItemOn: menu;
					workspaceMenuItemOn: menu;
					transcriptMenuItemOn: menu;
					testRunnerMenuItemOn: menu;
					methodFinderMenuItemOn: menu;
					messageNamesMenuItemOn: menu.
				menu addLine.
				self 
					simpleChangeSorterMenuItemOn: menu;
					dualChangeSorterMenuItemOn: menu;
					monticelloBrowserMenuItemOn: menu;
					monticelloConfigurationsMenuItemOn: menu.
				menu addLine.
				self
					gitInfrastructureMenuItemOn: menu;
					squeakInboxTalkMenuItemOn: menu.
				menu addLine.
				self
					processBrowserMenuItemOn: menu;
					preferenceBrowserMenuItemOn: menu;
					fileListMenuItemOn: menu.
			] ]
]

{
	#category : #'submenu - tools',
	#'squeak_changestamp' : 'mt 1/9/2023 10:53'
}
MWTheWorldMainDockingBar >> transcriptMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'Transcript' translated;
			help: 'Open the Transcript' translated;
			icon: (self colorIcon: Transcript windowColorToUse);
			target: [ (Smalltalk at: #Transcript) open ];
			selector: #value ].
]

{
	#category : #private,
	#'squeak_changestamp' : 'mt 9/25/2019 11:20'
}
MWTheWorldMainDockingBar >> updateIfNeeded: aDockingBar [ 
	"Update the given docking bar if needed"
	| timeStamp |
	timeStamp := aDockingBar
					valueOfProperty: #mainDockingBarTimeStamp
					ifAbsent: [].
	timeStamp ~= self class timeStamp
		ifTrue:
			[aDockingBar
				 release;
				 removeAllMorphs.
			 self fillDockingBar: aDockingBar]
]

{
	#category : #'submenu - projects',
	#'squeak_changestamp' : 'dtl 11/23/2009 21:48'
}
MWTheWorldMainDockingBar >> updateJumpToProjectSubMenu: subMenu [

	subMenu defaultTarget: Project.
	Project current buildJumpToMenu: subMenu
]

{
	#category : #'submenu - squeak',
	#'squeak_changestamp' : 'mt 6/30/2021 14:39'
}
MWTheWorldMainDockingBar >> updateMenuItemOn: menu [

	| firstCustomUpdater |
	menu addItem: [ :item |
		item
			contents: 'Update Squeak' translated;
			help: 'Load latest code updates via the internet' translated;
			icon: MenuIcons smallChangesIcon;
			target: self;
			selector: #updateSqueak ].
	
	firstCustomUpdater := true.
	TheWorldMainDockingBar methodsDo: [:method |
		(method pragmaAt: #updater:) ifNotNil: [:pragma |
			firstCustomUpdater ifTrue: [
				menu addLine.
				firstCustomUpdater := false].			
			menu addItem: [ :item |
				item
					contents: (pragma argumentAt: 1) translated;
					target: self;
					selector: method selector]]].
]

{
	#category : #'menu actions',
	#'squeak_changestamp' : 'fbs 12/6/2013 21:01'
}
MWTheWorldMainDockingBar >> updateSqueak [
	MCMcmUpdater updateFromServer.
]

{
	#category : #'submenu - help',
	#'squeak_changestamp' : 'tpr 6/5/2018 14:05'
}
MWTheWorldMainDockingBar >> usefulExpressions [
	
	self
		openHelp: #SqueakTutorials
		topic: #usefulExpressions
]

{
	#category : #'menu actions',
	#'squeak_changestamp' : 'fbs 7/25/2013 07:21'
}
MWTheWorldMainDockingBar >> vmStatistics [
	"Open a string view on a report of vm statistics"

	(StringHolder new contents: Smalltalk vmStatisticsReportString)
		openLabel: 'VM Statistics'
]

{
	#category : #'submenu - windows',
	#'squeak_changestamp' : 'cmm 6/21/2011 20:09'
}
MWTheWorldMainDockingBar >> windowMenuFor: window on: menu [
	menu 
		addItem: [ :item |
			item
				contents: 'Close' translated ;
				target: window;
				selector: #delete ];
		addItem: [ :item |
			item
				contents: 'Close all like this' translated ;
				target: self;
				selector: #closeAllWindowsLike:;
				arguments: { window } ];
		addItem: [ :item |
			item
				contents: 'Close all but this' translated ;
				target: self;
				selector: #closeAllWindowsBut:;
				arguments: { window } ];
		addItem: [ :item |
			item 
				contents: 'Expand or Contract' translated ;
				target: window;
				selector: #expandBoxHit ]
]

{
	#category : #'submenu - windows',
	#'squeak_changestamp' : 'laza 3/3/2010 04:59'
}
MWTheWorldMainDockingBar >> windowMenuItemLabelFor: window [
	| s |
	s := WriteStream on: String new.
	window model canDiscardEdits ifFalse: [ s nextPut: $* ].
	window isCollapsed ifTrue: [ s nextPut: $( ].
	s nextPutAll: window label.
	window isCollapsed ifTrue: [ s nextPut: $) ].
	^s contents contractTo: 50
]

{
	#category : #construction,
	#'squeak_changestamp' : 'kb 11/20/2009 17:55'
}
MWTheWorldMainDockingBar >> windowsMenuOn: aDockingBar [

	aDockingBar addItem: [ :item |
		item
			contents: 'Windows' translated;
			subMenuUpdater: self
			selector: #listWindowsOn: ]

]

{
	#category : #'submenu - help',
	#'squeak_changestamp' : 'tpr 6/5/2018 14:05'
}
MWTheWorldMainDockingBar >> workingWithSqueak [
	
	self
		openHelp: #SqueakProjectHelp
		topic: #workingWithSqueak
]

{
	#category : #'submenu - tools',
	#'squeak_changestamp' : 'mt 7/10/2016 12:11'
}
MWTheWorldMainDockingBar >> workspaceMenuItemOn: menu [

	menu addItem: [ :item |
		item
			contents: 'Workspace' translated;
			help: 'Open a Workspace' translated;
			icon: (self colorIcon: Workspace basicNew windowColorToUse);
			target: StandardToolSet;
			selector: #openWorkspace ]
]

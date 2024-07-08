Class {
	#name : #MWDockingBarTest,
	#superclass : #TestCase,
	#instVars : [
		'dockingbar'
	],
	#category : #'MensaWidget-Tests'
}

{
	#category : #helpers,
	#'squeak_changestamp' : 'LC 7/5/2024 11:13'
}
MWDockingBarTest >> clickMensaSubmenu: anObject [

	| menu submenu |
	
	self dockingbar allMorphsDo: [:each | 
		(each name asString includesSubstring: 'MensaMenu') ifTrue: [menu := each]].
	menu subMenu submorphsDo: [:each | 
		each contents = anObject ifTrue: [submenu := each]].
	^ submenu target perform: submenu selector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/10/2024 23:04'
}
MWDockingBarTest >> dockingbar [

	^ dockingbar
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/10/2024 23:04'
}
MWDockingBarTest >> dockingbar: anObject [

	dockingbar := anObject
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Louis Christ 6/10/2024 23:24'
}
MWDockingBarTest >> setUp [

	self dockingbar: (World mainDockingBars at: 1)
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Louis Christ 6/10/2024 23:06'
}
MWDockingBarTest >> tearDown [

	self dockingbar: nil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/5/2024 11:15'
}
MWDockingBarTest >> testOpenSettings [

	| oldState widget |
	
	oldState := TheWorldMainDockingBar showMensaMenuInWorldMainDockingBar.
	TheWorldMainDockingBar showMensaMenuInWorldMainDockingBar: true.
	widget := self clickMensaSubmenu: 'Settings'.
	self assert: widget class = PopUpChoiceMorph.
	TheWorldMainDockingBar showMensaMenuInWorldMainDockingBar: oldState.
	widget owner abandon
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/8/2024 00:24'
}
MWDockingBarTest >> testOpenWidget [
	
	| oldState initialState widget |
	
	oldState := TheWorldMainDockingBar showMensaMenuInWorldMainDockingBar.
	initialState := MWConfiguration isInitial.
	MWConfiguration isInitial: false.
	TheWorldMainDockingBar showMensaMenuInWorldMainDockingBar: true.
	widget := self clickMensaSubmenu: 'Potsdam'.
	self assert: widget class = MWFrame.
	TheWorldMainDockingBar showMensaMenuInWorldMainDockingBar: oldState.
	MWConfiguration isInitial: initialState.
	widget owner abandon
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/11/2024 11:35'
}
MWDockingBarTest >> testPreferenceExists [

	self assert: (TheWorldMainDockingBar respondsTo: #showMensaMenuInWorldMainDockingBar);
		assert: (TheWorldMainDockingBar respondsTo: #showMensaMenuInWorldMainDockingBar:)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/5/2024 11:48'
}
MWDockingBarTest >> testPreferenceOff [
	
	| any oldState |
	
	oldState := TheWorldMainDockingBar showMensaMenuInWorldMainDockingBar.
	TheWorldMainDockingBar showMensaMenuInWorldMainDockingBar: false.
	any := true.
	self dockingbar allMorphsDo: [:each | (each name asString includesSubstring: 'MensaMenu') ifTrue: [any := false]].
	self assert: any.
	TheWorldMainDockingBar showMensaMenuInWorldMainDockingBar: oldState
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/5/2024 11:48'
}
MWDockingBarTest >> testPreferenceOn [

	| any oldState |
	
	oldState := TheWorldMainDockingBar showMensaMenuInWorldMainDockingBar.
	TheWorldMainDockingBar showMensaMenuInWorldMainDockingBar: true.
	any := false.
	self dockingbar allMorphsDo: [:each | (each name asString includesSubstring: 'MensaMenu') ifTrue: [any := true]].
	self assert: any.
	TheWorldMainDockingBar showMensaMenuInWorldMainDockingBar: oldState
]

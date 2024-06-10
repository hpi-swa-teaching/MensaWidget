Class {
	#name : #MWDockingBarTest,
	#superclass : #TestCase,
	#instVars : [
		'dockingbar'
	],
	#category : #'MensaWidget-Tests'
}

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
	#'squeak_changestamp' : 'Louis Christ 6/11/2024 00:16'
}
MWDockingBarTest >> testOpenWidget [
	
	| menu submenu widget |
	
	TheWorldMainDockingBar showMensaMenuInWorldMainDockingBar: true.
	self dockingbar allMorphsDo: [:each | (each name asString includesSubstring: 'MensaMenu') ifTrue: [menu := each]].
	menu subMenu submorphsDo: [:each | each contents = 'Potsdam' ifTrue: [submenu := each]].
	widget := submenu target perform: submenu selector.
	self assert: widget class = MWFrame.
	widget abandon
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/11/2024 00:03'
}
MWDockingBarTest >> testPreferenceExists [

	self assert: 
		((TheWorldMainDockingBar respondsTo: #showMensaMenuInWorldMainDockingBar) and: 
		[TheWorldMainDockingBar respondsTo: #showMensaMenuInWorldMainDockingBar:])
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/10/2024 23:41'
}
MWDockingBarTest >> testPreferenceOff [
	
	| any |
	
	TheWorldMainDockingBar showMensaMenuInWorldMainDockingBar: false.
	any := true.
	self dockingbar allMorphsDo: [:each | (each name asString includesSubstring: 'MensaMenu') ifTrue: [any := false]].
	self assert: any
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/11/2024 00:03'
}
MWDockingBarTest >> testPreferenceOn [

	| any |
	
	TheWorldMainDockingBar showMensaMenuInWorldMainDockingBar: true.
	any := false.
	self dockingbar allMorphsDo: [:each | (each name asString includesSubstring: 'MensaMenu') ifTrue: [any := true]].
	self assert: any
]

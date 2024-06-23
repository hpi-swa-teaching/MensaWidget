"
A MWMenuBarTest is a Tests class that test if the menu bar works as expected.

Instance Variables
	mensaWidget:		<MWFrame>

mensaWidget
	- a Mensa widget instance on which the testing will be done

"
Class {
	#name : #MWMenuBarTest,
	#superclass : #TestCase,
	#instVars : [
		'mensaWidget'
	],
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Louis Christ 6/11/2024 01:02'
}

{
	#category : #helpers,
	#'squeak_changestamp' : 'Louis Christ 6/11/2024 00:59'
}
MWMenuBarTest >> getAllCanteens [
	
	| canteens |
	
	canteens := OrderedCollection new.
	self mensaWidget contentMorph allMorphsDo: [:each | 
		each color = MWColorTheme secondaryColor ifTrue: 
			[canteens add: (each submorphs at: 1) contents string]].
	^ canteens
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'Louis Christ 6/11/2024 00:59'
}
MWMenuBarTest >> getAllMeals [
	
	| meals |
	
	meals := OrderedCollection new.
	self mensaWidget contentMorph allMorphsDo: [:each | 
		each color = MWColorTheme primaryColor ifTrue: 
			[meals add: (each submorphs at: 1) contents string]].
	^ meals
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/11/2024 00:19'
}
MWMenuBarTest >> mensaWidget [

	^ mensaWidget
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/11/2024 00:19'
}
MWMenuBarTest >> mensaWidget: anObject [

	mensaWidget := anObject
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Oscar 6/17/2024 00:14'
}
MWMenuBarTest >> setUp [

	self mensaWidget: MWFrame new
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Oscar 6/17/2024 00:14'
}
MWMenuBarTest >> tearDown [

	self mensaWidget window abandon
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Oscar 6/17/2024 00:15'
}
MWMenuBarTest >> testCanteensChange [

	| menuBar oldCanteens |
	
	self mensaWidget window allMorphsDo: [:each | each class = MWMenuBar ifTrue: [menuBar :=each]].
	oldCanteens := self getAllCanteens.
	menuBar increaseDate.
	self assert: oldCanteens = self getAllCanteens.
	menuBar decreaseDate.
	self assert: oldCanteens = self getAllCanteens
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 6/23/2024 17:47'
}
MWMenuBarTest >> testMealsChange [

	| menuBar oldMeals |
	
	self mensaWidget window allMorphsDo: [:each | each class = MWMenuBar ifTrue: [menuBar :=each]].
	({#Saturday. #Sunday} includes: menuBar date weekday) ifTrue:
		[menuBar date addDays: -2].
	oldMeals := self getAllMeals.
	menuBar increaseDate.
	self assert: (oldMeals = self getAllMeals) not.
	menuBar decreaseDate.
	self assert: oldMeals = self getAllMeals
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Oscar 6/17/2024 00:15'
}
MWMenuBarTest >> testNavigateNextDay [

	| menuBar oldDate |
	
	self mensaWidget window allMorphsDo: [:each | each class = MWMenuBar ifTrue: [menuBar := each]].
	oldDate := menuBar date.
	menuBar increaseDate.
	self assert: (oldDate addDays: 1) = menuBar date
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Oscar 6/17/2024 00:15'
}
MWMenuBarTest >> testNavigatePreviousDay [

	| menuBar oldDate |
	
	self mensaWidget window allMorphsDo: [:each | each class = MWMenuBar ifTrue: [menuBar := each]].
	oldDate := menuBar date.
	menuBar decreaseDate.
	self assert: (oldDate addDays: -1) = menuBar date
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Oscar 6/17/2024 00:15'
}
MWMenuBarTest >> testOneMenuBarExists [

	| menuBars |
	
	menuBars := OrderedCollection new.
	self mensaWidget window allMorphsDo: [:each | each class = MWMenuBar ifTrue: [menuBars add: each]].
	self assert: menuBars size = 1
]

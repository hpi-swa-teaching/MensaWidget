"
A MWMenuBarTest is a Tests class that test if the menu bar works as expected.

Instance Variables
	mensaWidget:		<MWFrame>
	menuBar:		<MWMenuBar>

mensaWidget
	- a Mensa widget instance on which the testing will be done

"
Class {
	#name : #MWMenuBarTest,
	#superclass : #TestCase,
	#instVars : [
		'mensaWidget',
		'menuBar'
	],
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 11:29'
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
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 22:34'
}
MWMenuBarTest >> menuBar [

	^ menuBar
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 22:34'
}
MWMenuBarTest >> menuBar: anObject [

	menuBar := anObject
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 15:59'
}
MWMenuBarTest >> setUp [

	self mensaWidget: MWFrame new.
	self mensaWidget owner allMorphsDo: [:each | each class = MWMenuBar ifTrue: [self menuBar: each]].
	
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 15:59'
}
MWMenuBarTest >> tearDown [
	
	self menuBar: nil.
	self mensaWidget owner abandon
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 22:35'
}
MWMenuBarTest >> testCanteensChange [

	| oldCanteens |
	
	oldCanteens := self getAllCanteens.
	self menuBar increaseDate.
	self assert: oldCanteens = self getAllCanteens.
	self menuBar decreaseDate.
	self assert: oldCanteens = self getAllCanteens
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 22:36'
}
MWMenuBarTest >> testMealsChange [

	| oldMeals |
	
	({#Saturday. #Sunday} includes: self menuBar date weekday) ifTrue:
		[self menuBar addDays: 2].
	oldMeals := self getAllMeals.
	self menuBar increaseDate.
	self assert: (oldMeals = self getAllMeals) not.
	self menuBar decreaseDate.
	self assert: oldMeals = self getAllMeals
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 22:39'
}
MWMenuBarTest >> testMealsFitTime [

	| oldMeals |
	
	({#Saturday. #Sunday} includes: self menuBar date weekday) ifTrue:
		[self menuBar addDays: 2].
	oldMeals := self getAllMeals.
	self menuBar toggleTime.
	self assert: (oldMeals = self getAllMeals) not.
	self menuBar toggleTime.
	self assert: oldMeals = self getAllMeals
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 22:37'
}
MWMenuBarTest >> testNavigateNextDay [

	| oldDate |
	
	oldDate := self menuBar date.
	self menuBar increaseDate.
	self assert: (oldDate addDays: 1) = self menuBar date
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 22:37'
}
MWMenuBarTest >> testNavigatePreviousDay [

	| oldDate |
	
	oldDate := self menuBar date.
	self menuBar decreaseDate.
	self assert: (oldDate addDays: -1) = self menuBar date
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 15:59'
}
MWMenuBarTest >> testOneMenuBarExists [

	| menuBars |
	
	menuBars := OrderedCollection new.
	self mensaWidget owner allMorphsDo: [:each | each class = MWMenuBar ifTrue: [menuBars add: each]].
	self assert: menuBars size = 1
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 22:38'
}
MWMenuBarTest >> testToggleMealTime [

	| oldTime |
	
	oldTime := self menuBar time.
	self menuBar toggleTime.
	self assert: (oldTime = self menuBar time) not.
	self menuBar toggleTime.
	self assert: oldTime = self menuBar time
]

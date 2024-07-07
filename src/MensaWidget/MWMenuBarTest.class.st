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
	#'squeak_changestamp' : 'LC 7/6/2024 15:54'
}
MWMenuBarTest >> getAllCanteens [
	
	| canteens |
	
	canteens := OrderedCollection new.
	self mensaWidget contentMorph allMorphsDo: [:each | 
		each class = MWCanteen ifTrue: 
			[canteens add: each submorphs first submorphs second contents string]].
	^ canteens
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'LC 6/23/2024 18:44'
}
MWMenuBarTest >> getAllCategories [
	
	| categories |
	
	categories := OrderedCollection new.
	self mensaWidget contentMorph allMorphsDo: [:each | 
		each class = MWMeal ifTrue: 
			[categories add: each category]].
	^ categories
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'LC 6/23/2024 18:44'
}
MWMenuBarTest >> getAllMeals [
	
	| meals |
	
	meals := OrderedCollection new.
	self mensaWidget contentMorph allMorphsDo: [:each | 
		each class = MWMeal ifTrue: 
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
	#'squeak_changestamp' : 'LC 7/8/2024 00:21'
}
MWMenuBarTest >> setUp [

	self mensaWidget: MWFrame newForTests;
		menuBar: self mensaWidget menuBar
	
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
	#'squeak_changestamp' : 'LC 7/6/2024 15:45'
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
	#'squeak_changestamp' : 'Louis Christ 6/19/2024 01:06'
}
MWMenuBarTest >> testLunchMealCategory [

	| oldTime |
	
	oldTime := self menuBar time.
	self getAllCategories do: [:each | self assert: (each = oldTime or: [each = nil])].
	self menuBar toggleTime.
	self assert: (oldTime = self menuBar time) not.
	self getAllCategories do: [:each | self assert: (each = oldTime) not].
	self menuBar toggleTime.
	self assert: oldTime = self menuBar time
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/7/2024 19:02'
}
MWMenuBarTest >> testMealsChange [

	| menuBar oldMeals |
	
	self mensaWidget owner allMorphsDo: [:each | each class = MWMenuBar ifTrue: [menuBar :=each]].
	({#Saturday. #Sunday} includes: menuBar date weekday) ifTrue:
		[menuBar decreaseDate;
			decreaseDate].
	oldMeals := self getAllMeals.
	menuBar increaseDate.
	self assert: (oldMeals = self getAllMeals) not.
	menuBar decreaseDate.
	self assert: oldMeals = self getAllMeals
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 6/23/2024 18:45'
}
MWMenuBarTest >> testMealsFitTime [

	self getAllCategories do: [:each | 
		each ifNotNil: [self assert: each = MWMealCleaner lunchCategory]].
	self menuBar toggleTime.
	self getAllCategories do: [:each | 
		each ifNotNil: [self assert: each = MWMealCleaner dinnerCategory]]
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

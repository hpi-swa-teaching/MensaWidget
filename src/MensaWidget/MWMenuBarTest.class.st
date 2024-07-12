"
A MWMenuBarTest is a Tests class that test if the menu bar works as expected.

Instance Variables
	mensaWidget:		<MWFrame>
	menuBar:		<MWMenuBar>

mensaWidget
	- a Mensa widget instance on which the testing will be done
	
menuBar
	- is the menu bar that sits on top of the stored mensa widget

"
Class {
	#name : #MWMenuBarTest,
	#superclass : #TestCase,
	#instVars : [
		'mensaWidget',
		'menuBar'
	],
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'LC 7/12/2024 14:07'
}

{
	#category : #helpers,
	#'squeak_changestamp' : 'LC 7/12/2024 12:21'
}
MWMenuBarTest >> adjustForWeekend [

	({#Saturday. #Sunday} includes: self menuBar date weekday) 
		ifTrue: [self menuBar decreaseDate;
			decreaseDate].
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'LC 7/12/2024 12:23'
}
MWMenuBarTest >> getAllCanteens [
	
	^ (self mensaWidget contentMorph allMorphs 
		select: [:each | each class = MWCanteen]) 
		collect: [:each | self getCanteenName: each]
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'LC 7/12/2024 12:24'
}
MWMenuBarTest >> getAllCategories [
	
	^ (self mensaWidget contentMorph allMorphs 
		select: [:each | each class = MWMeal]) 
		collect: [:each | each category]
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'LC 7/12/2024 12:24'
}
MWMenuBarTest >> getAllMeals [
	
	^ (self mensaWidget contentMorph allMorphs 
		select: [:each | each class = MWMeal]) 
		collect: [:each | self getMeal: each]
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'LC 7/12/2024 12:24'
}
MWMenuBarTest >> getCanteenName: aMorph [
	
	^ aMorph nameMorph contents
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'LC 7/12/2024 12:24'
}
MWMenuBarTest >> getMeal: aMorph [
	
	^ aMorph nameMorph contents string
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
	#'squeak_changestamp' : 'LC 7/12/2024 12:25'
}
MWMenuBarTest >> testLunchMealCategory [

	| oldTime |
	
	oldTime := self menuBar time.
	self getAllCategories do: [:each | self assert: (each = oldTime or: [each isNil])].
	self menuBar toggleTime.
	self deny: oldTime = self menuBar time.
	self getAllCategories do: [:each | self deny: each = oldTime].
	self menuBar toggleTime.
	self assert: oldTime = self menuBar time
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/12/2024 12:25'
}
MWMenuBarTest >> testMealsChange [

	|  oldMeals |

	self adjustForWeekend.
	oldMeals := self getAllMeals.
	self menuBar increaseDate.
	self deny: oldMeals = self getAllMeals.
	self menuBar decreaseDate.
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
	#'squeak_changestamp' : 'LC 7/11/2024 18:50'
}
MWMenuBarTest >> testOneMenuBarExists [

	self assert: self menuBar notNil
]

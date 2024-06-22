"
A MWMenuBarTest is a Tests class that test if the menu bar works as expected.

Instance Variables
	mensaWidget:		<MWFrame>

mensaWidget
	- a Mensa widget instance on which the testing will be done

"
Class {
	#name : #MWFavouritesTest,
	#superclass : #TestCase,
	#instVars : [
		'mensaWidget'
	],
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #helpers,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 15:30'
}
MWFavouritesTest >> getAllMeals [
	
	| meals |
	
	meals := OrderedCollection new.
	self mensaWidget contentMorph allMorphsDo: [:each | 
		each color = MWColorTheme primaryColor ifTrue: 
			[meals add: each]].
	^ meals
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 15:37'
}
MWFavouritesTest >> getNameFor: aMeal [
	
	^ (aMeal submorphs at: 1) contents string
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 16:19'
}
MWFavouritesTest >> getStarColorFor: aMeal [
	
	^ ((self getStarFor: aMeal) submorphs at: 1) color
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 16:09'
}
MWFavouritesTest >> getStarFor: aMeal [
	
	^ aMeal submorphs at: 3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/11/2024 00:19'
}
MWFavouritesTest >> mensaWidget [

	^ mensaWidget
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/11/2024 00:19'
}
MWFavouritesTest >> mensaWidget: anObject [

	mensaWidget := anObject
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Oscar 6/17/2024 00:14'
}
MWFavouritesTest >> setUp [

	self mensaWidget: MWFrame new
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 16:02'
}
MWFavouritesTest >> simulateButtonClick: aStar [

	aStar handleMouseDown: 
		((MouseButtonEvent new setType: #mouseDown position: aStar center buttons: 4 hand: World currentHand) handler: aStar)
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Oscar 6/17/2024 00:14'
}
MWFavouritesTest >> tearDown [

	self mensaWidget window abandon
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 15:26'
}
MWFavouritesTest >> testFavouritesIsSet [

	self assert: MWFavorites favouriteFoods class = Set
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 16:15'
}
MWFavouritesTest >> testFavouritesRenderCorrectly [
	
	self tearDown;
		setUp.
	self getAllMeals do: [:each |
		(MWFavorites favouriteFoods includes: (self getNameFor: each))
			ifTrue: [self assert: ((self getStarColorFor: each) = Color transparent) not]
			ifFalse: [self assert: (self getStarColorFor: each) = Color transparent]]
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 15:27'
}
MWFavouritesTest >> testFavouritesSetExists [

	self assert: (MWFavorites respondsTo: #favouriteFoods)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 16:17'
}
MWFavouritesTest >> testMealIsLikable [

	self getAllMeals do: [:each |
		(MWFavorites favouriteFoods includes: (self getNameFor: each))
			ifFalse: [self simulateButtonClick: (self getStarFor: each). 
				self assert: (MWFavorites favouriteFoods includes: (self getNameFor: each));
					assert: ((self getStarColorFor: each) = Color transparent) not.
				^ nil]]
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 16:17'
}
MWFavouritesTest >> testMealIsUnlikable [

	self getAllMeals do: [:each |
		(MWFavorites favouriteFoods includes: (self getNameFor: each))
			ifTrue: [self simulateButtonClick: (self getStarFor: each). 
				self assert: (MWFavorites favouriteFoods includes: (self getNameFor: each)) not;
					assert: (self getStarColorFor: each) = Color transparent.
				^ nil]]
]

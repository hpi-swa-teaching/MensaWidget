"
A MWFavoritesTest is a Tests class that test if the liking of food works as expected.

Instance Variables
	mensaWidget:		<MWFrame>

mensaWidget
	- a Mensa widget instance on which the testing will be done

"
Class {
	#name : #MWFavoritesTest,
	#superclass : #TestCase,
	#instVars : [
		'mensaWidget'
	],
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 16:21'
}

{
	#category : #helpers,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 15:30'
}
MWFavoritesTest >> getAllMeals [
	
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
MWFavoritesTest >> getNameFor: aMeal [
	
	^ (aMeal submorphs at: 1) contents string
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 16:19'
}
MWFavoritesTest >> getStarColorFor: aMeal [
	
	^ ((self getStarFor: aMeal) submorphs at: 1) color
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 16:09'
}
MWFavoritesTest >> getStarFor: aMeal [
	
	^ aMeal submorphs at: 3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/11/2024 00:19'
}
MWFavoritesTest >> mensaWidget [

	^ mensaWidget
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/11/2024 00:19'
}
MWFavoritesTest >> mensaWidget: anObject [

	mensaWidget := anObject
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Oscar 6/17/2024 00:14'
}
MWFavoritesTest >> setUp [

	self mensaWidget: MWFrame new
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 16:02'
}
MWFavoritesTest >> simulateButtonClick: aStar [

	aStar handleMouseDown: 
		((MouseButtonEvent new setType: #mouseDown position: aStar center buttons: 4 hand: World currentHand) handler: aStar)
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Oscar 6/17/2024 00:14'
}
MWFavoritesTest >> tearDown [

	self mensaWidget window abandon
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 15:26'
}
MWFavoritesTest >> testFavouritesIsSet [

	self assert: MWFavorites favouriteFoods class = Set
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 16:15'
}
MWFavoritesTest >> testFavouritesRenderCorrectly [
	
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
MWFavoritesTest >> testFavouritesSetExists [

	self assert: (MWFavorites respondsTo: #favouriteFoods)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 16:17'
}
MWFavoritesTest >> testMealIsLikable [

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
MWFavoritesTest >> testMealIsUnlikable [

	self getAllMeals do: [:each |
		(MWFavorites favouriteFoods includes: (self getNameFor: each))
			ifTrue: [self simulateButtonClick: (self getStarFor: each). 
				self assert: (MWFavorites favouriteFoods includes: (self getNameFor: each)) not;
					assert: (self getStarColorFor: each) = Color transparent.
				^ nil]]
]

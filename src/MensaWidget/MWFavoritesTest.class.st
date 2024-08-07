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
	#'squeak_changestamp' : 'LC 7/12/2024 12:13'
}
MWFavoritesTest >> getAllMeals [
	
	^ self mensaWidget contentMorph allMorphs 
		select: [:each | each class = MWMeal]
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'LC 7/12/2024 11:11'
}
MWFavoritesTest >> getNameFor: aMeal [
	
	^ aMeal nameMorph contents string
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'LC 7/12/2024 11:11'
}
MWFavoritesTest >> getStarColorFor: aMeal [
	
	^ (self getStarFor: aMeal) color
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'LC 7/12/2024 11:11'
}
MWFavoritesTest >> getStarFor: aMeal [
	
	^ aMeal starMorph
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
	#'squeak_changestamp' : 'LC 7/8/2024 00:21'
}
MWFavoritesTest >> setUp [

	self mensaWidget: MWFrame newForTests
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'LC 6/26/2024 15:57'
}
MWFavoritesTest >> simulateButtonClick: aStar [

	aStar handleMouseDown: 
		((MouseButtonEvent new 
			setType: #mouseDown 
			position: aStar center 
			buttons: 4 
			hand: World currentHand) 
		handler: aStar)
]

{
	#category : #environment,
	#'squeak_changestamp' : 'LC 6/23/2024 19:21'
}
MWFavoritesTest >> tearDown [

	self mensaWidget owner abandon
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 6/26/2024 15:50'
}
MWFavoritesTest >> testFavouritesIsSet [

	self assert: MWFavorites favouriteMeals class = Set
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/12/2024 11:13'
}
MWFavoritesTest >> testFavouritesRenderCorrectly [
	
	self getAllMeals do: [:each |
		(MWFavorites favouriteMeals includes: (self getNameFor: each))
			ifTrue: [self deny: (self getStarColorFor: each) = Color transparent]
			ifFalse: [self assert: (self getStarColorFor: each) = Color transparent]]
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 6/26/2024 15:50'
}
MWFavoritesTest >> testFavouritesSetExists [

	self assert: (MWFavorites respondsTo: #favouriteMeals)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/12/2024 12:15'
}
MWFavoritesTest >> testMealIsLikable [

	self getAllMeals do: [:each |
		(MWFavorites favouriteMeals includes: (self getNameFor: each))
			ifFalse: [self simulateButtonClick: (self getStarFor: each). 
				self assert: (MWFavorites favouriteMeals includes: (self getNameFor: each));
					deny: (self getStarColorFor: each) = Color transparent]]
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/12/2024 12:15'
}
MWFavoritesTest >> testMealIsUnlikable [

	self getAllMeals do: [:each |
		(MWFavorites favouriteMeals includes: (self getNameFor: each))
			ifTrue: [self simulateButtonClick: (self getStarFor: each). 
				self deny: (MWFavorites favouriteMeals includes: (self getNameFor: each));
					assert: (self getStarColorFor: each) = Color transparent]]
]

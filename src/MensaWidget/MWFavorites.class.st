"
A MWFavorites is a class that stores all liked foods and also handle the liking process.

Instance Variables

"
Class {
	#name : #MWFavorites,
	#superclass : #Object,
	#classVars : [
		'FavouriteMeals'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 16:21'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 6/26/2024 15:56'
}
MWFavorites class >> favouriteMeals [

	FavouriteMeals ifNil: [FavouriteMeals := Set new].
	^ FavouriteMeals
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 6/26/2024 15:52'
}
MWFavorites class >> favouriteMeals: anObject [

	FavouriteMeals := anObject
]

{
	#category : #liking,
	#'squeak_changestamp' : 'LC 6/26/2024 15:58'
}
MWFavorites class >> insertMeal: aMeal [
	
	self favouriteMeals: 
		(self favouriteMeals add: aMeal; yourself)
]

{
	#category : #liking,
	#'squeak_changestamp' : 'LC 6/26/2024 15:51'
}
MWFavorites class >> removeMeal: aMeal [

	self favouriteMeals remove: aMeal ifAbsent: []
]

{
	#category : #liking,
	#'squeak_changestamp' : 'LC 6/26/2024 15:52'
}
MWFavorites class >> toggleLike: anEvent [

	anEvent handler color = Color transparent ifTrue: 
		[anEvent handler color: Color fern lighter.
		self insertMeal: anEvent handler owner submorphs first text string] ifFalse: 
		[anEvent handler color: Color transparent.
		self removeMeal: anEvent handler owner submorphs first text string]
]

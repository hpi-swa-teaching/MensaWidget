"
A MWFavorites is a class that stores all liked meals and also handle the liking process.

Class Variables
	FavouriteMeals:		<Set>
			
FavouriteMeals
	- is a set of meal names as strings which represents the liked meals

"
Class {
	#name : #MWFavorites,
	#superclass : #Object,
	#classVars : [
		'FavouriteMeals'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'tmc 7/10/2024 18:32'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 6/30/2024 23:20'
}
MWFavorites class >> favouriteMeals [

	^ FavouriteMeals ifNil: [FavouriteMeals := Set new]
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
	#'squeak_changestamp' : 'tmc 7/11/2024 22:31'
}
MWFavorites class >> insertMeal: aMeal [
	
	self favouriteMeals add: aMeal
]

{
	#category : #liking,
	#'squeak_changestamp' : 'LC 7/12/2024 13:16'
}
MWFavorites class >> removeMeal: aMeal [

	self favouriteMeals remove: aMeal 
		ifAbsent: []
]

{
	#category : #liking,
	#'squeak_changestamp' : 'LC 7/12/2024 13:18'
}
MWFavorites class >> toggleLike: anEvent [

	anEvent handler color = Color transparent 
		ifTrue: [anEvent handler color: MWConfiguration secondaryColor.
			self insertMeal: anEvent handler owner nameMorph text string] 
		ifFalse: [anEvent handler color: Color transparent.
			self removeMeal: anEvent handler owner nameMorph text string]
]

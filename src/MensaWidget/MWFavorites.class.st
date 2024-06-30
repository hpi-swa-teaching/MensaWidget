"
A MWFavorites is a class that stores all liked meals and also handle the liking process.

Class Variables
	LikedMeals:		<Set>
			
LikedMeals
	- is a set of meal names as strings which represents the liked meals

"
Class {
	#name : #MWFavorites,
	#superclass : #Object,
	#classVars : [
		'FavouriteMeals'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'LC 6/30/2024 20:39'
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
	#'squeak_changestamp' : 'LC 6/30/2024 23:21'
}
MWFavorites class >> insertMeal: aMeal [
	
	self favouriteMeals: 
		(self favouriteMeals add: aMeal; 
			yourself)
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
	#'squeak_changestamp' : 'LC 6/26/2024 16:01'
}
MWFavorites class >> toggleLike: anEvent [

	anEvent handler color = Color transparent ifTrue: 
		[anEvent handler color: MWColorTheme secondaryColor.
		self insertMeal: anEvent handler owner submorphs first text string] ifFalse: 
		[anEvent handler color: Color transparent.
		self removeMeal: anEvent handler owner submorphs first text string]
]

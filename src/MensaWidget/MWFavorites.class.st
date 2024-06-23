"
A MWFavorites is a class that stores all liked foods and also handle the liking process.

Instance Variables

"
Class {
	#name : #MWFavorites,
	#superclass : #Object,
	#classVars : [
		'FavouriteFoods'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 16:21'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 20:27'
}
MWFavorites class >> favouriteFoods [

	FavouriteFoods ifNil: 
		[FavouriteFoods := Set new].
	^ FavouriteFoods
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 20:08'
}
MWFavorites class >> favouriteFoods: anObject [

	FavouriteFoods := anObject
]

{
	#category : #liking,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 15:54'
}
MWFavorites class >> insertFood: aFood [
	
	self favouriteFoods: (self favouriteFoods add: aFood; yourself)
]

{
	#category : #liking,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 20:28'
}
MWFavorites class >> removeFood: aFood [

	self favouriteFoods remove: aFood ifAbsent: []
]

{
	#category : #liking,
	#'squeak_changestamp' : 'LC 6/23/2024 19:14'
}
MWFavorites class >> toggleLike: anEvent [

	anEvent handler color = Color transparent ifTrue: 
		[anEvent handler color: Color fern lighter.
		self insertFood: anEvent handler owner submorphs first text string] ifFalse: 
		[anEvent handler color: Color transparent.
		self removeFood: anEvent handler owner submorphs first text string]
]

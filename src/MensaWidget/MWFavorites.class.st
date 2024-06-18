Class {
	#name : #MWFavorites,
	#superclass : #Object,
	#classVars : [
		'FavouriteFoods'
	],
	#category : #MensaWidget
}

{
	#category : #liking,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 20:35'
}
MWFavorites class >> emptyFavourites [

	self favouriteFoods removeAll
]

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
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 20:25'
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
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 20:39'
}
MWFavorites class >> toggleLike: anEvent [

	anEvent handler submorphs first color = Color transparent ifTrue: 
		[anEvent handler submorphs first color: Color fern lighter.
		self insertFood: anEvent handler owner submorphs first text string] ifFalse: 
		[anEvent handler submorphs first color: Color transparent.
		self removeFood: anEvent handler owner submorphs first text string]
]

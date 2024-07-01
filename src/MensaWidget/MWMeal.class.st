"
A MWMeal is a structure to store information about a meal from the OpenMensa-API.

Instance Variables
	category:		<String>
	id:		<Number>
	name:		<String>
	notes:		<OrderedCollection>
	prices:		<JSONObject>

category
	- the category of the meal provided by OpenMensa-API

id
	- the provided id for the meal

name
	- the name of the meal

notes
	- additional info on the meal

prices
	- prices for students, employees, pupils and others

"
Class {
	#name : #MWMeal,
	#superclass : #AlignmentMorph,
	#instVars : [
		'id',
		'name',
		'category',
		'prices',
		'notes'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Max 5/31/2024 21:55'
}

{
	#category : #meals,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 15:49'
}
MWMeal class >> emptyMeal [

	^ self newRow id: nil;
		name: 'Hier gibt es nichts zu sehen.' translated;
		category: nil;
		notes: nil;
		prices: MWMealCleaner emptyPrice;
		build
]

{
	#category : #constants,
	#'squeak_changestamp' : 'LC 6/23/2024 19:02'
}
MWMeal class >> getStarVertices [
	
	^ RealEstateAgent scaleFactor * 
		{6 @ 0. 7 @ 5. 12 @ 5. 8 @ 8. 10 @ 12. 6 @ 10. 2 @ 12. 3 @ 8. 0 @ 5. 5 @ 5}

]

{
	#category : #meals,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:07'
}
MWMeal class >> hotCounterMeal [

	^ MWMeal newRow id: nil;
		name: 'Heiße Theke 100 g' translated;
		category: MWMealCleaner lunchCategory;
		notes: nil;
		prices: MWMealCleaner hotCounterPrice
]

{
	#category : #meals,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:07'
}
MWMeal class >> saladBarMeal [

	^ MWMeal newRow id: nil;
		name: 'Salatbar 100 g' translated;
		category: MWMealCleaner lunchCategory;
		notes: nil;
		prices: MWMealCleaner saladBarPrice
]

{
	#category : #constants,
	#'squeak_changestamp' : 'LC 6/23/2024 19:12'
}
MWMeal class >> spacerMorphWidth [

	^ 25 px 
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 20:58'
}
MWMeal class >> starBoarderWidth [

	^ 2 * RealEstateAgent scaleFactor
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 20:55'
}
MWMeal class >> starInset [

	^ 3 * RealEstateAgent scaleFactor
]

{
	#category : #display,
	#'squeak_changestamp' : 'LC 6/23/2024 19:12'
}
MWMeal >> build [
	
	^ self color: MWColorTheme primaryColor;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		addMorph: self getPriceMorph;		
		addMorph: self getSpacerMorph;
		addMorph: self getStarMorph;
		addMorph: self getSpacerMorph;
		addMorph: self getNameMorph;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 5/29/2024 12:57'
}
MWMeal >> category [

	^ category
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 5/29/2024 12:57'
}
MWMeal >> category: anObject [

	category := anObject
]

{
	#category : #display,
	#'squeak_changestamp' : 'Oscar 6/14/2024 13:17'
}
MWMeal >> getNameMorph [

	^ self name asText asMorph
		hResizing: #spaceFill;
		lock; 
		textStyle: TextStyle default copy;
		yourself
]

{
	#category : #display,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 19:12'
}
MWMeal >> getPriceMorph [
	
	^ StringMorph contents: self getPriceStream contents
]

{
	#category : #display,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:02'
}
MWMeal >> getPriceStream [

	| priceStream |
	
	priceStream := WriteStream on: String new.
    	(self prices at: 'students') 
		ifNil: [''] 
		ifNotNil: [:price | price printOn: priceStream showingDecimalPlaces: 2].
	^ priceStream
]

{
	#category : #display,
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 14:57'
}
MWMeal >> getSpacerMorph [

	^ Morph new 
		color: Color transparent;
		hResizing: #rigid;
		vResizing: #spaceFill;
		width: self class spacerMorphWidth;
		yourself
]

{
	#category : #star,
	#'squeak_changestamp' : 'LC 6/23/2024 19:13'
}
MWMeal >> getStarMorph [
	
	^ PolygonMorph new 
		color: self getStarMorphColor;
		borderColor: Color fern lighter;
		borderWidth: self class starBoarderWidth;
		setVertices: self class getStarVertices;
		on: #mouseDown send: #toggleLike: to: MWFavorites;
		yourself
]

{
	#category : #star,
	#'squeak_changestamp' : 'LC 6/26/2024 16:00'
}
MWMeal >> getStarMorphColor [

	(MWFavorites favouriteMeals includes: self name) ifTrue: 
		[^ MWColorTheme secondaryColor] ifFalse:
		[^ Color transparent]
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 5/29/2024 12:57'
}
MWMeal >> id [

	^ id
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 5/29/2024 12:57'
}
MWMeal >> id: anObject [

	id := anObject
]

{
	#category : #checks,
	#'squeak_changestamp' : 'Max 6/10/2024 20:12'
}
MWMeal >> isHotCounter [

	^ self category = 'Heiße Theke'
]

{
	#category : #checks,
	#'squeak_changestamp' : 'Max 6/10/2024 20:13'
}
MWMeal >> isSaladBar [

	^ self category = 'Salattheke'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 5/29/2024 12:58'
}
MWMeal >> name [

	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 5/29/2024 12:58'
}
MWMeal >> name: anObject [

	name := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 5/29/2024 12:58'
}
MWMeal >> notes [

	^ notes
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 5/29/2024 12:58'
}
MWMeal >> notes: anObject [

	notes := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 5/29/2024 12:58'
}
MWMeal >> prices [

	^ prices
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 5/29/2024 12:58'
}
MWMeal >> prices: anObject [

	prices := anObject
]

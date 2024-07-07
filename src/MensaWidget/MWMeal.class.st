"
A MWMeal is a structure to store information about a meal from the OpenMensa-API.

Instance Variables
	category:		<String>
	id:		<Number>
	name:		<String>
	notes:		<OrderedCollection>
	prices:		<JSONObject>

Class Variables
	PriceGroup:		<String>

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

PriceGroup
	- the configured price group, default is student
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
	#classVars : [
		'PriceGroup'
	],
	#category : 'MensaWidget',
	#'squeak_changestamp' : 'Max 7/1/2024 21:44'
}

{
	#category : #meals,
	#'squeak_changestamp' : 'Max 7/5/2024 09:40'
}
MWMeal class >> contentlessMeal [

	^ self newRow id: nil;
		name: '' translated;
		category: nil;
		notes: nil;
		prices: MWMealCleaner emptyPrice;
		build
]

{
	#category : #constants,
	#'squeak_changestamp' : 'tmc 6/18/2024 22:14'
}
MWMeal class >> defaultGroup [

	^ 'others'
]

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
	#category : #accessing,
	#'squeak_changestamp' : 'tmc 6/18/2024 22:02'
}
MWMeal class >> priceGroup [
	
	^ PriceGroup
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/5/2024 00:27'
}
MWMeal class >> priceGroup: anObject [
	
	(MWConfiguration priceGroups includes: anObject)
		ifTrue: [PriceGroup := anObject]
		ifFalse: [PriceGroup := MWMeal defaultGroup]
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
	#category : #updating,
	#'squeak_changestamp' : 'LC 7/3/2024 00:05'
}
MWMeal class >> updatePrice [

	self allInstancesDo: [:each | each updatePrice]
]

{
	#category : #display,
	#'squeak_changestamp' : 'LC 7/2/2024 10:27'
}
MWMeal >> build [
	
	^ self color: MWConfiguration primaryColor;
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
	#'squeak_changestamp' : 'LC 7/3/2024 00:01'
}
MWMeal >> getPriceStream [

	| priceStream |
	
	priceStream := WriteStream on: String new.
    	(self prices at: (self class priceGroup ifNil: [self class defaultGroup])) 
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
	#'squeak_changestamp' : 'LC 7/2/2024 10:28'
}
MWMeal >> getStarMorphColor [

	(MWFavorites favouriteMeals includes: self name) ifTrue: 
		[^ MWConfiguration secondaryColor] ifFalse:
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

{
	#category : #updating,
	#'squeak_changestamp' : 'LC 7/5/2024 11:45'
}
MWMeal >> updatePrice [
	
	self submorphs isEmptyOrNil ifFalse: 
		[self submorphs last contents: self getPriceStream contents]
]

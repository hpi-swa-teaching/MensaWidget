"
A MWMeal is a structure to store information about a meal from the OpenMensa-API.

Instance Variables
	category:		<String>
	id:		<Number>
	name:		<String>
	notes:		<OrderedCollection>
	prices:		<JSONObject>
	starMorph:		<PolygonMorph>
	nameMorph:	<TextMorph>
	priceMorph:	<StringMorph>

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
	

starMorph
	- morphic representation for the like button
	
nameMorph
	- morphic representation for the name of the meal

priceMorph
	- morphic representation for the price of the meal of the given price category

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
		'notes',
		'priceMorph',
		'nameMorph',
		'starMorph'
	],
	#classVars : [
		'PriceGroup'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'LC 7/11/2024 21:26'
}

{
	#category : #meals,
	#'squeak_changestamp' : 'NK 7/9/2024 11:50'
}
MWMeal class >> contentlessMeal [

	^ self newRow id: nil;
		name: '';
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
	#'squeak_changestamp' : 'LC 7/12/2024 11:28'
}
MWMeal class >> spacerMorphWidth [

	^ 25 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'LC 7/12/2024 11:28'
}
MWMeal class >> starBoarderWidth [

	^ 2 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'LC 7/12/2024 11:28'
}
MWMeal class >> starInset [

	^ 3 px
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
	#'squeak_changestamp' : 'NK 7/9/2024 11:47'
}
MWMeal >> addNameMorph [

	self nameMorph: (TextMorph new contents: self name;
		hResizing: #spaceFill;
		lock);
		addMorph: self nameMorph
]

{
	#category : #display,
	#'squeak_changestamp' : 'Oscar 7/12/2024 09:51'
}
MWMeal >> addPriceMorph [
	
	self priceMorph: (StringMorph contents: self getPrice);
		addMorph: self priceMorph
]

{
	#category : #display,
	#'squeak_changestamp' : 'NK 7/9/2024 11:47'
}
MWMeal >> addSpacerMorph [

	self addMorph: (Morph new 
		color: Color transparent;
		hResizing: #rigid;
		vResizing: #spaceFill;
		width: self class spacerMorphWidth)
]

{
	#category : #display,
	#'squeak_changestamp' : 'NK 7/9/2024 11:47'
}
MWMeal >> addStarMorph [
	
	self starMorph: (PolygonMorph new 
		color: self getStarMorphColor;
		borderColor: Color fern lighter;
		borderWidth: self class starBoarderWidth;
		setVertices: self class getStarVertices;
		on: #mouseDown send: #toggleLike: to: MWFavorites);
		addMorph: self starMorph
]

{
	#category : #display,
	#'squeak_changestamp' : 'NK 7/9/2024 11:47'
}
MWMeal >> build [
	
	^ self color: MWConfiguration primaryColor;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		addPriceMorph;		
		addSpacerMorph;
		addStarMorph;
		addSpacerMorph;
		addNameMorph
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
	#'squeak_changestamp' : 'Oscar 7/12/2024 09:51'
}
MWMeal >> getPrice [

	| priceStream |
	
	priceStream := WriteStream on: String new.
    	(self prices at: (self class priceGroup ifNil: [self class defaultGroup])) 
		ifNil: [''] 
		ifNotNil: [:price | price printOn: priceStream showingDecimalPlaces: 2].
	^ priceStream contents
]

{
	#category : #display,
	#'squeak_changestamp' : 'NK 7/9/2024 11:48'
}
MWMeal >> getStarMorphColor [

	(MWFavorites favouriteMeals includes: self name) 
		ifTrue: [^ MWConfiguration secondaryColor] 
		ifFalse: [^ Color transparent]
	
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
	#'squeak_changestamp' : 'NK 7/9/2024 11:42'
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
	#'squeak_changestamp' : 'NK 7/9/2024 10:51'
}
MWMeal >> nameMorph [

	^ nameMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'NK 7/9/2024 10:51'
}
MWMeal >> nameMorph: anObject [

	nameMorph := anObject
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
	#'squeak_changestamp' : 'NK 7/9/2024 10:37'
}
MWMeal >> priceMorph [

	^ priceMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'NK 7/9/2024 10:38'
}
MWMeal >> priceMorph: anObject [

	priceMorph := anObject
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
	#category : #accessing,
	#'squeak_changestamp' : 'NK 7/9/2024 11:46'
}
MWMeal >> starMorph [

	^ starMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'NK 7/9/2024 11:46'
}
MWMeal >> starMorph: anObject [

	starMorph := anObject
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Oscar 7/12/2024 10:42'
}
MWMeal >> updatePrice [
	
	self priceMorph ifNotNil: [self priceMorph contents: self getPrice]
]

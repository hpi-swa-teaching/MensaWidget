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
	#superclass : #Object,
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
	#category : #constants,
	#'squeak_changestamp' : 'tmc 6/18/2024 21:29'
}
MWMeal class >> getStarMorph: aMeal [
	
	^ PolygonMorph new 
		color: (self getStarMorphColor: aMeal);
		borderColor: Color fern lighter;
		borderWidth: self starBoarderWidth;
		setVertices: self getStarVertices;
		yourself
]

{
	#category : #constants,
	#'squeak_changestamp' : 'tmc 6/18/2024 21:27'
}
MWMeal class >> getStarMorphColor: aMeal [

	(MWFavorites favouriteFoods includes: aMeal) ifTrue: [^ Color fern lighter] 
		 ifFalse:[^ Color transparent]
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'tmc 6/18/2024 21:32'
}
MWMeal class >> getStarMorphCover: aMeal [
	
	^ AlignmentMorph new
		addMorph: (self getStarMorph: aMeal);
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		on: #mouseDown send: #toggleLike: to: MWFavorites;
		cellPositioning: #center;
		color: Color transparent;
		cellInset: self starInset;
		yourself
]

{
	#category : #constants,
	#'squeak_changestamp' : 'tmc 6/18/2024 21:19'
}
MWMeal class >> getStarVertices [
	
	^ RealEstateAgent scaleFactor * 
		{6@0. 7@5. 12@5. 8@8. 10@12. 6@10. 2@12. 3@8. 0@5. 5@5}

]

{
	#category : #constants,
	#'squeak_changestamp' : 'Oscar 6/15/2024 13:57'
}
MWMeal class >> spacerMorphWidth [

	^ 50 px 
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
	#'squeak_changestamp' : 'Louis Christ 6/22/2024 14:57'
}
MWMeal >> getMealMorph [

	^ AlignmentMorph newRow
		color: MWColorTheme primaryColor;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		addMorph: self getPriceMorph;
		addMorph: (self class getStarMorphCover: self name);
		addMorph: self getSpacerMorph;
		addMorph: self getNameMorph;
		yourself
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
	#'squeak_changestamp' : 'Oscar 6/16/2024 20:28'
}
MWMeal >> getPriceMorph [
	
	^ TextMorph new
		contents: self getPriceStream contents;
		readOnly: true;
		textStyle: TextStyle default;
		yourself
]

{
	#category : #display,
	#'squeak_changestamp' : 'Max 6/12/2024 13:51'
}
MWMeal >> getPriceStream [

	| priceStream |
	
	priceStream := WriteStream on: String new.
    	(self prices at: 'students') 
		ifNil: [' '] 
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

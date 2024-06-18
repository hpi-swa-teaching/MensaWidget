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
	#'squeak_changestamp' : 'Louis Christ 6/6/2024 22:10'
}
MWMeal class >> avgLineLenght [
	
	^ 30
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 20:05'
}
MWMeal class >> getStarMorph [
	
	^ PolygonMorph new 
		color: Color transparent;
		borderColor: Color paleGreen;
		borderWidth: 3;
		setVertices: self getStarVertices;
		yourself
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 19:48'
}
MWMeal class >> getStarVertices [
	
	^ RealEstateAgent scaleFactor * 
		{12.5@0. 15@10. 25@10. 17.5@16.25. 20@25. 12.5@20. 5@25. 7.5@16.25. 0@10. 10@10}

]

{
	#category : #constants,
	#'squeak_changestamp' : 'Oscar 6/5/2024 00:07'
}
MWMeal class >> mealMorphColor [
	
	 ^ Color paleGreen darker darker
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Oscar 6/5/2024 00:10'
}
MWMeal class >> mealMorphWidth [

	^ 400
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
	#'squeak_changestamp' : 'tmc 6/6/2024 21:46'
}
MWMeal >> getMealMorph [

	^ AlignmentMorph newRow
		color: self class mealMorphColor;
		width: self class mealMorphWidth;
		vResizing: #shrinkWrap;
		hResizing: #rigid;
		addMorph: self getPriceMorph;
		addMorph: self getSpacerMorph;
		addMorph: self getNameMorph;
		yourself
]

{
	#category : #display,
	#'squeak_changestamp' : 'tmc 6/6/2024 21:47'
}
MWMeal >> getNameMorph [

	^ TextMorph new
		contents: self name;
		averageLineLength: self class avgLineLenght;
		readOnly: true;
		yourself 

	
]

{
	#category : #display,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 11:00'
}
MWMeal >> getPriceMorph [

	^ TextMorph new
		contents: ((self prices at: 'students') ifNil: [0.00]) asString;
		readOnly: true;
		yourself
]

{
	#category : #display,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 20:05'
}
MWMeal >> getSpacerMorph [

	^ Morph new 
		color: Color transparent;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		on: #mouseDown send: #toggleLike: to: MWFavorites;
		addMorphCentered: self class getStarMorph;
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

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
	#category : #meals,
	#'squeak_changestamp' : 'Max 6/11/2024 10:37'
}
MWMeal class >> emptyMeal [

	^ MWMeal new id: nil;
		name: 'Hier gibt es nichts zu sehen.' translated;
		category: nil;
		notes: nil;
		prices: MWPrice emptyPrice
		
]

{
	#category : #meals,
	#'squeak_changestamp' : 'Max 6/10/2024 20:04'
}
MWMeal class >> hotCounter [

	^ MWMeal new id: nil;
		name: 'Heiße Theke 100 g' translated;
		category: 'lunch';
		notes: nil;
		prices: MWPrice hotCounterPrice
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
	#category : #meals,
	#'squeak_changestamp' : 'Max 6/10/2024 20:04'
}
MWMeal class >> saladBar [

	^ MWMeal new id: nil;
		name: 'Salatbar 100 g' translated;
		category: 'lunch';
		notes: nil;
		prices: MWPrice saladBarPrice
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
	#'squeak_changestamp' : 'Max 6/10/2024 21:25'
}
MWMeal >> getPriceMorph [

	^ TextMorph new
		contents: ((self prices students) ifNil: ['none']) asString;
		readOnly: true;
		yourself
]

{
	#category : #display,
	#'squeak_changestamp' : 'tmc 6/6/2024 21:57'
}
MWMeal >> getSpacerMorph [

	^ Morph new 
		color: Color transparent;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
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

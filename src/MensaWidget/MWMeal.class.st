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
	#'squeak_changestamp' : 'Oscar 6/5/2024 00:07'
}
MWMeal class >> mealMorphColor [
	
	 ^ Color paleGreen darker darker
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Oscar 6/14/2024 12:58'
}
MWMeal class >> spacerMorphWidth [
	^ 50 px 
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
	#'squeak_changestamp' : 'Oscar 6/13/2024 10:45'
}
MWMeal >> getMealMorph [

	^ AlignmentMorph newRow
		color: self class mealMorphColor;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		addMorph: self getPriceMorph;
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
	#'squeak_changestamp' : 'Oscar 6/14/2024 14:17'
}
MWMeal >> getPriceMorph [
	
	^ TextMorph new
		contents: ((self prices at: 'students') ifNil: [0.00]) asString;
		readOnly: true;
		textStyle: TextStyle default;
		yourself
]

{
	#category : #display,
	#'squeak_changestamp' : 'Oscar 6/14/2024 15:32'
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

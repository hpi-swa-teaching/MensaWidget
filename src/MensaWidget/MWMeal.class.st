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

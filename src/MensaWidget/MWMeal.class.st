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
	#category : #display,
	#'squeak_changestamp' : 'Max 6/4/2024 21:02'
}
MWMeal >> getMealMorph [

	| mealMorph nameMorph priceMorph |
	
	nameMorph := self getNameMorph.
	priceMorph := self getPriceMorph.
	mealMorph := Morph new.
	mealMorph 	color: Color paleGreen darker darker;
		extent: 400 @ ((self getNameMorphHeight: self name) + 20).
	mealMorph addMorph: nameMorph;
		addMorph: priceMorph.
	nameMorph position: 10@10.
	priceMorph position: (390@10)  - (priceMorph width @ 0).
	^ mealMorph.
]

{
	#category : #display,
	#'squeak_changestamp' : 'Max 6/4/2024 20:59'
}
MWMeal >> getNameMorph [

	| nameMorph |

	nameMorph := TextMorph new.
	nameMorph contents: self name;
		averageLineLength: 25.
	^ nameMorph
	
]

{
	#category : #display,
	#'squeak_changestamp' : 'Max 6/4/2024 21:00'
}
MWMeal >> getNameMorphHeight: aString [
	
	| namemorph size |
	namemorph := TextMorph new.
	namemorph contents: self name;
			averageLineLength: 25;
			openInWorld.
	size := namemorph height.
	namemorph abandon.
	^ size.
]

{
	#category : #display,
	#'squeak_changestamp' : 'Max 6/4/2024 20:59'
}
MWMeal >> getPriceMorph [

	| priceMorph |
	
	priceMorph := TextMorph new.
	priceMorph contents: ((self prices at: 'students') ifNil: [0.00]) asString.
	^ priceMorph
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

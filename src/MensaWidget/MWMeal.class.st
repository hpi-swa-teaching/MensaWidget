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
	#'squeak_changestamp' : 'Oscar 6/5/2024 00:04'
}
MWMeal class >> avgLineLenght [
	
	^ 25
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Oscar 6/5/2024 00:24'
}
MWMeal class >> mealMorphBorder [

	^ 10
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
	#'squeak_changestamp' : 'Max 6/5/2024 09:06'
}
MWMeal >> getMealMorph [

	| mealMorph nameMorph priceMorph priceMorphPosition |
	
	nameMorph := self getNameMorph.
	priceMorph := self getPriceMorph.
	mealMorph := Morph new.
	mealMorph color: self class mealMorphColor;
		extent: self class mealMorphWidth @((self getNameMorphHeight: self name) + (self class mealMorphBorder * 2)).
	mealMorph addMorph: nameMorph;
		addMorph: priceMorph.
	nameMorph position: self class mealMorphBorder@self class mealMorphBorder.
	priceMorphPosition := (self class mealMorphWidth - self class mealMorphBorder@self class mealMorphBorder) - (priceMorph width@0).
	priceMorph position: priceMorphPosition.
	^ mealMorph
]

{
	#category : #display,
	#'squeak_changestamp' : 'Oscar 6/5/2024 00:04'
}
MWMeal >> getNameMorph [

	| nameMorph |

	nameMorph := TextMorph new.
	nameMorph contents: self name;
		averageLineLength: self class avgLineLenght.
	^ nameMorph
	
]

{
	#category : #display,
	#'squeak_changestamp' : 'Max 6/5/2024 09:07'
}
MWMeal >> getNameMorphHeight: aString [
	
	| namemorph size |
	namemorph := TextMorph new.
	namemorph contents: self name;
			averageLineLength: self class avgLineLenght;
			openInWorld.
	size := namemorph height.
	namemorph abandon.
	^ size
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

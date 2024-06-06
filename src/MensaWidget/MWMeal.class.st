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
	#'squeak_changestamp' : 'Oscar 6/5/2024 12:39'
}
MWMeal >> getMealMorph [

	| mealMorph |

	mealMorph := Morph new
 		color: self class mealMorphColor;
		extent: self class mealMorphWidth @ 
			((self getNameMorphHeight: self name) + (self class mealMorphBorder * 2));
		addMorph: self getNameMorph;
		addMorph: self getPriceMorph.
	^ mealMorph.
]

{
	#category : #display,
	#'squeak_changestamp' : 'tmc 6/6/2024 18:55'
}
MWMeal >> getNameMorph [

	| nameMorph |

	nameMorph := TextMorph new
		contents: self name;
		averageLineLength: self class avgLineLenght;
		position: self class mealMorphBorder @ self class mealMorphBorder;
		readOnly: true.
	^ nameMorph
	
]

{
	#category : #display,
	#'squeak_changestamp' : 'Oscar 6/5/2024 12:54'
}
MWMeal >> getNameMorphHeight: aString [
	
	| namemorph size |
	
	namemorph := TextMorph new
		contents: self name;
		averageLineLength: self class avgLineLenght;
		openInWorld.
	size := namemorph height.
	namemorph abandon.
	^ size
]

{
	#category : #display,
	#'squeak_changestamp' : 'tmc 6/6/2024 18:56'
}
MWMeal >> getPriceMorph [

	| priceMorph |
	
	priceMorph := TextMorph new
		contents: ((self prices at: 'students') ifNil: [0.00]) asString;
		position: (self class mealMorphWidth - self class mealMorphBorder @ self class mealMorphBorder);
		readOnly: true.
		
	"offset needs to be calculated after creation" 
	priceMorph position: priceMorph position - (priceMorph width @ 0).
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

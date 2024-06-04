"
A MWCanteen is a object that stores the data of a canteen for a certain date with all available meals.

Instance Variables
	date:		<String>
	id:		<String>
	meals:		<String>
	name:		<OrderedCollection>

date
	- the date the meals are available

id
	- the id correlating to id at the api endpoint

meals
	- array of all available meals as meal objects

name
	- name of the canteen

"
Class {
	#name : #MWCanteen,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'date',
		'meals'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Louis Christ 5/31/2024 14:42'
}

{
	#category : #'constructor ',
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:34'
}
MWCanteen class >> newWithId: anId Name: aName Date: aDate Meals: aMealList [

	| newInstance | 
	
	newInstance := self new.
	newInstance id: anId;
		name: aName;
		date: aDate;
		meals: aMealList.
	^ newInstance.
]

{
	#category : #display,
	#'squeak_changestamp' : 'Max 6/4/2024 21:22'
}
MWCanteen >> addMealsToCanteenMorph: aCanteenMorph at: aPosition [

	| mealMorph position |
	
 	position := aPosition.   	
	self meals do: [ :each | 
      	mealMorph := each getMealMorph.
        	aCanteenMorph addMorph: mealMorph.
        	mealMorph position: position.
        	position := 0 @ (5 + mealMorph height) + position ]
]

{
	#category : #display,
	#'squeak_changestamp' : 'Max 6/4/2024 21:17'
}
MWCanteen >> createNameMorphAt: aPosition [

	| nameMorph |
	
    	nameMorph := TextMorph new.
    	nameMorph contents: self name.
    	nameMorph position: aPosition.
    	^ nameMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:33'
}
MWCanteen >> date [

	^ date
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:33'
}
MWCanteen >> date: anObject [

	date := anObject
]

{
	#category : #display,
	#'squeak_changestamp' : 'Max 6/4/2024 21:24'
}
MWCanteen >> getCanteenMorph [

	| canteenMorph nameMorph position |
	
	canteenMorph := self initializeCanteenMorph.
	nameMorph := self createNameMorphAt: 5@5.
	canteenMorph addMorph: nameMorph.
	position := 0 @ (5 +nameMorph height) + (5@5).
	self addMealsToCanteenMorph: canteenMorph at: position.
	canteenMorph extent: 410 @ position y.
	^ canteenMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:33'
}
MWCanteen >> id [

	^ id
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:33'
}
MWCanteen >> id: anObject [

	id := anObject
]

{
	#category : #display,
	#'squeak_changestamp' : 'Max 6/4/2024 21:15'
}
MWCanteen >> initializeCanteenMorph [

	| morph |
	
    	morph := Morph new.
   	morph color: Color fern lighter.
    	^ morph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:33'
}
MWCanteen >> meals [

	^ meals
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:33'
}
MWCanteen >> meals: anObject [

	meals := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:33'
}
MWCanteen >> name [

	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:33'
}
MWCanteen >> name: anObject [

	name := anObject
]

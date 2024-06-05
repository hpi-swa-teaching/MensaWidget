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
	#category : #constants,
	#'squeak_changestamp' : 'Oscar 6/5/2024 00:26'
}
MWCanteen class >> canteenMorphBorder [

	^ 5
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Oscar 6/5/2024 12:44'
}
MWCanteen class >> canteenMorphColor [ 

	^ Color fern lighter
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Oscar 6/5/2024 00:32'
}
MWCanteen class >> canteenMorphWidth [
	" = 2 * canteenMorphBorder + MWMeal class canteenMorphBorder "
	
	^ 410
]

{
	#category : #'constructor ',
	#'squeak_changestamp' : 'Max 6/5/2024 09:07'
}
MWCanteen class >> newWithId: anId Name: aName Date: aDate Meals: aMealList [

	| newInstance | 
	
	newInstance := self new.
	newInstance id: anId;
		name: aName;
		date: aDate;
		meals: aMealList.
	^ newInstance
]

{
	#category : #display,
	#'squeak_changestamp' : 'Max 6/5/2024 14:08'
}
MWCanteen >> addMealsToCanteenMorph: aCanteenMorph at: aPosition [

	| mealMorph position |
	
 	position := aPosition.   	
	self meals do: [ :each | 
      	mealMorph := each getMealMorph
			 position: position.
        	aCanteenMorph addMorph: mealMorph.
        	position := 0 @ (self class canteenMorphBorder + mealMorph height) + position ].
]

{
	#category : #display,
	#'squeak_changestamp' : 'Oscar 6/5/2024 12:41'
}
MWCanteen >> createNameMorphAt: aPosition [

	| nameMorph |
	
    	nameMorph := TextMorph new 
		contents: self name;
		position: aPosition.
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
	#'squeak_changestamp' : 'Max 6/5/2024 14:08'
}
MWCanteen >> getCanteenMorph [

	| canteenMorph nameMorph position |
	
	nameMorph := self createNameMorphAt: self class canteenMorphBorder @ self class canteenMorphBorder.
	canteenMorph := self initializeCanteenMorph addMorph: nameMorph.
	position := 0 @ (self class canteenMorphBorder  + nameMorph height) + (self class canteenMorphBorder @ self class canteenMorphBorder).
	self addMealsToCanteenMorph: canteenMorph at: position.
	canteenMorph extent: self class canteenMorphWidth @ ((self lowestSubmorphBoundOF: canteenMorph) + self class canteenMorphBorder).
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
	#'squeak_changestamp' : 'Oscar 6/5/2024 12:44'
}
MWCanteen >> initializeCanteenMorph [

	| morph |
	
    	morph := Morph new
		color: self class canteenMorphColor.
    	^ morph
]

{
	#category : #display,
	#'squeak_changestamp' : 'Max 6/5/2024 14:05'
}
MWCanteen >> lowestSubmorphBoundOF: aCanteenMorph [

	| bound |
	
	bound := 0.
	aCanteenMorph submorphsDo: [ :each |
		each bottomLeft y > bound ifTrue: [ bound := each bottomLeft y ] ].
	^ bound
]

{
	#category : #display,
	#'squeak_changestamp' : 'Max 6/5/2024 14:11'
}
MWCanteen >> lowestSubmorphBoundOf: aCanteenMorph [

	| bound |
	
	bound := 0.
	aCanteenMorph submorphsDo: [ :each |
		each bottomLeft y > bound ifTrue: [ bound := each bottomLeft y ] ].
	^ bound
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

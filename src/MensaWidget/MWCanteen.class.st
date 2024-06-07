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
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 11:04'
}
MWCanteen class >> canteenMorphCellGap [

	^ 5
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Oscar 6/5/2024 12:44'
}
MWCanteen class >> canteenMorphColor [ 

	^ Color fern lighter
]

{
	#category : #constants,
	#'squeak_changestamp' : 'tmc 6/6/2024 21:26'
}
MWCanteen class >> canteenMorphWidth [
	
	^ 410
]

{
	#category : #'constructor ',
	#'squeak_changestamp' : 'tmc 6/6/2024 21:28'
}
MWCanteen class >> newWithId: anId Name: aName Date: aDate Meals: aMealList [

	^ self new
		id: anId;
		name: aName;
		date: aDate;
		meals: aMealList;
		yourself
	
]

{
	#category : #display,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 11:02'
}
MWCanteen >> addMealsTo: aCanteenMorph [

	self meals do: [:each | aCanteenMorph addMorph: each getMealMorph]
]

{
	#category : #display,
	#'squeak_changestamp' : 'tmc 6/6/2024 21:30'
}
MWCanteen >> createNameMorph [

	^ TextMorph new 
		contents: self name;
		readOnly: true; 
		yourself
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
	#'squeak_changestamp' : 'Louis Christ 6/6/2024 19:39'
}
MWCanteen >> getCanteenMorph [

	| canteenMorph |
	
	canteenMorph := self initializeCanteenMorph.
	self addMealsTo: canteenMorph.
	canteenMorph addMorph: self createNameMorph.
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
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 11:04'
}
MWCanteen >> initializeCanteenMorph [

	^ AlignmentMorph newColumn
		color: self class canteenMorphColor;
		cellGap: self class canteenMorphCellGap;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap
    
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

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
	#'squeak_changestamp' : 'Louis Christ 6/6/2024 19:38'
}
MWCanteen >> addMealsTo: aCanteenMorph [

	self meals do: [ :each | aCanteenMorph addMorph: each getMealMorph]
]

{
	#category : #display,
	#'squeak_changestamp' : 'Louis Christ 6/6/2024 19:38'
}
MWCanteen >> createNameMorph [

	^ TextMorph new contents: self name.
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
	#'squeak_changestamp' : 'Louis Christ 6/6/2024 19:34'
}
MWCanteen >> initializeCanteenMorph [

	| morph |
	
    	morph := AlignmentMorph newColumn
		color: self class canteenMorphColor;
		cellGap: 5;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.
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

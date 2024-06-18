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
	#superclass : #AlignmentMorph,
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
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:14'
}
MWCanteen class >> cellGap [

	^ 5
]

{
	#category : #'constructor ',
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:30'
}
MWCanteen class >> newWithId: anId Name: aName Date: aDate Meals: aMealList [

	^ self newColumn
		id: anId;
		name: aName;
		date: aDate;
		meals: aMealList;
		yourself
	
]

{
	#category : #display,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:16'
}
MWCanteen >> addMealsForTime: aTime [

	self meals do: [:each | (each category = aTime) ifTrue:
		[self addMorph: each build]].
	self submorphs size = 0 ifTrue:
		[self addMorph: MWMeal emptyMeal build]
]

{
	#category : #display,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:23'
}
MWCanteen >> buildForTime: aTime [

	self addMealsForTime: aTime;
		addMorph: self createNameMorph
]

{
	#category : #display,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:21'
}
MWCanteen >> createNameMorph [

	^ StringMorph contents: self name
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
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:27'
}
MWCanteen >> initialize [
	
	super initialize.
	^ self color: MWColorTheme secondaryColor;
		cellGap: self class cellGap;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		yourself
    
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

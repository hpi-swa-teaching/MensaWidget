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
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 12:00'
}
MWCanteen class >> currency [ 
	
	^ 'EUR'
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
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 11:49'
}
MWCanteen class >> spacerMorphWidth [

	^ 50 px 
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Louis Christ 6/19/2024 00:57'
}
MWCanteen >> addMealsForTime: aTime [

	self meals do: [:each | 
		(each category = aTime or: [each category = nil]) ifTrue: 
		[self addMorphBack: each]].
	self submorphs size = 1 ifTrue: [self addMorphBack: MWMeal emptyMeal]
]

{
	#category : #display,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 15:55'
}
MWCanteen >> buildForTime: aTime [

	self addMorph: self createNameMorph;
		addMealsForTime: aTime
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
	#category : #updating,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 15:27'
}
MWCanteen >> deleteMeals [

	self submorphs from: 2 to: self submorphs size do: [:each | each abandon]
]

{
	#category : #display,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 11:52'
}
MWCanteen >> getSpacerMorph [

	^ Morph new 
		color: Color transparent;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		width: self class spacerMorphWidth;
		yourself
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

{
	#category : #updating,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 15:27'
}
MWCanteen >> updateForTime: aTime [

	self deleteMeals;
		addMealsForTime: aTime
]

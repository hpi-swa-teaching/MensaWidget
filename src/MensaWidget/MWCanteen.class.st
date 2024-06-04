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
	#'squeak_changestamp' : 'Louis Christ 6/4/2024 18:42'
}
MWCanteen >> getCanteenMorph [

	| canteenMorph position mealMorph namemorph |
	
	canteenMorph := Morph new.
	canteenMorph color: Color tangerine;
		borderWidth: 1;
		borderColor: Color white.
	namemorph := TextMorph new.
	position := 5@5.
	namemorph contents: self name;
		position: position.
	canteenMorph addMorph: namemorph.
	position := 0 @ (5 +namemorph height) + position.
	self meals do: [ :each | 
		mealMorph := each getMealMorph.
		canteenMorph addMorph: mealMorph.
		mealMorph position: position.
		position := 0 @ (5 +mealMorph height) + position].
	canteenMorph extent: 410 @ position y.
	^canteenMorph
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

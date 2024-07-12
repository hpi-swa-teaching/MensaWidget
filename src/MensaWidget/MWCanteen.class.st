"
A MWCanteen is a object that stores the data of a canteen for a certain date with all available meals.

Instance Variables
	date:		<String>
	id:		<String>
	meals:		<String>
	name:		<OrderedCollection>
	nameMorph:	<StringMorph>
	currencyMorph:	<StringMorph>

date
	- the date the meals are available

id
	- the id correlating to id at the api endpoint

meals
	- array of all available meals as meal objects

name
	- name of the canteen
	
nameMorph
	- morphic representation for the name of the canteen
	
currencyMorph
	- morphic representation for the currency the prices will be displayed in

"
Class {
	#name : #MWCanteen,
	#superclass : #AlignmentMorph,
	#instVars : [
		'id',
		'name',
		'date',
		'meals',
		'nameMorph',
		'currencyMorph'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'LC 7/11/2024 21:06'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'LC 7/12/2024 13:14'
}
MWCanteen class >> cellGap [

	^ 5 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 12:00'
}
MWCanteen class >> currency [ 
	
	^ 'EUR'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 7/5/2024 10:03'
}
MWCanteen class >> emptyCanteen [

	^ self new name: 'Hier gibt es keine Mensen.';
		meals: OrderedCollection new
]

{
	#category : #constants,
	#'squeak_changestamp' : 'LC 7/12/2024 13:06'
}
MWCanteen class >> layoutProperties [

	^ TableLayoutProperties new 
		hResizing: #spaceFill; 
		vResizing: #shrinkWrap; 
		cellGap: self cellGap; 
		layoutInset: 2 px; 
		rubberBandCells: true
]

{
	#category : #'constructor ',
	#'squeak_changestamp' : 'Oscar 7/12/2024 10:01'
}
MWCanteen class >> newWithId: anId Name: aName Date: aDate Meals: aMealList [

	^ self newColumn
		id: anId;
		name: aName;
		date: aDate;
		meals: aMealList;
		build
	
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
	#'squeak_changestamp' : 'NK 7/9/2024 11:42'
}
MWCanteen >> addMealsForTime: aTime [

	self meals do: [:each | 
		(each category = aTime or: [each category isNil]) 
			ifTrue: [self addMorphBack: each]].
	self submorphs size = 1 
		ifTrue: [self addMorphBack: MWMeal emptyMeal]
]

{
	#category : #display,
	#'squeak_changestamp' : 'Oscar 7/12/2024 10:00'
}
MWCanteen >> build [

	self addMorph: self createNameMorph
]

{
	#category : #display,
	#'squeak_changestamp' : 'NK 7/9/2024 11:41'
}
MWCanteen >> createNameMorph [

	^ AlignmentMorph newRow
		color: Color transparent;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		addMorph: self getCurrencyMorph;
		addMorph: self getSpacerMorph;
		addMorph: self getNameMorph;
		addMorph: self getSpacerMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'NK 7/9/2024 11:33'
}
MWCanteen >> currencyMorph [

	^ currencyMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'NK 7/9/2024 11:33'
}
MWCanteen >> currencyMorph: anObject [

	currencyMorph := anObject
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
	#'squeak_changestamp' : 'LC 7/12/2024 13:07'
}
MWCanteen >> deleteMeals [

	self submorphs from: 2 to: self submorphs size 
		do: [:each | each abandon]
]

{
	#category : #display,
	#'squeak_changestamp' : 'NK 7/9/2024 11:37'
}
MWCanteen >> getCurrencyMorph [

	^ self currencyMorph: (StringMorph contents: self class currency);
		currencyMorph
]

{
	#category : #display,
	#'squeak_changestamp' : 'NK 7/9/2024 11:38'
}
MWCanteen >> getNameMorph [

	^ self nameMorph: (StringMorph contents: self name);
		nameMorph
]

{
	#category : #display,
	#'squeak_changestamp' : 'NK 7/9/2024 11:41'
}
MWCanteen >> getSpacerMorph [

	^ Morph new 
		color: Color transparent;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		width: self class spacerMorphWidth
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
	#'squeak_changestamp' : 'NK 7/9/2024 11:41'
}
MWCanteen >> initialize [
	
	super initialize.
	^ self color: MWConfiguration secondaryColor;
		layoutProperties: self class layoutProperties
    
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
	#category : #accessing,
	#'squeak_changestamp' : 'NK 7/9/2024 11:33'
}
MWCanteen >> nameMorph [

	^ nameMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'NK 7/9/2024 11:33'
}
MWCanteen >> nameMorph: anObject [

	nameMorph := anObject
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 15:27'
}
MWCanteen >> updateForTime: aTime [

	self deleteMeals;
		addMealsForTime: aTime
]

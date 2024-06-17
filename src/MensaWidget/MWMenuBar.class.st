"
A MWMenuBar is a Menubar for navigation though the days and opening settings and filters.

Instance Variables
	date:		<Date>
	dateDisplay:		<Morph>
	target:		<MWFrame>

date
	- a Date variable that stores the date for the meals that are shown

dateDisplay
	- a variable that refers to the Morph that displays the Date

target
	- the target on which the menubar actions will be called

"
Class {
	#name : #MWMenuBar,
	#superclass : #AlignmentMorph,
	#instVars : [
		'date',
		'dateDisplay',
		'target',
		'time',
		'timeToggle'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 15:59'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 18:09'
}
MWMenuBar class >> getArrowButton [

	^ PolygonMorph new
		setVertices: {0 @ 0. 0 @ 20. 20 @ 10};
		color: MWColorTheme secondaryColor;
		addFlexShellIfNecessary; 
		yourself
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Oscar 6/16/2024 23:48'
}
MWMenuBar >> createDateDisplay [
	
	self dateDisplay: 
		(TextMorph new 
			contents: self date asString;
			textStyle: TextStyle default;
			lock).	
	self addMorph: self dateDisplay
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 18:11'
}
MWMenuBar >> createLayout [
	
	self createSpacer;
		createNextButton;
		createDateDisplay;
		createPrevButton;
		createTimeToggle
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 16:06'
}
MWMenuBar >> createNextButton [

	self addMorph: 
		(self class getArrowButton
			on: #mouseDown send: #increaseDate: to: self)
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 16:13'
}
MWMenuBar >> createPrevButton [
	
	self addMorph: 
		(self class getArrowButton
			rotationDegrees: 180;
			on: #mouseDown send: #decreaseDate: to: self)
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 15:50'
}
MWMenuBar >> createSpacer [
	
	self addMorph: 
		(AlignmentMorph new 
			hResizing: #spaceFill; 
			vResizing: #spaceFill; 
			color: Color transparent)
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 18:24'
}
MWMenuBar >> createTimeToggle [
	
	self timeToggle: 
		(SugarRoundedField new 
		color: Color yellow;
		extent: 200@50;
		addMorphCentered: (StringMorph contents: 'Lunch');
		on: #mouseDown send: #updateTime to: self).	
	self addMorph: self timeToggle 
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 13:46'
}
MWMenuBar >> date [
	
	^ date
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 13:46'
}
MWMenuBar >> date: anObject [
	
	date := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 13:48'
}
MWMenuBar >> dateDisplay [

	^ dateDisplay
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 13:48'
}
MWMenuBar >> dateDisplay: anObject [

	dateDisplay := anObject
]

{
	#category : #dateManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 18:23'
}
MWMenuBar >> decreaseDate [

	self date: (self date addDays: -1);
		updateDate
]

{
	#category : #dateManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 16:22'
}
MWMenuBar >> decreaseDate: aEvent [
	
	aEvent handler color: MWColorTheme backgroundColor.
	World doOneCycle.
	self decreaseDate.
	aEvent handler color: MWColorTheme secondaryColor
]

{
	#category : #dateManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 18:23'
}
MWMenuBar >> increaseDate [

	self date: (self date addDays: 1);
		updateDate
]

{
	#category : #dateManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 16:22'
}
MWMenuBar >> increaseDate: aEvent [
	
	aEvent handler color: MWColorTheme backgroundColor.
	World doOneCycle.
	self increaseDate.
	aEvent handler color: MWColorTheme secondaryColor
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 18:10'
}
MWMenuBar >> initialize [
	
	super initialize.
	self date: Date today;
		time: 'lunch';
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		cellPositioning: #center;
		color: MWColorTheme primaryColor;
		cellGap: 30;
		createLayout

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 15:50'
}
MWMenuBar >> target [

	^ target
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 15:50'
}
MWMenuBar >> target: anObject [

	target := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 15:20'
}
MWMenuBar >> time [

	^ time
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 15:20'
}
MWMenuBar >> time: anObject [

	time := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 15:20'
}
MWMenuBar >> timeToggle [

	^ timeToggle
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 15:20'
}
MWMenuBar >> timeToggle: anObject [

	timeToggle := anObject
]

{
	#category : #timeManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 16:16'
}
MWMenuBar >> toggleTime [

	self time = 'lunch' ifTrue:
		[self time: 'dinner'] ifFalse:
		[self time: 'lunch']
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 18:23'
}
MWMenuBar >> update [

	self target ifNotNil: [self target displayDay: self date andTime: self time]
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 18:23'
}
MWMenuBar >> updateDate [

	self dateDisplay contents: self date asString.
	self target ifNotNil: [self target displayDay: self date andTime: self time]
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Louis Christ 6/17/2024 18:23'
}
MWMenuBar >> updateTime [
	
	self time = 'lunch' ifTrue: 
		[self time: 'dinner'] ifFalse: 
		[self time: 'lunch'].
	(self timeToggle submorphs at: 1) contents: self time capitalized.
	self target ifNotNil: [self target displayDay: self date andTime: self time]
]

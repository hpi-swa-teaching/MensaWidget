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
		'target'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 15:59'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 16:26'
}
MWMenuBar class >> getArrowButton [

	^ PolygonMorph new
		setVertices: { 0@0. 0@20. 20@10 };
		color: MWColorTheme secondaryColor;
		addFlexShellIfNecessary; 
		yourself
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 15:49'
}
MWMenuBar >> createDateDisplay [
	
	self dateDisplay: 
		(TextMorph new 
			contents: self date asString;
			readOnly: true).
	self addMorph: self dateDisplay
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 15:52'
}
MWMenuBar >> createLayout [
	
	self createSpacer;
		createNextButton;
		createDateDisplay;
		createPrevButton;
		createSpacer
	
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
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 15:50'
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
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 15:50'
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
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 15:52'
}
MWMenuBar >> initialize [
	
	super initialize.
	self date: Date today;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		cellPositioning: #center;
		color: Color paleGreen darker darker;
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
	#category : #dateManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 21:06'
}
MWMenuBar >> updateDate [

	self dateDisplay contents: self date asString.
	self target ifNotNil: [self target displayDay]
	
]

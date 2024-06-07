Class {
	#name : #MWMenuBar,
	#superclass : #AlignmentMorph,
	#instVars : [
		'date',
		'dateDisplay',
		'target'
	],
	#category : #MensaWidget
}

{
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 14:22'
}
MWMenuBar class >> getArrowButton [

	^ Morph new extent: 40@15;
			color: Color fern lighter
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 21:08'
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
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 14:09'
}
MWMenuBar >> createNextButton [

	self addMorph: 
			(self class getArrowButton
			on: #mouseDown send: #increaseDate to: self)
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 14:14'
}
MWMenuBar >> createPrevButton [
	
	self addMorph: 
			(self class getArrowButton
			on: #mouseDown send: #decreaseDate to: self)
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 14:29'
}
MWMenuBar >> createSpacer [
	
	self addMorph: (
			AlignmentMorph new hResizing: #spaceFill; vResizing: #spaceFill; color: Color transparent)
	
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
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 13:59'
}
MWMenuBar >> decreaseDate [

	self date: (self date addDays: -1).
	self updateDate
]

{
	#category : #dateManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 13:59'
}
MWMenuBar >> increaseDate [

	self date: (self date addDays: 1).
	self updateDate
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 21:07'
}
MWMenuBar >> initialize [
	
	super initialize.
	self date: Date today;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		cellPositioning: #center;
		color: Color paleGreen darker darker;
		cellGap: 30;
		createSpacer;
		createNextButton;
		createDateDisplay;
		createPrevButton;
		createSpacer

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 21:02'
}
MWMenuBar >> target [
	^ target
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 21:02'
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

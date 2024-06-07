Class {
	#name : #MWDatePicker,
	#superclass : #AlignmentMorph,
	#instVars : [
		'date',
		'dateDisplay'
	],
	#category : #MensaWidget
}

{
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 14:22'
}
MWDatePicker class >> getArrowButton [

	^ Morph new extent: 40@15;
			color: Color fern lighter
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 14:00'
}
MWDatePicker >> createDateDisplay [
	
	self dateDisplay: 
		(TextMorph new 
		contents: self date yyyymmdd;
		readOnly: true).
	self addMorph: self dateDisplay
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 14:09'
}
MWDatePicker >> createNextButton [

	self addMorph: 
			(self class getArrowButton
			on: #mouseDown send: #increaseDate to: self)
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 14:14'
}
MWDatePicker >> createPrevButton [
	
	self addMorph: 
			(self class getArrowButton
			on: #mouseDown send: #decreaseDate to: self)
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 14:29'
}
MWDatePicker >> createSpacer [
	
	self addMorph: (
			AlignmentMorph new hResizing: #spaceFill; vResizing: #spaceFill; color: Color transparent)
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 13:46'
}
MWDatePicker >> date [
	
	^ date
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 13:46'
}
MWDatePicker >> date: anObject [
	
	date := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 13:48'
}
MWDatePicker >> dateDisplay [

	^ dateDisplay
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 13:48'
}
MWDatePicker >> dateDisplay: anObject [

	dateDisplay := anObject
]

{
	#category : #dateManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 13:59'
}
MWDatePicker >> decreaseDate [

	self date: (self date addDays: -1).
	self updateDate
]

{
	#category : #dateManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 13:59'
}
MWDatePicker >> increaseDate [

	self date: (self date addDays: 1).
	self updateDate
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 14:29'
}
MWDatePicker >> initialize [
	
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
	#category : #dateManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 13:58'
}
MWDatePicker >> updateDate [

	self dateDisplay contents: self date yyyymmdd
]

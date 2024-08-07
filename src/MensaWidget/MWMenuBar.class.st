"
A MWMenuBar is a Menubar for navigation though the days and opening settings and filters.

Instance Variables
	date:		<Date>
	dateDisplay:		<StringMorph>
	target:		<MWFrame>
	time:		<String>
	timeToggle:		<AlignmentMorph>
	settings: 		<PopUpChoiceMorph>

date
	- a Date variable that stores the date for the meals that are shown

dateDisplay
	- a variable that refers to the Morph that displays the Date

target
	- the target on which the menubar actions will be called
	
time
	- a String variable that stores the time for the meals that are shown

timeToggle
	- a variable that refers to the Morph that displays the Time and acts as a button to toggle it
	
settings
	- PopUp Morph that allows the user to choose the price category

"
Class {
	#name : #MWMenuBar,
	#superclass : #AlignmentMorph,
	#instVars : [
		'date',
		'dateDisplay',
		'target',
		'time',
		'timeToggle',
		'settings'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'LC 7/12/2024 14:04'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'LC 7/12/2024 13:43'
}
MWMenuBar class >> getArrowVertices [

	^ {0 px @ 0 px. 0 px @ 14 px. 14 px @ 7 px}
]

{
	#category : #constants,
	#'squeak_changestamp' : 'LC 7/2/2024 10:28'
}
MWMenuBar class >> getTimeToggle [

	^ AlignmentMorph new 
		addMorph: (StringMorph contents: 'Lunch'); 
		vResizing: #shrinkWrap; 
		hResizing: #shrinkWrap;
		color: MWConfiguration secondaryColor
]

{
	#category : #creation,
	#'squeak_changestamp' : 'LC 7/12/2024 13:43'
}
MWMenuBar >> createDateDisplay [
	
	self dateDisplay: (StringMorph new 
		contents: self date asString).	
	self addMorph: self dateDisplay
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'LC 7/3/2024 16:04'
}
MWMenuBar >> createLayout [
	
	self createSpacer;
		createNextButton;
		createDateDisplay;
		createPrevButton;
		createSpacer;
		createTimeToggle;
		createSettings
]

{
	#category : #creation,
	#'squeak_changestamp' : 'LC 7/12/2024 13:43'
}
MWMenuBar >> createNextButton [

	self addMorph: 
		(self getArrowButton 
			on: #mouseDown 
			send: #increaseDate: 
			to: self)
]

{
	#category : #creation,
	#'squeak_changestamp' : 'LC 7/12/2024 13:44'
}
MWMenuBar >> createPrevButton [
	
	self addMorph: 
		(self getArrowButton rotationDegrees: 180;
			on: #mouseDown 
			send: #decreaseDate: 
			to: self)
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'LC 7/5/2024 11:38'
}
MWMenuBar >> createSettings [

	self settings: MWConfiguration getPopUp;
		addMorphBack: self settings
]

{
	#category : #creation,
	#'squeak_changestamp' : 'LC 7/8/2024 21:35'
}
MWMenuBar >> createSpacer [
	
	self addMorph: self getSpacer
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'LC 7/8/2024 21:38'
}
MWMenuBar >> createTimeToggle [

	self timeToggle: self getTimeToggle;
		addMorph: self timeToggle
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
	#'squeak_changestamp' : 'LC 7/2/2024 10:28'
}
MWMenuBar >> decreaseDate: aEvent [
	
	aEvent handler color: MWConfiguration defaultColor.
	World doOneCycle.
	self decreaseDate.
	aEvent handler color: MWConfiguration secondaryColor
]

{
	#category : #morphicRepresentation,
	#'squeak_changestamp' : 'LC 7/12/2024 11:35'
}
MWMenuBar >> getArrowButton [

	^ PolygonMorph new
		setVertices: self class getArrowVertices;
		color: MWConfiguration secondaryColor;
		addFlexShellIfNecessary
]

{
	#category : #morphicRepresentation,
	#'squeak_changestamp' : 'LC 7/12/2024 11:38'
}
MWMenuBar >> getSpacer [

	^ AlignmentMorph new 
		hResizing: #spaceFill; 
		vResizing: #spaceFill; 
		color: Color transparent
]

{
	#category : #morphicRepresentation,
	#'squeak_changestamp' : 'LC 7/12/2024 13:46'
}
MWMenuBar >> getTimeToggle [

	^ AlignmentMorph new 
		addMorph: (StringMorph contents: 
			MWMealCleaner lunchCategory capitalized); 
		vResizing: #shrinkWrap; 
		hResizing: #shrinkWrap;
		color: MWConfiguration secondaryColor;
		on: #mouseDown send: #toggleTime to: self
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
	#'squeak_changestamp' : 'LC 7/2/2024 10:28'
}
MWMenuBar >> increaseDate: aEvent [
	
	aEvent handler color: MWConfiguration defaultColor.
	World doOneCycle.
	self increaseDate.
	aEvent handler color: MWConfiguration secondaryColor
]

{
	#category : #creation,
	#'squeak_changestamp' : 'LC 7/12/2024 13:45'
}
MWMenuBar >> initialize [
	
	super initialize.
	self date: Date today;
		time: 'lunch';
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		cellPositioning: #center;
		color: MWConfiguration primaryColor;
		cellInset: 4 px;
		createLayout

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/5/2024 11:37'
}
MWMenuBar >> settings [

	^ settings
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/5/2024 11:37'
}
MWMenuBar >> settings: anObject [

	settings := anObject
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
	#'squeak_changestamp' : 'LC 7/8/2024 21:43'
}
MWMenuBar >> toggleTime [

	self time = MWMealCleaner lunchCategory
		ifTrue: [self time: MWMealCleaner dinnerCategory] 
		ifFalse: [self time: MWMealCleaner lunchCategory].
	self updateTime
]

{
	#category : #updating,
	#'squeak_changestamp' : 'LC 7/12/2024 13:47'
}
MWMenuBar >> updateCategory [
	
	self settings contents: '';
		contents: MWMeal priceGroup
]

{
	#category : #updating,
	#'squeak_changestamp' : 'LC 7/8/2024 21:07'
}
MWMenuBar >> updateDate [

	self dateDisplay contents: self date asString.
	self target ifNotNil: [self target updateDate]
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'LC 7/8/2024 21:07'
}
MWMenuBar >> updateTime [
	
	self timeToggle submorphs first contents: self time capitalized.
	self target ifNotNil: [self target updateTime]
]

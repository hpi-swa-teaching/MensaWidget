"
A MWFrame is the base block for the useer interface of the widget.

Instance Variables
	window:		<SystemWindow>
	contentMorph:		<AlignmentMorph>
			
window
	- The window in which the content morphs is opened
contentMorph
	- Morph that has all meals als submorphs
"
Class {
	#name : #MWFrame,
	#superclass : #AlignmentMorph,
	#instVars : [
		'contentMorph',
		'menuBar',
		'scroller'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Oscar 6/17/2024 00:04'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'tmc 6/6/2024 21:40'
}
MWFrame class >> cellSpacing [

	^ 10
]

{
	#category : #constants,
	#'squeak_changestamp' : 'LC 7/8/2024 20:45'
}
MWFrame class >> contentExtent [

	^ 350 @ 550 
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LC 7/8/2024 00:20'
}
MWFrame class >> newForTests [
	
	| oldStatus frame |
	
	oldStatus := MWConfiguration isInitial.
	MWConfiguration isInitial: false.
	frame := MWFrame new.
	MWConfiguration isInitial: oldStatus.
	^ frame
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'Max 7/5/2024 14:56'
}
MWFrame class >> newWithDefaultLocation [

	MWDataGettingWrapper switchToDefaultLocation.
	^ MWFrame new
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'Max 7/5/2024 14:56'
}
MWFrame class >> newWithLocationSwitch [

	MWDataGettingWrapper switchLocation.
	^ MWFrame new
]

{
	#category : #registration,
	#'squeak_changestamp' : 'LC 7/8/2024 20:45'
}
MWFrame class >> register [ 
	
	TheWorldMenu registerOpenCommand: {'Mensa Widget'. {MWFrame. #new}}
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 19:24'
}
MWFrame class >> scrollBarThickness [

	^ 14 * RealEstateAgent scaleFactor 
]

{
	#category : #updating,
	#'squeak_changestamp' : 'LC 7/5/2024 11:41'
}
MWFrame class >> updateCategory [

	self allInstances do: [:each | each updateCategory]
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:45'
}
MWFrame class >> windowName [

	^ 'Mensa Widget'
]

{
	#category : #dayManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 15:34'
}
MWFrame >> abandonContent [
	
	self contentMorph submorphs do: [:each | each abandon]

	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'LC 7/8/2024 21:56'
}
MWFrame >> addContentMorph [

	self contentMorph: (AlignmentMorph newColumn 
		cellInset: self class cellSpacing;
		extent: self class contentExtent;
		vResizing: #shrinkWrap;
		yourself).
	self scroller addMorph: self contentMorph
]

{
	#category : #dayManipulation,
	#'squeak_changestamp' : 'LC 7/8/2024 20:50'
}
MWFrame >> addMeals [

	| morph |
	
	(MWDataGettingWrapper getMealsOnDate: self getDate) do: 
		[:each | morph := each buildForTime: self getTime.
		self contentMorph addMorph: morph.
		morph vResizing: #shrinkWrap]

	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:53'
}
MWFrame >> addMenuBar [
	
	self menuBar: (MWMenuBar new target: self);
		addMorph: self menuBar
]

{
	#category : #creation,
	#'squeak_changestamp' : 'LC 7/2/2024 10:27'
}
MWFrame >> addScrollPane [

	self scroller: 
		(ScrollPane new 
			scrollBarThickness: self class scrollBarThickness;
			color: MWConfiguration defaultColor;
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			scroller);
		addMorph: self scroller owner.
	self scroller layoutPolicy: TableLayout new.
	self scroller owner submorphs last color: MWConfiguration backgroundColor
]

{
	#category : #creation,
	#'squeak_changestamp' : 'LC 7/3/2024 16:23'
}
MWFrame >> buildLayout [

	self hResizing: #spaceFill;
		vResizing: #spaceFill;
		extent: self class contentExtent;
		color: MWConfiguration defaultColor;
		addScrollPane;
		addContentMorph;
		addMenuBar
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 14:52'
}
MWFrame >> contentMorph [

	^ contentMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 14:52'
}
MWFrame >> contentMorph: anObject [

	contentMorph := anObject
]

{
	#category : #values,
	#'squeak_changestamp' : 'LC 7/8/2024 20:53'
}
MWFrame >> getDate [

	^ self menuBar date yyyymmdd
]

{
	#category : #values,
	#'squeak_changestamp' : 'LC 7/8/2024 20:53'
}
MWFrame >> getTime [

	^ self menuBar time
]

{
	#category : #creation,
	#'squeak_changestamp' : 'LC 7/8/2024 21:00'
}
MWFrame >> initialize [
	
	MWConfiguration isInitial
		ifTrue: [self setUpScreen]
		ifFalse: [self initializeFrame]
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'LC 7/8/2024 21:08'
}
MWFrame >> initializeFrame [
	
	super initialize.
	self listDirection: #topToBottom;
		buildLayout;
		addMeals;
		openInWindowLabeled: self class windowName
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:47'
}
MWFrame >> menuBar [

	^ menuBar
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:47'
}
MWFrame >> menuBar: anObject [

	menuBar := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:49'
}
MWFrame >> scroller [
	
	^ scroller
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:49'
}
MWFrame >> scroller: anObject [

	scroller := anObject
]

{
	#category : #creation,
	#'squeak_changestamp' : 'LC 7/8/2024 21:01'
}
MWFrame >> setUpScreen [
	
	(MWConfiguration getPopUp
		openInWindowLabeled: 'Mensa Settings')
		width: 350;
		color: MWConfiguration defaultColor
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'LC 7/8/2024 20:50'
}
MWFrame >> updateCategory [

	self menuBar ifNotNil: [self menuBar updateCategory]
]

{
	#category : #dayManipulation,
	#'squeak_changestamp' : 'LC 7/8/2024 21:07'
}
MWFrame >> updateDate [
 	
	self abandonContent;
		addMeals
]

{
	#category : #dayManipulation,
	#'squeak_changestamp' : 'LC 7/8/2024 20:51'
}
MWFrame >> updateTime [
	
	self contentMorph submorphs do: [:each | each updateForTime: self getTime]

	
]

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
	#'squeak_changestamp' : 'Oscar 6/14/2024 12:54'
}
MWFrame class >> contentExtent [

	^ 350 px @ 550 px 
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 6/17/2024 20:42'
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
	#'squeak_changestamp' : 'Louis Christ 6/19/2024 00:59'
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
	#'squeak_changestamp' : 'Louis Christ 6/19/2024 01:00'
}
MWFrame >> addMealsOn: aDate forTime: aTime [

	| morph |
	
	(MWDataGettingWrapper getMealsOnDate: aDate yyyymmdd) do: 
		[:each | morph := each buildForTime: aTime.
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
	#category : #creation,
	#'squeak_changestamp' : 'LC 7/3/2024 22:52'
}
MWFrame >> initialize [
	
	super initialize.
	MWConfiguration isInitial
		ifTrue: [(MWConfiguration getPopUp
			openInWindowLabeled: 'Mensa Settings') 
			width: 350;
			color: MWConfiguration defaultColor]
		ifFalse: [self listDirection: #topToBottom;
			buildLayout;
			addMealsOn: Date today forTime: MWMealCleaner lunchCategory;
			openInWindowLabeled: self class windowName]
	
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
	#category : #dayManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 15:39'
}
MWFrame >> updateContent: aTime [
	
	self contentMorph submorphs do: [:each | each updateForTime: aTime]

	
]

{
	#category : #dayManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/19/2024 01:00'
}
MWFrame >> updateDay: aDate withTime: aTime [
 	
	self abandonContent;
		addMealsOn: aDate forTime: aTime
]

{
	#category : #dayManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 15:31'
}
MWFrame >> updateTime: aTime [

	self updateContent: aTime
]

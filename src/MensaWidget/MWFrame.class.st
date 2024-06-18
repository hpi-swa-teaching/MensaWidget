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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Oscar 6/16/2024 20:44'
}
MWFrame class >> contentPosition [

	^ 5 @ 30
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Oscar 6/5/2024 01:01'
}
MWFrame class >> scrollBarThickness [

	^ 20
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
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:54'
}
MWFrame >> addContentMorph [

	self contentMorph: (AlignmentMorph newColumn 
		 cellInset: self class cellSpacing;
		 extent: self class contentExtent;
		yourself).
	self scroller addMorph: self contentMorph
]

{
	#category : #dayManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 15:54'
}
MWFrame >> addMeals: aDate [

	| morph |
	
	(MWDataGettingWrapper getMealsOnDate: aDate yyyymmdd) do: 
		[:each | morph := (each buildForTime: MWMealCleaner lunchCategory).
		self contentMorph addMorph: morph.
		morph vResizing: #shrinkWrap].

	
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
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:57'
}
MWFrame >> addScrollPane [

	self scroller: 
		(ScrollPane new 
			scrollBarThickness: self class scrollBarThickness;
			color: MWColorTheme backgroundColor;
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			scroller);
		addMorph: self scroller owner.
	self scroller layoutPolicy: TableLayout new
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 15:05'
}
MWFrame >> buildLayout [

	self hResizing: #spaceFill;
		vResizing: #spaceFill;
		extent: self class contentExtent;
		color: MWColorTheme backgroundColor;
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
	#category : #dayManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 15:13'
}
MWFrame >> displayDay: aDate andTime: aTime [

	self abandonContent;
		addMeals: aDate forTime: aTime

	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 15:34'
}
MWFrame >> initialize [

	super initialize.
	self listDirection: #topToBottom;
		buildLayout;
		addMeals: Date today;
		openInWindowLabeled: self class windowName.
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
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 15:55'
}
MWFrame >> updateDay: aDate [
	
	self abandonContent;
		addMeals: aDate
]

{
	#category : #dayManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 15:31'
}
MWFrame >> updateTime: aTime [

	self updateContent: aTime
]

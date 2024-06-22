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
	#superclass : #Object,
	#instVars : [
		'window',
		'contentMorph'
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
	#category : #dayManipulation,
	#'squeak_changestamp' : 'Oscar 6/16/2024 23:56'
}
MWFrame >> addMeals: aDate [

	| contentMorph |
	
	contentMorph := self buildContentMorph.
	(MWDataGettingWrapper getMealsOnDate: aDate yyyymmdd) do: 
		[:each | contentMorph addMorph: each getCanteenMorph].
	self contentMorph scroller 
		layoutPolicy: TableLayout new;
		addMorph: contentMorph

	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Oscar 6/16/2024 23:52'
}
MWFrame >> buildContentMorph [

	^ AlignmentMorph newColumn 
		 cellInset: self class cellSpacing;
		 extent: self class contentExtent;
		 hResizing: #spaceFill;
		 vResizing: #spaceFill
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Oscar 6/16/2024 23:51'
}
MWFrame >> buildLayout [

	^ AlignmentMorph newColumn
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		extent: self class contentExtent;
		color: MWColorTheme backgroundColor;
		addMorph: self buildScrollPane;
		addMorph: self buildMenuBar;
		yourself
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/10/2024 17:59'
}
MWFrame >> buildMenuBar [
	
	^ MWMenuBar new target: self
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Oscar 6/16/2024 23:58'
}
MWFrame >> buildScrollPane [

	^ self contentMorph: 
		(ScrollPane new 
			scrollBarThickness: self class scrollBarThickness;
			color: MWColorTheme backgroundColor;
			extent: self class contentExtent;
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			yourself);
		contentMorph
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
	#'squeak_changestamp' : 'Louis Christ 6/11/2024 11:54'
}
MWFrame >> displayDay: aDate [

	self removeMeals;
		addMeals: aDate

	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Oscar 6/17/2024 00:00'
}
MWFrame >> initialize [

	super initialize.
	self window: (self buildLayout openInWindowLabeled: 'Mensa Widget').
	self addMeals: Date today
]

{
	#category : #dayManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/10/2024 17:57'
}
MWFrame >> removeMeals [

	self contentMorph scroller submorphsDo: [:each | each abandon]
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 6/15/2024 14:01'
}
MWFrame >> window [

	^ window
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 6/15/2024 14:01'
}
MWFrame >> window: anObject [

	window := anObject
]

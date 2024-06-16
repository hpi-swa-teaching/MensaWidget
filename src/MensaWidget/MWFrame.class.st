"
A MWFrame is the base block for the useer interface of the widget.

Instance Variables
	window:		<SystemWindow>
			
window
	- The window in which the content morphs is opened
"
Class {
	#name : #MWFrame,
	#superclass : #Object,
	#instVars : [
		'window'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Oscar 6/16/2024 19:59'
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
	#'squeak_changestamp' : 'tmc 6/6/2024 21:03'
}
MWFrame class >> contentMorphColor [

	^ Color darkGray
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Oscar 6/5/2024 01:01'
}
MWFrame class >> scrollBarThickness [

	^ 20
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Oscar 6/15/2024 19:30'
}
MWFrame >> buildAlignmentMorph [

	^ AlignmentMorph newColumn
			cellInset: self class cellSpacing;
			extent: self class contentExtent;
			hResizing: #spaceFill;
			vResizing: #spaceFill.
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Oscar 6/14/2024 14:15'
}
MWFrame >> buildFrameContent [

	| contentMorph |
	
	contentMorph := ScrollPane new.
	self fillContentMorph: contentMorph.
	contentMorph scrollBarThickness: self class scrollBarThickness;
		color: self class contentMorphColor;
		extent: self class contentExtent.
	^ contentMorph
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Oscar 6/15/2024 19:31'
}
MWFrame >> fillContentMorph: aContentMorph [
	
	| contentMorph |
	
	contentMorph := self buildAlignmentMorph.
	MWDataGettingWrapper getTodaysMeals do: [:each | 
		contentMorph addMorph: each getCanteenMorph].
	aContentMorph scroller 
		layoutPolicy: TableLayout new;
		addMorph: contentMorph
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Oscar 6/15/2024 19:27'
}
MWFrame >> initialize [

	super initialize.
	self window: (self buildFrameContent openInWindowLabeled: 'Mensa Widget')
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

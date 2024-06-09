"
A MWFrame is the base block for the useer interface of the widget.

Instance Variables

"
Class {
	#name : #MWFrame,
	#superclass : #PluggableSystemWindow,
	#instVars : [
		'contentMorph',
		'dayPicker'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 19:43'
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
	#'squeak_changestamp' : 'tmc 6/6/2024 21:36'
}
MWFrame class >> contentExtent [

	^ 450 @ 550
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
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 21:05'
}
MWFrame class >> contentPosition [

	^ 5 @ 30
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 21:04'
}
MWFrame class >> frameSize [

	^ 460 @ 610
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
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 20:55'
}
MWFrame >> buildContentMorph [

	^ AlignmentMorph newColumn
		cellInset: self class cellSpacing;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 15:55'
}
MWFrame >> buildLayout [

	^ AlignmentMorph newColumn
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		position: self class contentPosition;
		extent: self class contentExtent;
		color: self class contentMorphColor;
		addMorph: self buildScrollPane;
		addMorph: self buildMenuBar;
		yourself
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 15:51'
}
MWFrame >> buildMenuBar [
	
	^ self dayPicker: (MWMenuBar new target: self);
		dayPicker
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 15:56'
}
MWFrame >> buildScrollPane [

	^ self contentMorph: 
		(ScrollPane new 
			scrollBarThickness: self class scrollBarThickness;
			color: self class contentMorphColor;
			extent: self class contentExtent;
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
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 15:54'
}
MWFrame >> dayPicker [

	^ dayPicker
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 15:54'
}
MWFrame >> dayPicker: anObject [

	dayPicker := anObject
]

{
	#category : #dayManipulation,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 15:53'
}
MWFrame >> displayDay [

	| contentMorph |
	
	"delete old content"
	self contentMorph scroller submorphsDo: [:each | each abandon].
	"create new content"
	contentMorph := self buildContentMorph.
	(MWDataGettingWrapper getMealsOnDate: self dayPicker date yyyymmdd) do: 
		[:each | contentMorph addMorph: each getCanteenMorph].
	self contentMorph scroller addMorph: contentMorph.

	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 16:02'
}
MWFrame >> initialize [
	
	super initialize.
	self setLabel:'Mensa Widget';
		addPaneMorph: self buildLayout;
		showMealsFor: Date today yyyymmdd;
		openInWorld;
		extent: self class frameSize;
		removeMaximize;
		removeScalability
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 11:00'
}
MWFrame >> removeMaximize [
	
	self submorphsDo: [:each | 
	each class = AlignmentMorph ifTrue: 
		[each submorphsDo: [:each2 |
			(each2 class = SystemWindowButton and:
				[each2 actionSelector = #expandBoxHit]) 
					ifTrue: [each2 abandon]]]]
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 11:07'
}
MWFrame >> removeScalability [

	self submorphsDo: [:each |
		(each class superclass = BorderGripMorph or: 
			[each class superclass = CornerGripMorph]) 
				ifTrue: [each abandon]]
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 20:55'
}
MWFrame >> showMealsFor: aDate [
	
	| contentMorph |
	
	contentMorph := self buildContentMorph.
	(MWDataGettingWrapper getMealsOnDate: aDate) do: 
		[:each | contentMorph addMorph: each getCanteenMorph].
	self contentMorph scroller addMorph: contentMorph.
]

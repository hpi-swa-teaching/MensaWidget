"
A MWFrame is the base block for the useer interface of the widget.

Instance Variables

"
Class {
	#name : #MWFrame,
	#superclass : #PluggableSystemWindow,
	#instVars : [
		'contentMorph',
		'alignmentMorph'
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
	#'squeak_changestamp' : 'tmc 6/6/2024 21:50'
}
MWFrame class >> contentPosition [

	^ 5 @ 40
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 6/6/2024 19:50'
}
MWFrame class >> frameSize [

	^ 460 @ 595
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Oscar 6/5/2024 01:01'
}
MWFrame class >> scrollBarThickness [

	^ 20
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 15:03'
}
MWFrame >> alignmentMorph [
	
	^ alignmentMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 15:03'
}
MWFrame >> alignmentMorph: anObject [
	
	alignmentMorph := anObject
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 15:05'
}
MWFrame >> buildFrameContent [

	self contentMorph: ScrollPane new.
	self fillContentMorph: self contentMorph forDay: Date today yyyymmdd.
	self contentMorph scrollBarThickness: self class scrollBarThickness;
		color: self class contentMorphColor;
		position: self class contentPosition;
		extent: self class contentExtent.
	self addPaneMorph: self contentMorph
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
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 14:38'
}
MWFrame >> fillContentMorph: aContentMorph [
	
	| contentMorph |
	
	contentMorph := AlignmentMorph newColumn
		cellInset: self class cellSpacing;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.
	self showMealsFor: Date today yyyymmdd On: contentMorph.
	contentMorph addMorph: MWDatePicker new.
	aContentMorph scroller addMorph: contentMorph
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 15:13'
}
MWFrame >> fillContentMorph: aContentMorph forDay: aDate [
	
	self alignmentMorph: (AlignmentMorph newColumn
		cellInset: self class cellSpacing;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap).
	self showMealsFor: aDate On: self alignmentMorph.
	aContentMorph scroller addMorph: self alignmentMorph
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 10:59'
}
MWFrame >> initialize [
	
	super initialize.
	self setLabel:'Mensa Widget';
		buildFrameContent;
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
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 15:14'
}
MWFrame >> showMealsFor: aDate On: aMorph [
	
	aMorph submorphsDo: [:each | each abandon].
	(MWDataGettingWrapper getMealsOnDate: aDate) do: [:each | 
		aMorph addMorph: each getCanteenMorph].
	self alignmentMorph addMorph: (MWDatePicker new date: aDate) updateDate
]

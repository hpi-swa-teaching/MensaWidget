"
A MWFrame is the base block for the useer interface of the widget.

Instance Variables

"
Class {
	#name : #MWFrame,
	#superclass : #PluggableSystemWindow,
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
	#'squeak_changestamp' : 'Oscar 6/10/2024 02:06'
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
	#'squeak_changestamp' : 'Oscar 6/10/2024 02:00'
}
MWFrame class >> contentPosition [

	^ 5 @ (25 * RealEstateAgent scaleFactor)
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Oscar 6/10/2024 02:10'
}
MWFrame class >> frameSize [

	^ 460 @ (555 +( 25 * RealEstateAgent scaleFactor))
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
	#'squeak_changestamp' : 'tmc 6/6/2024 21:37'
}
MWFrame >> buildFrameContent [

	| contentMorph |
	
	contentMorph := ScrollPane new.
	self fillContentMorph: contentMorph.
	contentMorph scrollBarThickness: self class scrollBarThickness;
		color: self class contentMorphColor;
		position: self class contentPosition;
		extent: self class contentExtent.
	self addPaneMorph: contentMorph
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Oscar 6/8/2024 18:45'
}
MWFrame >> fillContentMorph: aContentMorph [
	
	| contentMorph |
	
	contentMorph := AlignmentMorph newColumn
		cellInset: self class cellSpacing;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.
	(MWDataGettingWrapper getMealsOnDate: '2024-06-07') do: [:each | 
		contentMorph addMorph: each getCanteenMorph].
	aContentMorph scroller addMorph: contentMorph
	
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

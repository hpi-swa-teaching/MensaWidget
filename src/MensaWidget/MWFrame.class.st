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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'tmc 6/6/2024 21:40'
}
MWFrame class >> cellSpacing [

	^ 10
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'tmc 6/6/2024 21:36'
}
MWFrame class >> contentExtent [

	^ 450 @ 550
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'tmc 6/6/2024 21:03'
}
MWFrame class >> contentMorphColor [

	^ Color darkGray
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Oscar 6/5/2024 00:54'
}
MWFrame class >> contentMorphInnerBorder [

	^ 5
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'tmc 6/6/2024 21:50'
}
MWFrame class >> contentPosition [

	^ 5 @ 40
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Louis Christ 6/6/2024 19:50'
}
MWFrame class >> frameSize [

	^ 460 @ 595
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Oscar 6/5/2024 01:01'
}
MWFrame class >> scrollBarThickness [

	^ 20
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Oscar 6/5/2024 00:57'
}
MWFrame class >> spacingBetweenCanteenMorphs [

	^ 5
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Oscar 6/5/2024 01:13'
}
MWFrame class >> windowHeaderSize [

	^ 40 
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
	#'squeak_changestamp' : 'tmc 6/6/2024 21:42'
}
MWFrame >> fillContentMorph: aContentMorph [
	
	| contentMorph |
	
	contentMorph := AlignmentMorph newColumn.
	contentMorph cellInset: self class cellSpacing;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.
	MWDataGettingWrapper getTodaysMeals do: [ :each | 
		contentMorph addMorph: each getCanteenMorph].
	aContentMorph scroller addMorph: contentMorph
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'tmc 6/6/2024 21:00'
}
MWFrame >> initialize [
	
	super initialize.
	self setLabel:'Mensa Widget';
		buildFrameContent;
		openInWorld;
		extent: self class frameSize.
]

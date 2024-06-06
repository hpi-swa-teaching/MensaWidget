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
	#'squeak_changestamp' : 'Oscar 6/5/2024 00:55'
}
MWFrame class >> contentMorphColor [

	^ Color paleTan darker
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
	#'squeak_changestamp' : 'Louis Christ 6/6/2024 19:48'
}
MWFrame >> buildFrameContent [

	| contentMorph |
	
	contentMorph := ScrollPane new.
	self fillContentMorph: contentMorph.
	contentMorph scrollBarThickness: self class scrollBarThickness;
		color: self class contentMorphColor;
		position: self class contentMorphInnerBorder @ self class windowHeaderSize;
		extent: 450@550.
	self addMorph: contentMorph.
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/6/2024 19:45'
}
MWFrame >> fillContentMorph: aContentMorph [
	
	| alignmentMorph |
	
	alignmentMorph := AlignmentMorph newColumn.
	alignmentMorph cellInset: 10;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.
	
	MWDataGettingWrapper getTodaysMeals do: [ :each | alignmentMorph addMorph: each getCanteenMorph.].
	aContentMorph scroller addMorph: alignmentMorph.
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Oscar 6/5/2024 12:49'
}
MWFrame >> initialize [
	
	super initialize.
	self setLabel:'Mensa Widget';
		buildFrameContent;
		openInWorld;
		extent: self class frameSize.
]

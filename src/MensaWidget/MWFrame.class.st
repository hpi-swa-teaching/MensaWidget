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
	#'squeak_changestamp' : 'Oscar 6/5/2024 01:14'
}
MWFrame class >> frameSize [

	^ 450 @ 595
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
	#'squeak_changestamp' : 'Oscar 6/5/2024 12:24'
}
MWFrame >> buildFrameContent [

	| contentMorph |
	
	contentMorph := ScrollPane new.
	self fillContentMorph: contentMorph.
	contentMorph scrollBarThickness: self class scrollBarThickness;
		extent: self calculateContentMorphExtend;
		color: self class contentMorphColor;
		position: self class contentMorphInnerBorder @ self class windowHeaderSize.
	self addMorph: contentMorph.
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Oscar 6/5/2024 12:47'
}
MWFrame >> calculateContentMorphExtend [

	^ (self class frameSize x - (2 * self class contentMorphInnerBorder)) @ (self class frameSize y - self class contentMorphInnerBorder - self class windowHeaderSize)
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Oscar 6/5/2024 12:46'
}
MWFrame >> fillContentMorph: aContentMorph [
	
	| canteenMorph position |
	
	position := self class contentMorphInnerBorder.
	
	MWDataGettingWrapper getTodaysMeals do: [ :each | 
		canteenMorph := each getCanteenMorph
			position: position.
		aContentMorph scroller addMorph: canteenMorph.
		position := 0 @ (self class spacingBetweenCanteenMorphs + canteenMorph height) + position].
	
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

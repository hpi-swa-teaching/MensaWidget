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
	#'squeak_changestamp' : 'Oscar 6/5/2024 01:13'
}
MWFrame >> addAllCanteens [

	| contentMorph position canteenMorph extent |
	
	contentMorph := ScrollPane new.
	contentMorph color: self class contentMorphColor.
	position := self class contentMorphInnerBorder.
	MWDataGettingWrapper getTodaysMeals do: [ :each | 
		canteenMorph := each getCanteenMorph.
		contentMorph scroller addMorph: canteenMorph.
		canteenMorph position: position.
		position := 0 @ (self class spacingBetweenCanteenMorphs + canteenMorph height) + position].
	extent := (self class frameSize x -  (2 * self class contentMorphInnerBorder)) @ (self class frameSize y -   self class contentMorphInnerBorder -  self class windowHeaderSize ).
	contentMorph scrollBarThickness: self class scrollBarThickness;
		extent: extent;
		position: self class contentMorphInnerBorder @ self class windowHeaderSize.
	self addMorph: contentMorph.
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:43'
}
MWFrame >> addText [

	| textMorph |
	
	textMorph := TextMorph new.
	textMorph contents: 'Are you a hungry?';
		position:  135@100.
	self addPaneMorph: textMorph.
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/4/2024 19:10'
}
MWFrame >> createFrame [
		
	self setLabel:'Mensa Widget'.	
	
	
	

	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Oscar 6/5/2024 01:00'
}
MWFrame >> initialize [
	
	super initialize.
	self createFrame;
		addAllCanteens;
		openInWorld;
		extent: self class frameSize.
]

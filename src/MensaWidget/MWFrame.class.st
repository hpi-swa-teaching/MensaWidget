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
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 17:00'
}
MWFrame >> createFrame [
		
	self setLabel:'Mensa Widget';
		openInWorld;
		extent: 400@600.	
	
	
	

	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 17:00'
}
MWFrame >> initialize [
	
	super initialize.
	self createFrame;
		addText.
]

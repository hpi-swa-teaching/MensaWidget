Class {
	#name : #MWFrame,
	#superclass : #PluggableSystemWindow,
	#category : #MensaWidget
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 17:09'
}
MWFrame >> addText [

	| textMorph |
	
	textMorph := TextMorph new.
		textMorph contents: 'Are you a Munch? ;)'.
		textMorph position:  135@100.
		
	self addPaneMorph: textMorph.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 17:00'
}
MWFrame >> createFrame [
		
	self setLabel:'Mensa Widget';
		openInWorld;
		extent: 400@600.	
	
	
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 17:00'
}
MWFrame >> initialize [
	
	super initialize.
	self createFrame;
		addText.
]

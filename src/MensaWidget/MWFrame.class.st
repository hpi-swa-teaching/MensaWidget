Class {
	#name : #MWFrame,
	#superclass : #PluggableSystemWindow,
	#instVars : [
		'frame',
		'text'
	],
	#category : #MensaWidget
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'tmc 5/27/2024 16:02'
}
MWFrame >> createFrame [
	
	
	|frame textMorph|
	frame:= self frame: SystemWindow new.
	textMorph := TextMorph new.
		textMorph contents: 'Dinner Time ;)'.
		textMorph position:  135@100.
	frame addMorph: textMorph.
	
	frame  setLabel:'Mensa Widget'.
	frame openInWorld.
	frame bounds: (400@400 extent: 400@600).	
	
	
	

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tmc 5/25/2024 17:03'
}
MWFrame >> frame [
	^ frame
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tmc 5/25/2024 17:03'
}
MWFrame >> frame: anObject [
	frame := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'tmc 5/25/2024 17:06'
}
MWFrame >> openFrame [
	
	self createFrame.
]

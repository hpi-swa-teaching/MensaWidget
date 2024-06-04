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
	#'squeak_changestamp' : 'Louis Christ 6/4/2024 19:22'
}
MWFrame >> addAllCanteens [

	| contentMorph position canteenMorph |
	
	contentMorph := ScrollPane new.
	contentMorph color: Color paleTan darker.
	position := 5@5.
	MWDataGettingWrapper getTodaysMeals do: [ :each | 
		canteenMorph := each getCanteenMorph.
		contentMorph scroller addMorph: canteenMorph.
		canteenMorph position: position.
		position := 0 @ (5 +canteenMorph height) + position].
	contentMorph scrollBarThickness: 20;
		extent: (420 + contentMorph scrollBarThickness) @ 550;
		position: 5@40.
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
	#'squeak_changestamp' : 'Louis Christ 6/4/2024 19:10'
}
MWFrame >> initialize [
	
	super initialize.
	self createFrame;
		addAllCanteens;
		openInWorld;
		extent: 450@595.
]

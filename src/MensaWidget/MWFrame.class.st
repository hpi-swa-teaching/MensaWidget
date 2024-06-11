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
	#category : #scalablity,
	#'squeak_changestamp' : 'tmc 6/10/2024 20:31'
}
MWFrame >> addExpandBox [

	^ nil
 	


]

{
	#category : #scalablity,
	#'squeak_changestamp' : 'tmc 6/10/2024 20:31'
}
MWFrame >> addGrips [

	^ nil


]

{
	#category : #creation,
	#'squeak_changestamp' : 'tmc 6/11/2024 10:50'
}
MWFrame >> bound [

	^ nil
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
	#category : #scalablity,
	#'squeak_changestamp' : 'tmc 6/10/2024 20:31'
}
MWFrame >> expandToFullScreen [

	^ nil
 	


]

{
	#category : #creation,
	#'squeak_changestamp' : 'Louis Christ 6/7/2024 11:05'
}
MWFrame >> fillContentMorph: aContentMorph [
	
	| contentMorph |
	
	contentMorph := AlignmentMorph newColumn
		cellInset: self class cellSpacing;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.
	MWDataGettingWrapper getTodaysMeals do: [:each | 
		contentMorph addMorph: each getCanteenMorph].
	aContentMorph scroller addMorph: contentMorph
	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'tmc 6/11/2024 10:50'
}
MWFrame >> initialize [
	
	super initialize.
	self setLabel:'Mensa Widget';
		buildFrameContent;
		openInWorld;
		extent: self class frameSize.

	
]

{
	#category : #creation,
	#'squeak_changestamp' : 'tmc 6/11/2024 11:32'
}
MWFrame >> setExtentFromHalo: anExtent [

	^ nil
]

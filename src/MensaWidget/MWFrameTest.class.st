"
A MWFrameTest is Test Case for the MWFrame.

Instance Variables
	widgetFrame:		<MWFrame>

widgetFrame
	- a instance of the MWFrame on which the tests will be done

"
Class {
	#name : #MWFrameTest,
	#superclass : #TestCase,
	#instVars : [
		'widgetFrame'
	],
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 19:44'
}

{
	#category : #environment,
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 17:12'
}
MWFrameTest >> setUp [

	widgetFrame := MWFrame new
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 17:10'
}
MWFrameTest >> tearDown [

	widgetFrame abandon
]

{
	#category : #tests,
	#'squeak_changestamp' : 'tmc 6/6/2024 22:21'
}
MWFrameTest >> testCantineCount [

	self widgetFrame submorphsDo: [ :each | 
		each class = ScrollPane ifTrue: 
			[ each submorphsDo: [ :each2 |
				each2 class = TransformationMorph ifTrue: 
					[ each2 submorphsDo: [ :each3 |
						each3 class = AlignmentMorph ifTrue: [
							self assert: each3 subclasses size = 
								MWDataGettingWrapper canteenDict size]]]]]]
				 
			  
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:42'
}
MWFrameTest >> testContent [
	
	self assert: (self widgetFrame paneMorphs = #()) not
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:42'
}
MWFrameTest >> testCorrectSuperclass [

	self assert: self widgetFrame class superclass = PluggableSystemWindow
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:42'
}
MWFrameTest >> testCorrectTitle [
	
	self assert: self widgetFrame label = 'Mensa Widget'
]

{
	#category : #tests,
	#'squeak_changestamp' : 'tmc 6/12/2024 12:07'
}
MWFrameTest >> testForButton [

	| bool |
	
	bool := true.
	self widgetFrame allMorphsDo: [:each |
		((each respondsTo: #actionSelector) and: 
		[each actionSelector = #expandBoxHit]) ifTrue: 
			[bool := false]].	
	self assert: bool

]

{
	#category : #tests,
	#'squeak_changestamp' : 'tmc 6/12/2024 12:01'
}
MWFrameTest >> testFullScreen [
	
	| size | 
	
	size := 1 @ 1.

	self widgetFrame extent: size;
		assert: (self widgetFrame extent = size).
	self widgetFrame expandToFullScreen;
		assert: (self widgetFrame extent = size)
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'tmc 6/12/2024 12:11'
}
MWFrameTest >> testGripMorphs [

	| bool |
	
	bool := true.
	self widgetFrame submorphsDo: [:each | 
		(each class inheritsFrom:CornerGripMorph) ifTrue:
			[bool := false]].
	self assert: bool
]

{
	#category : #tests,
	#'squeak_changestamp' : 'tmc 6/12/2024 12:03'
}
MWFrameTest >> testHalo [
	
	| size | 
	
	size := 1 @ 1.

	self widgetFrame extent: size;
		assert: (self widgetFrame extent = size).
	self widgetFrame setExtentFromHalo: 5 @ 5;
		assert: (self widgetFrame extent = size).
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:42'
}
MWFrameTest >> testOpened [

	self assert: self widgetFrame isInWorld; 
		assert: self widgetFrame isCollapsed = false
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:42'
}
MWFrameTest >> testSize [

	self assert: self widgetFrame extent < World extent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:41'
}
MWFrameTest >> widgetFrame [

	^ widgetFrame
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:41'
}
MWFrameTest >> widgetFrame: anObject [

	widgetFrame := anObject
]

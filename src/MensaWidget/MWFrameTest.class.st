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
	#'squeak_changestamp' : 'Oscar 6/15/2024 14:05'
}
MWFrameTest >> setUp [

	widgetFrame := MWFrame new window
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
	#'squeak_changestamp' : 'Oscar 6/14/2024 15:29'
}
MWFrameTest >> testCorrectSuperclass [

	self assert: self widgetFrame class superclass = MorphicModel
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
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:42'
}
MWFrameTest >> testOpened [

	self assert: self widgetFrame isInWorld; 
		assert: self widgetFrame isCollapsed = false
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 6/17/2024 11:58'
}
MWFrameTest >> testRegister [
	
	| occurrence |
	
	occurrence := 0.
	TheWorldMenu registry do: [:each | each first = 'Mensa Widget' ifTrue: [occurrence := occurrence + 1]].
	self assert: occurrence >= 1. 

 

]

{
	#category : #tests,
	#'squeak_changestamp' : 'Oscar 6/16/2024 18:37'
}
MWFrameTest >> testSize [
	
	self assert: self widgetFrame extent >= MWFrame contentExtent



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

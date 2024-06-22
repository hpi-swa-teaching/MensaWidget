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
		'widgetFrame',
		'isRegistered'
	],
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 19:44'
}

{
	#category : #environment,
	#'squeak_changestamp' : 'Max 6/17/2024 21:02'
}
MWFrameTest >> setUp [
	
	isRegistered := true.
	[TheWorldMenu registry find: {'Mensa Widget'. {MWFrame. #new}}] on: Error do:
		[isRegistered := false].
	TheWorldMenu unregisterOpenCommand: 'Mensa Widget'.
	MWFrame register.
	widgetFrame := MWFrame new window
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Max 6/17/2024 21:05'
}
MWFrameTest >> tearDown [

	widgetFrame abandon.
	isRegistered ifFalse: [TheWorldMenu unregisterOpenCommand: 'Mensa Widget']
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
	#'squeak_changestamp' : 'Max 6/17/2024 21:07'
}
MWFrameTest >> testRegister [
	
	| occurrence |
	
	occurrence := true.
	[TheWorldMenu registry find: {'Mensa Widget'. {MWFrame. #new}}] on: Error do:
		[occurrence := false].
	self assert: occurrence

 

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

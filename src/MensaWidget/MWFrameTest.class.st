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
		'widget'
	],
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 19:44'
}

{
	#category : #environment,
	#'squeak_changestamp' : 'Louis Christ 6/19/2024 01:09'
}
MWFrameTest >> setUp [
	
	self widget: MWFrame new.
	self widgetFrame: self widget owner
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Louis Christ 6/19/2024 01:10'
}
MWFrameTest >> tearDown [
	
	self widget: nil.
	self widgetFrame abandon
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/19/2024 01:10'
}
MWFrameTest >> testCantineCount [

	self assert: self widget contentMorph submorphs size = MWDataGettingWrapper canteenDict size
				 
			  
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/19/2024 01:10'
}
MWFrameTest >> testContent [
	
	self assert: (self widget paneMorphs = #()) not
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 16:21'
}
MWFrameTest >> testCorrectClass [

	self assert: self widgetFrame class = SystemWindow
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 16:14'
}
MWFrameTest >> testCorrectTitle [
	
	self assert: self widgetFrame label = MWFrame windowName
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
	#'squeak_changestamp' : 'Oscar 6/16/2024 18:37'
}
MWFrameTest >> testSize [
	
	self assert: self widgetFrame extent >= MWFrame contentExtent



]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/19/2024 01:09'
}
MWFrameTest >> widget [

	^ widget
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 6/19/2024 01:09'
}
MWFrameTest >> widget: anObject [

	widget := anObject
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

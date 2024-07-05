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
		'widget',
		'isRegistered',
		'initialLatitude',
		'initialLongitude',
		'initialRadius'
	],
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 19:44'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/4/2024 23:13'
}
MWFrameTest >> initialLatitude [
	^ initialLatitude
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/4/2024 23:13'
}
MWFrameTest >> initialLatitude: anObject [
	initialLatitude := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/4/2024 23:13'
}
MWFrameTest >> initialLongitude [
	^ initialLongitude
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/4/2024 23:13'
}
MWFrameTest >> initialLongitude: anObject [
	initialLongitude := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/4/2024 23:13'
}
MWFrameTest >> initialRadius [
	^ initialRadius
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/4/2024 23:13'
}
MWFrameTest >> initialRadius: anObject [
	initialRadius := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 6/23/2024 18:35'
}
MWFrameTest >> isRegistered [

	^ isRegistered
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 6/23/2024 18:35'
}
MWFrameTest >> isRegistered: anObject [

	isRegistered := anObject
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Oscar 7/4/2024 23:18'
}
MWFrameTest >> safeUserLatLongRad [
	self initialLatitude: MWDataGettingWrapper initialLatitude.
	self initialLongitude: MWDataGettingWrapper initialLongitude.
	self initialRadius: MWDataGettingWrapper initialRadius
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Oscar 7/4/2024 23:18'
}
MWFrameTest >> setUp [
	
	self isRegistered: true.
	[TheWorldMenu registry find: {'Mensa Widget'. {MWFrame. #new}}] on: Error do:
		[self isRegistered: false].
	TheWorldMenu unregisterOpenCommand: 'Mensa Widget'.
	MWFrame register.
	self safeUserLatLongRad.
	MWDataGettingWrapper switchToDefaultLocation.
	self widget: MWFrame new;
		widgetFrame: self widget owner 
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Oscar 7/4/2024 23:19'
}
MWFrameTest >> tearDown [
	
	self widget: nil.
	self widgetFrame abandon.
	self isRegistered ifFalse: [TheWorldMenu unregisterOpenCommand: 'Mensa Widget'].
	MWDataGettingWrapper initialLatitude: initialLatitude.
	MWDataGettingWrapper initialLongitude: initialLongitude.
	MWDataGettingWrapper initialRadius: initialRadius
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

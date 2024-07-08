"
A MWFrameTest is a test case for the MWFrame.

Instance Variables:
    widgetFrame:        <SystemWindow>
    widget:             <MWFrame>
    initialLatitude:    <String>
    initialLongitude:   <String>
    initialRadius:      <String>

widgetFrame
    - The system window in which the widget gets opened.
widget
    - An instance of the MWFrame on which the tests will be conducted.
initialLatitude
    - Saves the initial latitude so it can be restored after the tests are done.
initialLongitude
    - Saves the initial longitude so it can be restored after the tests are done.
initialRadius
    - Saves the initial radius so it can be restored after the tests are done.
"
Class {
	#name : #MWFrameTest,
	#superclass : #TestCase,
	#instVars : [
		'widgetFrame',
		'widget',
		'initialLatitude',
		'initialLongitude',
		'initialRadius'
	],
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'LC 7/8/2024 22:29'
}

{
	#category : #helper,
	#'squeak_changestamp' : 'LC 7/8/2024 22:04'
}
MWFrameTest >> getAllCurrencies [

	| currencies |
	
	currencies := OrderedCollection new.
	self widgetFrame allMorphsDo: [:each | 
		(each class = MWCanteen) ifTrue: 
			[currencies add: (self getCurrency: each)]].
	^ currencies
	
]

{
	#category : #helper,
	#'squeak_changestamp' : 'LC 7/8/2024 22:22'
}
MWFrameTest >> getCanteenAmount: aCanteen [

	^ aCanteen submorphs first submorphs last contents
	
]

{
	#category : #helper,
	#'squeak_changestamp' : 'LC 7/8/2024 22:04'
}
MWFrameTest >> getCurrency: aCanteen [

	^ aCanteen submorphs first submorphs last contents
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/5/2024 13:21'
}
MWFrameTest >> initialLatitude [

	^ initialLatitude
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/5/2024 13:21'
}
MWFrameTest >> initialLatitude: anObject [

	initialLatitude := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/5/2024 13:21'
}
MWFrameTest >> initialLongitude [

	^ initialLongitude
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/5/2024 13:21'
}
MWFrameTest >> initialLongitude: anObject [

	initialLongitude := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/5/2024 13:21'
}
MWFrameTest >> initialRadius [

	^ initialRadius
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/5/2024 13:21'
}
MWFrameTest >> initialRadius: anObject [

	initialRadius := anObject
]

{
	#category : #helper,
	#'squeak_changestamp' : 'LC 7/8/2024 22:27'
}
MWFrameTest >> register [

	| wasRegistered | 
	
	wasRegistered := true.
	[TheWorldMenu registry find: {'Mensa Widget'. {MWFrame. #new}}] on: Error do:
		[wasRegistered := false].
	TheWorldMenu unregisterOpenCommand: 'Mensa Widget'.
	MWFrame register.
	^ wasRegistered
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Max 7/5/2024 14:35'
}
MWFrameTest >> saveUserLatLongRad [

	self initialLatitude: MWDataGettingWrapper initialLatitude;
		initialLongitude: MWDataGettingWrapper initialLongitude;
		initialRadius: MWDataGettingWrapper initialRadius
]

{
	#category : #environment,
	#'squeak_changestamp' : 'LC 7/8/2024 22:24'
}
MWFrameTest >> setUp [
	
	self saveUserLatLongRad.
	MWDataGettingWrapper switchToDefaultLocation.
	self widget: MWFrame newForTests;
		widgetFrame: self widget owner 
]

{
	#category : #environment,
	#'squeak_changestamp' : 'LC 7/8/2024 22:26'
}
MWFrameTest >> tearDown [
	
	self widget: nil.
	self widgetFrame abandon.
	MWDataGettingWrapper initialLatitude: self initialLatitude;
		initialLongitude: self initialLongitude;
		initialRadius: self initialRadius
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
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 12:07'
}
MWFrameTest >> testCorrectCurrency [

	self getAllCurrencies do: [:each | self assert: each = MWCanteen currency]
		
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 12:08'
}
MWFrameTest >> testCorrectCurrencyAmount [

	self assert: self getAllCurrencies size = MWDataGettingWrapper canteenDict size
		
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
	#'squeak_changestamp' : 'LC 7/8/2024 22:28'
}
MWFrameTest >> testRegister [
	
	| occurrence wasRegistered |
	
	wasRegistered := self register.
	occurrence := true.
	[TheWorldMenu registry find: {'Mensa Widget'. {MWFrame. #new}}] 
		on: Error
		do: [occurrence := false].
	self assert: occurrence.
	wasRegistered ifFalse: [TheWorldMenu unregisterOpenCommand: 'Mensa Widget']

 

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

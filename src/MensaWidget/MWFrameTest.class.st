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
		'isRegistered'
	],
	#category : 'MensaWidget-Tests',
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 19:44'
}

{
	#category : #helper,
	#'squeak_changestamp' : 'LC 7/6/2024 15:53'
}
MWFrameTest >> getAllCurrencies [

	| currencies |
	
	currencies := OrderedCollection new.
	self widgetFrame allMorphsDo: [:each | 
		(each class = MWCanteen) ifTrue: 
			[currencies add: each submorphs first submorphs last contents]].
	^ currencies
	
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
	#'squeak_changestamp' : 'LC 6/23/2024 18:30'
}
MWFrameTest >> setUp [
	
	self isRegistered: true.
	[TheWorldMenu registry find: {'Mensa Widget'. {MWFrame. #new}}] on: Error do:
		[self isRegistered: false].
	TheWorldMenu unregisterOpenCommand: 'Mensa Widget'.
	MWFrame register.
	self widget: MWFrame new;
		widgetFrame: self widget owner 
]

{
	#category : #environment,
	#'squeak_changestamp' : 'LC 6/23/2024 18:31'
}
MWFrameTest >> tearDown [
	
	self widget: nil.
	self widgetFrame abandon.
	self isRegistered ifFalse: [TheWorldMenu unregisterOpenCommand: 'Mensa Widget']
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

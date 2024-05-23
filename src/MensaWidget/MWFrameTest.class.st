Class {
	#name : #MWFrameTest,
	#superclass : #TestCase,
	#instVars : [
		'widgetFrame'
	],
	#category : #'MensaWidget-Tests'
}

{
	#category : #environment,
	#'squeak_changestamp' : 'Louis Christ 5/23/2024 21:15'
}
MWFrameTest >> setUp [

	widgetFrame := MWFrame new
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Louis Christ 5/23/2024 21:15'
}
MWFrameTest >> tearDown [

	widgetFrame destroy
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 5/23/2024 21:34'
}
MWFrameTest >> testInitialize [

	self assert: widgetFrame superclass = PluggableSystemWindow;
		assert: widgetFrame isInWorld; 
		assert: widgetFrame isCollapsed = false;
		assert: widgetFrame label = 'Untitled Window' not;
		assert: widgetFrame extent < World extent;
		assert: (widgetFrame paneMorphs = #()) not.
]

Class {
	#name : #MWFrameTest,
	#superclass : #TestCase,
	#instVars : [
		'widgetFrame'
	],
	#category : #'MensaWidget-Tests'
}

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 17:12'
}
MWFrameTest >> setUp [

	widgetFrame := MWFrame new
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 17:10'
}
MWFrameTest >> tearDown [

	widgetFrame abandon
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 17:11'
}
MWFrameTest >> testContent [
	
	self assert: (widgetFrame paneMorphs = #()) not
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 17:11'
}
MWFrameTest >> testCorrectSuperclass [

	self assert: widgetFrame class superclass = PluggableSystemWindow
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 17:11'
}
MWFrameTest >> testCorrectTitle [
	
	self assert: widgetFrame label = 'Mensa Widget'
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 17:11'
}
MWFrameTest >> testOpened [

	self assert: widgetFrame isInWorld; 
		assert: widgetFrame isCollapsed = false
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 17:11'
}
MWFrameTest >> testSize [

	self assert: widgetFrame extent < World extent
]

"
A MWDataGettingWrapperTest is a Test Case for the MWDataGettingWrapper.

Instance Variables
	dataGettingWrapper:		<MWDataGettingWrapper>

dataGettingWrapper
	- a DataGettingWrapper instance on which the tests will be performed

"
Class {
	#name : #MWDataGettingWrapperTest,
	#superclass : #TestCase,
	#instVars : [
		'dataGettingWrapper'
	],
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 19:35'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:35'
}
MWDataGettingWrapperTest >> dataGettingWrapper [

	^ dataGettingWrapper
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:35'
}
MWDataGettingWrapperTest >> dataGettingWrapper: anObject [

	dataGettingWrapper := anObject
]

{
	#category : #testCases,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:35'
}
MWDataGettingWrapperTest >> testCollectionClasses [
	
	self dataGettingWrapper todaysMeals do: [ :each |
		self assert: each class = MWMeal ]
]

{
	#category : #testCases,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:35'
}
MWDataGettingWrapperTest >> testCollectionValues [
	
	self dataGettingWrapper todaysMeals do: [ :each |
		each instanceVariableValues do: [ :value | 
			self assert: value = nil not]]
]

{
	#category : #testCases,
	#'squeak_changestamp' : 'Louis Christ 5/29/2024 18:35'
}
MWDataGettingWrapperTest >> testSize [

	self assert: self dataGettingWrapper todaysMeals size = self dataGettingWrapper class canteenDict size
]

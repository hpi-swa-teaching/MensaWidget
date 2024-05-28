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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 19:39'
}
MWDataGettingWrapperTest >> testCollectionClasses [
	
	dataGettingWrapper todaysMeals do: [ :each |
		self assert: each class = MWMeal ]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 19:42'
}
MWDataGettingWrapperTest >> testCollectionValues [
	
	dataGettingWrapper todaysMeals do: [ :each |
		each instanceVariableValues do: [ :value | 
			self assert: value = nil not]]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 19:36'
}
MWDataGettingWrapperTest >> testSize [

	self assert: dataGettingWrapper todaysMeals size = dataGettingWrapper class canteenDict size
]

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
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 19:35'
}

{
	#category : #tests,
	#'squeak_changestamp' : 'NK 5/29/2024 19:18'
}
MWDataGettingWrapperTest >> testCollectionClasses [
	
	MWDataGettingWrapper new todaysMeals do: [ :each |
		self assert: each class = MWCanteen ]
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Louis Christ 5/31/2024 15:30'
}
MWDataGettingWrapperTest >> testCollectionValues [
	
	MWDataGettingWrapper new todaysMeals do: [ :each |
		each instanceVariableValues do: [ :value | 
			self assert: (value = nil) not ] ]
]

{
	#category : #tests,
	#'squeak_changestamp' : 'NK 5/29/2024 19:16'
}
MWDataGettingWrapperTest >> testSize [

	self assert: MWDataGettingWrapper new todaysMeals size = MWDataGettingWrapper new class canteenDict size
]

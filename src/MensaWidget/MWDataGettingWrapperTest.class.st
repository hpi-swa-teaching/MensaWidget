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
	#'squeak_changestamp' : 'NK 6/18/2024 21:45'
}
MWDataGettingWrapperTest >> testCollectionClasses [
	
	MWDataGettingWrapper getTodaysMeals do: [:each |
		self assert: each class = MWCanteen]
]

{
	#category : #tests,
	#'squeak_changestamp' : 'NK 6/18/2024 21:45'
}
MWDataGettingWrapperTest >> testCollectionValues [
	
	MWDataGettingWrapper getTodaysMeals do: [:each |
		each instanceVariableValues do: [:value | 
			self assert: (value = nil) not]]
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 6/1/2024 10:35'
}
MWDataGettingWrapperTest >> testSize [

	self assert: MWDataGettingWrapper getTodaysMeals size = MWDataGettingWrapper new class canteenDict size
]

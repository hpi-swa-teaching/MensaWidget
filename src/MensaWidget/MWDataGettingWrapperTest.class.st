"
A MWDataGettingWrapperTest is a Test Case for the MWDataGettingWrapper.

"
Class {
	#name : #MWDataGettingWrapperTest,
	#superclass : #TestCase,
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Oscar 7/11/2024 17:57'
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
	#'squeak_changestamp' : 'Oscar 7/11/2024 19:08'
}
MWDataGettingWrapperTest >> testCollectionValues [
	
	MWDataGettingWrapper getTodaysMeals do: [:each |
		each instanceVariableValues do: [:value | 
			self assert: value notNil]]
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 7/5/2024 10:16'
}
MWDataGettingWrapperTest >> testEmptyCanteen [

	| canteenDict name |
	
	canteenDict := MWDataGettingWrapper canteenDict.
	MWDataGettingWrapper canteenDict: Dictionary new.
	name := (MWDataGettingWrapper getMealsOnDate: '2024-07-05') first name.
	self assert: name = MWCanteen emptyCanteen name.
	MWDataGettingWrapper canteenDict: canteenDict.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Oscar 7/11/2024 18:02'
}
MWDataGettingWrapperTest >> testSize [

	self assert: MWDataGettingWrapper getTodaysMeals size = MWDataGettingWrapper canteenDict size
]

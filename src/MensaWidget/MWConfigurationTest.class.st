"
A MWConfigurationTest is Test Case for the MWConfiguration.

Instance Variables

"
Class {
	#name : #MWConfigurationTest,
	#superclass : #TestCase,
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Max 7/1/2024 20:26'
}

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 7/1/2024 20:21'
}
MWConfigurationTest >> testInvalidSet [
	
	MWConfiguration setPriceGroup: 'noPriceGroup'.
	self assert: (MWMeal priceGroup isNil or: MWMeal priceGroup = 'students')
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 7/1/2024 20:20'
}
MWConfigurationTest >> testValidSet [
	
	| oldPriceGroup |
	
	oldPriceGroup := MWMeal priceGroup.
	MWConfiguration setPriceGroup: 'others'.
	self assert: MWMeal priceGroup = 'others'.
	MWMeal priceGroup: oldPriceGroup.
]

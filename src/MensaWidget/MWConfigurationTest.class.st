"
A MWConfigurationTest is Test Case for the MWConfiguration.

Instance Variables

"
Class {
	#name : #MWConfigurationTest,
	#superclass : #TestCase,
	#instVars : [
		'mensaWidget',
		'oldPriceGroup'
	],
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Max 7/1/2024 20:26'
}

{
	#category : #helpers,
	#'squeak_changestamp' : 'LC 7/5/2024 00:47'
}
MWConfigurationTest >> getPopUp [
	
	^ self mensaWidget menuBar submorphs last
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/3/2024 22:40'
}
MWConfigurationTest >> mensaWidget [

	^ mensaWidget
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/3/2024 22:40'
}
MWConfigurationTest >> mensaWidget: anObject [

	mensaWidget := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 7/8/2024 09:55'
}
MWConfigurationTest >> oldPriceGroup [
	^ oldPriceGroup
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 7/8/2024 09:55'
}
MWConfigurationTest >> oldPriceGroup: anObject [
	oldPriceGroup := anObject
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Max 7/8/2024 09:55'
}
MWConfigurationTest >> setUp [

	self mensaWidget: MWFrame newForTests.
	self oldPriceGroup: MWMeal priceGroup
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'LC 7/5/2024 11:18'
}
MWConfigurationTest >> simulatePopUpChoice: anObject [
	
	| popUp | 
	
	popUp := self getPopUp.
	popUp contentsClipped: anObject.
	popUp actionSelector ifNotNil: 
		[popUp target perform: popUp actionSelector
			withArguments: (popUp arguments copyWith: anObject)]
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Max 7/8/2024 09:56'
}
MWConfigurationTest >> tearDown [

	self mensaWidget owner abandon.
	self mensaWidget: nil.
	MWMeal priceGroup: self oldPriceGroup
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/8/2024 00:31'
}
MWConfigurationTest >> testChangingGroups [
	
	MWConfiguration priceGroups do: [:each | 
		self simulatePopUpChoice: each.
		MWMeal allInstances do: [:meal |
			self assert: (meal submorphs last contents = '' or: 
				[meal submorphs last contents asNumber = (meal prices at: each)])]]
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/8/2024 00:25'
}
MWConfigurationTest >> testInitialSetUp [

	self tearDown.
	MWConfiguration isInitial: true.
	self mensaWidget: MWFrame new;
		assert: (self mensaWidget class = MWFrame) not.
	MWConfiguration isInitial: false
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 7/8/2024 09:56'
}
MWConfigurationTest >> testInvalidSet [
	
	MWConfiguration setPriceGroup: 'noPriceGroup'.
	self assert: (MWMeal priceGroup isNil or: MWMeal priceGroup = MWMeal defaultGroup)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 7/8/2024 09:56'
}
MWConfigurationTest >> testValidSet [
	
	MWConfiguration setPriceGroup: 'others'.
	self assert: MWMeal priceGroup = 'others'
]

"
A MWConfigurationTest is Test Case for the MWConfiguration.

Instance Variables

"
Class {
	#name : #MWConfigurationTest,
	#superclass : #TestCase,
	#instVars : [
		'mensaWidget'
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
	#category : #environment,
	#'squeak_changestamp' : 'LC 7/3/2024 22:41'
}
MWConfigurationTest >> setUp [

	self mensaWidget: MWFrame new
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'LC 7/5/2024 00:47'
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
	#'squeak_changestamp' : 'LC 7/3/2024 22:47'
}
MWConfigurationTest >> tearDown [

	self mensaWidget owner abandon.
	self mensaWidget: nil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/5/2024 00:52'
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
	#'squeak_changestamp' : 'LC 7/5/2024 00:38'
}
MWConfigurationTest >> testInitialSetUp [

	self tearDown.
	MWConfiguration isInitial: true.
	self setUp;
		assert: (self mensaWidget class = MWFrame) not.
	MWConfiguration isInitial: false
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/5/2024 00:30'
}
MWConfigurationTest >> testInvalidSet [
	
	MWConfiguration setPriceGroup: 'noPriceGroup'.
	self assert: (MWMeal priceGroup isNil or: MWMeal priceGroup = MWMeal defaultGroup)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/2/2024 00:55'
}
MWConfigurationTest >> testValidSet [
	
	| oldPriceGroup |
	
	oldPriceGroup := MWMeal priceGroup.
	MWConfiguration setPriceGroup: 'others'.
	self assert: MWMeal priceGroup = 'others'.
	MWMeal priceGroup: oldPriceGroup
]

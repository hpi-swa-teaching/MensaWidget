"
A MWConfigurationTest is Test Case for the MWConfiguration.

Instance Variables
	mensaWidget:		<MWFrame>
	oldPriceGroup:		<String>

mensaWidget:
	- an instance of the MensaWidget to run the tests on
	
oldPriceGroup:
	- the old priceGroup based on the preferences by the user

"
Class {
	#name : #MWConfigurationTest,
	#superclass : #TestCase,
	#instVars : [
		'mensaWidget',
		'oldPriceGroup'
	],
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Max 7/8/2024 10:00'
}

{
	#category : #helpers,
	#'squeak_changestamp' : 'Oscar 7/12/2024 10:54'
}
MWConfigurationTest >> getAllMeals [
	
	^ (self mensaWidget allMorphs 
		collect: [:each | each class = MWMeal 
			ifTrue: [each]]) 
		select: [:each | each notNil]
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'LC 7/12/2024 12:00'
}
MWConfigurationTest >> getPopUp [
	
	^ self mensaWidget menuBar settings
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
	#'squeak_changestamp' : 'tmc 7/11/2024 22:12'
}
MWConfigurationTest >> oldPriceGroup [
	
	^ oldPriceGroup
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tmc 7/11/2024 22:12'
}
MWConfigurationTest >> oldPriceGroup: anObject [
	
	oldPriceGroup := anObject
]

{
	#category : #environment,
	#'squeak_changestamp' : 'LC 7/12/2024 11:59'
}
MWConfigurationTest >> setUp [

	self mensaWidget: MWFrame newForTests;
		oldPriceGroup: MWMeal priceGroup
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'tmc 7/11/2024 22:17'
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
	#'squeak_changestamp' : 'LC 7/12/2024 11:10'
}
MWConfigurationTest >> testChangingGroups [
	
	MWConfiguration priceGroups do: [:each | 
		self simulatePopUpChoice: each.
		self getAllMeals do: [:meal |
			self assert: (meal priceMorph contents isEmpty or: 
				[meal priceMorph contents asNumber = (meal prices at: each)])]]
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/12/2024 12:04'
}
MWConfigurationTest >> testInitialSetUp [

	self tearDown.
	MWConfiguration isInitial: true.
	self mensaWidget: MWFrame new;
		deny: self mensaWidget class = MWFrame.
	MWConfiguration isInitial: false
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/12/2024 12:05'
}
MWConfigurationTest >> testInvalidSet [
	
	MWConfiguration setPriceGroup: 'noPriceGroup'.
	self assert: MWMeal priceGroup = MWMeal defaultGroup
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 7/8/2024 09:56'
}
MWConfigurationTest >> testValidSet [
	
	MWConfiguration setPriceGroup: 'others'.
	self assert: MWMeal priceGroup = 'others'
]

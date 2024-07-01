"
A MWConfiguration is a class for accessing the different configurations of the MensaWidget.

Instance Variables

"
Class {
	#name : #MWConfiguration,
	#superclass : #Object,
	#classVars : [
		'BackgroundColor',
		'DefaultColor',
		'PrimaryColor',
		'SecondayColor'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Max 7/1/2024 20:26'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/2/2024 01:04'
}
MWConfiguration class >> backgroundColor [
	^ BackgroundColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/2/2024 01:04'
}
MWConfiguration class >> backgroundColor: anObject [
	BackgroundColor := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/2/2024 01:04'
}
MWConfiguration class >> defaultColor [
	^ DefaultColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/2/2024 01:04'
}
MWConfiguration class >> defaultColor: anObject [
	DefaultColor := anObject
]

{
	#category : #priceGroup,
	#'squeak_changestamp' : 'Max 6/19/2024 09:17'
}
MWConfiguration class >> priceGroups [

	^ #('students' 'others' 'pupils' 'employees')

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/2/2024 01:04'
}
MWConfiguration class >> primaryColor [
	^ PrimaryColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/2/2024 01:04'
}
MWConfiguration class >> primaryColor: anObject [
	PrimaryColor := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/2/2024 01:04'
}
MWConfiguration class >> secondayColor [
	^ SecondayColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/2/2024 01:04'
}
MWConfiguration class >> secondayColor: anObject [
	SecondayColor := anObject
]

{
	#category : #priceGroup,
	#'squeak_changestamp' : 'Max 6/19/2024 09:17'
}
MWConfiguration class >> setPriceGroup: aPriceGroup [

	(self priceGroups includes: aPriceGroup) ifFalse: [^ nil].
	MWMeal priceGroup: aPriceGroup.
]

{
	#category : #priceGroup,
	#'squeak_changestamp' : 'Max 6/19/2024 09:18'
}
MWConfiguration class >> showPriceGroup [

	^ MWMeal priceGroup
]

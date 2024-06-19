Class {
	#name : #MWConfiguration,
	#superclass : #Object,
	#category : #MensaWidget
}

{
	#category : #priceGroup,
	#'squeak_changestamp' : 'Max 6/19/2024 09:17'
}
MWConfiguration class >> priceGroups [

	^ #('students' 'others' 'pupils' 'employees')

	
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

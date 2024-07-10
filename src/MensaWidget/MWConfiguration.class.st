"
A MWConfiguration is a class for accessing the different configurations of the MensaWidget.

Class Variables
	
	BackgroundColor:		<Color>
	DefaultColor:		<Color>
	IsInitial:			<Boolean>
	PrimaryColor:		<Color>
	SecondaryColor:		<Color>
	
BackgroundColor
	- the Background Color of the Configuration
	
DefaultColor
	- the default Color of the Configuration
	
IsInitial
	- checks whether the widget is being opened for the first time
	
PrimaryColor
	- the Primary Color of the Configuration 
	
SecondaryColor
	- the Secondary Color of the Configuration

"
Class {
	#name : #MWConfiguration,
	#superclass : #Object,
	#classVars : [
		'BackgroundColor',
		'DefaultColor',
		'IsInitial',
		'PrimaryColor',
		'SecondaryColor'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'tmc 7/10/2024 23:20'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/2/2024 10:23'
}
MWConfiguration class >> backgroundColor [

	^ BackgroundColor ifNil: [BackgroundColor := Color r: 0.8 g: 1 b: 0.8]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/2/2024 10:23'
}
MWConfiguration class >> backgroundColor: anObject [

	BackgroundColor := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/2/2024 10:24'
}
MWConfiguration class >> defaultColor [

	^ DefaultColor ifNil: [DefaultColor := Color darkGray]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/2/2024 10:24'
}
MWConfiguration class >> defaultColor: anObject [

	DefaultColor := anObject
]

{
	#category : #priceGroup,
	#'squeak_changestamp' : 'LC 7/5/2024 11:39'
}
MWConfiguration class >> fromPopUp: aPopUp setPriceGroup: aCategory [
	
	self setPriceGroup: aCategory.
	MWFrame updateCategory.
	MWMeal updatePrice
]

{
	#category : #morphs,
	#'squeak_changestamp' : 'LC 7/3/2024 22:30'
}
MWConfiguration class >> getPopUp [

	| popUp |
	
	popUp := PopUpChoiceMorph new
		target: self;
		getItemsSelector: #priceGroups;
		actionSelector: #fromPopUp:setPriceGroup:;
		contents: MWMeal priceGroup;
		yourself.
	popUp arguments: (popUp arguments copyWith: popUp).
	^ popUp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/3/2024 00:22'
}
MWConfiguration class >> isInitial [

	^ IsInitial ifNil: [IsInitial := true]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/3/2024 00:22'
}
MWConfiguration class >> isInitial: anObject [

	IsInitial := anObject
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
	#'squeak_changestamp' : 'LC 7/2/2024 10:25'
}
MWConfiguration class >> primaryColor [

	^ PrimaryColor ifNil: [PrimaryColor := Color paleGreen darker darker]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/2/2024 10:25'
}
MWConfiguration class >> primaryColor: anObject [

	PrimaryColor := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/2/2024 10:30'
}
MWConfiguration class >> secondaryColor [

	^ SecondaryColor ifNil: [SecondaryColor := Color fern lighter]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LC 7/2/2024 10:30'
}
MWConfiguration class >> secondaryColor: anObject [

	SecondaryColor := anObject
]

{
	#category : #priceGroup,
	#'squeak_changestamp' : 'LC 7/3/2024 00:25'
}
MWConfiguration class >> setPriceGroup: aCategory [
	
	self isInitial: false.
	MWMeal priceGroup: aCategory;
		updatePrice
]

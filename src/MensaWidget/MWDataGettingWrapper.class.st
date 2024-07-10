"
A MWDataGettingWrapper is providing a functionality as a middleman to store all canteens that data will be pulled from and get all canteen objects returned.

Class Variables: 
    CanteenDict:       <Dictionary>
    InitialLatitude:   <String>
    InitialLongitude:  <String>
    InitialRadius:     <String>

CanteenDict
    - A dictionary which maps canteen IDs to their 
InitialLatitude
    - The last used latitude for the other cities 
InitialLongitude
    - The last used longitude for the other cities 
InitialRadius
    - The last used radius for the other cities feature

"
Class {
	#name : #MWDataGettingWrapper,
	#superclass : #Object,
	#classVars : [
		'CanteenDict',
		'InitialLatitude',
		'InitialLongitude',
		'InitialRadius'
	],
	#classInstVars : [
		'canteenDict'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Oscar 7/5/2024 12:47'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/1/2024 16:20'
}
MWDataGettingWrapper class >> canteenDict [

	^ CanteenDict
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/1/2024 16:20'
}
MWDataGettingWrapper class >> canteenDict: anObject [

	CanteenDict := anObject
]

{
	#category : #dataPulling,
	#'squeak_changestamp' : 'Max 7/5/2024 09:37'
}
MWDataGettingWrapper class >> getMealsOnDate: aDate [

	| canteens canteenDict json |
	
	canteens := OrderedCollection new.
	self canteenDict isEmpty ifTrue: [^ canteens add: MWCanteen emptyCanteen;
		yourself].
	canteenDict := self canteenDict.
	canteenDict keys do: [:id |
		json := MWApiWrapper getMealsFrom: id on: aDate using: WebClient.
		canteens add: (MWCanteen newWithId: id  Name: (canteenDict at: id) Date: aDate Meals: (MWMealCleaner clean: (MWParser put: json in: MWMeal)))].
	^ canteens
]

{
	#category : #dataPulling,
	#'squeak_changestamp' : 'Max 6/1/2024 10:35'
}
MWDataGettingWrapper class >> getTodaysMeals [

	| today |
	
	today := Date today yyyymmdd.
	^ MWDataGettingWrapper getMealsOnDate: today
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 7/5/2024 14:26'
}
MWDataGettingWrapper class >> initialLatitude [

	^ InitialLatitude isEmptyOrNil 
		ifTrue: [InitialLatitude := '52.393822']
		ifFalse: [InitialLatitude]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/1/2024 16:21'
}
MWDataGettingWrapper class >> initialLatitude: anObject [

	InitialLatitude := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 7/5/2024 14:26'
}
MWDataGettingWrapper class >> initialLongitude [

	^ InitialLongitude isEmptyOrNil 
		ifTrue: [InitialLongitude := '13.129558']
		ifFalse: [InitialLongitude]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/1/2024 16:21'
}
MWDataGettingWrapper class >> initialLongitude: anObject [

	InitialLongitude := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 7/5/2024 14:25'
}
MWDataGettingWrapper class >> initialRadius [

	^ InitialRadius isEmptyOrNil 
		ifTrue: [InitialRadius := '5']
		ifFalse: [InitialRadius]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/1/2024 16:21'
}
MWDataGettingWrapper class >> initialRadius: anObject [

	InitialRadius := anObject
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 7/5/2024 13:55'
}
MWDataGettingWrapper class >> latitudeMessage [

	^ 'Please enter your latitude.'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 7/5/2024 13:54'
}
MWDataGettingWrapper class >> longitudeMessage [

	^ 'Please enter your longitude.'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 7/5/2024 13:55'
}
MWDataGettingWrapper class >> radiusMessage [

	^ 'Please enter your radius.'
]

{
	#category : #dataPulling,
	#'squeak_changestamp' : 'Max 7/10/2024 20:28'
}
MWDataGettingWrapper class >> switchLocation [
	
	| outletDict |
	
	self initialLatitude: (FillInTheBlankMorph request: self latitudeMessage initialAnswer: self initialLatitude);
		initialLongitude: (FillInTheBlankMorph request: self longitudeMessage initialAnswer: self initialLongitude);
		initialRadius: (FillInTheBlankMorph request: self radiusMessage initialAnswer: self initialRadius).
	outletDict := MWApiWrapper getOutletDictFrom: self initialLatitude and: self initialLongitude andRadius: self initialRadius.
	self canteenDict: (MWParser transformToDict: outletDict)
]

{
	#category : #dataPulling,
	#'squeak_changestamp' : 'Max 7/10/2024 20:28'
}
MWDataGettingWrapper class >> switchToDefaultLocation [
	
	| outletDict |
	
	outletDict := MWApiWrapper getOutletDictFrom: 52.393822 and: 13.129558 andRadius: 5.
	self canteenDict: (MWParser transformToDict: outletDict)
]

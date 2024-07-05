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
	#'squeak_changestamp' : 'Oscar 7/1/2024 16:32'
}
MWDataGettingWrapper class >> initialLatitude [

	^ InitialLatitude ifNil: [52.393822]
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
	#'squeak_changestamp' : 'Oscar 7/1/2024 16:32'
}
MWDataGettingWrapper class >> initialLongitude [

	^ InitialLongitude ifNil: [13.129558]
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
	#'squeak_changestamp' : 'Oscar 7/1/2024 16:33'
}
MWDataGettingWrapper class >> initialRadius [

	^ InitialRadius ifNil: [5]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/1/2024 16:21'
}
MWDataGettingWrapper class >> initialRadius: anObject [

	InitialRadius := anObject
]

{
	#category : #dataPulling,
	#'squeak_changestamp' : 'Oscar 7/5/2024 12:59'
}
MWDataGettingWrapper class >> switchLocation [
	
	| longitude latitude radius |
	
	latitude := FillInTheBlankMorph request: 'Please enter your Latitude' initialAnswer: self initialLatitude.
	longitude := FillInTheBlankMorph request: 'Please enter your Longitude' initialAnswer: self initialLongitude.
	radius := FillInTheBlankMorph request: 'Please enter your Radius' initialAnswer: self initialRadius.
	self canteenDict: (MWParser transformJsonToDict: (MWApiWrapper getOutletDictFrom: latitude and: longitude andRadius: radius));
		initialLongitude: longitude;
		initialLatitude: latitude;
		initialRadius: radius
]

{
	#category : #dataPulling,
	#'squeak_changestamp' : 'Oscar 7/5/2024 13:00'
}
MWDataGettingWrapper class >> switchToDefaultLocation [
	
	self canteenDict: (MWParser transformJsonToDict: 
		(MWApiWrapper getOutletDictFrom: 52.393822 and: 13.129558 andRadius: 5))
]

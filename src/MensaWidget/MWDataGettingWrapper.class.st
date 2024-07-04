"
A MWDataGettingWrapper is providing a functionality as a middleman to store all canteens that data will be pulled from and get all canteen objects returned.

Instance Variables

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
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 19:22'
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
	#'squeak_changestamp' : 'Oscar 6/30/2024 18:13'
}
MWDataGettingWrapper class >> getMealsOnDate: aDate [

	| canteens canteenDict json |
	
	canteens := OrderedCollection new.
	
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
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/1/2024 16:52'
}
MWDataGettingWrapper class >> switchLocation [
	
	| longitude latitude radius |
	
	latitude := FillInTheBlankMorph request: 'Please enter your Latitude' initialAnswer: self initialLatitude.
	longitude := FillInTheBlankMorph request: 'Please enter your Longitude' initialAnswer: self initialLongitude.
	radius := FillInTheBlankMorph request: 'Please enter your Radius' initialAnswer: self initialRadius.
	self canteenDict: (MWParser transformJsonToDict: (MWApiWrapper getOutletDictFrom: latitude and: longitude andRadius: radius)).
	self initialLongitude: longitude.
	self initialLatitude: latitude.
	self initialRadius: radius.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Oscar 7/1/2024 16:30'
}
MWDataGettingWrapper class >> switchToDefaultLocation [
	
	self canteenDict: (MWParser transformJsonToDict: (MWApiWrapper getOutletDictFrom: 52.393822 and: 13.129558 andRadius: 5))
]

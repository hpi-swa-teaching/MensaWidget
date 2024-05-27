"
A MWDataGettingWrapper is providing a functionality as a middleman to store all canteens that data will be pulled from and get all canteen objects returned.

Instance Variables

"
Class {
	#name : #MWDataGettingWrapper,
	#superclass : #Object,
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 19:22'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 19:27'
}
MWDataGettingWrapper class >> canteenDict [

	^ {'112' -> 'Ulfs Cafe'. 
		'62' -> 'Mensa Griebnitzsee'.
		'1222' -> 'Mensa Filmuni'. 
		'1717' -> 'Campus Kitchen One'} asDictionary
]

{
	#category : #today,
	#'squeak_changestamp' : 'Louis Christ 5/27/2024 19:33'
}
MWDataGettingWrapper >> todaysMeals [

	| api parser canteens today canteenDict json |
	
	api := MWApiWrapper new.
	parser := MWParser new.
	canteens := OrderedCollection new.
	today := Date today yyyymmdd.
	canteenDict := self class canteenDict.
	
	canteenDict keys do: [ :id |
		json := api getMealsFrom: id on: today.
		canteens add: (MWCanteen newWithId: id  Name: (canteenDict at: id) Date: today Meals: (parser put: json in: MWMeal))].
	^ canteens
]

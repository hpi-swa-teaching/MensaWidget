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
	#'squeak_changestamp' : 'NK 5/28/2024 11:25'
}
MWDataGettingWrapper class >> canteenDict [

	^ {'112' -> 'Ulfs Cafe'. 
		'62' -> 'Mensa Griebnitzsee'.
		'1222' -> 'Mensa Babelsberg'. 
		'1717' -> 'Campus Kitchen One'} asDictionary
]

{
	#category : #today,
	#'squeak_changestamp' : 'NK 5/30/2024 17:17'
}
MWDataGettingWrapper >> getMealsOnDate: aDate [

	| api canteens canteenDict json |
	
	api := MWApiWrapper new.
	canteens := OrderedCollection new.
	canteenDict := self class canteenDict.
	canteenDict keys do: [ :id |
		json := api getMealsFrom: id on: aDate.
		canteens add: (MWCanteen newWithId: id  Name: (canteenDict at: id) Date: aDate Meals: (MWParser put: json in: MWMeal))].
	^ canteens
]

{
	#category : #today,
	#'squeak_changestamp' : 'NK 5/30/2024 17:19'
}
MWDataGettingWrapper >> getTodaysMeals [

	| today |
	

	today := Date today yyyymmdd.
	
	^ MWDataGettingWrapper new getMealsOnDate: today
]

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
	#'squeak_changestamp' : 'Oscar 6/8/2024 17:37'
}
MWDataGettingWrapper class >> canteenDict [

	^ {'112' -> 'Ulfs Cafe'. 
		'62' -> 'Mensa Griebnitzsee'.
		'1222' -> 'Mensa Babelsberg'. 
		'1717' -> 'Campus Kitchen One'.
		'1792' -> 'Schraders Bistro'} asDictionary
]

{
	#category : #dataPulling,
	#'squeak_changestamp' : 'Max 6/18/2024 18:29'
}
MWDataGettingWrapper class >> getMealsOnDate: aDate [

	| canteens canteenDict json |
	
	canteens := OrderedCollection new.
	canteenDict := self canteenDict.
	canteenDict keys do: [ :id |
		json := MWApiWrapper getMealsFrom: id on: aDate using: WebClient.
		canteens add: (MWCanteen newWithId: id  Name: (canteenDict at: id) Date: aDate Meals: (MWMealCleaner clean: (MWParser put: json in: MWMeal))) ].
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

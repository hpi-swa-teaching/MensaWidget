"
A MWMealCleaner is a FIlter for Meal lists provided by the parsing after processing the JSON String.

Instance Variables

"
Class {
	#name : #MWMealCleaner,
	#superclass : #Object,
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Max 6/11/2024 20:46'
}

{
	#category : #cleaning,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 13:54'
}
MWMealCleaner class >> clean: aMealList [
	
	| newMealList |
	
	newMealList := OrderedCollection new.
	aMealList isEmpty ifTrue: [^ newMealList add: MWMeal emptyMeal; 
		yourself].
	aMealList do: [:each | newMealList add: (self fixMeal: each)].
	^ newMealList
		
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 13:58'
}
MWMealCleaner class >> dinnerCategory [

	^ 'dinner'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 6/12/2024 13:42'
}
MWMealCleaner class >> emptyPrice [

	^ Json readFromString: '{"students":null,"employees":null,"pupils":null,"others":null}'
]

{
	#category : #cleaning,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 14:01'
}
MWMealCleaner class >> fixCategories: aMeal [

	aMeal category ifNil: [^ nil].
	(aMeal category beginsWith: 'Abend') ifTrue: [aMeal category: self dinnerCategory].
	aMeal category = self dinnerCategory ifFalse: [aMeal category: self lunchCategory]
	
	
	
		
]

{
	#category : #cleaning,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 13:58'
}
MWMealCleaner class >> fixMeal: aMeal [

	| meal |
	
	meal := aMeal.
	meal isSaladBar ifTrue: [meal := MWMeal saladBarMeal].
	meal isHotCounter ifTrue: [meal := MWMeal hotCounterMeal].
	self fixPrices: meal;
	 	fixCategories: meal.
	^ meal
		
]

{
	#category : #cleaning,
	#'squeak_changestamp' : 'Max 6/12/2024 15:29'
}
MWMealCleaner class >> fixPrices: aMeal [
	
	| price |
	
	aMeal prices ifNil: [aMeal prices: self emptyPrice. 
		^ nil].
	price := aMeal prices.
	(price at: 'students') ifNil: [price at: 'students' put: (price at: 'others')].
	(price at: 'employees') ifNil: [price at: 'employees' put: (price at: 'others')].
	(price at: 'pupils') ifNil: [price at: 'pupils' put: (price at: 'students')].
	aMeal prices: price
	
	
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 6/12/2024 13:49'
}
MWMealCleaner class >> hotCounterPrice [

	^ Json readFromString: '{"students":0.60,"employees":0.60,"pupils":0.60,"others":1.10}'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 13:58'
}
MWMealCleaner class >> lunchCategory [

	^ 'lunch'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 6/12/2024 13:47'
}
MWMealCleaner class >> saladBarPrice [

	^ Json readFromString: '{"students":1.10,"employees":1.10,"pupils":1.10,"others":1.60}'
]

"
A MWMealCleaner is a FIlter for Meal lists provided by the parsing after processing the JSON Strring.

Instance Variables

"
Class {
	#name : #MWMealCleaner,
	#superclass : #Object,
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Max 6/11/2024 10:40'
}

{
	#category : #cleaning,
	#'squeak_changestamp' : 'Max 6/11/2024 18:25'
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
	#category : #cleaning,
	#'squeak_changestamp' : 'Max 6/10/2024 20:02'
}
MWMealCleaner class >> fixCategories: aMeal [

	aMeal category ifNil: [^ nil].
	(aMeal category beginsWith: 'Abend') ifTrue: [aMeal category: 'dinner'].
	aMeal category = 'dinner' ifFalse: [aMeal category: 'lunch']
	
	
	
		
]

{
	#category : #cleaning,
	#'squeak_changestamp' : 'Max 6/10/2024 20:47'
}
MWMealCleaner class >> fixMeal: aMeal [

	| meal |
	
	meal := aMeal.
	meal isSaladBar ifTrue: [meal := MWMeal saladBar].
	meal isHotCounter ifTrue: [meal := MWMeal hotCounter].
	self fixPrices: meal.
	self fixCategories: meal.
	^ meal
		
]

{
	#category : #cleaning,
	#'squeak_changestamp' : 'Max 6/10/2024 21:59'
}
MWMealCleaner class >> fixPrices: aMeal [
	
	| price |
	
	aMeal prices ifNil: [aMeal prices: MWPrice emptyPrice. 
		^ nil].
	aMeal prices class = MWPrice ifTrue: [^ nil].
	price := (MWParser put: '[', aMeal prices asJsonString, ']' in: MWPrice) first.
	price students ifNil: [price students: price others].
	price employees ifNil: [price employees: price others].
	price pupils ifNil: [price pupils: price students].
	aMeal prices: price
	
	
	
]

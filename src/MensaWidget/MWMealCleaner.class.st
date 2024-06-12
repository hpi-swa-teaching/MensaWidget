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
	#'squeak_changestamp' : 'Max 6/12/2024 13:56'
}
MWMealCleaner class >> clean: aMealList [
	
	| newMealList |
	
	newMealList := OrderedCollection new.
	aMealList isEmpty ifTrue: [^ newMealList add: self emptyMeal; 
		yourself].
	aMealList do: [:each | newMealList add: (self fixMeal: each)].
	^ newMealList
		
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 6/12/2024 13:50'
}
MWMealCleaner class >> emptyMeal [

	^ MWMeal new id: nil;
		name: 'Hier gibt es nichts zu sehen.' translated;
		category: nil;
		notes: nil;
		prices: self emptyPrice
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
	#'squeak_changestamp' : 'Max 6/10/2024 20:02'
}
MWMealCleaner class >> fixCategories: aMeal [

	aMeal category ifNil: [^ nil].
	(aMeal category beginsWith: 'Abend') ifTrue: [aMeal category: 'dinner'].
	aMeal category = 'dinner' ifFalse: [aMeal category: 'lunch']
	
	
	
		
]

{
	#category : #cleaning,
	#'squeak_changestamp' : 'Max 6/12/2024 13:51'
}
MWMealCleaner class >> fixMeal: aMeal [

	| meal |
	
	meal := aMeal.
	meal isSaladBar ifTrue: [meal := self saladBar].
	meal isHotCounter ifTrue: [meal := self hotCounter].
	self fixPrices: meal;
	 	fixCategories: meal.
	^ meal
		
]

{
	#category : #cleaning,
	#'squeak_changestamp' : 'Max 6/12/2024 13:46'
}
MWMealCleaner class >> fixPrices: aMeal [
	
	| price |
	
	aMeal prices ifNil: [aMeal prices: self emptyPrice. 
		^ nil].
	price := aMeal prices.
	"aMeal prices class = MWPrice ifTrue: [^ nil].
	price := (MWParser put: '[', aMeal prices asJsonString, ']' in: MWPrice) first."
	(price at: 'students') ifNil: [price at: 'students' put: (price at: 'others')].
	(price at: 'employees') ifNil: [price at: 'employees' put: (price at: 'others')].
	(price at: 'pupils') ifNil: [price at: 'pupils' put: (price at: 'students')].
	aMeal prices: price
	
	
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 6/12/2024 13:50'
}
MWMealCleaner class >> hotCounter [

	^ MWMeal new id: nil;
		name: 'Heiße Theke 100 g' translated;
		category: 'lunch';
		notes: nil;
		prices: self hotCounterPrice
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
	#'squeak_changestamp' : 'Max 6/12/2024 13:50'
}
MWMealCleaner class >> saladBar [

	^ MWMeal new id: nil;
		name: 'Salatbar 100 g' translated;
		category: 'lunch';
		notes: nil;
		prices: self saladBarPrice
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 6/12/2024 13:47'
}
MWMealCleaner class >> saladBarPrice [

	^ Json readFromString: '{"students":1.10,"employees":1.10,"pupils":1.10,"others":1.60}'
]

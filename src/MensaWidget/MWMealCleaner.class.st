Class {
	#name : #MWMealCleaner,
	#superclass : #Object,
	#category : #MensaWidget
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Max 6/10/2024 19:12'
}
MWMealCleaner class >> clean: aMealList [
	
	| newMealList meal |
	
	newMealList := OrderedCollection new.
	aMealList empty ifTrue: [^ newMealList add: self emptyMeal].
	aMealList do: [:each |
		meal := each.
		each isSaladBar ifTrue: [meal := self saladBar].
		each isHotCounter ifTrue: [meal := self hotCounter].
		self fixPrices: meal.
		self fixCategories: meal.
		newMealList add: meal].
	^ newMealList
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Max 6/10/2024 19:45'
}
MWMealCleaner class >> emptyMeal [

	^ MWMeal new id: nil;
		name: 'Heute gibt es kein Essen.' translated;
		category: nil;
		notes: nil;
		prices: self emptyPrice
		
		
		
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Max 6/10/2024 19:45'
}
MWMealCleaner class >> emptyPrice [

	^ MWPrice new students: nil;
		employees: nil;
		others: nil;
		pupils: nil
	
	
	
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Max 6/10/2024 19:49'
}
MWMealCleaner class >> fixCategories: aMeal [

	aMeal category ifNil: [^ nil].
	(aMeal category beginsWith: 'Abend') ifTrue: [aMeal category: 'dinner'. ^ nil].
	aMeal category: 'lunch'
	
	
	
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Max 6/10/2024 19:45'
}
MWMealCleaner class >> fixPrices: aMeal [
	
	| price |
	
	aMeal prices ifNil: [aMeal prices: self emptyPrice. ^ nil].
	price := aMeal prices: (MWParser put: aMeal prices in: MWPrice) first.
	price students ifNil: [price students: price others].
	price students = 0.0 ifTrue: [price students: price others].
	price employees ifNil: [price employees: price others].
	price employees = 0.0 ifTrue: [price employees: price others].
	price pupils: price students.
	
	
	
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Max 6/10/2024 19:25'
}
MWMealCleaner class >> hotCounter [

	^ MWMeal new id: nil;
		name: 'Heiße Theke 100 g' translated;
		category: 'lunch';
		notes: nil;
		prices: self hotCounterPrice
		
		
		
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Max 6/10/2024 19:34'
}
MWMealCleaner class >> hotCounterPrice [

	^ MWPrice new students: 0.60;
		employees: 0.60;
		others: 1.10;
		pupils: 0.60
		
		
		
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Max 6/10/2024 19:25'
}
MWMealCleaner class >> saladBar [

	^ MWMeal new id: nil;
		name: 'Salatbar 100 g' translated;
		category: 'lunch';
		notes: nil;
		prices: self saladBarPrice
		
		
		
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Max 6/10/2024 19:35'
}
MWMealCleaner class >> saladBarPrice [

	^ MWPrice new students: 1.10;
		employees: 1.10;
		others: 1.60;
		pupils: 1.10
		
		
		
		
]

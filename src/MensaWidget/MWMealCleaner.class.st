Class {
	#name : #MWMealCleaner,
	#superclass : #Object,
	#category : #MensaWidget
}

{
	#category : #cleaning,
	#'squeak_changestamp' : 'Max 6/10/2024 20:22'
}
MWMealCleaner class >> clean: aMealList [
	
	| newMealList |
	
	newMealList := OrderedCollection new.
	aMealList isEmpty ifTrue: [^ newMealList add: MWMeal emptyMeal].
	aMealList do: [:each |
		newMealList add: (self fixMeal: each)].
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
	#'squeak_changestamp' : 'Max 6/10/2024 21:01'
}
MWMealCleaner class >> fixPrices: aMeal [
	
	| price |
	
	aMeal prices ifNil: [aMeal prices: MWPrice emptyPrice. 
		^ nil].
	aMeal prices class = MWPrice ifTrue: [^ nil].
	"price := aMeal prices: (MWParser put: aMeal prices transform to string in: MWPrice) first."
	price := MWPrice new.
	price students: (aMeal prices at: 'students').
	price employees: (aMeal prices at: 'employees').
	price others: (aMeal prices at: 'others').
	price pupils: (aMeal prices at: 'pupils').
	price students ifNil: [price students: price others].
	price employees ifNil: [price employees: price others].
	price pupils ifNil: [price pupils: price students]
	
	
	
]

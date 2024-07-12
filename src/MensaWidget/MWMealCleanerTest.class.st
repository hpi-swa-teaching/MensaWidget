"
A MWMealCleanerTest is a test for the MWMealCleaner.

Instance Variables

"
Class {
	#name : #MWMealCleanerTest,
	#superclass : #TestCase,
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Max 6/11/2024 18:06'
}

{
	#category : #meals,
	#'squeak_changestamp' : 'NK 6/18/2024 21:47'
}
MWMealCleanerTest >> brokenEveningMeal [

	^ MWMeal new name: 'Ich bin ein Abendangebot';
		category: 'Abend Angebot'
]

{
	#category : #meals,
	#'squeak_changestamp' : 'Max 6/11/2024 18:17'
}
MWMealCleanerTest >> brokenHotCounter [
	
	^ MWMeal new name: 'Preis pro 100 g';
		category: 'Heiße Theke'

]

{
	#category : #meals,
	#'squeak_changestamp' : 'Max 6/11/2024 18:38'
}
MWMealCleanerTest >> brokenLunchMeal [

	^ MWMeal new name: 'Ich bin ein Mittagsangebot';
		category: 'Angebot'
]

{
	#category : #meals,
	#'squeak_changestamp' : 'Max 6/11/2024 18:31'
}
MWMealCleanerTest >> brokenPriceMeal [
	
	^ MWMeal new name: 'Ich habe nur Gäste';
		category: 'Angebot';
		prices: (Json readFromString: '{"students":null,"employees":null,"pupils":null,"others":7.5}')
]

{
	#category : #meals,
	#'squeak_changestamp' : 'Max 6/11/2024 18:16'
}
MWMealCleanerTest >> brokenSaladBar [

	^ MWMeal new name: 'große Schale\nkleine Schale\nRelevo Schale\n100g Stud. 1,10€/ Gäste 1,60€';
		category: 'Salattheke'
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Max 7/10/2024 20:59'
}
MWMealCleanerTest >> check: aMealList [

	self assert: aMealList first name = 'Salatbar 100 g';
		assert: aMealList first category = 'lunch';
		assert: aMealList second category = MWMealCleaner dinnerCategory;
		assert: (aMealList third prices at: 'students') = 7.5;
		assert: (aMealList third prices at: 'employees') = 7.5;
		assert: (aMealList third prices at: 'pupils') = 7.5
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/12/2024 12:20'
}
MWMealCleanerTest >> testClean [

	| mealList |
	
	mealList := OrderedCollection new 
		add: self brokenSaladBar;
		add: self brokenEveningMeal;
		add: self brokenPriceMeal;
		yourself.
	self check: (MWMealCleaner clean: mealList)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/12/2024 13:56'
}
MWMealCleanerTest >> testEmptyMealList [
	
	| mealList |
	
	mealList := MWMealCleaner clean: #().
	self assert: mealList size = 1;
		assert: mealList first name = 'Hier gibt es nichts zu sehen.';
		assert: mealList first category isNil;
		assert: mealList first prices = MWMealCleaner emptyPrice;
		assert: mealList first notes isNil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 7/10/2024 20:38'
}
MWMealCleanerTest >> testFixPrice [

	| meal |
	
	meal := self brokenPriceMeal.
	MWMealCleaner fixPrices: meal.
	self assert: (meal prices at: 'students') = 7.5;
		assert: (meal prices at: 'employees') = 7.5;
		assert: (meal prices at: 'pupils') = 7.5
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 7/10/2024 20:46'
}
MWMealCleanerTest >> testHotCounter [

 	| meal |
	
	meal := self brokenHotCounter.
	meal := MWMealCleaner fixMeal: meal.
	self assert: meal name = 'Heiße Theke 100 g';
		assert: meal category = 'lunch';
		assert: meal notes isNil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 7/10/2024 20:47'
}
MWMealCleanerTest >> testSaladBar [

 	| meal |
	
	meal := self brokenSaladBar.
	meal := MWMealCleaner fixMeal: meal.
	self assert: meal name = 'Salatbar 100 g';
		assert: meal category = 'lunch';
		assert: meal notes isNil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 7/10/2024 20:41'
}
MWMealCleanerTest >> testSetDinnerCategory [

	| meal |
	
	meal := self brokenEveningMeal.
	MWMealCleaner fixCategories: meal.
	self assert: meal category = MWMealCleaner dinnerCategory
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 7/10/2024 20:41'
}
MWMealCleanerTest >> testSetLunchCategory [

	| meal |
	
	meal := self brokenLunchMeal.
	MWMealCleaner fixCategories: meal.
	self assert: meal category = MWMealCleaner lunchCategory
]

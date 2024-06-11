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
	#'squeak_changestamp' : 'Max 6/11/2024 18:38'
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
	#category : #tests,
	#'squeak_changestamp' : 'Max 6/11/2024 18:42'
}
MWMealCleanerTest >> testEmptyMealList [
	
	| mealList |
	mealList := MWMealCleaner clean: #().
	self assert: mealList size = 1;
		assert: mealList first name = 'Hier gibt es nichts zu sehen.';
		assert: mealList first category isNil;
		assert: mealList first notes isNil;
		assert: mealList first prices class = MWPrice
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 6/11/2024 18:35'
}
MWMealCleanerTest >> testFixPrice [

	| mealList |
	
	mealList := MWMealCleaner clean: (OrderedCollection new add: self brokenPriceMeal;
		yourself).
	self assert: mealList first prices students = 7.5;
		assert: mealList first prices employees = 7.5;
		assert: mealList first prices pupils = 7.5
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 6/11/2024 18:36'
}
MWMealCleanerTest >> testHotCounterList [

 	| mealList |
	
	mealList := MWMealCleaner clean: (OrderedCollection new add: self brokenHotCounter; 
		yourself).
	self assert: mealList first name = 'Heiße Theke 100 g';
		assert: mealList first category = 'lunch';
		assert: mealList first notes isNil;
		assert: mealList first prices class = MWPrice
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 6/11/2024 18:36'
}
MWMealCleanerTest >> testSaladBarList [

	| mealList |
	
	mealList := MWMealCleaner clean: (OrderedCollection new add: self brokenSaladBar;
		yourself).
	self assert: mealList first name = 'Salatbar 100 g';
		assert: mealList first category = 'lunch';
		assert: mealList first notes isNil;
		assert: mealList first prices class = MWPrice
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 6/11/2024 18:41'
}
MWMealCleanerTest >> testSetCategory [

	| mealList |
	
	mealList := MWMealCleaner clean: (OrderedCollection new add: self brokenEveningMeal;
		add: self brokenLunchMeal;
		yourself).
	self assert: mealList first category = 'dinner';
		assert: mealList second category = 'lunch'
]

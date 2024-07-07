"
A MWParser is a Parser for JSON data as Strings to a class instance with the same attributes.

Instance Variables
"
Class {
	#name : #MWParser,
	#superclass : #Object,
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Max 5/31/2024 21:55'
}

{
	#category : #parsing,
	#'squeak_changestamp' : 'NK 6/18/2024 21:35'
}
MWParser class >> put: aDataset in: aClass [

	| someDataJson classInstanceList classInstance |
	
	aDataset = '' ifTrue: [^ #()].
	someDataJson := Json readFromString: aDataset.
	classInstanceList := OrderedCollection new.
	someDataJson collect: [:each | 
		classInstance := aClass new.
		aClass instVarNames collect: [:varName |
			self set: varName on: classInstance from: each].
		classInstanceList add: classInstance].
	 ^ classInstanceList
]

{
	#category : #parsing,
	#'squeak_changestamp' : 'Max 5/29/2024 17:18'
}
MWParser class >> set: someInstanceVariable on: aClassInstance from: aDataset [

	| value |
	
	value := aDataset at: someInstanceVariable.
	 ^ aClassInstance instVarNamed: someInstanceVariable put: value
]

{
	#category : #parsing,
	#'squeak_changestamp' : 'Oscar 6/30/2024 18:07'
}
MWParser class >> transformJsonToDict: aJson [

	| someDataJson dict |
	
	aJson = '' ifTrue: [^ #()]. 
	someDataJson := Json readFromString: aJson.  
	dict := Dictionary new.  
	someDataJson do: [:each | 
		dict at: (each at: 'id') put: (each at: 'name')].  
	^ dict  
]

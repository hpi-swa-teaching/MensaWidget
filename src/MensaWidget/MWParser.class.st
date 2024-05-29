"
This class enables parsing data from a String directly into a given class instance.
"
Class {
	#name : #MWParser,
	#superclass : #Object,
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Max 5/29/2024 13:04'
}

{
	#category : #parsing,
	#'squeak_changestamp' : 'Max 5/29/2024 17:18'
}
MWParser class >> put: aDataset in: aClass [

	| someDataJson classInstanceList classInstance |
	
	someDataJson := Json readFromString: aDataset.
	classInstanceList := OrderedCollection new.
	someDataJson collect: [:each | 
		classInstance := aClass new.
		aClass instVarNames collect: [:varName |
			self set: varName on: classInstance from: each.].
		classInstanceList add: classInstance.].
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

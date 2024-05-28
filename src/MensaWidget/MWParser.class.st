Class {
	#name : #MWParser,
	#superclass : #Object,
	#category : #MensaWidget
}

{
	#category : #parsing,
	#'squeak_changestamp' : 'Max 5/28/2024 18:46'
}
MWParser class >> put: someData in: aClass [
	| someDataJson classInstanceList classInstance |
	someDataJson := Json readFromString: someData.
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
	#'squeak_changestamp' : 'Max 5/28/2024 18:34'
}
MWParser class >> set: someInstanceVariable on: aClassInstance from: someData [
	| value |
	value := someData at: someInstanceVariable.
	 ^ aClassInstance instVarNamed: someInstanceVariable put: value
]

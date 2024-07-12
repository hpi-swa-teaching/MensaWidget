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
	#'squeak_changestamp' : 'Max 7/10/2024 20:21'
}
MWParser class >> put: aDataset in: aClass [

	| datasetJson |
	
	aDataset isEmpty ifTrue: [^ #()].
	datasetJson := Json readFromString: aDataset.
	^ self putJSON: datasetJson in: aClass
]

{
	#category : #parsing,
	#'squeak_changestamp' : 'Max 7/10/2024 20:21'
}
MWParser class >> putJSON: aDataset in: aClass [

	| instanceList instance |
	
	instanceList := OrderedCollection new.
	aDataset collect: [:each | 
		instance := aClass new.
		aClass instVarNames collect: [:varName |
			self set: varName on: instance from: each].
		instanceList add: instance].
	 ^ instanceList
]

{
	#category : #parsing,
	#'squeak_changestamp' : 'Max 7/10/2024 20:22'
}
MWParser class >> set: instanceVariable on: anInstance from: aDataset [

	| value |
	
	value := aDataset at: instanceVariable.
	 ^ anInstance instVarNamed: instanceVariable put: value
]

{
	#category : #parsing,
	#'squeak_changestamp' : 'Max 7/10/2024 20:29'
}
MWParser class >> transformJsonToDict: aDataset [

	| dict |
	
	dict := Dictionary new.  
	aDataset do: [:each | 
		dict at: (each at: 'id') put: (each at: 'name')].  
	^ dict  
]

{
	#category : #parsing,
	#'squeak_changestamp' : 'Max 7/10/2024 20:26'
}
MWParser class >> transformToDict: aDataset [

	| datasetJson |

	aDataset isEmpty ifTrue: [^ #()].
	datasetJson := Json readFromString: aDataset.
	^ self transformJsonToDict: datasetJson
	
	
]

"
A MWParser is a Parser for JSON data as Strings to a class instance with the same attributes.
"
Class {
	#name : #MWParser,
	#superclass : #Object,
	#category : #MensaWidget,
	#'squeak_changestamp' : 'LC 7/12/2024 14:04'
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
	#'squeak_changestamp' : 'LC 7/12/2024 13:49'
}
MWParser class >> putJSON: aDataset in: aClass [

	| instance |
	
	^ aDataset collect: [:each | 
		instance := aClass new.
		aClass instVarNames do: [:varName |
			self set: varName on: instance from: each].
		instance]
]

{
	#category : #parsing,
	#'squeak_changestamp' : 'LC 7/12/2024 13:51'
}
MWParser class >> set: instanceVariable on: anInstance from: aDataset [

	 anInstance instVarNamed: instanceVariable 
		put: (aDataset at: instanceVariable)
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

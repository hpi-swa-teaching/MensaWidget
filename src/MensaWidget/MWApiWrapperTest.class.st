Class {
	#name : #MWApiWrapperTest,
	#superclass : #TestCase,
	#instVars : [
		'apiWrapper'
	],
	#classInstVars : [
		'apiWrapper'
	],
	#category : #'MensaWidget-Tests'
}

{
	#category : #environment,
	#'squeak_changestamp' : 'Oscar 5/22/2024 22:54'
}
MWApiWrapperTest >> setUp [
	apiWrapper := MWApiWrapper new 
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Oscar 5/22/2024 22:55'
}
MWApiWrapperTest >> tearDown [
	apiWrapper destroy
]

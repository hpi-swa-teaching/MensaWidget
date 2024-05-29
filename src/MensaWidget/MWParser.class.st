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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'NK 5/29/2024 00:24'
}
MWParser class >> put: someData in: aClass [
	| xyz |
	
	xyz := {1} asOrderedCollection.
	
	^ xyz
]

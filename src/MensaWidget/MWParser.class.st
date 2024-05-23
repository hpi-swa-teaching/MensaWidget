Class {
	#name : #MWParser,
	#superclass : #Object,
	#category : #MensaWidget
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Max 5/23/2024 22:48'
}
MWParser class >> put: data in: class [
	(Smalltalk hasClassNamed: class asString)
		ifFalse: [^ -1].
	  ^ nil
]

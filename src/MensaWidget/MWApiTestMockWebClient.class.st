Class {
	#name : #MWApiTestMockWebClient,
	#superclass : #Object,
	#instVars : [
		'id',
		'name'
	],
	#category : #'MensaWidget-Tests'
}

{
	#category : #http,
	#'squeak_changestamp' : 'Max 6/18/2024 18:31'
}
MWApiTestMockWebClient class >> httpGet: anUrl [

	^ NetworkError new signal
]

"
A MWApiTestMockWebClient is a Mock object that returns a Netowrk Error on every http request.

Instance Variables

"
Class {
	#name : #MWApiTestMockWebClient,
	#superclass : #Object,
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Max 6/19/2024 08:40'
}

{
	#category : #http,
	#'squeak_changestamp' : 'Max 6/18/2024 18:31'
}
MWApiTestMockWebClient class >> httpGet: anUrl [

	^ NetworkError new signal
]

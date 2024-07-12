"
A MWApiTestMockWebClient is a Mock object that returns a Netowrk Error on every http request.


"
Class {
	#name : #MWApiTestMockWebClient,
	#superclass : #Object,
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'LC 7/12/2024 14:05'
}

{
	#category : #http,
	#'squeak_changestamp' : 'Max 6/18/2024 18:31'
}
MWApiTestMockWebClient class >> httpGet: anUrl [

	^ NetworkError new signal
]

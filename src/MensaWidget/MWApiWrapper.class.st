"
A MWApiWrapper is a wrapper around the api call which stores the endpoint end call url. 

Instance Variables

"
Class {
	#name : #MWApiWrapper,
	#superclass : #Object,
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Oscar 6/2/2024 12:56'
}

{
	#category : #openMensa,
	#'squeak_changestamp' : 'Oscar 5/31/2024 19:55'
}
MWApiWrapper class >> baseEndpoint [

 	^ 'https://openmensa.org/api/v2'
]

{
	#category : #openMensa,
	#'squeak_changestamp' : 'Oscar 5/31/2024 19:55'
}
MWApiWrapper class >> mealsPostfix [

	^ '/canteens/{1}/days/{2}/meals'
]

{
	#category : #call,
	#'squeak_changestamp' : 'Oscar 5/31/2024 19:53'
}
MWApiWrapper >> getMealsFrom: anOutletId on: aDate [
	"The two attributes need to be a string"
	
	| url response |
	
	url := self class baseEndpoint, self class mealsPostfix.
	url := url format: {anOutletId. aDate}.
	response := WebClient httpGet: url.
	^ response content
	
]

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
	#category : #constants,
	#'squeak_changestamp' : 'Max 6/18/2024 10:35'
}
MWApiWrapper class >> NetworkErrorResponse [

	^ '[{"name":"Es ist ein Netzwerkfehler aufgetreten"}]'
]

{
	#category : #openMensa,
	#'squeak_changestamp' : 'Oscar 5/31/2024 19:55'
}
MWApiWrapper class >> baseEndpoint [

 	^ 'https://openmensa.org/api/v2'
]

{
	#category : #call,
	#'squeak_changestamp' : 'Max 6/18/2024 10:34'
}
MWApiWrapper class >> getMealsFrom: anOutletId on: aDate [
	"The two attributes need to be a string"
	
	| url response |
	
	url := self baseEndpoint, self mealsPostfix.
	url := url format: {anOutletId. aDate}.
	[response := WebClient httpGet: url] on: NetworkError do: [
		^ self NetworkErrorResponse]. 
	^ response content
	
]

{
	#category : #openMensa,
	#'squeak_changestamp' : 'Oscar 5/31/2024 19:55'
}
MWApiWrapper class >> mealsPostfix [

	^ '/canteens/{1}/days/{2}/meals'
]

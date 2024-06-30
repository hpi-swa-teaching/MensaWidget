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
	#'squeak_changestamp' : 'Max 6/18/2024 22:08'
}
MWApiWrapper class >> getMealsFrom: anOutletId on: aDate using: aWebClient [
	"The two attributes need to be a string"
	
	| url response |
	
	url := self baseEndpoint, self mealsPostfix.
	url := url format: {anOutletId. aDate}.
	[response := aWebClient httpGet: url] on: NetworkError do: [^ self NetworkErrorResponse].
	^ response content
	
]

{
	#category : #call,
	#'squeak_changestamp' : 'Oscar 6/30/2024 17:57'
}
MWApiWrapper class >> getOutletDictFrom: alatitude and: alongitude andRadius: aKM [
	
	| url response |
	
	url := self baseEndpoint, self locationPostfix.
	url := url format: {alatitude. alongitude. aKM}.
	[response := WebClient httpGet: url] on: NetworkError do: [^ self NetworkErrorResponse].
	^ response content
]

{
	#category : #openMensa,
	#'squeak_changestamp' : 'Oscar 6/30/2024 17:51'
}
MWApiWrapper class >> locationPostfix [

	^ '/canteens?near[lat]={1}&near[lng]={2}&near[dist]={3}'
]

{
	#category : #openMensa,
	#'squeak_changestamp' : 'Oscar 5/31/2024 19:55'
}
MWApiWrapper class >> mealsPostfix [

	^ '/canteens/{1}/days/{2}/meals'
]

Class {
	#name : #MWApiWrapper,
	#superclass : #Object,
	#category : #MensaWidget
}

{
	#category : #openMensa,
	#'squeak_changestamp' : 'Oscar 5/24/2024 10:51'
}
MWApiWrapper class >> baseEndpoint [
 	^ 'https://openmensa.org/api/v2'
]

{
	#category : #openMensa,
	#'squeak_changestamp' : 'Oscar 5/26/2024 15:47'
}
MWApiWrapper class >> mealsPostfix [
	^ '/canteens/{1}/days/{2}/meals'
]

{
	#category : #call,
	#'squeak_changestamp' : 'Oscar 5/26/2024 15:47'
}
MWApiWrapper >> getMealsFrom: anOutletId on: aDate [
	"The two attributes need to be a string"
	
	| url response |
	url := self class baseEndpoint, self class mealsPostfix.
	url := url format: {anOutletId. aDate}.
	response := WebClient httpGet: url.
	^ (response content)
	
]

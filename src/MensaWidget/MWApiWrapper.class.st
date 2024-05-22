Class {
	#name : #MWApiWrapper,
	#superclass : #Object,
	#category : #MensaWidget
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Oscar 5/22/2024 20:53'
}
MWApiWrapper class >> baseEndpoint [
 	^'https://openmensa.org/api/v2'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Oscar 5/22/2024 21:12'
}
MWApiWrapper class >> mealsPostfix [
	^'/canteens/{canteen_id}/days/{date}/meals'
]

{
	#category : #call,
	#'squeak_changestamp' : 'Oscar 5/22/2024 23:00'
}
MWApiWrapper >> getMealsFrom: anOutletId on: aDate [
	"The two attributes need to be a string"
	
	| url response |
	url := self class baseEndpoint, self class mealsPostfix.
	url := url copyReplaceAll: '{canteen_id}' with: anOutletId.
	url := url copyReplaceAll: '{date}' with: aDate.
	response := WebClient httpGet: url.
	^ (response content)
	
]

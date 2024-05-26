Class {
	#name : #MWApiWrapperTest,
	#superclass : #TestCase,
	#instVars : [
		'apiWrapper'
	],
	#classInstVars : [
		'apiWrapper'
	],
	#category : #'MensaWidget-Tests'
}

{
	#category : #environment,
	#'squeak_changestamp' : 'Oscar 5/22/2024 22:54'
}
MWApiWrapperTest >> setUp [
	apiWrapper := MWApiWrapper new 
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Oscar 5/26/2024 09:26'
}
MWApiWrapperTest >> tearDown [
	apiWrapper  := nil. 
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Oscar 5/26/2024 16:17'
}
MWApiWrapperTest >> testApiCallWithInvalidUrl [
    | responseWrapper errorOccurred |
    errorOccurred := false.
    [
        responseWrapper := apiWrapper getMealsFrom: '404' on: '2002-05-06'.
    ] on: NetworkError do: [ :ex |
        errorOccurred := true.
    ].
    self assert: (responseWrapper = '' or: errorOccurred).

]

{
	#category : #tests,
	#'squeak_changestamp' : 'Oscar 5/26/2024 16:17'
}
MWApiWrapperTest >> testApiCallWithValidUrl [
    | responseWrapper responseApi errorOccurred |
    errorOccurred := false.
    [
        responseWrapper := apiWrapper getMealsFrom: '62' on: '2024-05-06'.
        responseApi := WebClient httpGet: 'https://openmensa.org/api/v2/canteens/62/days/2024-05-06/meals'.
    ] on: NetworkError do: [ :ex |
        errorOccurred := true.
    ].
    self assert: ((errorOccurred) or: [responseApi content = responseWrapper]).

	
	
]

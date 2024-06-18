"
A MWApiWrapperTest is class that is used to test the functionality of the MWApiWrapper.

Instance Variables
	apiWrapper:		<MWApiWrapper>

apiWrapper
	- A MWApiWrapper intances that is used for testing purposes

"
Class {
	#name : #MWApiWrapperTest,
	#superclass : #TestCase,
	#classInstVars : [
		'apiWrapper'
	],
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Louis Christ 6/3/2024 09:06'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Oscar 6/2/2024 15:37'
}
MWApiWrapperTest class >> invalidDate [

	^ '2002-05-06' 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Oscar 6/2/2024 15:36'
}
MWApiWrapperTest class >> invalidMensaId [

	^ '404' 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Oscar 6/2/2024 15:38'
}
MWApiWrapperTest class >> validApiUrl [

	^ 'https://openmensa.org/api/v2/canteens/62/days/2024-05-06/meals'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Oscar 6/2/2024 15:37'
}
MWApiWrapperTest class >> validDate [

	^ '2024-05-06' 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Oscar 6/2/2024 15:36'
}
MWApiWrapperTest class >> validMensaId [

	^ '62' 
]

{
	#category : #tests,
	#'squeak_changestamp' : 'NK 6/18/2024 21:44'
}
MWApiWrapperTest >> testApiCallWithInvalidUrl [

    | responseWrapper errorOccurred |

    errorOccurred := false.
    [responseWrapper := MWApiWrapper getMealsFrom: self class invalidMensaId on: self class invalidDate.
    ] on: NetworkError do: [:ex |
        errorOccurred := true].
    self assert: (responseWrapper = '' or: errorOccurred).

]

{
	#category : #tests,
	#'squeak_changestamp' : 'NK 6/18/2024 21:45'
}
MWApiWrapperTest >> testApiCallWithValidUrl [

    | responseWrapper responseApi errorOccurred |

    errorOccurred := false.
    [responseWrapper := MWApiWrapper getMealsFrom: self class validMensaId on: self class validDate.
    responseApi := WebClient httpGet: self class validApiUrl.
    ] on: NetworkError do: [:ex |
        errorOccurred := true ].
    self assert: (errorOccurred or: [responseApi content = responseWrapper]).

	
	
]

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
	#category : #environment,
	#'squeak_changestamp' : 'Oscar 5/31/2024 19:55'
}
MWApiWrapperTest >> setUp [

	apiWrapper := MWApiWrapper new 
]

{
	#category : #environment,
	#'squeak_changestamp' : 'Oscar 6/2/2024 12:58'
}
MWApiWrapperTest >> tearDown [

	apiWrapper  := nil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Oscar 6/2/2024 15:39'
}
MWApiWrapperTest >> testApiCallWithInvalidUrl [

    | responseWrapper errorOccurred |

    errorOccurred := false.
    [ responseWrapper := apiWrapper getMealsFrom: self class invalidMensaId on: self class invalidDate.
    ] on: NetworkError do: [ :ex |
        errorOccurred := true ].
    self assert: (responseWrapper = '' or: errorOccurred).

]

{
	#category : #tests,
	#'squeak_changestamp' : 'Oscar 6/2/2024 15:44'
}
MWApiWrapperTest >> testApiCallWithValidUrl [

    | responseWrapper responseApi errorOccurred |

    errorOccurred := false.
    [ responseWrapper := apiWrapper getMealsFrom: self class validMensaId on: self class validDate.
    responseApi := WebClient httpGet: self class validApiUrl.
    ] on: NetworkError do: [ :ex |
        errorOccurred := true ].
    self assert: ( errorOccurred or: [responseApi content = responseWrapper]).

	
	
]

"
A MWApiWrapperTest is class that is used to test the functionality of the MWApiWrapper.

"
Class {
	#name : #MWApiWrapperTest,
	#superclass : #TestCase,
	#classInstVars : [
		'apiWrapper'
	],
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'LC 7/12/2024 14:05'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'Oscar 6/2/2024 15:37'
}
MWApiWrapperTest class >> invalidDate [

	^ '2002-05-06' 
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Oscar 6/2/2024 15:36'
}
MWApiWrapperTest class >> invalidMensaId [

	^ '404' 
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Oscar 6/2/2024 15:38'
}
MWApiWrapperTest class >> validApiUrl [

	^ 'https://openmensa.org/api/v2/canteens/62/days/2024-05-06/meals'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Oscar 6/2/2024 15:37'
}
MWApiWrapperTest class >> validDate [

	^ '2024-05-06' 
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Oscar 6/2/2024 15:36'
}
MWApiWrapperTest class >> validMensaId [

	^ '62' 
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/12/2024 11:59'
}
MWApiWrapperTest >> testApiCallWithInvalidUrl [

    	| responseWrapper errorOccurred |

    	errorOccurred := false.
	[responseWrapper := MWApiWrapper getMealsFrom: self class invalidMensaId 
		on:self class invalidDate 
		using: WebClient] 
		on: NetworkError 
		do: [:ex | errorOccurred := true].
	self assert: (responseWrapper isEmpty or: errorOccurred)

]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/12/2024 11:57'
}
MWApiWrapperTest >> testApiCallWithValidUrl [

    	| responseWrapper responseApi errorOccurred |

    	errorOccurred := false.
    	[responseWrapper := MWApiWrapper getMealsFrom: self class validMensaId 
		on: self class validDate 
		using: WebClient.
    	responseApi := WebClient httpGet: self class validApiUrl] 
		on: NetworkError 
		do: [:ex | errorOccurred := true].
   	self assert: (errorOccurred or: [responseApi content = responseWrapper])

	
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'LC 7/12/2024 11:59'
}
MWApiWrapperTest >> testApiCallWithoutNetwork [

	| result |
	
	result := MWApiWrapper getMealsFrom: '62' on: '2024-06-18' 
		using: MWApiTestMockWebClient.
	self assert: result = MWApiWrapper NetworkErrorResponse

	

	
	
]

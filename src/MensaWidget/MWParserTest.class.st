Class {
	#name : #MWParserTest,
	#superclass : #TestCase,
	#category : #'MensaWidget-Tests'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 5/28/2024 18:21'
}
MWParserTest class >> multipleJSONs [
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 5/28/2024 18:42'
}
MWParserTest class >> simpleJSON [
	^ '[{"id":19500904,"name":"testName"}]'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Max 5/28/2024 18:16'
}
MWParserTest >> setUp [
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Max 5/28/2024 18:16'
}
MWParserTest >> tearDown [
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Max 5/28/2024 18:38'
}
MWParserTest >> testMWParserSetOnFromInvalidData [
	| data  mockInstance|
	data := Json readFromString: '{"idx":19500904,"namep":"testName"}'.
	mockInstance := MWParserTestMockObject new.
	MWParser set: 'id' on: mockInstance from: data.
	MWParser set: 'name' on: mockInstance from: data.
	self assert: mockInstance id isNil.
	self assert: mockInstance name isNil
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Max 5/28/2024 18:37'
}
MWParserTest >> testMWParserSetOnFromValidData [
	| data  mockInstance|
	data := Json readFromString: '{"id":19500904,"name":"testName"}'.
	mockInstance := MWParserTestMockObject new.
	MWParser set: 'id' on: mockInstance from: data.
	MWParser set: 'name' on: mockInstance from: data.
	self assert: mockInstance id = 19500904.
	self assert: mockInstance name = 'testName'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Max 5/28/2024 18:51'
}
MWParserTest >> testMWParserSetOnFromValidExtensiveData [
	| data  mockInstance|
	data := Json readFromString: '{"id":19500904,"name":"testName", "property3":42}'.
	mockInstance := MWParserTestMockObject new.
	MWParser set: 'id' on: mockInstance from: data.
	MWParser set: 'name' on: mockInstance from: data.
	self assert: mockInstance id = 19500904.
	self assert: mockInstance name = 'testName'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Max 5/28/2024 18:51'
}
MWParserTest >> testMWParserWithMultipleJSONObjects [
	| instanceList |
	instanceList := MWParser put:  '[{"id":19500904,"name":"testName"}, {"id":25, "name": "anotherName", "property3":42}]' in: MWParserTestMockObject.
	self assert: instanceList first id = 19500904.
	self assert: instanceList first name = 'testName'.
	self assert: (instanceList at: 2) id = 25.
	self assert: (instanceList at: 2) name = 'anotherName'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Max 5/28/2024 18:44'
}
MWParserTest >> testMWParserWithOneJSONObject [
	| instanceList |
	instanceList := MWParser put:  '[{"id":19500904,"name":"testName"}]' in: MWParserTestMockObject.
	self assert: instanceList first id = 19500904.
	self assert: instanceList first name = 'testName'
]

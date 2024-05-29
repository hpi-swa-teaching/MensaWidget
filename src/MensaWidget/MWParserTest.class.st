"
A MWParserTest2 is a testcase for the functionality of the MWParser.

Instance Variables

"
Class {
	#name : #MWParserTest,
	#superclass : #TestCase,
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Max 5/29/2024 19:52'
}

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 5/29/2024 14:06'
}
MWParserTest >> testMWParserSetOnFromInvalidData [

	| data  mockInstance |
	
	data := Json readFromString: '{"idx":19500904,"namep":"testName"}'.
	mockInstance := MWParserTestMockObject new.
	MWParser set: 'id' on: mockInstance from: data;
		set: 'name' on: mockInstance from: data.
	self assert: mockInstance id isNil;
		assert: mockInstance name isNil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 5/29/2024 14:06'
}
MWParserTest >> testMWParserSetOnFromValidData [

	| data  mockInstance |
	
	data := Json readFromString: '{"id":19500904,"name":"testName"}'.
	mockInstance := MWParserTestMockObject new.
	MWParser set: 'id' on: mockInstance from: data;
		set: 'name' on: mockInstance from: data.
	self assert: mockInstance id = 19500904;
		assert: mockInstance name = 'testName'
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 5/29/2024 18:15'
}
MWParserTest >> testMWParserSetOnFromValidExtensiveData [

	| data  mockInstance |
	
	data := Json readFromString: '{"id":19500904,"name":"testName", "property3":42}'.
	mockInstance := MWParserTestMockObject new.
	MWParser set: 'id' on: mockInstance from: data;
		set: 'name' on: mockInstance from: data.
	self assert: mockInstance id = 19500904;
		assert: mockInstance name = 'testName'
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 5/29/2024 14:07'
}
MWParserTest >> testMWParserWithMultipleJSONObjects [

	| instanceList |
	
	instanceList := MWParser put:  '[{"id":19500904,"name":"testName"}, {"id":25, "name": "anotherName", "property3":42}]' in: MWParserTestMockObject.
	self assert: instanceList first id = 19500904;
		assert: instanceList first name = 'testName';
		assert: (instanceList at: 2) id = 25;
		assert: (instanceList at: 2) name = 'anotherName'
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 5/29/2024 14:08'
}
MWParserTest >> testMWParserWithOneJSONObject [

	| instanceList |
	
	instanceList := MWParser put:  '[{"id":19500904,"name":"testName"}]' in: MWParserTestMockObject.
	self assert: instanceList first id = 19500904;
		assert: instanceList first name = 'testName'
]

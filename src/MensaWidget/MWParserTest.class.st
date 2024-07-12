"
A MWParserTest is a testcase for the functionality of the MWParser.

Instance Variables

"
Class {
	#name : #MWParserTest,
	#superclass : #TestCase,
	#category : #'MensaWidget-Tests',
	#'squeak_changestamp' : 'Max 5/31/2024 21:55'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 7/10/2024 21:32'
}
MWParserTest >> invalidData [

	^ '{"idx":19500904,"namep":"testName"}'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 7/10/2024 21:33'
}
MWParserTest >> multipleData [

	^ '[{"id":19500904,"name":"testName"}, {"id":25, "name": "anotherName", "property3":42}]'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 7/10/2024 21:34'
}
MWParserTest >> singleData [

	^ '[{"id":19500904,"name":"testName"}]'
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 7/10/2024 21:32'
}
MWParserTest >> testMWParserSetOnFromInvalidData [

	| data  mockInstance |
	
	data := Json readFromString: self invalidData.
	mockInstance := MWParserTestMockObject new.
	MWParser set: 'id' on: mockInstance from: data;
		set: 'name' on: mockInstance from: data.
	self assert: mockInstance id isNil;
		assert: mockInstance name isNil
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 7/10/2024 21:32'
}
MWParserTest >> testMWParserSetOnFromValidData [

	| data  mockInstance |
	
	data := Json readFromString: self validData.
	mockInstance := MWParserTestMockObject new.
	MWParser set: 'id' on: mockInstance from: data;
		set: 'name' on: mockInstance from: data.
	self assert: mockInstance id = 19500904;
		assert: mockInstance name = 'testName'
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 7/10/2024 21:33'
}
MWParserTest >> testMWParserSetOnFromValidExtensiveData [

	| data  mockInstance |
	
	data := Json readFromString: self validExtensiveData.
	mockInstance := MWParserTestMockObject new.
	MWParser set: 'id' on: mockInstance from: data;
		set: 'name' on: mockInstance from: data.
	self assert: mockInstance id = 19500904;
		assert: mockInstance name = 'testName'
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 7/10/2024 21:33'
}
MWParserTest >> testMWParserWithMultipleJSONObjects [

	| instanceList |
	
	instanceList := MWParser put: self multipleData in: MWParserTestMockObject.
	self assert: instanceList first id = 19500904;
		assert: instanceList first name = 'testName';
		assert: (instanceList at: 2) id = 25;
		assert: (instanceList at: 2) name = 'anotherName'
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Max 7/10/2024 21:34'
}
MWParserTest >> testMWParserWithOneJSONObject [

	| instanceList |
	
	instanceList := MWParser put: self singleData in: MWParserTestMockObject.
	self assert: instanceList first id = 19500904;
		assert: instanceList first name = 'testName'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 7/10/2024 21:32'
}
MWParserTest >> validData [

	^ '{"id":19500904,"name":"testName"}'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Max 7/10/2024 21:33'
}
MWParserTest >> validExtensiveData [

	^ '{"id":19500904,"name":"testName", "property3":42}'
]

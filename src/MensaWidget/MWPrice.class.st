Class {
	#name : #MWPrice,
	#superclass : #Object,
	#instVars : [
		'students',
		'employees',
		'others',
		'pupils'
	],
	#category : #MensaWidget
}

{
	#category : #prices,
	#'squeak_changestamp' : 'Max 6/10/2024 20:00'
}
MWPrice class >> emptyPrice [

	^ MWPrice new students: nil;
		employees: nil;
		others: nil;
		pupils: nil
]

{
	#category : #prices,
	#'squeak_changestamp' : 'Max 6/10/2024 20:00'
}
MWPrice class >> hotCounterPrice [

	^ MWPrice new students: 0.60;
		employees: 0.60;
		others: 1.10;
		pupils: 0.60
]

{
	#category : #prices,
	#'squeak_changestamp' : 'Max 6/10/2024 20:00'
}
MWPrice class >> saladBarPrice [

	^ MWPrice new students: 1.10;
		employees: 1.10;
		others: 1.60;
		pupils: 1.10
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 6/10/2024 18:47'
}
MWPrice >> employees [
	^ employees
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 6/10/2024 18:47'
}
MWPrice >> employees: anObject [
	employees := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 6/10/2024 18:47'
}
MWPrice >> others [
	^ others
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 6/10/2024 21:03'
}
MWPrice >> others: anObject [
	others := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 6/10/2024 18:47'
}
MWPrice >> pupils [
	^ pupils
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 6/10/2024 18:47'
}
MWPrice >> pupils: anObject [
	pupils := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 6/10/2024 19:34'
}
MWPrice >> students [
	^ students
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 6/10/2024 19:34'
}
MWPrice >> students: anObject [
	students := anObject
]

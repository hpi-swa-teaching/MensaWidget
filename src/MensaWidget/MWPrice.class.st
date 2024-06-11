"
A MWPrice is an Object to store price information about a MWMeal in.

Instance Variables
	employees:		<Number>
	others:		<Number>
	pupils:		<Number>
	students:		<Number>

employees
	- the price for employees provided by the openMensa-API

others
	- the price for guests provided by the openMensa-API

pupils
	- the price for pupils provided by the openMensa-API

students
	- the price for students provided by the openMensa-API

"
Class {
	#name : #MWPrice,
	#superclass : #Object,
	#instVars : [
		'students',
		'employees',
		'others',
		'pupils'
	],
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Max 6/11/2024 10:42'
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
	#'squeak_changestamp' : 'Max 6/11/2024 10:38'
}
MWPrice >> employees [

	^ employees
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 6/11/2024 10:38'
}
MWPrice >> employees: anObject [

	employees := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 6/11/2024 10:38'
}
MWPrice >> others [

	^ others
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 6/11/2024 10:38'
}
MWPrice >> others: anObject [

	others := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 6/11/2024 10:38'
}
MWPrice >> pupils [

	^ pupils
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 6/11/2024 10:38'
}
MWPrice >> pupils: anObject [

	pupils := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 6/11/2024 10:38'
}
MWPrice >> students [

	^ students
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Max 6/11/2024 10:38'
}
MWPrice >> students: anObject [

	students := anObject
]

"
A MWColorTheme is a class that stores the colors for the widget centrally.

Instance Variables

"
Class {
	#name : #MWColorTheme,
	#superclass : #Object,
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Louis Christ 6/10/2024 17:47'
}

{
	#category : #colors,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 17:47'
}
MWColorTheme class >> backgroundColor [

	^ Color r: 0.8 g: 1 b: 0.8
]

{
	#category : #colors,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 17:45'
}
MWColorTheme class >> defaultColor [

	^ Color darkGray
]

{
	#category : #colors,
	#'squeak_changestamp' : 'Louis Christ 6/18/2024 17:46'
}
MWColorTheme class >> primaryColor [
	
	^ Color paleGreen darker darker
]

{
	#category : #colors,
	#'squeak_changestamp' : 'Louis Christ 6/19/2024 01:06'
}
MWColorTheme class >> secondaryColor [

	^ Color fern lighter
]

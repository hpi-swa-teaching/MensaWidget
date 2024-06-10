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
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 16:19'
}
MWColorTheme class >> backgroundColor [

	^ Color darkGray
]

{
	#category : #colors,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 16:26'
}
MWColorTheme class >> primaryColor [

	^ Color paleGreen darker darker
]

{
	#category : #colors,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 16:26'
}
MWColorTheme class >> secondaryColor [

	^  Color fern lighter
]

{
	#category : #colors,
	#'squeak_changestamp' : 'Louis Christ 6/10/2024 17:41'
}
MWColorTheme class >> transparentColor [

	^  Color transparent
]

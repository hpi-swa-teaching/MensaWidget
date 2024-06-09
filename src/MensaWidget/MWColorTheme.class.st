Class {
	#name : #MWColorTheme,
	#superclass : #Object,
	#category : #MensaWidget
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
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 16:20'
}
MWColorTheme class >> primaryColor [

	^ Color fern lighter
]

{
	#category : #colors,
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 16:20'
}
MWColorTheme class >> secondaryColor [

	^ Color paleGreen darker darker
]

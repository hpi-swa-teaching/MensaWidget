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

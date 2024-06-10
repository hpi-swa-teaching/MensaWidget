Class {
	#name : #MWFontLoader,
	#superclass : #Object,
	#category : #MensaWidget
}

{
	#category : #'font loading',
	#'squeak_changestamp' : 'Max 6/10/2024 18:42'
}
MWFontLoader class >> loadFallbackFont [

	TextStyle setDefaultFallback: (TTCFont newTextStyleFromTT:  (TTFontReader readFrom: ((GitAssetLoader for: 'MensaWidget') loadAsset: '/fonts/eurosign-fallback.ttf') 		readStream) first).
	TextStyle installDefaultFallbackTextStyle
]

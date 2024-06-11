"
A MWFontLoader is a tool for loading a fallback font that includes Unicode character U+20AC, the eurosign.

Instance Variables

"
Class {
	#name : #MWFontLoader,
	#superclass : #Object,
	#category : #MensaWidget,
	#'squeak_changestamp' : 'Max 6/11/2024 20:42'
}

{
	#category : #'font loading',
	#'squeak_changestamp' : 'Max 6/11/2024 18:50'
}
MWFontLoader class >> fontAsset [

	^ (GitAssetLoader for: 'MensaWidget') loadAsset: '/fonts/eurosign-fallback.ttf'
]

{
	#category : #'font loading',
	#'squeak_changestamp' : 'Max 6/11/2024 18:58'
}
MWFontLoader class >> loadFallbackFont [
	
	| fontReader font |
	
	fontReader := TTFontReader readFrom: self fontAsset readStream.
	font := TTCFont newTextStyleFromTT: fontReader first.
	TextStyle setDefaultFallback: font.	
	TextStyle installDefaultFallbackTextStyle
]

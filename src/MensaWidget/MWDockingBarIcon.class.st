Class {
	#name : #MWDockingBarIcon,
	#superclass : #Object,
	#category : #MensaWidget
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'NK 6/3/2024 16:48'
}
MWDockingBarIcon class >> createIcon [

	| textMorph |

	textMorph := StringMorph new.
	textMorph contents: 'abc'.
	textMorph color: Color black.
	^ textMorph
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'NK 6/3/2024 17:10'
}
MWDockingBarIcon class >> createItem [

| dockingBarItem textMorph |

textMorph := MWDockingBarIcon createIcon.

textMorph on: #mouseUp send: #myAction to: MWDockingBarIcon new myAction.

"Add the text to the DockingBar"
dockingBarItem := DockingBarItemMorph new.
dockingBarItem selectedIcon: textMorph.
dockingBarItem drawIconOn: TheWorldMainDockingBar.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'NK 6/3/2024 17:18'
}
MWDockingBarIcon >> myAction [
	
	MWFrame new initialize.
]

Extension { #name : #TheWorldMainDockingBar }

{
	#category : #'*MensaWidget-override',
	#'squeak_changestamp' : 'Louis Christ 6/8/2024 14:17'
}
TheWorldMainDockingBar >> mensaMenuOn: aDockingBar [
	"Create a menu with the options for MensaWidget"

	aDockingBar addItem: [:item |
		item icon: ((GitAssetLoader for: 'MensaWidget') loadForm: '/icons/mensa_icon.png');
			addSubMenu: [:menu | 
				menu addItem: [:item1 |
						item1 contents: 'Potsdam' translated;
							help: 'open mensa widget' translated;
							target: self;
							selector: #openMensaWidget].
				menu addItem: [:item2 |
						item2 contents: 'Other citys' translated;
							help: 'open mensa widget location picker' translated;
							target: self].
				menu addItem: [:item3 |
						item3 contents: 'Settings' translated;
							help: 'open mensa widget settings' translated;
							target: self]]]

]

{
	#category : #'*MensaWidget-override',
	#'squeak_changestamp' : 'Louis Christ 6/8/2024 14:04'
}
TheWorldMainDockingBar >> menusOn: aDockingBar [

	self class showMainMenuInWorldMainDockingBar ifTrue: [
		self squeakMenuOn: aDockingBar].

	self class showProjectsMenuInWorldMainDockingBar ifTrue: [
		self projectsMenuOn: aDockingBar].

	self class showToolsMenuInWorldMainDockingBar ifTrue: [
		self toolsMenuOn: aDockingBar].

	self class showAppsMenuInWorldMainDockingBar ifTrue: [
		self appsMenuOn: aDockingBar].

	self class showDoMenuInWorldMainDockingBar ifTrue: [
		self doMenuOn: aDockingBar].

	self class showExtrasMenuInWorldMainDockingBar ifTrue: [
		self extrasMenuOn: aDockingBar].

	self class showWindowsMenuInWorldMainDockingBar ifTrue: [
		self windowsMenuOn: aDockingBar].

	self class showHelpMenuInWorldMainDockingBar ifTrue: [
		self helpMenuOn: aDockingBar].
	
	self class showMensaMenuInWorldMainDockingBar ifTrue: [
		self mensaMenuOn: aDockingBar].
]

{
	#category : #'*MensaWidget-override',
	#'squeak_changestamp' : 'Louis Christ 6/4/2024 14:28'
}
TheWorldMainDockingBar >> openMensaWidget [
	"Update the apps list in the menu"

	MWFrame new openInWorld.

]

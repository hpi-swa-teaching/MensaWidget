Extension { #name : #TheWorldMainDockingBar }

{
	#category : #'*MensaWidget-override',
	#'squeak_changestamp' : 'Louis Christ 6/4/2024 15:20'
}
TheWorldMainDockingBar >> mensaMenuOn: aDockingBar [
	"Create a menu with the registered apps"

	aDockingBar addItem: [ :item |
		item
			contents: '';
			icon: ((GitAssetLoader for: 'MensaWidget') loadForm: '/icons/mensa_icon.png');
			addSubMenu: [ :menu | 
				menu addItem: [:itemy |
						itemy
							contents: 'Potsdam' translated;
							help: 'open mensa widget' translated;
							target: self;
							selector: #openMensaWidget].
				menu addItem: [:itemy |
						itemy
							contents: 'Other citys' translated;
							help: 'open mensa widget location picker' translated;
							target: self";
							selector: #openMensaWidget"].
				menu addItem: [:itemy |
						itemy
							contents: 'Setting' translated;
							help: 'open mensa widget settings' translated;
							target: self";
							selector: #openMensaWidget"]]]

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

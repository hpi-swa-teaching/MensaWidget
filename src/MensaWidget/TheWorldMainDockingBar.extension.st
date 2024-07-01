Extension { #name : #TheWorldMainDockingBar }

{
	#category : #'*MensaWidget-override',
	#'squeak_changestamp' : 'Oscar 7/1/2024 16:11'
}
TheWorldMainDockingBar >> mensaMenuOn: aDockingBar [
	"Create a menu with the options for MensaWidget"

	aDockingBar addItem: [:item |
		item icon: ((GitAssetLoader for: 'MensaWidget') loadForm: '/icons/mensa_icon.png');
			name: 'MensaMenu';
			addSubMenu: [:menu | 
				menu addItem: [:menuItem |
					menuItem contents: 'Potsdam' translated;
						help: 'open mensa widget' translated;
						target: self;
						selector: #openMensaWidget].
				menu addItem: [:menuItem |
					menuItem contents: 'Other citys' translated;
						help: 'open mensa widget location picker' translated;
						target: self;
						selector: #openMensaWidgetWithLocationChoice].
				menu addItem: [:menuItem |
					menuItem contents: 'Settings' translated;
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
	#'squeak_changestamp' : 'Oscar 7/1/2024 16:36'
}
TheWorldMainDockingBar >> openMensaWidget [
	"Open the mensa widget"
	
	MWDataGettingWrapper switchToDefaultLocation.
	^ MWFrame new

]

{
	#category : #'*MensaWidget-override',
	#'squeak_changestamp' : 'Oscar 7/1/2024 16:38'
}
TheWorldMainDockingBar >> openMensaWidgetWithLocationChoice [
	"Open the mensa widget"
	
	self halt.
	MWDataGettingWrapper switchLocation.
	^ MWFrame new

]

{
	#category : #'*MensaWidget-override',
	#'squeak_changestamp' : 'Louis Christ 6/9/2024 15:12'
}
TheWorldMainDockingBar class >> showMensaMenuInWorldMainDockingBar [
	
	<preference: 'Show ''Mensa'' menu in world main docking bar'
		category: 'docking bars'
		description: 'Whether world''s main docking bar should show the ''Mensa'' menu.'
		type: #Boolean>
	^ self getMenuPreference: #showMensaMenuInWorldMainDockingBar ifAbsent: [false]

]

{
	#category : #'*MensaWidget-override',
	#'squeak_changestamp' : 'Louis Christ 6/4/2024 14:13'
}
TheWorldMainDockingBar class >> showMensaMenuInWorldMainDockingBar: aBoolean [
	
	self
		setMenuPreference: #showMensaMenuInWorldMainDockingBar
		to: aBoolean.

]

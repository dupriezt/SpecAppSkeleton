Class {
	#name : #SpecAppSkeleton,
	#superclass : #SpPresenter,
	#instVars : [
		'pointTable',
		'textField',
		'executeButton',
		'inspectButton'
	],
	#category : #SpecAppSkeleton
}

{ #category : #specs }
SpecAppSkeleton class >> buttonConstraints [
	"Defines a common constraint to be used for all buttons"
	^ [ :cstr | cstr width: 120. cstr height: 20 ]
	
]

{ #category : #specs }
SpecAppSkeleton class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: (SpPanedLayout newHorizontal
			add: #pointTable;
			add: #textField;
			yourself
		);
		add: (SpBoxLayout newHorizontal
			add: #inspectButton withConstraints: self buttonConstraints;
			add: #executeButton withConstraints: self buttonConstraints;
			yourself	
		) withConstraints: [ :cstr | cstr height: 30 ];
		yourself.
]

{ #category : #specs }
SpecAppSkeleton class >> title [
	^ 'Spec App Skeleton'
]

{ #category : #data }
SpecAppSkeleton >> collectionOfPoints [
	| c |
	c := OrderedCollection new.
	c add: (Point x: 1 y: 5).
	c add: (Point x: 48 y: 1).
	c add: (Point x: 5 y: 6).
	c add: (Point x: 1 y: 48).
	c add: (Point x: 3 y: 92).
	c add: (Point x: 4 y: 67).
	c add: (Point x: 8 y: 5).
	c add: (Point x: 16 y: 22).
	c add: (Point x: 22 y: 21).
	c add: (Point x: 2 y: 31).
	c add: (Point x: 43 y: 2).
	^ c
]

{ #category : #initialization }
SpecAppSkeleton >> connectPresenters [
	"The method connectPresenters defines the interactions between the dif- ferent widgets. By connecting the behaviors of the different widgets it speci- fies the overall presentation, i.e., how the overall UI responds to interactions by the user. Usually this method consists of specifications of actions to per- form when a certain event is received by a widget. The whole interaction flow of the UI then emerges from the propagation of those events."
	inspectButton action: [ self inspectSelectedItem ].
	executeButton action: [ self executeCode ]
]

{ #category : #'button action' }
SpecAppSkeleton >> executeCode [
]

{ #category : #icon }
SpecAppSkeleton >> iconManager [
	"This is where this application gets its icons.
	To see the list of availlable icons, inspect 'Smalltalk ui icons' and click on the 'Icons' tab"
	^ Smalltalk ui icons
]

{ #category : #initialization }
SpecAppSkeleton >> initializePresenters [
	"The method initializePresenters instantiates, saves in instance vari- ables, and partially configures the different widgets that will be part of the UI.
	In general the initializePresenters method should follow the pattern:
		• widget instantiation
		• widget configuration specification
		• specification of focus order"
		
	| indexColumn xColumn yColumn |
	pointTable := self newTable. "SpTablePresenter"
	indexColumn := SpIndexTableColumn new width: 40; title: 'Index'; yourself.
	xColumn := SpStringTableColumn new evaluated: [:item | item x]; title: 'X'; width: 60; yourself.
	yColumn := SpStringTableColumn new evaluated: [:item | item y]; title: 'Y'; width: 60; yourself.
	pointTable addColumn: indexColumn; addColumn: xColumn; addColumn: yColumn.
	pointTable items: self collectionOfPoints.
		
	textField := self newCode. "SpCodePresenter"
	textField placeholder: 'Variable "data" will be bound to the list of points'; autoAccept: true.
	
	inspectButton := self newButton. "SpButtonPresenter"
	inspectButton label: 'Inspect Selected'; icon: (self iconManager iconNamed: #glamorousInspect).
	
	executeButton := self newButton. "SpButtonPresenter"
	executeButton label: 'Execute'; icon: (self iconManager iconNamed: #glamorousGo)..
	
	"I don't know how to do focus order"
]

{ #category : #'button action' }
SpecAppSkeleton >> inspectSelectedItem [
	pointTable selectedItems inspect.
]

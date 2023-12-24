Class {
	#name : #SpDopToolStartPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'buttonInfo',
		'buttonOperationChoice'
	],
	#classInstVars : [
		'anObject'
	],
	#category : #'Connector-Delta-IHM'
}

{ #category : #layout }
SpDopToolStartPresenter >> defaultLayout [
	^ SpGridLayout build: [ :builder | 
		builder
			beColumnHomogeneous;
			beRowHomogeneous;
			borderWidth: 30;
			add: buttonInfo;
			nextRow;
			add: buttonOperationChoice.]
]

{ #category : #initialization }
SpDopToolStartPresenter >> initializePresenters [
	buttonInfo := self newButton
		label: 'Welcome! Click on the button below to select an operation';
		enabled: false;
		yourself.
	buttonOperationChoice := self newButton
		label: 'Choose an operation';
		contextMenu: self subMenu;
		yourself.

	self focusOrder
		add: buttonInfo;
		add: buttonOperationChoice.
]

{ #category : #examples }
SpDopToolStartPresenter >> start [
	^ self open.
]

{ #category : #initialization }
SpDopToolStartPresenter >> subMenu [
	^ self newMenu
	   	addItem: [ :item | 
			item
				name: 'New delta project';
				icon: (self iconNamed: #add);
				action: [ SpCreateDeltaProjectPresenter new start ] ];
			
		addItem: [ :item | 
			item
				name: 'Create a delta module';
				icon: (self iconNamed: #add);
				action: [ SpCreateDeltaModulePresenter new start ] ];

		addItem: [ :item | 
			item
				name: 'Apply a delta module';
				icon: (self iconNamed: #smallProfile);
				action: [ SpApplyDeltaModulePresenter new start ] ];
			
		addItem: [ :item | 
			item
				name: 'Update a delta module';
				icon: (self iconNamed: #smallUpdate);
				action: [ SpUpdateDeltaModulePresenter new start ] ];
			
		addItem: [ :item | 
			item
				name: 'Generate model fro metamodel';
				icon: (self iconNamed: #add);
				action: [ SpModelGeneratorPresenter new start ] ];

			
		addItem: [ :item | 
			item
				name: 'Generate code from model';
				icon: (self iconNamed: #add);
				action: [ SpModelToCodePresenter new start ] ];
			
		addItem: [ :item | 
			item
				name: 'Cancel';
				icon: (self iconNamed: #back);
				action: [ self inform: 'Cancelled back to main menu' ] ];
			
		yourself
]

{ #category : #accessing }
SpDopToolStartPresenter >> title [
	^ 'Welcome to the SPL DOP MDE Tool' 
]

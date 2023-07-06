Class {
	#name : #SpCreateDeltaModulePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'fieldGenerator',
		'fieldEntity',
		'fieldPackage',
		'fieldPrefix',
		'fieldOperation',
		'fieldSuffix',
		'buttonSaveDelta',
		'fieldDeltaName'
	],
	#classInstVars : [
		'anObject'
	],
	#category : #'Connector-Delta-IHM'
}

{ #category : #accessing }
SpCreateDeltaModulePresenter >> buttonSaveDelta [

	^ buttonSaveDelta
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> buttonSaveDelta: anObject [

	buttonSaveDelta := anObject
]

{ #category : #layout }
SpCreateDeltaModulePresenter >> defaultLayout [
	^ SpGridLayout new
		  add: 'Delta name' at: 1 @ 1;
		  add: fieldDeltaName at: 2 @ 1 span: 2 @ 1;
		  add: 'Generator:' at: 1 @ 2;
		  add: fieldGenerator at: 2 @ 2 span: 2 @ 1;
		  add: 'Entity' at: 1 @ 3;
		  add: fieldEntity at: 2 @ 3 span: 2 @ 1;
		  add: 'Package' at: 1 @ 4;
		  add: fieldPackage at: 2 @ 4 span: 2 @ 1;
		  add: 'Prefix' at: 1 @ 5;
		  add: fieldPrefix at: 2 @ 5 span: 2 @ 1;
		  add: 'Operation' at: 1 @ 6;
		  add: fieldOperation at: 2 @ 6 span: 2 @ 1;
		  add: 'Suffix:' at: 1 @ 7;
		  add: fieldSuffix at: 2 @ 7 span: 2 @ 1;
		  add: buttonSaveDelta at: 1 @ 8;
		  beColumnNotHomogeneous;
		  yourself
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldEntity [

	^ fieldEntity
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldEntity: anObject [

	fieldEntity := anObject
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldGenerator [

	^ fieldGenerator
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldGenerator: anObject [

	fieldGenerator := anObject
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldOperation [

	^ fieldOperation
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldOperation: anObject [

	fieldOperation := anObject
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldPackage [

	^ fieldPackage
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldPackage: anObject [

	fieldPackage := anObject
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldPrefix [

	^ fieldPrefix
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldPrefix: anObject [

	fieldPrefix := anObject
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldSuffix [

	^ fieldSuffix
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldSuffix: anObject [

	fieldSuffix := anObject
]

{ #category : #initialization }
SpCreateDeltaModulePresenter >> initializePresenters [
	fieldDeltaName := self newTextInput
		placeholder: 'Name of the delta module';
		yourself.

	fieldGenerator := self newTextInput
		placeholder: 'Name of the generator model version to consider';
		yourself.

	fieldEntity:= self newTextInput
		placeholder: 'Name of the concerned entity';
		yourself.

	fieldPackage := self newTextInput
		placeholder: 'Package name of the considered generator model';
		yourself.

	fieldPrefix := self newTextInput
		placeholder: 'Prefix of the new model';
		yourself.
		
	fieldOperation := self newTextInput
		placeholder: 'Operation type';
		yourself.
		
	fieldSuffix := self newTextInput
		placeholder: 'Suffix for the new generator package name';
		yourself.
		
	buttonSaveDelta := self newButton
      label: 'Save delta';
	   color: Color gray;
		action:  [ self saveDeltaModule: 'deltas.db']
      yourself.

]

{ #category : #'as yet unclassified' }
SpCreateDeltaModulePresenter >> saveDeltaModule: deltaDb [

	| connection name generator entity package prefix operation suffix |
	"Field values"
	name := fieldDeltaName text.
	generator := fieldGenerator text.
	entity := fieldEntity text.
	package := fieldPackage text.
	prefix := fieldPrefix text.
	operation := fieldOperation text.
	suffix := fieldSuffix text.

	"database"
	connection := SQLite3Connection memory.
	connection := SQLite3Connection on:
		              (Smalltalk imageDirectory / deltaDb) fullName.

	connection open.

	connection
		execute:
		'INSERT INTO deltas(delta_name, generator, entity, package, prefix, operation, suffix) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7);'
		with: { 
		      name.
				generator.
				entity.
				package.
				prefix.
				operation.
				suffix }.

	connection close.

	self inform: 'Delta module ', name, ' succefully created'
]

{ #category : #examples }
SpCreateDeltaModulePresenter >> start [
	^ self open.
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> title [
	^ 'Delta module creation'
]

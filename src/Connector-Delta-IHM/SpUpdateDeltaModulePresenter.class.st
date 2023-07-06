Class {
	#name : #SpUpdateDeltaModulePresenter,
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
SpUpdateDeltaModulePresenter >> buttonSaveDelta [

	^ buttonSaveDelta
]

{ #category : #accessing }
SpUpdateDeltaModulePresenter >> buttonSaveDelta: anObject [

	buttonSaveDelta := anObject
]

{ #category : #layout }
SpUpdateDeltaModulePresenter >> defaultLayout [
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
SpUpdateDeltaModulePresenter >> fieldEntity [

	^ fieldEntity
]

{ #category : #accessing }
SpUpdateDeltaModulePresenter >> fieldEntity: anObject [

	fieldEntity := anObject
]

{ #category : #accessing }
SpUpdateDeltaModulePresenter >> fieldGenerator [

	^ fieldGenerator
]

{ #category : #accessing }
SpUpdateDeltaModulePresenter >> fieldGenerator: anObject [

	fieldGenerator := anObject
]

{ #category : #accessing }
SpUpdateDeltaModulePresenter >> fieldOperation [

	^ fieldOperation
]

{ #category : #accessing }
SpUpdateDeltaModulePresenter >> fieldOperation: anObject [

	fieldOperation := anObject
]

{ #category : #accessing }
SpUpdateDeltaModulePresenter >> fieldPackage [

	^ fieldPackage
]

{ #category : #accessing }
SpUpdateDeltaModulePresenter >> fieldPackage: anObject [

	fieldPackage := anObject
]

{ #category : #accessing }
SpUpdateDeltaModulePresenter >> fieldPrefix [

	^ fieldPrefix
]

{ #category : #accessing }
SpUpdateDeltaModulePresenter >> fieldPrefix: anObject [

	fieldPrefix := anObject
]

{ #category : #accessing }
SpUpdateDeltaModulePresenter >> fieldSuffix [

	^ fieldSuffix
]

{ #category : #accessing }
SpUpdateDeltaModulePresenter >> fieldSuffix: anObject [

	fieldSuffix := anObject
]

{ #category : #initialization }
SpUpdateDeltaModulePresenter >> initializePresenters [
	fieldDeltaName := self newTextInput
		placeholder: 'TODO Replace by scroll';
		yourself.

	fieldGenerator := self newTextInput
		placeholder: 'TODO Replace by scroll';
		yourself.

	fieldEntity:= self newTextInput
		placeholder: 'TODO Replace by scroll';
		yourself.

	fieldPackage := self newTextInput
		placeholder: 'TODO Replace by scroll';
		yourself.

	fieldPrefix := self newTextInput
		placeholder: 'TODO Replace by scroll';
		yourself.
		
	fieldOperation := self newTextInput
		placeholder: 'TODO Replace by scroll Enum';
		yourself.
		
	fieldSuffix := self newTextInput
		placeholder: 'TODO Replace by scroll';
		yourself.
		
	buttonSaveDelta := self newButton
      label: 'Save delta';
	   color: Color gray;
		action:  [ self saveDeltaModule: 'deltas.db']
      yourself.

]

{ #category : #'as yet unclassified' }
SpUpdateDeltaModulePresenter >> saveDeltaModule: deltaDb [

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
SpUpdateDeltaModulePresenter >> start [
	^ self open.
]

{ #category : #accessing }
SpUpdateDeltaModulePresenter >> title [
	^ 'Delta module creation'
]

Class {
	#name : #SpCreateDeltaModulePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'fieldDbName',
		'fieldDeltaName',
		'fieldApplyCondition',
		'fieldPredecessors',
		'fieldIdDeltaCore',
		'buttonSaveDelta',
		'fieldAddonEntities',
		'fieldRemovableEntities'
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
		  add: 'Delta db name' at: 1 @ 1;
		  add: fieldDbName at: 2 @ 1 span: 2 @ 1;
		  add: 'Delta name' at: 1 @ 2;
		  add: fieldDeltaName at: 2 @ 2 span: 2 @ 1;
		  add: 'Application condition' at: 1 @ 3;
		  add: fieldApplyCondition at: 2 @ 3 span: 2 @ 1;
		  add: 'Predecessors' at: 1 @ 4;
		  add: fieldPredecessors at: 2 @ 4 span: 2 @ 1;
		  add: 'Id delta core' at: 1 @ 5;
		  add: fieldIdDeltaCore at: 2 @ 5 span: 2 @ 1;
		  add: 'Add-on entities' at: 1 @ 6;
		  add: fieldAddonEntities at: 2 @ 6 span: 2 @ 1;
		  add: 'Removable entities' at: 1 @ 7;
		  add: fieldRemovableEntities at: 2 @ 7 span: 2 @ 1;
		  add: buttonSaveDelta at: 1 @ 8;
		  beColumnNotHomogeneous;
		  yourself
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldAddonEntities [

	^ fieldAddonEntities
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldAddonEntities: anObject [

	fieldAddonEntities := anObject
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldApplyCondition [

	^ fieldApplyCondition
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldApplyCondition: anObject [

	fieldApplyCondition := anObject
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldDeltaName [ 

	^ fieldDeltaName
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldDeltaName: anObject [

	fieldDeltaName := anObject
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldIdDeltaCore [

	^ fieldIdDeltaCore
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldIdDeltaCore: anObject [

	fieldIdDeltaCore := anObject
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldPredecessors [

	^ fieldPredecessors
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldPredecessors: anObject [

	fieldPredecessors := anObject
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldRemovableEntities [

	^ fieldRemovableEntities
]

{ #category : #accessing }
SpCreateDeltaModulePresenter >> fieldRemovableEntities: anObject [

	fieldRemovableEntities := anObject
]

{ #category : #initialization }
SpCreateDeltaModulePresenter >> initializePresenters [
	fieldDbName := self newTextInput
		placeholder: 'Name of the delta database';
		yourself.
		
	fieldDeltaName := self newTextInput
		placeholder: 'Name of the delta module';
		yourself.

	fieldApplyCondition := self newTextInput
		placeholder: 'Config for deltamodule activation';
		yourself.

	fieldPredecessors:= self newTextInput
		placeholder: 'List of the predecessors delta module';
		yourself.
	
	fieldAddonEntities:= self newTextInput
		placeholder: 'List of entities to add';
		yourself.
		
	fieldRemovableEntities:= self newTextInput
		placeholder: 'List of entities to remove';
		yourself.

	fieldIdDeltaCore := self newTextInput
		placeholder: 'Identifier ofvthe deltacore';
		yourself.

	buttonSaveDelta := self newButton
      label: 'Save delta';
	   color: Color gray;
		action:  [ self saveDeltaModule]
      yourself.
]

{ #category : #'as yet unclassified' }
SpCreateDeltaModulePresenter >> saveDeltaModule [

	| connection dbName name applyCondition predecessors idDeltaCore addonEntities removableEntities idDeltaModule tabAddonEntities tabRemovableEntities|
	"Field values will become dto"
	dbName := fieldDbName text.
	name := fieldDeltaName text.
	applyCondition := fieldApplyCondition text.
	predecessors := fieldPredecessors text.
	idDeltaCore := fieldIdDeltaCore text.
	addonEntities := fieldAddonEntities text.
	removableEntities := fieldRemovableEntities text.

	"database"
	connection := SQLite3Connection memory.
	connection := SQLite3Connection on:
		              (Smalltalk imageDirectory / dbName) fullName.

	connection open.

	connection
		execute:
		'INSERT INTO delta_module(name, apply_condition, predecessors, id_delta_core, addon_entities, removable_entities) VALUES (?1, ?2, ?3, ?4, ?5, ?6);'
		with: { 
		      name.
				applyCondition.
				predecessors.
				idDeltaCore.
				addonEntities.
				removableEntities
				}.

	"Create entity and delta link"
	
	idDeltaModule := ((connection execute: 'Select id from delta_module where name=?' with: {name}) next) at:'id'.
   "Todo create function for the two case duplication"
	tabAddonEntities := addonEntities splitOn: ','.
	tabAddonEntities do: [ :each |
		|entity|

    entity := (connection execute: 'Select name_entity from entity where name_entity=?' with: {each}) next.
    "if entity not alredy exist"
	 entity ifNil: [ 
		each ifNotEmpty: [  
			connection
				execute:
					'INSERT INTO entity(name_entity) VALUES (?1);'	
						with: { 
		     					each
								}.
								]

		].
	   "Create link between delta module and entity"
	each ifNotEmpty: [ 
	   		connection
				execute:
					'INSERT INTO delta_entity_link(id_delta, name_entity, operation) VALUES (?1, ?2, ?3);'	
						with: { 
		     					idDeltaModule.
								each.
								'ADD'
								}.
								]
].

"Todo create function for the two case duplication"
	tabRemovableEntities := removableEntities splitOn: ','.
	tabRemovableEntities do: [ :each |
		|entity|
    entity := (connection execute: 'Select name_entity from entity where name_entity=?' with: {each}) next.
    "if entity not alredy exist"
	 entity ifNil:  [ 
		each ifNotEmpty: [ 
			connection
				execute:
					'INSERT INTO entity(name_entity) VALUES (?1);'	
						with: { 
		     					each
								}.
								]

		].
	
	   "Create link between delta module and entity"
	   each ifNotEmpty: [ 
	  	 	connection
				execute:
					'INSERT INTO delta_entity_link(id_delta, name_entity, operation) VALUES (?1, ?2, ?3);'	
						with: { 
		     					idDeltaModule.
								each.
								'REMOVE'
								}.
								]
].
	
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

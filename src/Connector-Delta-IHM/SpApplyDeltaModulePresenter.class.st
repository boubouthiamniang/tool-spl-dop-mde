Class {
	#name : #SpApplyDeltaModulePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'fieldDeltaName',
		'fieldGeneratorName',
		'fieldPackageName',
		'fieldPrefix',
		'fieldSuffix',
		'buttonApplyDelta',
		'fieldDbName'
	],
	#classInstVars : [
		'anObject'
	],
	#category : #'Connector-Delta-IHM'
}

{ #category : #'as yet unclassified' }
SpApplyDeltaModulePresenter >> applyDeltaModule [

	 | connection  dbName deltaName generatorName generatorClassName generatorClass entitiesOperationsLink packageName prefix suffix deltaModule deltaActionManager sourceNameDico retrievedGenerator|
   
	dbName := fieldDbName text.
	deltaName := fieldDeltaName text.
	generatorName := fieldGeneratorName text.
	packageName := fieldPackageName text.
	prefix := fieldPrefix text.
	suffix := fieldSuffix text.

	connection  := SQLite3Connection memory.
	connection := SQLite3Connection on:
		              (Smalltalk imageDirectory / dbName) fullName.

	connection open.

	deltaModule := (connection execute: 'Select id from delta_module where name=?' with: {deltaName}) next.
	entitiesOperationsLink := (connection execute: 'Select name_entity, operation from delta_entity_link where id_delta=?' with: {(deltaModule at:'id')})"next".

	"generatorClassName := deltaModule at:'generator'."
	generatorClass := Smalltalk classNamed: generatorName.
	"entityName := deltaModule at:'entity'."
	"packageName := deltaModule at:'package'."
	"prefix := deltaModule at:'prefix'."
	"suffix := deltaModule at:'suffix'."

	deltaActionManager := DeltaActionManager new.
	
	"Each entity delta link"
	(entitiesOperationsLink rows) do:[:row |
		deltaActionManager modifyGeneratorInstanceSideForDelta: generatorClass entitiesOperationsLink: row.
		 ].

	sourceNameDico := Dictionary new.
	sourceNameDico at: 'packageName' put: packageName.
	sourceNameDico at: 'prefix' put: prefix.
   
	deltaActionManager modifyGeneratorClassSideForDelta: generatorClass sourceNameDico: sourceNameDico 	varianteSufixe:  suffix.
		
	"After applying we deltas modules we save link with generator in db"
	connection
		execute:
		'INSERT INTO variant_generator(name, package, prefix, sufixe) VALUES (?1, ?2, ?3, ?4);'
		with: { 
		      generatorName.
				packageName.
				prefix.
				suffix
				}.
      
   "Create link betweeen generator and delta module"
   retrievedGenerator := (connection execute: 'Select id from variant_generator where name=?' with: {generatorName}) next.
	connection
		execute:
		'INSERT INTO delta_variant_link(id_delta, id_variant) VALUES (?1, ?2);'
		with: { 
		      (deltaModule at:'id').
				(retrievedGenerator at:'id')
				}.
				
	connection close.

    
	self inform: 'Delta module', deltaName, ' succefully applied'.
]

{ #category : #accessing }
SpApplyDeltaModulePresenter >> buttonApplyDelta [

	^ buttonApplyDelta
]

{ #category : #accessing }
SpApplyDeltaModulePresenter >> buttonApplyDelta: anObject [

	buttonApplyDelta := anObject
]

{ #category : #layout }
SpApplyDeltaModulePresenter >> defaultLayout [
	^ SpGridLayout new
		  add: 'Delta database name:' at: 1 @ 1;
		  add: fieldDbName at: 2 @ 1 span: 2 @ 1;
		  add: 'Delta module name:' at: 1 @ 2;
		  add: fieldDeltaName at: 2 @ 2 span: 2 @ 1;
		  add: 'Target generator name:' at: 1 @ 3;
		  add: fieldGeneratorName at: 2 @ 3 span: 2 @ 1;
		  add: 'Name of original package:' at: 1 @ 4;
		  add: fieldPackageName at: 2 @ 4 span: 2 @ 1;
		  add: 'Prefix of the orgine:' at: 1 @ 5;
		  add: fieldPrefix at: 2 @ 5 span: 2 @ 1;
		  add: 'Tag suffix:' at: 1 @ 6;
		  add: fieldSuffix at: 2 @ 6 span: 2 @ 1;
		  add: buttonApplyDelta at: 1 @ 7;
		  beColumnNotHomogeneous;
		  yourself
]

{ #category : #accessing }
SpApplyDeltaModulePresenter >> fieldDeltaName [

	^ fieldDeltaName
]

{ #category : #accessing }
SpApplyDeltaModulePresenter >> fieldDeltaName: anObject [

	fieldDeltaName := anObject
]

{ #category : #accessing }
SpApplyDeltaModulePresenter >> fieldGeneratorName [ 

	^ fieldGeneratorName
]

{ #category : #accessing }
SpApplyDeltaModulePresenter >> fieldGeneratorName: anObject [

	fieldGeneratorName := anObject
]

{ #category : #accessing }
SpApplyDeltaModulePresenter >> fieldPackageName [ 

	^ fieldPackageName
]

{ #category : #accessing }
SpApplyDeltaModulePresenter >> fieldPackageName: anObject [

	fieldPackageName := anObject
]

{ #category : #accessing }
SpApplyDeltaModulePresenter >> fieldPrefix [ 

	^ fieldPrefix
]

{ #category : #accessing }
SpApplyDeltaModulePresenter >> fieldPrefix: anObject [

	fieldPrefix := anObject
]

{ #category : #accessing }
SpApplyDeltaModulePresenter >> fieldSuffix [ 

	^ fieldSuffix
]

{ #category : #accessing }
SpApplyDeltaModulePresenter >> fieldSuffix: anObject [

	fieldSuffix := anObject
]

{ #category : #initialization }
SpApplyDeltaModulePresenter >> initializePresenters [

	fieldDbName := self newTextInput
		                  placeholder:
			                  'Name of the delta database';
		                  yourself.
	fieldDeltaName := self newTextInput
		                  placeholder:
			                  'Name of the delta module to be applied';
		                  yourself.
	
	fieldGeneratorName := self newTextInput
		                  placeholder:
			                  'Name of the generator version';
		                  yourself.
	
	fieldPackageName := self newTextInput
		                  placeholder:
			                  'Name of the package where the model wiil be generated';
		                  yourself.
	
	fieldPrefix := self newTextInput
		                  placeholder:
			                  'Name of the fieldPrefix';
		                  yourself.
		
	fieldSuffix := self newTextInput
		                  placeholder:
			                  'Name of the suffix';
		                  yourself.

	buttonApplyDelta := self newButton
		                    label: 'Apply delta on generator';
		                    color: Color gray;
		                    action: [ self applyDeltaModule]
								  yourself.
]

{ #category : #examples }
SpApplyDeltaModulePresenter >> start [
	^ self open.
]

{ #category : #accessing }
SpApplyDeltaModulePresenter >> title [
	^ 'Product derivation'
]

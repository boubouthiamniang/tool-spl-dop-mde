Class {
	#name : #SpCreateDeltaProjectPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'fieldDBName',
		'fieldDeltaCoreName',
		'fieldFeatureList',
		'fieldArtifactUri',
		'buttonInitDeltaProject'
	],
	#category : #'Connector-Delta-IHM'
}

{ #category : #accessing }
SpCreateDeltaProjectPresenter >> buttonInitDeltaProject [

	^ buttonInitDeltaProject
]

{ #category : #accessing }
SpCreateDeltaProjectPresenter >> buttonInitDeltaProject: anObject [

	buttonInitDeltaProject := anObject
]

{ #category : #layout }
SpCreateDeltaProjectPresenter >> defaultLayout [
	^ SpGridLayout new
		  add: 'Database name:' at: 1 @ 1;
		  add: fieldDBName at: 2 @ 1 span: 2 @ 1;
		  add: 'Delta core name:' at: 1 @ 2;
		  add: fieldDeltaCoreName at: 2 @ 2 span: 2 @ 1;
		  add: 'Feature list:' at: 1 @ 3;
		  add: fieldFeatureList at: 2 @ 3 span: 2 @ 1;
		  add: 'Artifact uri:' at: 1 @ 4;
		  add: fieldArtifactUri at: 2 @ 4 span: 2 @ 1;
		  
		  add: buttonInitDeltaProject at: 1 @ 8;
		  beColumnNotHomogeneous;
		  yourself
]

{ #category : #accessing }
SpCreateDeltaProjectPresenter >> fieldArtifactUri [

	^ fieldArtifactUri
]

{ #category : #accessing }
SpCreateDeltaProjectPresenter >> fieldArtifactUri: anObject [

	fieldArtifactUri := anObject
]

{ #category : #accessing }
SpCreateDeltaProjectPresenter >> fieldDBName [

	^ fieldDBName
]

{ #category : #accessing }
SpCreateDeltaProjectPresenter >> fieldDBName: anObject [

	fieldDBName:= anObject
]

{ #category : #accessing }
SpCreateDeltaProjectPresenter >> fieldDeltaCoreName [

	^ fieldDeltaCoreName
]

{ #category : #accessing }
SpCreateDeltaProjectPresenter >> fieldDeltaCoreName: anObject [

	fieldDeltaCoreName := anObject
]

{ #category : #accessing }
SpCreateDeltaProjectPresenter >> fieldFeatureList [

	^ fieldFeatureList
]

{ #category : #accessing }
SpCreateDeltaProjectPresenter >> fieldFeatureList: anObject [

	fieldFeatureList := anObject
]

{ #category : #'as yet unclassified' }
SpCreateDeltaProjectPresenter >> initDeltaProject [

	| connection dbName deltaCoreName featureList artifactUri |
	"Field values"
	dbName := fieldDBName text.
	deltaCoreName := fieldDeltaCoreName text.
	featureList := fieldFeatureList text.
	artifactUri := fieldArtifactUri text.

	"database"
	connection := SQLite3Connection memory.
	connection := SQLite3Connection on:
		              (Smalltalk imageDirectory / dbName) fullName.

	connection open.
	connection
		execute:
		'
		CREATE TABLE "delta_core" (
			"id"	INTEGER NOT NULL,
			"name"	TEXT,
			"feature_list"	TEXT,
			"artifact_uri"	TEXT,
			PRIMARY KEY("id" AUTOINCREMENT)
		);
		'.
    connection
		execute:
		'
		CREATE TABLE "delta_module" (
			"id"	INTEGER NOT NULL,
			"name"	TEXT UNIQUE,
			"apply_condition"	TEXT,
			"predecessors"	TEXT,
			"addon_entities"   TEXT,
	      "removable_entities"   TEXT,
			"id_delta_core"	INTEGER,
			FOREIGN KEY("id_delta_core") REFERENCES "delta_core"("id"),
			PRIMARY KEY("id" AUTOINCREMENT)
		);
		'.
	connection
		execute:
		'
		CREATE TABLE "variant_generator" (
			"id"	INTEGER NOT NULL,
			"name"	TEXT UNIQUE,
			"package"	TEXT UNIQUE,
			"prefix"	TEXT UNIQUE,
			"sufixe"	TEXT UNIQUE,
			PRIMARY KEY("id" AUTOINCREMENT)
		);
		'.
	connection
		execute:
		'
		CREATE TABLE "delta_variant_link" (
			"id_delta"	INTEGER,
			"id_variant"	INTEGER,
			FOREIGN KEY("id_delta") REFERENCES "delta_module"("id"),
			FOREIGN KEY("id_variant") REFERENCES "variant_generator"("id")
		);
		'.
	connection
		execute:
		'
		CREATE TABLE "entity" (
			"id_entity"	INTEGER NOT NULL,
			"name_entity"	TEXT,
			PRIMARY KEY("id_entity" AUTOINCREMENT)
		);
		'.
	connection
		execute:
		'
		CREATE TABLE "delta_entity_link" (
			"id_delta"	INTEGER,
			"name_entity"	TEXT,
			"operation"	TEXT,
			FOREIGN KEY("id_delta") REFERENCES "delta_module"("id")
		);
		'.
	"Init delta core table"
	connection
		execute:
		'INSERT INTO delta_core(name, feature_list, artifact_uri) VALUES    
		(?1, ?2, ?3);'
		with: { 
		      deltaCoreName .
				featureList .
				artifactUri}.
				
	connection close.
	
	self inform: 'Delta project succefully initialized'.
	self inform: 'Delta core ', deltaCoreName, ' succefully initialized'.
]

{ #category : #accessing }
SpCreateDeltaProjectPresenter >> initializePresenters [
	fieldDBName := self newTextInput
		placeholder: 'Name of the delta database ';
		yourself.

	fieldDeltaCoreName := self newTextInput
		placeholder: 'Name of the version of the delta core ';
		yourself.
	
	fieldFeatureList := self newTextInput
		placeholder: 'List of features ';
		yourself.
		
	fieldArtifactUri := self newTextInput
		placeholder: 'Artifacts location ';
		yourself.
	
	buttonInitDeltaProject := self newButton
      label: 'Init delta project';
	   color: Color gray;
		action:  [ self initDeltaProject]
      yourself.

]

{ #category : #accessing }
SpCreateDeltaProjectPresenter >> start [
	^ self open.
]

{ #category : #accessing }
SpCreateDeltaProjectPresenter >> title [
	^ 'Init delta project'
]

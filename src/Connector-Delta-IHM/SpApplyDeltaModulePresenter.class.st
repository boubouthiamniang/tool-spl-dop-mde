Class {
	#name : #SpApplyDeltaModulePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'fieldDeltaName',
		'buttonApplyDelta'
	],
	#classInstVars : [
		'anObject'
	],
	#category : #'Connector-Delta-IHM'
}

{ #category : #'as yet unclassified' }
SpApplyDeltaModulePresenter >> applyDeltaModule: deltaDb withDeltaName: deltaName [

	| connection generatorClassName generatorClass entityName packageName prefix suffix deltaModule deltaActionManager sourceNameDico|

	connection := SQLite3Connection memory.
	connection := SQLite3Connection on:
		              (Smalltalk imageDirectory / deltaDb) fullName.

	connection open.

	deltaModule := (connection execute: 'Select * from deltas where delta_name=?' with: {deltaName}) next.

	generatorClassName := deltaModule at:'generator'.
	generatorClass := Smalltalk classNamed: generatorClassName.
	entityName := deltaModule at:'entity'.
	packageName := deltaModule at:'package'.
	prefix := deltaModule at:'prefix'.
	suffix := deltaModule at:'suffix'.

	deltaActionManager := DeltaActionManager new.

	deltaActionManager modifyGeneratorInstanceSideForDelta: generatorClass entityName: entityName.

	sourceNameDico := Dictionary new.
	sourceNameDico at: 'packageName' put: packageName.
	sourceNameDico at: 'prefix' put: prefix.

	deltaActionManager modifyGeneratorClassSideForDelta: generatorClass sourceNameDico: sourceNameDico 	varianteSufixe:  suffix.
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
		  add: 'Delta name:' at: 1 @ 1;
		  add: fieldDeltaName at: 2 @ 1 span: 2 @ 1;
		  add: buttonApplyDelta at: 1 @ 2;
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

{ #category : #initialization }
SpApplyDeltaModulePresenter >> initializePresenters [

	fieldDeltaName := self newTextInput
		                  placeholder:
			                  'Name of the delta module to be applied';
		                  yourself.

	buttonApplyDelta := self newButton
		                    label: 'Apply delta';
		                    color: Color gray;
		                    "action:  [ self applyDeltaModule: 'deltas.db' withDeltaName: self fieldDeltaName ]"
		                    action: [ 
			                    "| a spApplyDeltaModulePresenter |
									  spApplyDeltaModulePresenter := SpApplyDeltaModulePresenter new.
			                    a := spApplyDeltaModulePresenter fieldDeltaName text."
			                    "self inform: fieldDeltaName text"
									self applyDeltaModule: 'deltas.db' withDeltaName: fieldDeltaName text] yourself
]

{ #category : #examples }
SpApplyDeltaModulePresenter >> start [
	^ self open.
]

{ #category : #accessing }
SpApplyDeltaModulePresenter >> title [
	^ 'Product derivation'
]

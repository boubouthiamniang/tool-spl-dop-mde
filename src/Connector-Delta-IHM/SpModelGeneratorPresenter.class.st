Class {
	#name : #SpModelGeneratorPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'fieldMetamodelName',
		'buttonModelGenerator'
	],
	#classInstVars : [
		'anObject'
	],
	#category : #'Connector-Delta-IHM'
}

{ #category : #accessing }
SpModelGeneratorPresenter >> buttonModelGenerator [

	^ buttonModelGenerator
]

{ #category : #accessing }
SpModelGeneratorPresenter >> buttonModelGenerator: anObject [

	buttonModelGenerator := anObject
]

{ #category : #layout }
SpModelGeneratorPresenter >> defaultLayout [
	^ SpGridLayout new
		  add: 'Metamodel name:' at: 1 @ 1;
		  add: fieldMetamodelName at: 2 @ 1 span: 2 @ 1;
		  add: buttonModelGenerator at: 2 @ 7;
		  beColumnNotHomogeneous;
		  yourself
]

{ #category : #accessing }
SpModelGeneratorPresenter >> fieldMetamodelName [

	^ fieldMetamodelName
]

{ #category : #accessing }
SpModelGeneratorPresenter >> fieldMetamodelName: anObject [

	fieldMetamodelName := anObject
]

{ #category : #'as yet unclassified' }
SpModelGeneratorPresenter >> generateModel: metamodelName [

   |class|
	class := (Smalltalk classNamed: metamodelName text).
	class generate.

	self inform: 'Model successfully generated'.
]

{ #category : #initialization }
SpModelGeneratorPresenter >> initializePresenters [

	fieldMetamodelName := self newTextInput
		                  placeholder:
			                  'Name of the metamodel';
		                  yourself.
		
	buttonModelGenerator:= self newButton
		                    label: 'Generate model';
		                    color: Color gray;
		                    action: [ self generateModel: fieldMetamodelName text]
								  yourself.
]

{ #category : #examples }
SpModelGeneratorPresenter >> start [
	^ self open.
]

{ #category : #accessing }
SpModelGeneratorPresenter >> title [
	^ 'Model generator'
]

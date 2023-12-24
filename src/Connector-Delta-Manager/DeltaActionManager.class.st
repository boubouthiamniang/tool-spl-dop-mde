Class {
	#name : #DeltaActionManager,
	#superclass : #Object,
	#category : #'Connector-Delta-Manager'
}

{ #category : #'as yet unclassified' }
DeltaActionManager >> modifyGeneratorClassSideForDelta: class sourceNameDico:sourceNameDico varianteSufixe:varianteSufixe [

	#('packageName' 'prefix') do:[:each |
		| deltaActionManager sourceName |
		deltaActionManager := DeltaActionManager new.
		sourceName := sourceNameDico at: each ifAbsent: [ '' ].
		 
		deltaActionManager modifyGeneratorClassSideMethods: class methodName: each sourceName: sourceName varianteSufixe: varianteSufixe
				].
						

]

{ #category : #'as yet unclassified' }
DeltaActionManager >> modifyGeneratorClassSideMethods: class methodName: methodName sourceName:sourceName varianteSufixe:varianteSufixe [

	| methodSelector lines linesEnd modifiedMethod |

	methodSelector := methodName asSymbol.

	modifiedMethod := class classSide compiledMethodAt: methodSelector ifAbsent: [^self].
	modifiedMethod := modifiedMethod copy. 

	lines:= modifiedMethod sourceCode lines asStringWithCr.
	linesEnd:=lines copyReplaceAll: sourceName with: sourceName, varianteSufixe.
	class classSide compile: linesEnd.
]

{ #category : #'as yet unclassified' }
DeltaActionManager >> modifyGeneratorInstanceSideForDelta: className entitiesOperationsLink:entitiesOperationsLink [
   "1 halt."
	#('defineClasses' 'defineHierarchy' 'defineProperties' 'defineRelations') do:[:each | 
		| deltaActionManager |
		deltaActionManager := DeltaActionManager new.
		deltaActionManager	modifyGeneratorInstanceSideMethods:  className methodName: each  entitiesOperationsLink: entitiesOperationsLink].
]

{ #category : #'as yet unclassified' }
DeltaActionManager >> modifyGeneratorInstanceSideMethods: class methodName: methodName entitiesOperationsLink:entitiesOperationsLink [

	|classCompiledMethod lines linesEnd| 
   "1 halt."
	classCompiledMethod := (Smalltalk classNamed: class name) compiledMethodAt: methodName asSymbol.
	lines := classCompiledMethod sourceCode lines.
	
	((entitiesOperationsLink at:'operation') equalsTo: 'REMOVE') ifTrue: [ 
		linesEnd:=lines reject:[:l | l includesSubstring: (entitiesOperationsLink at:'name_entity') caseSensitive: false].
		 ] ifFalse: [ linesEnd:=lines].
	
	"Normally this method replace the methods defineClasses but i use a same name for instance 
	but it is note a method of super class so can not generate "
	class compile: linesEnd asStringWithCr. 
]

{ #category : #utilities }
DeltaActionManager >> retrieveDeltaProperties: dbPath generator: generator entity: entity [

	| connection deltaModule generatorClassName generatorClass entityName packageName prefix suffix deltaPropertiesDico |
	connection := SQLite3Connection memory.

	connection := SQLite3Connection on: dbPath fullName.
	connection open.
	"deltaModule := (connection execute: 'Select * from deltas where generator=',''',generator,''',' and entity=?;' with: #('ConnectorMetamodelGeneratorVarA' 'kafkaConfig')) next."

	deltaModule := (connection
		                execute:
		                'Select * from deltas where generator=? and entity=?;'
							 "Don' work with generato and entity values. La ligne commenté ci-dessous fonctionne"
		                with: #( generator entity )) next.

	deltaModule ifNil: [ ^ self ].

	"Get values from db"
	generatorClassName := deltaModule at: 'generator'.
	generatorClass := Smalltalk classNamed: generatorClassName.
	entityName := deltaModule at: 'entity'.
	packageName := deltaModule at: 'package'.
	prefix := deltaModule at: 'prefix'.
	suffix := deltaModule at: 'suffix'.

	^ deltaPropertiesDico new
		  at: 'generatorClass' put: generatorClass;
		  at: 'entityName' put: entityName;
		  at: 'packageName' put: packageName;
		  at: 'prefix' put: prefix;
		  at: 'suffix' put: suffix
]

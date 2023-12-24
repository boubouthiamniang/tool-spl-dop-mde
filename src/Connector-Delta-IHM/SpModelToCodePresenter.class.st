Class {
	#name : #SpModelToCodePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'fieldPrefix',
		'buttonGenerateCode',
		'fieldRootEntityName',
		'fieldArtifactsLocaton',
		'fieldRootFolder'
	],
	#category : #'Connector-Delta-IHM'
}

{ #category : #initialization }
SpModelToCodePresenter >> buttonGenerateCode [

	^ buttonGenerateCode
]

{ #category : #initialization }
SpModelToCodePresenter >> buttonGenerateCode: anObject [

	buttonGenerateCode := anObject
]

{ #category : #layout }
SpModelToCodePresenter >> defaultLayout [
	^ SpGridLayout new
		  add: 'Root entity name:' at: 1 @ 1;
		  add: fieldRootEntityName at: 2 @ 1 span: 2 @ 1;
		  add: 'Prefix:' at: 1 @ 2;
		  add: fieldPrefix at: 2 @ 2 span: 2 @ 1;
		  add: 'Artifact JSON location:' at: 1 @ 3;
		  add: fieldArtifactsLocaton at: 2 @ 3 span: 2 @ 1;
		  add: 'Root folder:' at: 1 @ 4;
		  add: fieldRootFolder at: 2 @ 4 span: 2 @ 1;
		  add: buttonGenerateCode at: 1 @ 5;
		  beColumnNotHomogeneous;
		  yourself
]

{ #category : #layout }
SpModelToCodePresenter >> fieldArtifactsLocaton [ 

	^ fieldArtifactsLocaton
]

{ #category : #accessing }
SpModelToCodePresenter >> fieldArtifactsLocaton: anObject [

	fieldArtifactsLocaton := anObject
]

{ #category : #layout }
SpModelToCodePresenter >> fieldPrefix [ 

	^ fieldPrefix
]

{ #category : #accessing }
SpModelToCodePresenter >> fieldPrefix: anObject [

	fieldPrefix := anObject
]

{ #category : #layout }
SpModelToCodePresenter >> fieldRootEntityName [ 

	^ fieldRootEntityName
]

{ #category : #accessing }
SpModelToCodePresenter >> fieldRootEntityName: anObject [

	fieldRootEntityName := anObject
]

{ #category : #accessing }
SpModelToCodePresenter >> fieldRootFolder [

	^ fieldRootFolder
]

{ #category : #accessing }
SpModelToCodePresenter >> fieldRootFolder: anObject [

	fieldRootFolder := anObject
]

{ #category : #'as yet unclassified' }
SpModelToCodePresenter >> generateJavaFromDeltaCore [
  	| rootEntityName prefix artifactsLocaton rootFolder entityList artefactsDictionary visitor|
   
	rootEntityName := fieldRootEntityName text.
	prefix := fieldPrefix text.
	artifactsLocaton := fieldArtifactsLocaton text. 
	rootFolder := fieldRootFolder text.

	"Todo funtion: prefixe, class name, Model Name location"
entityList := (Smalltalk classNamed: rootEntityName) allSubclasses.

"targetSourceLocation:= 'D:\Users\boubouthiam.niang\workspace\epl_legacy_dop_tool_demo\ExpressionProductLineGeneratedNew\src'."

artefactsDictionary:= artifactsLocaton asFileReference
	readStreamDo: [ :readStream |
		(NeoJSONReader on: readStream) next ].

"Attribut"
entityList do: [ :class | 
	|st c m package componentAnnotation componentAnnotationInstance getAnnotation getAnnotationInstance  parentClass methodArray targetSourceLocation|
	
	st := FamixJavaClass new.
	st name: 'String'.
	c := FamixJavaClass new.
	c name: (class name copyFrom:prefix size + 1 to:class name size).

	class instVarNames do: [ :var | 
		|currentAttribut| 
		currentAttribut := FamixJavaAttribute new.
		currentAttribut name: var.
		currentAttribut declaredType: st.

		c addAttribute: currentAttribut.
		].
	
	"Method"
	m := FamixJavaMethod new.
	"Get linked artefacts for current class"
	methodArray := (artefactsDictionary includesKey: c name) ifTrue: [ (artefactsDictionary at: c name) at:'methods']
	ifFalse: [ OrderedCollection  new.].
	methodArray do:[ :method |
		      |arrayParam paramTmp|
	        	
			   m := FamixJavaMethod new.
				m name: (method at:'name'). 
				m sourceAnchor:
				  (FamixJavaSourceTextAnchor new source:
					   (method at: 'sourceEnchor')). 
				"1 halt."
				m parentType: c.
				m declaredType: st.
				arrayParam := OrderedCollection  new.
				(method at:'parameters') do: [ :p |
					|param paramType|
					"1 halt."
					p ifNotEmpty: [ 
						param := FamixJavaParameter new.
					   paramType := FamixJavaClass new.
	               paramType name: (p at:'name').
					   param declaredType: paramType.
					   arrayParam add:param.
					] 
				].
				
				"Multi parameter sort problem in Famix2Java (why param sourceAnchor?)"
				"arrayParam ifNotEmpty: [ m parameters: arrayParam]."
		      
		      	"Annotation methhod (not key value yet)"
		      getAnnotation := FamixJavaAnnotationType new name: 'MethodAnnotation'.
		      getAnnotationInstance := FamixJavaAnnotationInstance new annotationType: getAnnotation.
		
		      m annotationInstances add: getAnnotationInstance. 
		      "1 halt."
			   c addMethod:  m.
				
			].
	
	
   
	componentAnnotation := FamixJavaAnnotationType new name: 'ComponentAnnotation'.
	componentAnnotationInstance := FamixJavaAnnotationInstance new annotationType: componentAnnotation.
	c annotationInstances add: componentAnnotationInstance.  
	"Inheritance (real parentclass?)" 
	parentClass := FamixJavaClass new
	   name: 'ParentClass';
		parentPackage: package;
		yourself.
		
	c
		addSuperInheritance:
			(FamixJavaInheritance new
				subclass: c;
				superclass: parentClass).	
		
	targetSourceLocation := (artefactsDictionary at:c name) at:'targetSourceLocation'.
				
	

	"Interface not working (possible in pharo)"
	"interface := FamixJavaInterface new
		name: 'Interop';
		parentPackage: package;
		yourself.
	
	c 
		addInterfaceImplementation: 
			(FamixJavaImplementation new
				interface: interface;
				implementingClass: c)."
	
	"impl := FamixJavaImplementation new.
	impl interface: interface.
	impl implementingClass: c."
	
	"Package not working (improve famix2java?"
	"package := FamixJavaPackage new. 
	package name: 'com.bl.thesis'.
	c parentPackage: package."
	
	"comment not working"
	"comment := FamixJavaComment new.
	comment contents: 'okmlmmm'.
	comment commentedEntity: c."
   
	"1 halt." 
	
	visitor := FAMIX2JavaVisitor new.
	"visitor rootFolder: targetSourceLocation asFileReference."
	visitor rootFolder:'D:\Users\boubouthiam.niang\workspace\epl_legacy_dop_tool_demo\ExpressionProductLineGeneratedNew\src' asFileReference.
	c accept: visitor.
	self inform: 'Class', c name, 'bien généré'.
		].
    
	
]

{ #category : #initialization }
SpModelToCodePresenter >> initializePresenters [

	fieldRootEntityName := self newTextInput
		                  placeholder:
			               'Name of the root entity';
		                  yourself.
	fieldPrefix := self newTextInput
		                  placeholder:
			               'Prefix added to entity name';
		                  yourself.
	
	fieldArtifactsLocaton := self newTextInput
		                  placeholder:
			               'Location of the artifacts JSON';
		                  yourself.
	
	fieldRootFolder := self newTextInput
		                  placeholder:
			                  'Target folder for generated code';
		                  yourself.

	buttonGenerateCode := self newButton
		                    label: 'Generate java code';
		                    color: Color gray;
		                    action: [ self generateJavaFromDeltaCore]
								  yourself.
]

{ #category : #initialization }
SpModelToCodePresenter >> start [
	^ self open.
]

{ #category : #initialization }
SpModelToCodePresenter >> title [
	^ 'Model to code transformation'
]

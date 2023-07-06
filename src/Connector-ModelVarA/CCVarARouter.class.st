Class {
	#name : #CCVarARouter,
	#superclass : #CCVarAEntity,
	#instVars : [
		'#connector => FMOne type: #CCVarAConnector opposite: #router'
	],
	#category : #'Connector-ModelVarA-Entities'
}

{ #category : #meta }
CCVarARouter class >> annotation [

	<FMClass: #Router super: #CCVarAEntity>
	<package: #'Connector-ModelVarA'>
	<generated>
	^ self
]

{ #category : #accessing }
CCVarARouter >> connector [
	"Relation named: #connector type: #CCVarAConnector opposite: #router"

	<generated>
	<container>
	<derived>
	^ connector
]

{ #category : #accessing }
CCVarARouter >> connector: anObject [

	<generated>
	connector := anObject
]

{ #category : #navigation }
CCVarARouter >> connectorGroup [
	<generated>
	<navigation: 'Connector'>
	^ MooseSpecializedGroup with: self connector
]

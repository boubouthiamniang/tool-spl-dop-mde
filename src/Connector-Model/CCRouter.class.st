Class {
	#name : #CCRouter,
	#superclass : #CCEntity,
	#instVars : [
		'#connector => FMOne type: #CCConnector opposite: #router'
	],
	#category : #'Connector-Model-Entities'
}

{ #category : #meta }
CCRouter class >> annotation [

	<FMClass: #Router super: #CCEntity>
	<package: #'Connector-ModelVarA'>
	<generated>
	^ self
]

{ #category : #accessing }
CCRouter >> connector [
	"Relation named: #connector type: #CCConnector opposite: #router"

	<generated>
	<container>
	<derived>
	^ connector
]

{ #category : #accessing }
CCRouter >> connector: anObject [

	<generated>
	connector := anObject
]

{ #category : #navigation }
CCRouter >> connectorGroup [
	<generated>
	<navigation: 'Connector'>
	^ MooseSpecializedGroup with: self connector
]

Class {
	#name : #CCVarAVarBRouter,
	#superclass : #CCVarAVarBEntity,
	#instVars : [
		'#connector => FMOne type: #CCVarAVarBConnector opposite: #router'
	],
	#category : #'Connector-ModelVarAVarB-Entities'
}

{ #category : #meta }
CCVarAVarBRouter class >> annotation [

	<FMClass: #Router super: #CCVarAVarBEntity>
	<package: #'Connector-ModelVarAVarB'>
	<generated>
	^ self
]

{ #category : #accessing }
CCVarAVarBRouter >> connector [
	"Relation named: #connector type: #CCVarAVarBConnector opposite: #router"

	<generated>
	<container>
	<derived>
	^ connector
]

{ #category : #accessing }
CCVarAVarBRouter >> connector: anObject [

	<generated>
	connector := anObject
]

{ #category : #navigation }
CCVarAVarBRouter >> connectorGroup [
	<generated>
	<navigation: 'Connector'>
	^ MooseSpecializedGroup with: self connector
]

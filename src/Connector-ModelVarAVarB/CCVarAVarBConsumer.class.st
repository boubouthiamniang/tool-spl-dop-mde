Class {
	#name : #CCVarAVarBConsumer,
	#superclass : #CCVarAVarBEntity,
	#instVars : [
		'#type => FMProperty',
		'#connector => FMOne type: #CCVarAVarBConnector opposite: #consumer'
	],
	#category : #'Connector-ModelVarAVarB-Entities'
}

{ #category : #meta }
CCVarAVarBConsumer class >> annotation [

	<FMClass: #Consumer super: #CCVarAVarBEntity>
	<package: #'Connector-ModelVarAVarB'>
	<generated>
	^ self
]

{ #category : #accessing }
CCVarAVarBConsumer >> connector [
	"Relation named: #connector type: #CCVarAVarBConnector opposite: #consumer"

	<generated>
	<container>
	<derived>
	^ connector
]

{ #category : #accessing }
CCVarAVarBConsumer >> connector: anObject [

	<generated>
	connector := anObject
]

{ #category : #navigation }
CCVarAVarBConsumer >> connectorGroup [
	<generated>
	<navigation: 'Connector'>
	^ MooseSpecializedGroup with: self connector
]

{ #category : #accessing }
CCVarAVarBConsumer >> type [

	<FMProperty: #type type: #String>
	<generated>
	^ type
]

{ #category : #accessing }
CCVarAVarBConsumer >> type: anObject [
	<generated>
	type := anObject
]

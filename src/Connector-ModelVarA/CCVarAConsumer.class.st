Class {
	#name : #CCVarAConsumer,
	#superclass : #CCVarAEntity,
	#instVars : [
		'#type => FMProperty',
		'#connector => FMOne type: #CCVarAConnector opposite: #consumer'
	],
	#category : #'Connector-ModelVarA-Entities'
}

{ #category : #meta }
CCVarAConsumer class >> annotation [

	<FMClass: #Consumer super: #CCVarAEntity>
	<package: #'Connector-ModelVarA'>
	<generated>
	^ self
]

{ #category : #accessing }
CCVarAConsumer >> connector [
	"Relation named: #connector type: #CCVarAConnector opposite: #consumer"

	<generated>
	<container>
	<derived>
	^ connector
]

{ #category : #accessing }
CCVarAConsumer >> connector: anObject [

	<generated>
	connector := anObject
]

{ #category : #navigation }
CCVarAConsumer >> connectorGroup [
	<generated>
	<navigation: 'Connector'>
	^ MooseSpecializedGroup with: self connector
]

{ #category : #accessing }
CCVarAConsumer >> type [

	<FMProperty: #type type: #String>
	<generated>
	^ type
]

{ #category : #accessing }
CCVarAConsumer >> type: anObject [
	<generated>
	type := anObject
]

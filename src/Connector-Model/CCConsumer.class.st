Class {
	#name : #CCConsumer,
	#superclass : #CCEntity,
	#instVars : [
		'#type => FMProperty',
		'#connector => FMOne type: #CCConnector opposite: #consumer'
	],
	#category : #'Connector-Model-Entities'
}

{ #category : #meta }
CCConsumer class >> annotation [

	<FMClass: #Consumer super: #CCEntity>
	<package: #'Connector-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
CCConsumer >> connector [
	"Relation named: #connector type: #CCConnector opposite: #consumer"

	<generated>
	<container>
	<derived>
	^ connector
]

{ #category : #accessing }
CCConsumer >> connector: anObject [

	<generated>
	connector := anObject
]

{ #category : #navigation }
CCConsumer >> connectorGroup [
	<generated>
	<navigation: 'Connector'>
	^ MooseSpecializedGroup with: self connector
]

{ #category : #accessing }
CCConsumer >> type [

	<FMProperty: #type type: #String>
	<generated>
	^ type
]

{ #category : #accessing }
CCConsumer >> type: anObject [
	<generated>
	type := anObject
]

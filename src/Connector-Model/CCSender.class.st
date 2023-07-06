Class {
	#name : #CCSender,
	#superclass : #CCEntity,
	#instVars : [
		'#annotationType => FMProperty',
		'#exchange => FMProperty',
		'#routingkey => FMProperty',
		'#connector => FMOne type: #CCConnector opposite: #sender'
	],
	#category : #'Connector-Model-Entities'
}

{ #category : #meta }
CCSender class >> annotation [

	<FMClass: #Sender super: #CCEntity>
	<package: #'Connector-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
CCSender >> annotationType [

	<FMProperty: #annotationType type: #String>
	<generated>
	^ annotationType
]

{ #category : #accessing }
CCSender >> annotationType: anObject [
	<generated>
	annotationType := anObject
]

{ #category : #accessing }
CCSender >> connector [
	"Relation named: #connector type: #CCConnector opposite: #sender"

	<generated>
	<container>
	<derived>
	^ connector
]

{ #category : #accessing }
CCSender >> connector: anObject [

	<generated>
	connector := anObject
]

{ #category : #navigation }
CCSender >> connectorGroup [
	<generated>
	<navigation: 'Connector'>
	^ MooseSpecializedGroup with: self connector
]

{ #category : #accessing }
CCSender >> exchange [

	<FMProperty: #exchange type: #String>
	<generated>
	^ exchange
]

{ #category : #accessing }
CCSender >> exchange: anObject [
	<generated>
	exchange := anObject
]

{ #category : #accessing }
CCSender >> routingkey [

	<FMProperty: #routingkey type: #String>
	<generated>
	^ routingkey
]

{ #category : #accessing }
CCSender >> routingkey: anObject [
	<generated>
	routingkey := anObject
]

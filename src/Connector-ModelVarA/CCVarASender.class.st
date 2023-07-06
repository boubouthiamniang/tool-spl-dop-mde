Class {
	#name : #CCVarASender,
	#superclass : #CCVarAEntity,
	#instVars : [
		'#annotationType => FMProperty',
		'#exchange => FMProperty',
		'#routingkey => FMProperty',
		'#connector => FMOne type: #CCVarAConnector opposite: #sender'
	],
	#category : #'Connector-ModelVarA-Entities'
}

{ #category : #meta }
CCVarASender class >> annotation [

	<FMClass: #Sender super: #CCVarAEntity>
	<package: #'Connector-ModelVarA'>
	<generated>
	^ self
]

{ #category : #accessing }
CCVarASender >> annotationType [

	<FMProperty: #annotationType type: #String>
	<generated>
	^ annotationType
]

{ #category : #accessing }
CCVarASender >> annotationType: anObject [
	<generated>
	annotationType := anObject
]

{ #category : #accessing }
CCVarASender >> connector [
	"Relation named: #connector type: #CCVarAConnector opposite: #sender"

	<generated>
	<container>
	<derived>
	^ connector
]

{ #category : #accessing }
CCVarASender >> connector: anObject [

	<generated>
	connector := anObject
]

{ #category : #navigation }
CCVarASender >> connectorGroup [
	<generated>
	<navigation: 'Connector'>
	^ MooseSpecializedGroup with: self connector
]

{ #category : #accessing }
CCVarASender >> exchange [

	<FMProperty: #exchange type: #String>
	<generated>
	^ exchange
]

{ #category : #accessing }
CCVarASender >> exchange: anObject [
	<generated>
	exchange := anObject
]

{ #category : #accessing }
CCVarASender >> routingkey [

	<FMProperty: #routingkey type: #String>
	<generated>
	^ routingkey
]

{ #category : #accessing }
CCVarASender >> routingkey: anObject [
	<generated>
	routingkey := anObject
]

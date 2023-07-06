Class {
	#name : #CCVarAVarBSender,
	#superclass : #CCVarAVarBEntity,
	#instVars : [
		'#annotationType => FMProperty',
		'#exchange => FMProperty',
		'#routingkey => FMProperty',
		'#connector => FMOne type: #CCVarAVarBConnector opposite: #sender'
	],
	#category : #'Connector-ModelVarAVarB-Entities'
}

{ #category : #meta }
CCVarAVarBSender class >> annotation [

	<FMClass: #Sender super: #CCVarAVarBEntity>
	<package: #'Connector-ModelVarAVarB'>
	<generated>
	^ self
]

{ #category : #accessing }
CCVarAVarBSender >> annotationType [

	<FMProperty: #annotationType type: #String>
	<generated>
	^ annotationType
]

{ #category : #accessing }
CCVarAVarBSender >> annotationType: anObject [
	<generated>
	annotationType := anObject
]

{ #category : #accessing }
CCVarAVarBSender >> connector [
	"Relation named: #connector type: #CCVarAVarBConnector opposite: #sender"

	<generated>
	<container>
	<derived>
	^ connector
]

{ #category : #accessing }
CCVarAVarBSender >> connector: anObject [

	<generated>
	connector := anObject
]

{ #category : #navigation }
CCVarAVarBSender >> connectorGroup [
	<generated>
	<navigation: 'Connector'>
	^ MooseSpecializedGroup with: self connector
]

{ #category : #accessing }
CCVarAVarBSender >> exchange [

	<FMProperty: #exchange type: #String>
	<generated>
	^ exchange
]

{ #category : #accessing }
CCVarAVarBSender >> exchange: anObject [
	<generated>
	exchange := anObject
]

{ #category : #accessing }
CCVarAVarBSender >> routingkey [

	<FMProperty: #routingkey type: #String>
	<generated>
	^ routingkey
]

{ #category : #accessing }
CCVarAVarBSender >> routingkey: anObject [
	<generated>
	routingkey := anObject
]

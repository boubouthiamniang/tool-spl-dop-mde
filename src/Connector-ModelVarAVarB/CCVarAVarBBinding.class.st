Class {
	#name : #CCVarAVarBBinding,
	#superclass : #CCVarAVarBEntity,
	#instVars : [
		'#routingkey => FMProperty',
		'#brokerConfig => FMOne type: #CCVarAVarBBrokerConfig opposite: #binding',
		'#queue => FMOne type: #CCVarAVarBQueue opposite: #brokerConfig',
		'#exchange => FMOne type: #CCVarAVarBExchange opposite: #brokerConfig'
	],
	#category : #'Connector-ModelVarAVarB-Entities'
}

{ #category : #meta }
CCVarAVarBBinding class >> annotation [

	<FMClass: #Binding super: #CCVarAVarBEntity>
	<package: #'Connector-ModelVarAVarB'>
	<generated>
	^ self
]

{ #category : #accessing }
CCVarAVarBBinding >> brokerConfig [
	"Relation named: #brokerConfig type: #CCVarAVarBBrokerConfig opposite: #binding"

	<generated>
	<container>
	^ brokerConfig
]

{ #category : #accessing }
CCVarAVarBBinding >> brokerConfig: anObject [

	<generated>
	brokerConfig := anObject
]

{ #category : #navigation }
CCVarAVarBBinding >> brokerConfigGroup [
	<generated>
	<navigation: 'BrokerConfig'>
	^ MooseSpecializedGroup with: self brokerConfig
]

{ #category : #accessing }
CCVarAVarBBinding >> exchange [
	"Relation named: #exchange type: #CCVarAVarBExchange opposite: #brokerConfig"

	<generated>
	^ exchange
]

{ #category : #accessing }
CCVarAVarBBinding >> exchange: anObject [

	<generated>
	exchange := anObject
]

{ #category : #accessing }
CCVarAVarBBinding >> queue [
	"Relation named: #queue type: #CCVarAVarBQueue opposite: #brokerConfig"

	<generated>
	^ queue
]

{ #category : #accessing }
CCVarAVarBBinding >> queue: anObject [

	<generated>
	queue := anObject
]

{ #category : #accessing }
CCVarAVarBBinding >> routingkey [

	<FMProperty: #routingkey type: #String>
	<generated>
	^ routingkey
]

{ #category : #accessing }
CCVarAVarBBinding >> routingkey: anObject [
	<generated>
	routingkey := anObject
]

Class {
	#name : #CCVarAVarBBrokerConfig,
	#superclass : #CCVarAVarBEntity,
	#instVars : [
		'#routingkey => FMProperty',
		'#exchange => FMProperty',
		'#connector => FMOne type: #CCVarAVarBConnector opposite: #brokerConfig',
		'#queue => FMMany type: #CCVarAVarBQueue opposite: #brokerConfig',
		'#binding => FMMany type: #CCVarAVarBBinding opposite: #brokerConfig'
	],
	#category : #'Connector-ModelVarAVarB-Entities'
}

{ #category : #meta }
CCVarAVarBBrokerConfig class >> annotation [

	<FMClass: #BrokerConfig super: #CCVarAVarBEntity>
	<package: #'Connector-ModelVarAVarB'>
	<generated>
	^ self
]

{ #category : #adding }
CCVarAVarBBrokerConfig >> addBinding: anObject [
	<generated>
	^ self binding add: anObject
]

{ #category : #adding }
CCVarAVarBBrokerConfig >> addExchange: anObject [
	<generated>
	^ self exchange add: anObject
]

{ #category : #adding }
CCVarAVarBBrokerConfig >> addQueue: anObject [
	<generated>
	^ self queue add: anObject
]

{ #category : #accessing }
CCVarAVarBBrokerConfig >> binding [
	"Relation named: #binding type: #CCVarAVarBBinding opposite: #brokerConfig"

	<generated>
	<derived>
	^ binding
]

{ #category : #accessing }
CCVarAVarBBrokerConfig >> binding: anObject [

	<generated>
	binding value: anObject
]

{ #category : #navigation }
CCVarAVarBBrokerConfig >> bindingGroup [
	<generated>
	<navigation: 'Binding'>
	^ MooseSpecializedGroup withAll: self binding asSet
]

{ #category : #accessing }
CCVarAVarBBrokerConfig >> connector [
	"Relation named: #connector type: #CCVarAVarBConnector opposite: #brokerConfig"

	<generated>
	<container>
	^ connector
]

{ #category : #accessing }
CCVarAVarBBrokerConfig >> connector: anObject [

	<generated>
	connector := anObject
]

{ #category : #navigation }
CCVarAVarBBrokerConfig >> connectorGroup [
	<generated>
	<navigation: 'Connector'>
	^ MooseSpecializedGroup with: self connector
]

{ #category : #accessing }
CCVarAVarBBrokerConfig >> exchange [

	<FMProperty: #exchange type: #String>
	<generated>
	^ exchange
]

{ #category : #accessing }
CCVarAVarBBrokerConfig >> exchange: anObject [
	<generated>
	exchange := anObject
]

{ #category : #navigation }
CCVarAVarBBrokerConfig >> exchangeGroup [
	<generated>
	<navigation: 'Exchange'>
	^ MooseSpecializedGroup withAll: self exchange asSet
]

{ #category : #accessing }
CCVarAVarBBrokerConfig >> queue [
	"Relation named: #queue type: #CCVarAVarBQueue opposite: #brokerConfig"

	<generated>
	<derived>
	^ queue
]

{ #category : #accessing }
CCVarAVarBBrokerConfig >> queue: anObject [

	<generated>
	queue value: anObject
]

{ #category : #navigation }
CCVarAVarBBrokerConfig >> queueGroup [
	<generated>
	<navigation: 'Queue'>
	^ MooseSpecializedGroup withAll: self queue asSet
]

{ #category : #accessing }
CCVarAVarBBrokerConfig >> routingkey [

	<FMProperty: #routingkey type: #String>
	<generated>
	^ routingkey
]

{ #category : #accessing }
CCVarAVarBBrokerConfig >> routingkey: anObject [
	<generated>
	routingkey := anObject
]

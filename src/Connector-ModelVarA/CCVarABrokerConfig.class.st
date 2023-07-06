Class {
	#name : #CCVarABrokerConfig,
	#superclass : #CCVarAEntity,
	#instVars : [
		'#routingkey => FMProperty',
		'#exchange => FMProperty',
		'#connector => FMOne type: #CCVarAConnector opposite: #brokerConfig',
		'#queue => FMMany type: #CCVarAQueue opposite: #brokerConfig',
		'#binding => FMMany type: #CCVarABinding opposite: #brokerConfig'
	],
	#category : #'Connector-ModelVarA-Entities'
}

{ #category : #meta }
CCVarABrokerConfig class >> annotation [

	<FMClass: #BrokerConfig super: #CCVarAEntity>
	<package: #'Connector-ModelVarA'>
	<generated>
	^ self
]

{ #category : #adding }
CCVarABrokerConfig >> addBinding: anObject [
	<generated>
	^ self binding add: anObject
]

{ #category : #adding }
CCVarABrokerConfig >> addExchange: anObject [
	<generated>
	^ self exchange add: anObject
]

{ #category : #adding }
CCVarABrokerConfig >> addQueue: anObject [
	<generated>
	^ self queue add: anObject
]

{ #category : #accessing }
CCVarABrokerConfig >> binding [
	"Relation named: #binding type: #CCVarABinding opposite: #brokerConfig"

	<generated>
	<derived>
	^ binding
]

{ #category : #accessing }
CCVarABrokerConfig >> binding: anObject [

	<generated>
	binding value: anObject
]

{ #category : #navigation }
CCVarABrokerConfig >> bindingGroup [
	<generated>
	<navigation: 'Binding'>
	^ MooseSpecializedGroup withAll: self binding asSet
]

{ #category : #accessing }
CCVarABrokerConfig >> connector [
	"Relation named: #connector type: #CCVarAConnector opposite: #brokerConfig"

	<generated>
	<container>
	^ connector
]

{ #category : #accessing }
CCVarABrokerConfig >> connector: anObject [

	<generated>
	connector := anObject
]

{ #category : #navigation }
CCVarABrokerConfig >> connectorGroup [
	<generated>
	<navigation: 'Connector'>
	^ MooseSpecializedGroup with: self connector
]

{ #category : #accessing }
CCVarABrokerConfig >> exchange [

	<FMProperty: #exchange type: #String>
	<generated>
	^ exchange
]

{ #category : #accessing }
CCVarABrokerConfig >> exchange: anObject [
	<generated>
	exchange := anObject
]

{ #category : #navigation }
CCVarABrokerConfig >> exchangeGroup [
	<generated>
	<navigation: 'Exchange'>
	^ MooseSpecializedGroup withAll: self exchange asSet
]

{ #category : #accessing }
CCVarABrokerConfig >> queue [
	"Relation named: #queue type: #CCVarAQueue opposite: #brokerConfig"

	<generated>
	<derived>
	^ queue
]

{ #category : #accessing }
CCVarABrokerConfig >> queue: anObject [

	<generated>
	queue value: anObject
]

{ #category : #navigation }
CCVarABrokerConfig >> queueGroup [
	<generated>
	<navigation: 'Queue'>
	^ MooseSpecializedGroup withAll: self queue asSet
]

{ #category : #accessing }
CCVarABrokerConfig >> routingkey [

	<FMProperty: #routingkey type: #String>
	<generated>
	^ routingkey
]

{ #category : #accessing }
CCVarABrokerConfig >> routingkey: anObject [
	<generated>
	routingkey := anObject
]

Class {
	#name : #CCBrokerConfig,
	#superclass : #CCEntity,
	#instVars : [
		'#routingkey => FMProperty',
		'#exchange => FMProperty',
		'#connector => FMOne type: #CCConnector opposite: #brokerConfig',
		'#queue => FMMany type: #CCQueue opposite: #brokerConfig',
		'#binding => FMMany type: #CCBinding opposite: #brokerConfig'
	],
	#category : #'Connector-Model-Entities'
}

{ #category : #meta }
CCBrokerConfig class >> annotation [

	<FMClass: #BrokerConfig super: #CCEntity>
	<package: #'Connector-ModelVarA'>
	<generated>
	^ self
]

{ #category : #adding }
CCBrokerConfig >> addBinding: anObject [
	<generated>
	^ self binding add: anObject
]

{ #category : #adding }
CCBrokerConfig >> addExchange: anObject [
	<generated>
	^ self exchange add: anObject
]

{ #category : #adding }
CCBrokerConfig >> addQueue: anObject [
	<generated>
	^ self queue add: anObject
]

{ #category : #accessing }
CCBrokerConfig >> binding [
	"Relation named: #binding type: #CCBinding opposite: #brokerConfig"

	<generated>
	<derived>
	^ binding
]

{ #category : #accessing }
CCBrokerConfig >> binding: anObject [

	<generated>
	binding value: anObject
]

{ #category : #navigation }
CCBrokerConfig >> bindingGroup [
	<generated>
	<navigation: 'Binding'>
	^ MooseSpecializedGroup withAll: self binding asSet
]

{ #category : #accessing }
CCBrokerConfig >> connector [
	"Relation named: #connector type: #CCConnector opposite: #brokerConfig"

	<generated>
	<container>
	^ connector
]

{ #category : #accessing }
CCBrokerConfig >> connector: anObject [

	<generated>
	connector := anObject
]

{ #category : #navigation }
CCBrokerConfig >> connectorGroup [
	<generated>
	<navigation: 'Connector'>
	^ MooseSpecializedGroup with: self connector
]

{ #category : #accessing }
CCBrokerConfig >> exchange [

	<FMProperty: #exchange type: #String>
	<generated>
	^ exchange
]

{ #category : #accessing }
CCBrokerConfig >> exchange: anObject [
	<generated>
	exchange := anObject
]

{ #category : #navigation }
CCBrokerConfig >> exchangeGroup [
	<generated>
	<navigation: 'Exchange'>
	^ MooseSpecializedGroup withAll: self exchange asSet
]

{ #category : #accessing }
CCBrokerConfig >> queue [
	"Relation named: #queue type: #CCQueue opposite: #brokerConfig"

	<generated>
	<derived>
	^ queue
]

{ #category : #accessing }
CCBrokerConfig >> queue: anObject [

	<generated>
	queue value: anObject
]

{ #category : #navigation }
CCBrokerConfig >> queueGroup [
	<generated>
	<navigation: 'Queue'>
	^ MooseSpecializedGroup withAll: self queue asSet
]

{ #category : #accessing }
CCBrokerConfig >> routingkey [

	<FMProperty: #routingkey type: #String>
	<generated>
	^ routingkey
]

{ #category : #accessing }
CCBrokerConfig >> routingkey: anObject [
	<generated>
	routingkey := anObject
]

Class {
	#name : #CCBinding,
	#superclass : #CCEntity,
	#instVars : [
		'#routingkey => FMProperty',
		'#brokerConfig => FMOne type: #CCBrokerConfig opposite: #binding',
		'#queue => FMOne type: #CCQueue opposite: #brokerConfig',
		'#exchange => FMOne type: #CCExchange opposite: #brokerConfig'
	],
	#category : #'Connector-Model-Entities'
}

{ #category : #meta }
CCBinding class >> annotation [

	<FMClass: #Binding super: #CCEntity>
	<package: #'Connector-ModelVarA'>
	<generated>
	^ self
]

{ #category : #accessing }
CCBinding >> brokerConfig [
	"Relation named: #brokerConfig type: #CCBrokerConfig opposite: #binding"

	<generated>
	<container>
	^ brokerConfig
]

{ #category : #accessing }
CCBinding >> brokerConfig: anObject [

	<generated>
	brokerConfig := anObject
]

{ #category : #navigation }
CCBinding >> brokerConfigGroup [
	<generated>
	<navigation: 'BrokerConfig'>
	^ MooseSpecializedGroup with: self brokerConfig
]

{ #category : #accessing }
CCBinding >> exchange [
	"Relation named: #exchange type: #CCExchange opposite: #brokerConfig"

	<generated>
	^ exchange
]

{ #category : #accessing }
CCBinding >> exchange: anObject [

	<generated>
	exchange := anObject
]

{ #category : #accessing }
CCBinding >> queue [
	"Relation named: #queue type: #CCQueue opposite: #brokerConfig"

	<generated>
	^ queue
]

{ #category : #accessing }
CCBinding >> queue: anObject [

	<generated>
	queue := anObject
]

{ #category : #accessing }
CCBinding >> routingkey [

	<FMProperty: #routingkey type: #String>
	<generated>
	^ routingkey
]

{ #category : #accessing }
CCBinding >> routingkey: anObject [
	<generated>
	routingkey := anObject
]

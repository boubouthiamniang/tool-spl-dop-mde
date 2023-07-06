Class {
	#name : #CCVarABinding,
	#superclass : #CCVarAEntity,
	#instVars : [
		'#routingkey => FMProperty',
		'#brokerConfig => FMOne type: #CCVarABrokerConfig opposite: #binding',
		'#queue => FMOne type: #CCVarAQueue opposite: #brokerConfig',
		'#exchange => FMOne type: #CCVarAExchange opposite: #brokerConfig'
	],
	#category : #'Connector-ModelVarA-Entities'
}

{ #category : #meta }
CCVarABinding class >> annotation [

	<FMClass: #Binding super: #CCVarAEntity>
	<package: #'Connector-ModelVarA'>
	<generated>
	^ self
]

{ #category : #accessing }
CCVarABinding >> brokerConfig [
	"Relation named: #brokerConfig type: #CCVarABrokerConfig opposite: #binding"

	<generated>
	<container>
	^ brokerConfig
]

{ #category : #accessing }
CCVarABinding >> brokerConfig: anObject [

	<generated>
	brokerConfig := anObject
]

{ #category : #navigation }
CCVarABinding >> brokerConfigGroup [
	<generated>
	<navigation: 'BrokerConfig'>
	^ MooseSpecializedGroup with: self brokerConfig
]

{ #category : #accessing }
CCVarABinding >> exchange [
	"Relation named: #exchange type: #CCVarAExchange opposite: #brokerConfig"

	<generated>
	^ exchange
]

{ #category : #accessing }
CCVarABinding >> exchange: anObject [

	<generated>
	exchange := anObject
]

{ #category : #accessing }
CCVarABinding >> queue [
	"Relation named: #queue type: #CCVarAQueue opposite: #brokerConfig"

	<generated>
	^ queue
]

{ #category : #accessing }
CCVarABinding >> queue: anObject [

	<generated>
	queue := anObject
]

{ #category : #accessing }
CCVarABinding >> routingkey [

	<FMProperty: #routingkey type: #String>
	<generated>
	^ routingkey
]

{ #category : #accessing }
CCVarABinding >> routingkey: anObject [
	<generated>
	routingkey := anObject
]

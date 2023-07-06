Class {
	#name : #CCVarAVarBQueue,
	#superclass : #CCVarAVarBEntity,
	#instVars : [
		'#queueName => FMProperty',
		'#durable => FMProperty',
		'#brokerConfig => FMOne type: #CCVarAVarBBrokerConfig opposite: #queue'
	],
	#category : #'Connector-ModelVarAVarB-Entities'
}

{ #category : #meta }
CCVarAVarBQueue class >> annotation [

	<FMClass: #Queue super: #CCVarAVarBEntity>
	<package: #'Connector-ModelVarAVarB'>
	<generated>
	^ self
]

{ #category : #accessing }
CCVarAVarBQueue >> brokerConfig [
	"Relation named: #brokerConfig type: #CCVarAVarBBrokerConfig opposite: #queue"

	<generated>
	<container>
	^ brokerConfig
]

{ #category : #accessing }
CCVarAVarBQueue >> brokerConfig: anObject [

	<generated>
	brokerConfig := anObject
]

{ #category : #navigation }
CCVarAVarBQueue >> brokerConfigGroup [
	<generated>
	<navigation: 'BrokerConfig'>
	^ MooseSpecializedGroup with: self brokerConfig
]

{ #category : #accessing }
CCVarAVarBQueue >> durable [

	<FMProperty: #durable type: #Boolean>
	<generated>
	^ durable
]

{ #category : #accessing }
CCVarAVarBQueue >> durable: anObject [
	<generated>
	durable := anObject
]

{ #category : #accessing }
CCVarAVarBQueue >> queueName [

	<FMProperty: #queueName type: #String>
	<generated>
	^ queueName
]

{ #category : #accessing }
CCVarAVarBQueue >> queueName: anObject [
	<generated>
	queueName := anObject
]

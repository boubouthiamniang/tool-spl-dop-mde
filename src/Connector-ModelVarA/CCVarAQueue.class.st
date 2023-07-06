Class {
	#name : #CCVarAQueue,
	#superclass : #CCVarAEntity,
	#instVars : [
		'#queueName => FMProperty',
		'#durable => FMProperty',
		'#brokerConfig => FMOne type: #CCVarABrokerConfig opposite: #queue'
	],
	#category : #'Connector-ModelVarA-Entities'
}

{ #category : #meta }
CCVarAQueue class >> annotation [

	<FMClass: #Queue super: #CCVarAEntity>
	<package: #'Connector-ModelVarA'>
	<generated>
	^ self
]

{ #category : #accessing }
CCVarAQueue >> brokerConfig [
	"Relation named: #brokerConfig type: #CCVarABrokerConfig opposite: #queue"

	<generated>
	<container>
	^ brokerConfig
]

{ #category : #accessing }
CCVarAQueue >> brokerConfig: anObject [

	<generated>
	brokerConfig := anObject
]

{ #category : #navigation }
CCVarAQueue >> brokerConfigGroup [
	<generated>
	<navigation: 'BrokerConfig'>
	^ MooseSpecializedGroup with: self brokerConfig
]

{ #category : #accessing }
CCVarAQueue >> durable [

	<FMProperty: #durable type: #Boolean>
	<generated>
	^ durable
]

{ #category : #accessing }
CCVarAQueue >> durable: anObject [
	<generated>
	durable := anObject
]

{ #category : #accessing }
CCVarAQueue >> queueName [

	<FMProperty: #queueName type: #String>
	<generated>
	^ queueName
]

{ #category : #accessing }
CCVarAQueue >> queueName: anObject [
	<generated>
	queueName := anObject
]

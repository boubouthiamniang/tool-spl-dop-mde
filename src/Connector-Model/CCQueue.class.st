Class {
	#name : #CCQueue,
	#superclass : #CCEntity,
	#instVars : [
		'#queueName => FMProperty',
		'#durable => FMProperty',
		'#brokerConfig => FMOne type: #CCBrokerConfig opposite: #queue'
	],
	#category : #'Connector-Model-Entities'
}

{ #category : #meta }
CCQueue class >> annotation [

	<FMClass: #Queue super: #CCEntity>
	<package: #'Connector-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
CCQueue >> brokerConfig [
	"Relation named: #brokerConfig type: #CCBrokerConfig opposite: #queue"

	<generated>
	<container>
	^ brokerConfig
]

{ #category : #accessing }
CCQueue >> brokerConfig: anObject [

	<generated>
	brokerConfig := anObject
]

{ #category : #navigation }
CCQueue >> brokerConfigGroup [
	<generated>
	<navigation: 'BrokerConfig'>
	^ MooseSpecializedGroup with: self brokerConfig
]

{ #category : #accessing }
CCQueue >> durable [

	<FMProperty: #durable type: #Boolean>
	<generated>
	^ durable
]

{ #category : #accessing }
CCQueue >> durable: anObject [
	<generated>
	durable := anObject
]

{ #category : #accessing }
CCQueue >> queueName [

	<FMProperty: #queueName type: #String>
	<generated>
	^ queueName
]

{ #category : #accessing }
CCQueue >> queueName: anObject [
	<generated>
	queueName := anObject
]

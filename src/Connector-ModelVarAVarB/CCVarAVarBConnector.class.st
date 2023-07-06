Class {
	#name : #CCVarAVarBConnector,
	#superclass : #CCVarAVarBEntity,
	#instVars : [
		'#name => FMProperty',
		'#brokerConfig => FMMany type: #CCVarAVarBBrokerConfig opposite: #connector',
		'#sender => FMOne type: #CCVarAVarBSender opposite: #connector',
		'#consumer => FMOne type: #CCVarAVarBConsumer opposite: #connector',
		'#router => FMOne type: #CCVarAVarBRouter opposite: #connector'
	],
	#category : #'Connector-ModelVarAVarB-Entities'
}

{ #category : #meta }
CCVarAVarBConnector class >> annotation [

	<FMClass: #Connector super: #CCVarAVarBEntity>
	<package: #'Connector-ModelVarAVarB'>
	<generated>
	^ self
]

{ #category : #adding }
CCVarAVarBConnector >> addBrokerConfig: anObject [
	<generated>
	^ self brokerConfig add: anObject
]

{ #category : #accessing }
CCVarAVarBConnector >> brokerConfig [
	"Relation named: #brokerConfig type: #CCVarAVarBBrokerConfig opposite: #connector"

	<generated>
	<derived>
	^ brokerConfig
]

{ #category : #accessing }
CCVarAVarBConnector >> brokerConfig: anObject [

	<generated>
	brokerConfig value: anObject
]

{ #category : #navigation }
CCVarAVarBConnector >> brokerConfigGroup [
	<generated>
	<navigation: 'BrokerConfig'>
	^ MooseSpecializedGroup withAll: self brokerConfig asSet
]

{ #category : #accessing }
CCVarAVarBConnector >> consumer [
	"Relation named: #consumer type: #CCVarAVarBConsumer opposite: #connector"

	<generated>
	^ consumer
]

{ #category : #accessing }
CCVarAVarBConnector >> consumer: anObject [

	<generated>
	consumer := anObject
]

{ #category : #navigation }
CCVarAVarBConnector >> consumerGroup [
	<generated>
	<navigation: 'Consumer'>
	^ MooseSpecializedGroup with: self consumer
]

{ #category : #accessing }
CCVarAVarBConnector >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
CCVarAVarBConnector >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
CCVarAVarBConnector >> router [
	"Relation named: #router type: #CCVarAVarBRouter opposite: #connector"

	<generated>
	^ router
]

{ #category : #accessing }
CCVarAVarBConnector >> router: anObject [

	<generated>
	router := anObject
]

{ #category : #navigation }
CCVarAVarBConnector >> routerGroup [
	<generated>
	<navigation: 'Router'>
	^ MooseSpecializedGroup with: self router
]

{ #category : #accessing }
CCVarAVarBConnector >> sender [
	"Relation named: #sender type: #CCVarAVarBSender opposite: #connector"

	<generated>
	^ sender
]

{ #category : #accessing }
CCVarAVarBConnector >> sender: anObject [

	<generated>
	sender := anObject
]

{ #category : #navigation }
CCVarAVarBConnector >> senderGroup [
	<generated>
	<navigation: 'Sender'>
	^ MooseSpecializedGroup with: self sender
]

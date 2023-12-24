Class {
	#name : #CCConnector,
	#superclass : #CCEntity,
	#instVars : [
		'#name => FMProperty',
		'#brokerConfig => FMMany type: #CCBrokerConfig opposite: #connector',
		'#sender => FMOne type: #CCSender opposite: #connector',
		'#consumer => FMOne type: #CCConsumer opposite: #connector',
		'#router => FMOne type: #CCRouter opposite: #connector'
	],
	#category : #'Connector-Model-Entities'
}

{ #category : #meta }
CCConnector class >> annotation [

	<FMClass: #Connector super: #CCEntity>
	<package: #'Connector-ModelVarA'>
	<generated>
	^ self
]

{ #category : #adding }
CCConnector >> addBrokerConfig: anObject [
	<generated>
	^ self brokerConfig add: anObject
]

{ #category : #accessing }
CCConnector >> brokerConfig [
	"Relation named: #brokerConfig type: #CCBrokerConfig opposite: #connector"

	<generated>
	<derived>
	^ brokerConfig
]

{ #category : #accessing }
CCConnector >> brokerConfig: anObject [

	<generated>
	brokerConfig value: anObject
]

{ #category : #navigation }
CCConnector >> brokerConfigGroup [
	<generated>
	<navigation: 'BrokerConfig'>
	^ MooseSpecializedGroup withAll: self brokerConfig asSet
]

{ #category : #accessing }
CCConnector >> consumer [
	"Relation named: #consumer type: #CCConsumer opposite: #connector"

	<generated>
	^ consumer
]

{ #category : #accessing }
CCConnector >> consumer: anObject [

	<generated>
	consumer := anObject
]

{ #category : #navigation }
CCConnector >> consumerGroup [
	<generated>
	<navigation: 'Consumer'>
	^ MooseSpecializedGroup with: self consumer
]

{ #category : #accessing }
CCConnector >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
CCConnector >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
CCConnector >> router [
	"Relation named: #router type: #CCRouter opposite: #connector"

	<generated>
	^ router
]

{ #category : #accessing }
CCConnector >> router: anObject [

	<generated>
	router := anObject
]

{ #category : #navigation }
CCConnector >> routerGroup [
	<generated>
	<navigation: 'Router'>
	^ MooseSpecializedGroup with: self router
]

{ #category : #accessing }
CCConnector >> sender [
	"Relation named: #sender type: #CCSender opposite: #connector"

	<generated>
	^ sender
]

{ #category : #accessing }
CCConnector >> sender: anObject [

	<generated>
	sender := anObject
]

{ #category : #navigation }
CCConnector >> senderGroup [
	<generated>
	<navigation: 'Sender'>
	^ MooseSpecializedGroup with: self sender
]

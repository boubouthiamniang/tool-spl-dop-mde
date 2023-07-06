Class {
	#name : #CCVarAConnector,
	#superclass : #CCVarAEntity,
	#instVars : [
		'#name => FMProperty',
		'#brokerConfig => FMMany type: #CCVarABrokerConfig opposite: #connector',
		'#sender => FMOne type: #CCVarASender opposite: #connector',
		'#consumer => FMOne type: #CCVarAConsumer opposite: #connector',
		'#router => FMOne type: #CCVarARouter opposite: #connector'
	],
	#category : #'Connector-ModelVarA-Entities'
}

{ #category : #meta }
CCVarAConnector class >> annotation [

	<FMClass: #Connector super: #CCVarAEntity>
	<package: #'Connector-ModelVarA'>
	<generated>
	^ self
]

{ #category : #adding }
CCVarAConnector >> addBrokerConfig: anObject [
	<generated>
	^ self brokerConfig add: anObject
]

{ #category : #accessing }
CCVarAConnector >> brokerConfig [
	"Relation named: #brokerConfig type: #CCVarABrokerConfig opposite: #connector"

	<generated>
	<derived>
	^ brokerConfig
]

{ #category : #accessing }
CCVarAConnector >> brokerConfig: anObject [

	<generated>
	brokerConfig value: anObject
]

{ #category : #navigation }
CCVarAConnector >> brokerConfigGroup [
	<generated>
	<navigation: 'BrokerConfig'>
	^ MooseSpecializedGroup withAll: self brokerConfig asSet
]

{ #category : #accessing }
CCVarAConnector >> consumer [
	"Relation named: #consumer type: #CCVarAConsumer opposite: #connector"

	<generated>
	^ consumer
]

{ #category : #accessing }
CCVarAConnector >> consumer: anObject [

	<generated>
	consumer := anObject
]

{ #category : #navigation }
CCVarAConnector >> consumerGroup [
	<generated>
	<navigation: 'Consumer'>
	^ MooseSpecializedGroup with: self consumer
]

{ #category : #accessing }
CCVarAConnector >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
CCVarAConnector >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
CCVarAConnector >> router [
	"Relation named: #router type: #CCVarARouter opposite: #connector"

	<generated>
	^ router
]

{ #category : #accessing }
CCVarAConnector >> router: anObject [

	<generated>
	router := anObject
]

{ #category : #navigation }
CCVarAConnector >> routerGroup [
	<generated>
	<navigation: 'Router'>
	^ MooseSpecializedGroup with: self router
]

{ #category : #accessing }
CCVarAConnector >> sender [
	"Relation named: #sender type: #CCVarASender opposite: #connector"

	<generated>
	^ sender
]

{ #category : #accessing }
CCVarAConnector >> sender: anObject [

	<generated>
	sender := anObject
]

{ #category : #navigation }
CCVarAConnector >> senderGroup [
	<generated>
	<navigation: 'Sender'>
	^ MooseSpecializedGroup with: self sender
]

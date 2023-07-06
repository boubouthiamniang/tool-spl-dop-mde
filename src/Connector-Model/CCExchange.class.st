Class {
	#name : #CCExchange,
	#superclass : #CCEntity,
	#instVars : [
		'#exchangeName => FMProperty',
		'#brokerConfig => FMOne type: #CCBrokerConfig opposite: #exchange'
	],
	#category : #'Connector-Model-Entities'
}

{ #category : #meta }
CCExchange class >> annotation [

	<FMClass: #Exchange super: #CCEntity>
	<package: #'Connector-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
CCExchange >> brokerConfig [
	"Relation named: #brokerConfig type: #CCBrokerConfig opposite: #exchange"

	<generated>
	<container>
	^ brokerConfig
]

{ #category : #accessing }
CCExchange >> brokerConfig: anObject [

	<generated>
	brokerConfig := anObject
]

{ #category : #navigation }
CCExchange >> brokerConfigGroup [
	<generated>
	<navigation: 'BrokerConfig'>
	^ MooseSpecializedGroup with: self brokerConfig
]

{ #category : #accessing }
CCExchange >> exchangeName [

	<FMProperty: #exchangeName type: #String>
	<generated>
	^ exchangeName
]

{ #category : #accessing }
CCExchange >> exchangeName: anObject [
	<generated>
	exchangeName := anObject
]

Class {
	#name : #CCVarAExchange,
	#superclass : #CCVarAEntity,
	#instVars : [
		'#exchangeName => FMProperty',
		'#brokerConfig => FMOne type: #CCVarABrokerConfig opposite: #exchange'
	],
	#category : #'Connector-ModelVarA-Entities'
}

{ #category : #meta }
CCVarAExchange class >> annotation [

	<FMClass: #Exchange super: #CCVarAEntity>
	<package: #'Connector-ModelVarA'>
	<generated>
	^ self
]

{ #category : #accessing }
CCVarAExchange >> brokerConfig [
	"Relation named: #brokerConfig type: #CCVarABrokerConfig opposite: #exchange"

	<generated>
	<container>
	^ brokerConfig
]

{ #category : #accessing }
CCVarAExchange >> brokerConfig: anObject [

	<generated>
	brokerConfig := anObject
]

{ #category : #navigation }
CCVarAExchange >> brokerConfigGroup [
	<generated>
	<navigation: 'BrokerConfig'>
	^ MooseSpecializedGroup with: self brokerConfig
]

{ #category : #accessing }
CCVarAExchange >> exchangeName [

	<FMProperty: #exchangeName type: #String>
	<generated>
	^ exchangeName
]

{ #category : #accessing }
CCVarAExchange >> exchangeName: anObject [
	<generated>
	exchangeName := anObject
]

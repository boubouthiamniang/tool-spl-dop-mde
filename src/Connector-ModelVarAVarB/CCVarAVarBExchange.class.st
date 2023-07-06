Class {
	#name : #CCVarAVarBExchange,
	#superclass : #CCVarAVarBEntity,
	#instVars : [
		'#exchangeName => FMProperty',
		'#brokerConfig => FMOne type: #CCVarAVarBBrokerConfig opposite: #exchange'
	],
	#category : #'Connector-ModelVarAVarB-Entities'
}

{ #category : #meta }
CCVarAVarBExchange class >> annotation [

	<FMClass: #Exchange super: #CCVarAVarBEntity>
	<package: #'Connector-ModelVarAVarB'>
	<generated>
	^ self
]

{ #category : #accessing }
CCVarAVarBExchange >> brokerConfig [
	"Relation named: #brokerConfig type: #CCVarAVarBBrokerConfig opposite: #exchange"

	<generated>
	<container>
	^ brokerConfig
]

{ #category : #accessing }
CCVarAVarBExchange >> brokerConfig: anObject [

	<generated>
	brokerConfig := anObject
]

{ #category : #navigation }
CCVarAVarBExchange >> brokerConfigGroup [
	<generated>
	<navigation: 'BrokerConfig'>
	^ MooseSpecializedGroup with: self brokerConfig
]

{ #category : #accessing }
CCVarAVarBExchange >> exchangeName [

	<FMProperty: #exchangeName type: #String>
	<generated>
	^ exchangeName
]

{ #category : #accessing }
CCVarAVarBExchange >> exchangeName: anObject [
	<generated>
	exchangeName := anObject
]

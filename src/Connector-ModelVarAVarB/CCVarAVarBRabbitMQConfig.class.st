Class {
	#name : #CCVarAVarBRabbitMQConfig,
	#superclass : #CCVarAVarBBrokerConfig,
	#instVars : [
		'#rabbitMQSpecAttribut => FMProperty'
	],
	#category : #'Connector-ModelVarAVarB-Entities'
}

{ #category : #meta }
CCVarAVarBRabbitMQConfig class >> annotation [

	<FMClass: #RabbitMQConfig super: #CCVarAVarBBrokerConfig>
	<package: #'Connector-ModelVarAVarB'>
	<generated>
	^ self
]

{ #category : #accessing }
CCVarAVarBRabbitMQConfig >> rabbitMQSpecAttribut [

	<FMProperty: #rabbitMQSpecAttribut type: #String>
	<generated>
	^ rabbitMQSpecAttribut
]

{ #category : #accessing }
CCVarAVarBRabbitMQConfig >> rabbitMQSpecAttribut: anObject [
	<generated>
	rabbitMQSpecAttribut := anObject
]

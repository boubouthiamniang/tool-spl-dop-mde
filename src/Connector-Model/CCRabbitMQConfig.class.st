Class {
	#name : #CCRabbitMQConfig,
	#superclass : #CCBrokerConfig,
	#instVars : [
		'#rabbitMQSpecAttribut => FMProperty'
	],
	#category : #'Connector-Model-Entities'
}

{ #category : #meta }
CCRabbitMQConfig class >> annotation [

	<FMClass: #RabbitMQConfig super: #CCBrokerConfig>
	<package: #'Connector-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
CCRabbitMQConfig >> rabbitMQSpecAttribut [

	<FMProperty: #rabbitMQSpecAttribut type: #String>
	<generated>
	^ rabbitMQSpecAttribut
]

{ #category : #accessing }
CCRabbitMQConfig >> rabbitMQSpecAttribut: anObject [
	<generated>
	rabbitMQSpecAttribut := anObject
]

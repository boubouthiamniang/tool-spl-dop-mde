Class {
	#name : #CCVarARabbitMQConfig,
	#superclass : #CCVarABrokerConfig,
	#instVars : [
		'#rabbitMQSpecAttribut => FMProperty'
	],
	#category : #'Connector-ModelVarA-Entities'
}

{ #category : #meta }
CCVarARabbitMQConfig class >> annotation [

	<FMClass: #RabbitMQConfig super: #CCVarABrokerConfig>
	<package: #'Connector-ModelVarA'>
	<generated>
	^ self
]

{ #category : #accessing }
CCVarARabbitMQConfig >> rabbitMQSpecAttribut [

	<FMProperty: #rabbitMQSpecAttribut type: #String>
	<generated>
	^ rabbitMQSpecAttribut
]

{ #category : #accessing }
CCVarARabbitMQConfig >> rabbitMQSpecAttribut: anObject [
	<generated>
	rabbitMQSpecAttribut := anObject
]

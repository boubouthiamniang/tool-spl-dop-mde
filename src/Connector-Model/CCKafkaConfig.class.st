Class {
	#name : #CCKafkaConfig,
	#superclass : #CCBrokerConfig,
	#instVars : [
		'#kafkaSpecAttibut => FMProperty'
	],
	#category : #'Connector-Model-Entities'
}

{ #category : #meta }
CCKafkaConfig class >> annotation [

	<FMClass: #KafkaConfig super: #CCBrokerConfig>
	<package: #'Connector-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
CCKafkaConfig >> kafkaSpecAttibut [

	<FMProperty: #kafkaSpecAttibut type: #String>
	<generated>
	^ kafkaSpecAttibut
]

{ #category : #accessing }
CCKafkaConfig >> kafkaSpecAttibut: anObject [
	<generated>
	kafkaSpecAttibut := anObject
]

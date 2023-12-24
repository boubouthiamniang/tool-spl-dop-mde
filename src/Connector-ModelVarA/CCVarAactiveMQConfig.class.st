Class {
	#name : #CCVarAActiveMQConfig,
	#superclass : #CCVarABrokerConfig,
	#instVars : [
		'#activeMQSpecAttribut => FMProperty'
	],
	#category : #'Connector-ModelVarA-Entities'
}

{ #category : #meta }
CCVarAActiveMQConfig class >> annotation [

	<FMClass: #ActiveMQConfig super: #CCVarABrokerConfig>
	<package: #'Connector-ModelVarA'>
	<generated>
	^ self
]

{ #category : #accessing }
CCVarAActiveMQConfig >> activeMQSpecAttribut [

	<FMProperty: #activeMQSpecAttribut type: #String>
	<generated>
	^ activeMQSpecAttribut
]

{ #category : #accessing }
CCVarAActiveMQConfig >> activeMQSpecAttribut: anObject [
	<generated>
	activeMQSpecAttribut := anObject
]

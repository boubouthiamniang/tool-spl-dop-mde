Class {
	#name : #CCActiveMQConfig,
	#superclass : #CCBrokerConfig,
	#instVars : [
		'#activeMQSpecAttribut => FMProperty'
	],
	#category : #'Connector-Model-Entities'
}

{ #category : #meta }
CCActiveMQConfig class >> annotation [

	<FMClass: #ActiveMQConfig super: #CCBrokerConfig>
	<package: #'Connector-ModelVarA'>
	<generated>
	^ self
]

{ #category : #accessing }
CCActiveMQConfig >> activeMQSpecAttribut [

	<FMProperty: #activeMQSpecAttribut type: #String>
	<generated>
	^ activeMQSpecAttribut
]

{ #category : #accessing }
CCActiveMQConfig >> activeMQSpecAttribut: anObject [
	<generated>
	activeMQSpecAttribut := anObject
]

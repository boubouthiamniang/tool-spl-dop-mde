Class {
	#name : #CCactiveMQConfig,
	#superclass : #CCBrokerConfig,
	#instVars : [
		'#activeMQSpecAttribut => FMProperty'
	],
	#category : #'Connector-Model-Entities'
}

{ #category : #meta }
CCactiveMQConfig class >> annotation [

	<FMClass: #activeMQConfig super: #CCBrokerConfig>
	<package: #'Connector-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
CCactiveMQConfig >> activeMQSpecAttribut [

	<FMProperty: #activeMQSpecAttribut type: #String>
	<generated>
	^ activeMQSpecAttribut
]

{ #category : #accessing }
CCactiveMQConfig >> activeMQSpecAttribut: anObject [
	<generated>
	activeMQSpecAttribut := anObject
]

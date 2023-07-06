Class {
	#name : #CCVarAactiveMQConfig,
	#superclass : #CCVarABrokerConfig,
	#instVars : [
		'#activeMQSpecAttribut => FMProperty'
	],
	#category : #'Connector-ModelVarA-Entities'
}

{ #category : #meta }
CCVarAactiveMQConfig class >> annotation [

	<FMClass: #activeMQConfig super: #CCVarABrokerConfig>
	<package: #'Connector-ModelVarA'>
	<generated>
	^ self
]

{ #category : #accessing }
CCVarAactiveMQConfig >> activeMQSpecAttribut [

	<FMProperty: #activeMQSpecAttribut type: #String>
	<generated>
	^ activeMQSpecAttribut
]

{ #category : #accessing }
CCVarAactiveMQConfig >> activeMQSpecAttribut: anObject [
	<generated>
	activeMQSpecAttribut := anObject
]

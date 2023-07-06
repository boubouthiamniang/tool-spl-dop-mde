Class {
	#name : #CCVarAVarBEntity,
	#superclass : #MooseEntity,
	#category : #'Connector-ModelVarAVarB-Entities'
}

{ #category : #meta }
CCVarAVarBEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Connector-ModelVarAVarB'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
CCVarAVarBEntity class >> isAbstract [

	<generated>
	^ self == CCVarAVarBEntity
]

{ #category : #meta }
CCVarAVarBEntity class >> metamodel [

	<generated>
	^ CCVarAVarBModel metamodel
]

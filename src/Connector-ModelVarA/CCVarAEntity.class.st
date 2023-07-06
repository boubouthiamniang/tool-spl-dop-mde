Class {
	#name : #CCVarAEntity,
	#superclass : #MooseEntity,
	#category : #'Connector-ModelVarA-Entities'
}

{ #category : #meta }
CCVarAEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Connector-ModelVarA'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
CCVarAEntity class >> isAbstract [

	<generated>
	^ self == CCVarAEntity
]

{ #category : #meta }
CCVarAEntity class >> metamodel [

	<generated>
	^ CCVarAModel metamodel
]

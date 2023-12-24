Class {
	#name : #CCEntity,
	#superclass : #MooseEntity,
	#category : #'Connector-Model-Entities'
}

{ #category : #meta }
CCEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Connector-ModelVarA'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
CCEntity class >> isAbstract [

	<generated>
	^ self == CCEntity
]

{ #category : #meta }
CCEntity class >> metamodel [

	<generated>
	^ CCModel metamodel
]

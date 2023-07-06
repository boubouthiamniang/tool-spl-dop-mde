Class {
	#name : #CCEntity,
	#superclass : #MooseEntity,
	#category : #'Connector-Model-Entities'
}

{ #category : #meta }
CCEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Connector-Model'>
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

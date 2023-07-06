Class {
	#name : #BaselineOfToolSplDopMde,
	#superclass : #BaselineOf,
	#category : #BaselineOfToolSplDopMde
}

{ #category : #baselines }
BaselineOfToolSplDopMde >> baseline: spec [
    <baseline>
    spec
    for: #common
    do: [ 
        self defineDependencies: spec.
        self definePackages: spec.
        self defineGroups: spec ]

]

{ #category : #baselines }
BaselineOfToolSplDopMde >> defineDependencies: spec [
    spec
        baseline: 'SQLite3'
        with: [ spec
            repository: 'github://pharo-rdbms/Pharo-SQLite3/src' ].

]

{ #category : #baselines }
BaselineOfToolSplDopMde >> defineGroups: spec [



]

{ #category : #baselines }
BaselineOfToolSplDopMde >> definePackages: spec [

	spec
		package: 'Connector-Delta-IHM'
		with: [ spec requires: #( 'SQLite3-Core' ) ];
		package: 'Connector-Delta-Manager'
		with: [ spec requires: #( 'SQLite3-Core' ) ];
		package: 'Connector-Model';
		package: 'Connector-Model-Generator';
		package: 'Connector-ModelVarA';
		package: 'Connector-ModelVarAVarB'.

]

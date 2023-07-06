Class {
	#name : #SplDopMdeToolApplication,
	#superclass : #SpApplication,
	#category : #'Connector-Delta-IHM'
}

{ #category : #initialization }
SplDopMdeToolApplication >> start [ 	
	^ SpDopToolStartPresenter new open.
]

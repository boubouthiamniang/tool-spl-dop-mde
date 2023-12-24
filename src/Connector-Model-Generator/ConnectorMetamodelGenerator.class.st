Class {
	#name : #ConnectorMetamodelGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'connector',
		'sender',
		'consumer',
		'router',
		'queue',
		'exchange',
		'binding',
		'rabbitMQConfig',
		'kafkaConfig',
		'brokerConfig',
		'activeMQConfig'
	],
	#classInstVars : [
		'builder',
		'connector',
		'sender',
		'consumer',
		'router',
		'brockerConfig',
		'queue',
		'exchange',
		'binding'
	],
	#category : #'Connector-Model-Generator'
}

{ #category : #accessing }
ConnectorMetamodelGenerator class >> packageName [
    ^ #'Connector-Model'

]

{ #category : #accessing }
ConnectorMetamodelGenerator class >> prefix [
    ^ #'CC'

]

{ #category : #definition }
ConnectorMetamodelGenerator >> defineClasses [
    super defineClasses.
    connector := builder newClassNamed: #Connector.

    sender := builder newClassNamed: #Sender.
 	 consumer := builder newClassNamed: #Consumer.
	
    router := builder newClassNamed: #Router.

    brokerConfig := builder newClassNamed: #BrokerConfig.
    rabbitMQConfig := builder newClassNamed: #RabbitMQConfig.
	 kafkaConfig := builder newClassNamed: #KafkaConfig.
	 activeMQConfig := builder newClassNamed: #ActiveMQConfig.
	
    queue := builder newClassNamed: #Queue.
    exchange := builder newClassNamed: #Exchange.
    binding := builder newClassNamed: #Binding


]

{ #category : #definition }
ConnectorMetamodelGenerator >> defineHierarchy [
    super defineHierarchy.
    rabbitMQConfig --|> brokerConfig.
    kafkaConfig --|> brokerConfig.
    activeMQConfig --|> brokerConfig.
]

{ #category : #definition }
ConnectorMetamodelGenerator >> defineProperties [
    super defineProperties.
    connector property: #name type: #String.

	 sender property: #annotationType type: #String.
	 sender property: #exchange type: #String.
	 sender property: #routingkey type: #String.
	
	 consumer property: #type type: #String.
	
	 brokerConfig property: #routingkey type: #String.
	 brokerConfig property: #exchange type: #String.
	
	 rabbitMQConfig property: #rabbitMQSpecAttribut type: #String.
	 kafkaConfig property: #kafkaSpecAttibut type: #String.
	 activeMQConfig property: #activeMQSpecAttribut type: #String.

    queue property: #queueName type: #String.
    queue property: #durable type: #Boolean.

    exchange property: #exchangeName type: #String.
    
    binding property: #routingkey type: #String.
	

]

{ #category : #definition }
ConnectorMetamodelGenerator >> defineRelations [
   (connector property: #brokerConfig) <>-* (brokerConfig property: #connector).
	(connector property: #sender) <>- (sender property: #connector).
	(connector property: #consumer) <>- (consumer property: #connector).
	(connector property: #router) <>- (router property: #connector).
	
	(brokerConfig property: #queue) <>-* (queue property: #brokerConfig).
	(brokerConfig property: #exchange) <>-* (exchange property: #brokerConfig).
	(brokerConfig property: #binding) <>-* (binding property: #brokerConfig).
	
	(binding property: #queue) - (queue property: #brokerConfig).
	(binding property: #exchange) - (exchange property: #brokerConfig).



]

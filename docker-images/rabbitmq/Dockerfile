FROM rabbitmq:management
COPY config/rabbitmq.conf  /etc/rabbitmq
RUN rabbitmq-plugins enable --offline rabbitmq_peer_discovery_consul rabbitmq_shovel rabbitmq_shovel_management

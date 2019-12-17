FROM cassandra:latest
COPY config/cassandra/cassandra.yaml /etc/cassandra/cassandra.yaml

# Build Prometheus Agent Jmx
ENV JMX_PROMETHEUS_JAVA_AGENT_VERSION=0.12.0

ADD http://central.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/${JMX_PROMETHEUS_JAVA_AGENT_VERSION}/jmx_prometheus_javaagent-${JMX_PROMETHEUS_JAVA_AGENT_VERSION}.jar /usr/app/jmx_prometheus_javaagent.jar

COPY config/prometheus/prometheus.yml /usr/app/prometheus.yml

EXPOSE 31500

RUN chmod +r /usr/app/jmx_prometheus_javaagent.jar \
 && echo 'JVM_OPTS="$JVM_OPTS -javaagent:/usr/app/jmx_prometheus_javaagent.jar=31500:/usr/app/prometheus.yml"' >> /etc/cassandra/cassandra-env.sh

FROM fluent/fluentd:latest

RUN gem install fluent-plugin-elasticsearch

ENV ELASTICSEARCH_HOST=localhost
ENV ELASTICSEARCH_PORT=9200

COPY fluentd-entry.sh /fluentd-entry.sh
CMD [ "/fluentd-entry.sh" ]


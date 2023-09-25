FROM apache/spark:latest
USER root

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.11

RUN mkdir -p /opt/conda/bin
RUN ln -s /usr/bin/python3.11 /opt/conda/bin/python

COPY spark-worker-entrypoint.sh ./spark-worker-entrypoint.sh
RUN chmod +x ./spark-worker-entrypoint.sh

CMD ["/bin/bash", "./spark-worker-entrypoint.sh"]

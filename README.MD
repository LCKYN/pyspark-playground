# README for Spark Cluster and Jupyter Notebook

This repository contains a Docker Compose configuration to set up a Spark cluster and a Jupyter Notebook server for running Spark applications in a development environment.

## Prerequisites

Before you begin, make sure you have the following installed:

- [Docker](https://www.docker.com/)

## Getting Started

1. Clone this repository to your local machine:

   ```shell
   git clone <repository-url>
   cd <repository-directory>
   ```

2. Build the Docker containers for Spark master and worker nodes:

   ```shell
   docker-compose build
   ```

3. Start the Spark cluster and Jupyter Notebook server:

   ```shell
   docker-compose up -d
   ```

   The `-d` flag runs the containers in the background.

4. Access the Jupyter Notebook server at [http://localhost:8899](http://localhost:8899) in your web browser. You can start creating notebooks and running Spark applications from here.

## Components

This Docker Compose configuration includes the following components:

### Spark Master

- Container Name: `spark-master`
- Ports:
  - Spark Web UI: [http://localhost:8081](http://localhost:8081)
  - Spark Master Port: 7077

### Spark Worker

- Container Name: `spark-worker`
- Ports:
  - Spark Worker Web UI: [http://localhost:8082](http://localhost:8082)
  - Spark Worker Port: 7078
- Environment Variables:
  - `SPARK_MASTER`: The address of the Spark Master (`spark-master:7077`)

### Jupyter Notebook Server

- Container Name: `notebook`
- Image: `jupyter/all-spark-notebook`
- Ports:
  - Jupyter Notebook Web UI: [http://localhost:8899](http://localhost:8899)
- Volumes:
  - Mounts notebooks from `./jupyter-notebook/notebooks` to the Jupyter home directory.
  - Mounts Spark configuration from `./jupyter-notebook/spark/conf` to the Spark configuration directory.
- Environment Variables:
  - `SPARK_MASTER`: The address of the Spark Master (`spark-master`)

## Customization

You can customize this setup by modifying the following:

- Spark configuration can be adjusted in the `./jupyter-notebook/spark/conf` directory.
- You can add your own notebooks or code to the `./jupyter-notebook/notebooks` directory.

## Stopping the Cluster

To stop the Spark cluster and Jupyter Notebook server, run:

```shell
docker-compose down
```

## Cleaning Up

To remove all Docker containers and associated volumes, run:

```shell
docker-compose down -v
```

## Note

- Ensure that the necessary Docker images are downloaded the first time you run `docker-compose up`. It may take some time to download the images depending on your internet connection speed.

- This setup is intended for development and testing purposes. Ensure that you have the required resources (CPU and memory) available on your machine to run Spark applications effectively.

- Security note: The Jupyter Notebook server is configured with an empty token and password for simplicity. In a production environment, it is strongly recommended to configure proper authentication and security measures.

- Make sure to adapt this configuration to your specific needs and requirements.

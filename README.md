# MAC and IP Routing

A simple demo with clients and routers to illustrate how IP and MAC addresses work together to route packets.

This demo is a part of [my talk on MAC and IP Routing](https://talks.harshkapadia.me/mac-and-ip-routing).

## Network Topology

![](img/network-topology.png)

## Setup

> Some of the instructions are pertaining to a Windows base OS, but it should be easy to find similar instructions for other OSs online.

-   Install [Docker](https://docker.com) to simulate clients, routers and subnets.
    -   [More on Docker](https://harshkapadia2.github.io/docker)
-   Install a X Server for GUI support.
    -   [Run GUI app in linux docker container on windows host](https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde)
    -   Change the `DISPLAY` environment variable in all the services in [the `compose.yaml` file](compose.yaml) with the appropriate IP address.
-   Navigate to the project root directory (`mac-ip-routing`).
-   Build the custom Docker image with the name `nhttpd` (Networked [HTTPd](https://httpd.apache.org)) from [the `Dockerfile`](Dockerfile).
    -   Ensure that no existing image has the name `nhttpd` using the `docker image ls` command.
        -   If an image with that name already exists, then either delete that image (`docker image rm <image_id>`) or change the image name in the command below and then in the [the `compose.yaml` file](compose.yaml) as well.
    -   Build Docker image: `docker build . -t nhttpd`
-   Create and/or start containers and subnets
    -   Ensure that no existing containers have the same names as the `container_name` field in all the `services` listed in [the `compose.yaml` file](compose.yaml) using the command `docker container ls`.
        -   If any containers have their names matching any of the names in the `compose.yaml` file, either delete the existing container (`docker container rm <container_id>`) or change the corresponding `container_name` field in the `compose.yaml` file.
    -   Ensure that no existing networks have the same names as the `name` field in all the `networks` listed in [the `compose.yaml` file](compose.yaml) using the command `docker network ls`.
        -   If any networks have their names matching any of the names in the `compose.yaml` file, either delete the existing network (`docker network rm <container_id>`) or change the corresponding `name` field in the `compose.yaml` file.
    -   Use [Docker Compose](https://docs.docker.com/compose) (bundled with the default Docker installation) to create and/or start the clients and routers, and if required, to create the networks as well: `docker compose up`
    -   If faced with Docker bugs and errors, please clear all containers (`docker container rm node-a node-b node-c router-1 router-2 router-3`) and networks (`docker network rm net-1 net-2 net-3 net-4`) before running `docker compose up` again.

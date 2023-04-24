# Super-SLAM Docker
Docker for ```Super-SLAM``` system

This application builds ```Super-SLAM``` algorithm in a docker container.
# Build the docker 
Building the docker can take a while, and at least 15GB from disk space.

To ccess data from/to Docker:
```
mkdir Dataset
```
Workspace required to have these folders and files:
```
.
├── Dataset
├── super-slam
├── Dockerfile
├── eigen-3.3.9.zip
├── README.md
└── Run_docker.sh
```
Run the following command to build the docker. 
```
sudo docker build -t super .
```
# Run the docker
The following command will open a docker terminal
```
./Run_docker.sh
```

# Exit the docker
Inside the docker just type the following command, but the docker will still be activate when you leave:
```
exit
```

# Kill docker process
Outside the docker, type the following command to show all docker process running
```
sudo docker ps -a
```
To kill a docker: 
```
sudo docker rm <CONTAINER ID> 
```

# Remove Docker image
Outside the docker, type the following command to show all docker images running
```
sudo docker images
```
To erase a docker image:
```
sudo docker rmi <IMAGE ID>


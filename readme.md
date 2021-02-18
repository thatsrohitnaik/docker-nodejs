FROM alpine
# A minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size!
FROM node:12
# install nodejs version 12
WORKDIR /usr/src/app
# use this location to copy the application 
COPY package*.json ./
# it makes sure both package.json AND package-lock.json are copied
RUN npm install
# this will install all dependecies 
COPY . .
# Bundle app source
EXPOSE 3001
# exposes port 3001 
CMD [ "node", "index.js" ]
# runs the node application 
# node app is build to run on port 3001 hence we have exposed this port

# you need to name the docker file as Dockerfile specifically
# Dockerfile is like instaructions for build
# once created need to build the docker image
docker build -t itsrohitnaik/node .
# build the docker image itsrohitnaik is my username on dockerhub
docker images
# once the build is done docker image is created this command will list all the images for you
docker run -p 3001:3001 -d itsrohitnaik/nodejsHelloWorld
# above command will run docker image and link port 9090 with the exposed port 3001 in the docker image
# http://0.0.0.0:3001/

docker ps
# this will show all the docker images that are currently runninh 
docker ps -a
# Show all the docker images that were run 
docker logs containerid
# shows the logs of the container
docker exec -it <container id> /bin/bash
# this will take you to terminal of the container
docker stop containerid
# stops the container


# gcp authenticate 
cat keys.json | docker login -u _json_key --password-stdin https://gcr.io
# give access to docker app
docker login -u _json_key -p "$(cat keys.json)" https://gcr.io
# repo 
docker tag imagename gcr.io/project-id/imagename

# Kubernetes deployment via command line 
# Creating deployment and exposing services

kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4
kubectl expose deployment hello-minikube --type=NodePort --port=8080


# Steps to Deploy on Google Kubernetes Engine 

# Step 1 
# Publish your App image on DockerHub or on Google Container Registry (Privatly)
# You can find the video link to Push on GCP in below section
# Uploading on Docker Hub is simple, all you need to do is login via Dokcer Dashboard App onto your DockerHub account and Push.


# Setp 2 
# Create Kubernetes Cluster on GCP 
# Connect to the cluster 
# i already have one create so i wont create a new also it takes time to create
# now we connect with the cluster via google cloud shell

# We are creating a deployment of image at 
# https://hub.docker.com/repository/docker/itsrohitnaik/nodejs-hello-world-app

kubectl create deployment nodejs-app --image=itsrohitnaik/nodejs-hello-world-app

# Step 3 
# Expose the service
# Since this app runs on port 3001 we will be exposing this port to external users
kubectl expose deployment nodejs-app --type=LoadBalancer --port=3001


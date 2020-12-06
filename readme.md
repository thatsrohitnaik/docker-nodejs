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
docker run -p 9090:3001 -d itsrohitnaik/abc
# above command will run docker image and link port 9090 with the exposed port 3001 in the docker image
# http://0.0.0.0:9090/

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



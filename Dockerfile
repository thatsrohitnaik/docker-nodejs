FROM alpine
#A minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size!
FROM node:12
#install nodejs version 12
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

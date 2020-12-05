https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

docker build -t itsrohitnaik/node .

docker images

docker run -p 49160:9090 -d itsrohitnaik/node
docker run -p 49160:8080 -d <your username>/node-web-app


docker run -it --entrypoint /bin/bash itsrohitnaik/abc -s

docker ps

docker logs constainerid

docker exec -it <container id> /bin/bash

docker stop containerid




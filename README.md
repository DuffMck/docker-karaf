# Docker container with Apache Karaf

To run the container 
```
docker run -it --name karaf -p 1099:1099 -p 8101:8101 -p 44444:44444 -v /Users/david/tmp/docker/karaf:/deploy docker-karaf
```

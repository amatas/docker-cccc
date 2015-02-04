## CCCC Dockerfile


This repository is used to build [Controllable Crowd Caption Correction] Docker image.


### Port(s) Exposed

* `8080 TCP`


### Base Docker Image

* [inclusivedesign/resin](https://github.com/idi-ops/docker-resin/)


### Volumes

* /var/resin

### Download

    docker pull trace/ccc


#### Run `Resin`


```
docker run \
-d \
-p 8080:8080 \
--name="resin" \
trace/ccc
```

### Build your own image


    docker build --rm=true -t <your name>/ccc .

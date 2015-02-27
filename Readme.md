## CCCC Dockerfile details


This repository is used to build [Controllable Crowd Caption Correction](https://github.com/GPII/controllable-crowd-caption-correction) Docker image.


### Port(s) Exposed

* `8080 TCP`


### Base Docker Image

* [inclusivedesign/resin](https://github.com/idi-ops/docker-resin/)


### Volumes

* /var/resin

## How to deploy the container


### Download

If the container is available in [Docker Hub Registry](https://registry.hub.docker.com/) you can run this command to fetch a already built container:

```
docker pull trace/ccc
```

### Build the container

Also, you can build the container using the source code of this git repository:

1. Clone this repository
  
  ```
  git clone https://github.com/gpii-ops/docker-ccc.git
  ```

2. Clone the source data of CCCC

  ```
  cd docker-ccc
  git clone https://github.com/GPII/controllable-crowd-caption-correction.git data
  ```
 
3. Build the container

  ```
  docker build --rm=true -t trace/ccc .
  ```

### Run `Resin`

That commmand will make that the application listens at 8080 port of the local machine:


```
docker run \
-d \
-p 8080:8080 \
-e "CCC_PASSWORD=secretpassword" \
--name="resin" \
trace/ccc
```



## Development and testing

  A Vagrantfile is provided in order to make easier the testing and the development of the application. [Vagrant application](https://www.vagrantup.com/) and [Virtualbox](https://www.virtualbox.org/) are needed to boot a virtual machine with all the stuff inside it.

  The application source must be in the "data" directory, and any change made in that directory will be reflected in the running application.

  ```
  git clone https://github.com/gpii-ops/docker-ccc.git
  cd docker-ccc
  git clone https://github.com/GPII/controllable-crowd-caption-correction.git data
  ```
  
  Once Vagrant is installed to boot up the virtual machine run the following command:

  ```
  vagrant up
  ```

  The application is served through the 127.0.0.1:8888 port of the local machine.

  *The first time that you run this command Vagrant downloads some image files, so this proccess takes some time.*

### Shutdown the virtual machine:
  ```
  vagrant halt
  ```

### Access to the virtual machine using SSH:

  ```
  vagrant ssh
  ```

### Redeploy the components

  If you need to deploy all the docker containers in the virtual machine run:

  ```
  vagrant provision
  ```

### Reset the environment

  If you want to start from the beggining: destroy the vm and create a new one:

  ```
  vagrant destroy
  vagrant up
  ```

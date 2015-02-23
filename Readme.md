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

### Development and testing

  A Vagrantfile is provided in order to make easy the testing and the development of the application. [Vagrant application](https://www.vagrantup.com/) and [Virtualbox](https://www.virtualbox.org/) are needed to boot a virtual machine with all the stuff inside it.

  The application source must be in the "data" directory, and any change made in that directory will be reflected in the running application.

  The application is served through the 127.0.0.1:8888 port of the local machine.

  Once Vagrant is installed to boot up the virtual machine run the following command:

  ```
  vagrant up
  ```

  *The first time that you run this command Vagrant downloads some image files, so this proccess takes some time.*

  to shutdown the virtual machine:
  ```
  vagrant halt
  ```

  to access to the virtual machine using SSH:
  ```
  vagrant ssh
  ```


  If you need to deploy all the docker containers in the virtual machine run:

  ```
  vagrant provision
  ```

  If you want to start from the beggining: destroy the vm and create a new one:

  ```
  vagrant destroy
  vagrnat up
  ```

# kubetest

A self serving repository to demonstrate local setup of minikube. Assumes the ```kubectl```, ```minikube```, ```docker-toolbox```, ```java``` and ```maven``` have been already installed on the system. Note that there is no remote container registry involved in this. We setup minikube in such a way that local docker images on system are picked up rather than via a pull from a remote container registry. This will (obviously) have to be changed in a prod like environment. Docker run command in ```step 5``` although not required is placed in between nevertheless just to validate the successful creation and run of an atomic container outside the scope of kubernetes. Thereafter the docker container is deleted and recreated within the kubernetes pod with ```kubectl``` commands based on the settings picked up from ```yml``` file. 

1. Open terminal and start minikube
```
minikube start
```
2. Check minikube's docker-environment 
```
minikube docker-en
```
3. Point the terminal to minikube's docker-daemon. This is done because we want minikube to use the locally built images rather than using images from remote registry. Check pull policy in ```echokube.yml```
```
eval $(minikube -p minikube docker-env)
```
4. Change directory to basefolder and build the jar 
```
mvn package
```
2. Run the program from command line 
```
java -cp target/kubetest-1.0.jar com.nerdysermons.Echo hello 1
```
3. Check the dockerfile and build image 
```
docker build -t kubetest .
```
4. Validate the successful docker image built
```
docker images
```
5. Create a container with the latest tag  and validate a successful run of the program, first as a docker container
```
docker run kubetest:latest
```
6. A container was validated using docker run. We can now delete all containers. 
```
docker rm $(docker ps -aq)  
```
7. Create the container with kubectl inside a pod using the settings picked up from ```echokube.yml```
```
kubectl create -f echokube.yml 
```
8. View pod info 
```
kubectl get pods
```
9. Get logs from pod name of previous command's output 
```
kubectl logs <podname>
```
10. View minikube dashboard for running pod status and other details 
```
minikube dashboard
```
11. Clean up 
```
kubectl delete -f echokube.yml
```

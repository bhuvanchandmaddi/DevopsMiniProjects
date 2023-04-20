# Nginx deployment in kubernetes cluster
This project contains helm chart, which is used to deploy nginx application in kubernetes cluster

## Pre-requisites
* kube-config file to connect to any Kubernetes cluster
* helm binary to work with helm commands
* Kubectl binary to talk to kubernetes api-server

## Usuage instructions
Install the helm chart using below command
```
helm install <release-name> nginx
```
* If you want to set any custom configuration then set it using helm --set option as shown below
```
helm install <release-name> nginx \
--set replicaCount=2 
```
**Note:** Custom configuration can be set using different ways. The order of precedence looks like below:
```
update values.yaml < supply external file to helm install < using set override
```

## Testing details
* After successful deployment below text writeen in Notes.txt will be displayed in stdout
```
NOTES:
1. Get the application URL by running these commands:

  export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services nginx)

  export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT
```

* Verify deployment by list helm release 
```
helm list
```

* Verify pods status
```
kubectl get pods
```

* Verify service status
```
kubectl get svc 
```
* since we used NodePort Service, the service type should be **NodePort** and its values should be within range 30000-32767

* Copy the nodeport value and you should access the nginx application by hitting any one of the worker nodes ip/dns name followed by nodeport


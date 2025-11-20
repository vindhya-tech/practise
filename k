Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.
                                                                                                                        Try the new cross-platform PowerShell https://aka.ms/pscore6                                                                                                                                                                                    PS C:\Windows\system32> minikube version                                                                                minikube version: v1.34.0                                                                                               commit: 210b148df93a80eb872ecbeb7e35281b3c582c61
PS C:\Windows\system32> mnikube start --driver=docker
mnikube : The term 'mnikube' is not recognized as the name of a cmdlet, function, script file, or operable program.
Check the spelling of the name, or if a path was included, verify that the path is correct and try again.
At line:1 char:1
+ mnikube start --driver=docker
+ ~~~~~~~
    + CategoryInfo          : ObjectNotFound: (mnikube:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException

PS C:\Windows\system32> minikube start --driver=docker
* minikube v1.34.0 on Microsoft Windows 10 Pro 10.0.19045.6456 Build 19045.6456

! Exiting due to GUEST_DRIVER_MISMATCH: The existing "minikube" cluster was created using the "hyperv" driver, which is incompatible with requested "docker" driver.
* Suggestion: Delete the existing 'minikube' cluster using: 'minikube delete', or start the existing 'minikube' cluster using: 'minikube start --driver=hyperv'

PS C:\Windows\system32> minikube start --driver=hyperv
* minikube v1.34.0 on Microsoft Windows 10 Pro 10.0.19045.6456 Build 19045.6456
* minikube 1.37.0 is available! Download it: https://github.com/kubernetes/minikube/releases/tag/v1.37.0
* To disable this notice, run: 'minikube config set WantUpdateNotification false'

* Using the hyperv driver based on existing profile
* Starting "minikube" primary control-plane node in "minikube" cluster
* Restarting existing hyperv VM for "minikube" ...
PS C:\Windows\system32> minikube start --driver=docker
* minikube v1.34.0 on Microsoft Windows 10 Pro 10.0.19045.6456 Build 19045.6456

! Exiting due to GUEST_DRIVER_MISMATCH: The existing "minikube" cluster was created using the "hyperv" driver, which is incompatible with requested "docker" driver.
* Suggestion: Delete the existing 'minikube' cluster using: 'minikube delete', or start the existing 'minikube' cluster using: 'minikube start --driver=hyperv'

PS C:\Windows\system32> minikube start --driver=hyperv
* minikube v1.34.0 on Microsoft Windows 10 Pro 10.0.19045.6456 Build 19045.6456
* Using the hyperv driver based on existing profile
* Starting "minikube" primary control-plane node in "minikube" cluster
* Updating the running hyperv "minikube" VM ...
! Failing to connect to https://registry.k8s.io/ from inside the minikube VM
* To pull new external images, you may need to configure a proxy: https://minikube.sigs.k8s.io/docs/reference/networking/proxy/
* Preparing Kubernetes v1.31.0 on Docker 27.2.0 ...
* Configuring bridge CNI (Container Networking Interface) ...
* Verifying Kubernetes components...
  - Using image gcr.io/k8s-minikube/storage-provisioner:v5
* Enabled addons: storage-provisioner, default-storageclass
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
PS C:\Windows\system32> minikube kubectl -- get pod -A
NAMESPACE     NAME                               READY   STATUS    RESTARTS        AGE
kube-system   coredns-6f6b679f8f-8msdn           1/1     Running   1 (51s ago)     321d
kube-system   etcd-minikube                      1/1     Running   0               29s
kube-system   kube-apiserver-minikube            1/1     Running   0               30s
kube-system   kube-controller-manager-minikube   1/1     Running   1 (51s ago)     321d
kube-system   kube-proxy-6cs45                   1/1     Running   1 (51s ago)     321d
kube-system   kube-scheduler-minikube            1/1     Running   1 (51s ago)     321d
kube-system   storage-provisioner                1/1     Running   23 (319d ago)   321d
PS C:\Windows\system32> minikube create deployment mynginx --image=nginx
Error: unknown command "create" for "minikube"
Run 'minikube --help' for usage.
PS C:\Windows\system32> kubectl create deployment mynginx --iamge=nginx
error: unknown flag: --iamge
See 'kubectl create deployment --help' for usage.
PS C:\Windows\system32> kubectl create deployment mynginx --image=nginx
deployment.apps/mynginx created
PS C:\Windows\system32> kubectl get deployments
NAME      READY   UP-TO-DATE   AVAILABLE   AGE
mynginx   0/1     1            0           19s
PS C:\Windows\system32> kubectl get pods
NAME                       READY   STATUS              RESTARTS   AGE
mynginx-79bb8756c7-8lp9z   0/1     ContainerCreating   0          25s
PS C:\Windows\system32> kubectl expose deployment mynginx --type=NodePort --port=80 --target-port=80
service/mynginx exposed
PS C:\Windows\system32> kubectl scale depolyment mynginx --replicas=4
error: the server doesn't have a resource type "depolyment"
PS C:\Windows\system32> kubectl scale deployment mynginx --replicas=4
deployment.apps/mynginx scaled
PS C:\Windows\system32> kubectl port-forward svc/mynginx 8090:80
Forwarding from 127.0.0.1:8090 -> 80
Forwarding from [::1]:8090 -> 80
Handling connection for 8090
Handling connection for 8090
PS C:\Windows\system32> kubectl get deployments
NAME      READY   UP-TO-DATE   AVAILABLE   AGE
mynginx   4/4     4            4           3m42s
PS C:\Windows\system32> kubectl get pod

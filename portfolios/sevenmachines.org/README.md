
# EKS

* Configure kubectl
```
aws eks update-kubeconfig --name eks1
iam-auth https://docs.aws.amazon.com/eks/latest/userguide/configure-kubectl.html
```

* Apply auth to allow nodes to join cluster (needs arn 
```
kubectl apply -f aws-auth-cm.yaml
```

* install helm:
```
https://docs.helm.sh/using_helm/#installing-helm
```

* install aws-servicebroker:
```
https://github.com/awslabs/aws-servicebroker
```

* install autoscaler
```
https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler/cloudprovider/aws
```

* install istio
```
https://preliminary.istio.io/docs/setup/kubernetes/helm-install/
```

* install kube2iam:
```
https://github.com/jtblin/kube2iam
```

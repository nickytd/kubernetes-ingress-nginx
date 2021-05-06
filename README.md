# kubernetes-ingress-nginx

This setup provisions a sample [nginx](https://kubernetes.github.io/ingress-nginx/) ingress controller

# helm chart dependencies
* ```helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx```

[mkcert](https://github.com/FiloSottile/mkcert) tool can be used to facilitate creating SSL certificates for local development

In some development environments like minikibe an additional patch is needed on coredns to allow resolving local development addresses from within the workloads. Here is an example [kubernetes-coredns-patch](https://github.com/nickytd/kubernetes-coredns-patch)
# kubernetes-ingress-nginx
A simple ingress controller setup. 
[mkcert](https://github.com/FiloSottile/mkcert) tool can be used to facilitate creating SSL certificates for local development

In some development environments like minikibe an additional patch is needed on coredns to allow resolving local development addresses from workloads. The provided patch example uses local [hosts](coredns/hosts) file approach.
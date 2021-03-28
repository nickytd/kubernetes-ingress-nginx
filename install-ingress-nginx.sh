#!/bin/bash

set -eo pipefail

dir=$(dirname $0)

echo "setting up ingress nginx controller stack"

kubectl create namespace ingress-nginx \
  --dry-run=client -o yaml | kubectl apply -f -

kubectl apply -f $dir/ingress-nginx/filebeat-nginx-configmap.yaml

helm upgrade ingress-nginx ingress-nginx/ingress-nginx \
  -n ingress-nginx -f $dir/ingress-nginx/ingress-nginx-values.yaml \
  --install --wait --timeout 15m


for var in "$@"
do
    if [[ "$var" = "--with-coredns-patch" ]]; then
      echo "patching coredns"
      $dir/coredns/patch_coredns.sh
    fi  

done
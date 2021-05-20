#!/bin/bash

set -eo pipefail

dir=$(dirname $0)
source $dir/.includes.sh

check_executables
check_helm_chart "hingress-nginx/ingress-nginx"

echo "setting up ingress nginx controller stack"

kubectl create namespace ingress-nginx \
  --dry-run=client -o yaml | kubectl apply -f -

kubectl apply -f $dir/filebeat-nginx-configmap.yaml -n ingress-nginx

helm upgrade ingress-nginx ingress-nginx/ingress-nginx \
  -n ingress-nginx -f $dir/ingress-nginx-values.yaml \
  --install --wait --timeout 15m

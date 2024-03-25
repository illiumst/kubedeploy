#! /bin/bash

# Install MetalLB and configure ip ranges (local homelab)
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.3/config/manifests/metallb-native.yaml
              -f ./01-metallb-pool.yml
              -f ./01-metallb-advert.yml

# Install argoCD for deployment and secret management
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml


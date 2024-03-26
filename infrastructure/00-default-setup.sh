#! /bin/bash

# Install MetalLB and configure ip ranges (local homelab)
kubectl apply -k ./01-metallb

# Install argoCD for deployment and secret management
kustomize apply -f ./02-argocd

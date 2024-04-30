#! /bin/bash

# Install MetalLB and configure ip ranges (local homelab)
kubectl apply -k ./01-metallb

# Install argoCD for deployment and secret management
kubectl apply -k ./02-argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/argocd-image-updater/stable/manifests/install.yaml

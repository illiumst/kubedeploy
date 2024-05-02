#! /bin/bash

# Install MetalLB and configure ip ranges (local homelab)
kubectl apply -k ./01-metallb

# Install argoCD for deployment and secret management
kubectl apply -k ./02-argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/argocd-image-updater/stable/manifests/install.yaml

# Start NFD - if your cluster doesn't have NFD installed yet
kubectl apply -k 'https://github.com/intel/intel-device-plugins-for-kubernetes/deployments/nfd?ref=v0.29.0'

# Create NodeFeatureRules for detecting GPUs on nodes
kubectl apply -k 'https://github.com/intel/intel-device-plugins-for-kubernetes/deployments/nfd/overlays/node-feature-rules?ref=v0.29.0'

# Create GPU plugin daemonset
kubectl apply -k 'https://github.com/intel/intel-device-plugins-for-kubernetes/deployments/gpu_plugin/overlays/nfd_labeled_nodes?ref=v0.29.0'
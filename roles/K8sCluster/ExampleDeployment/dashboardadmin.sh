#!/bin/bash

# Create Service Account
echo "apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kube-system" | kubectl apply -n kube-system -f -

# Create role binding for the service account
echo "apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kube-system" | kubectl apply -n kube-system -f -

# Get the token for that Account
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')

#!/bin/bash
cp -a .githooks/. .git/hooks/
chmod +x .git/hooks/pre-commit
chmod +x .git/hooks/post-commit

kind create cluster --config kind-cluster.yml

docker-compose build

kind load docker-image testkube-samples-api --name veotest

kubectl apply -f apps/api/k8s/service.yml

kubectl apply -f apps/api/k8s/deployment.yml
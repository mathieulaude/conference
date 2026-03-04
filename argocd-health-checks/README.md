
minikube start
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.19.4/cert-manager.yaml
kubectl create namespace gitlab-system
kubectl apply -f https://gitlab.com/api/v4/projects/18899486/packages/generic/gitlab-operator/2.9.1/gitlab-operator-kubernetes-2.9.1.yaml


kubectl apply -k overlays/standard

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d | clipcopy && kubectl -n argocd port-forward service/argocd-server 8080:80

kubectl -n argocd apply -f application-gitlab.yaml

kubectl apply -k overlays/custom-health

kubectl -n argocd apply -f application-syncwave.yaml

https://openfeedback.io/OCl79QRhVQ7K2pAqD6by/2026-03-03/EOIJLIgOxlWjJGjedZgZ
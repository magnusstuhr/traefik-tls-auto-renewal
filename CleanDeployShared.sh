echo "------------------------"
echo "TLS resources"
echo "------------------------"
kubectl -n kube-system apply -f https://github.com/emberstack/kubernetes-reflector/releases/latest/download/reflector.yaml # Use the local yaml file if unavailable.
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.8.0/cert-manager.yaml # Use the local yaml file if unavailable.
kubectl apply -f https://raw.githubusercontent.com/stakater/Reloader/master/deployments/kubernetes/reloader.yaml
kubectl apply -f ../common/cert-issuer.yml
kubectl apply -f certificate.yml

echo "------------------------"
echo "Traefik"
echo "------------------------"
kubectl apply -f ../common/traefik-role.yml
kubectl apply -f traefik-service.yml
kubectl apply -f ../common/traefik.yml
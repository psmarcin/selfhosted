add-repo:
	helm repo add jetstack https://charts.jetstack.io
install:
	helm install cert-manager --namespace cert-manager --create-namespace --version v1.16.2 jetstack/cert-manager && \
	kubectl apply -f ./cloudflare.yaml
uninstall:
	helm uninstall cert-manager
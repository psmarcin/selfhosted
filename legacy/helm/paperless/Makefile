add-repo:
	kubectl apply --server-side -f https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-1.24/releases/cnpg-1.24.1.yaml

install:
	helm upgrade -f values.yaml paperless oci://tccr.io/truecharts/paperless-ngx --namespace=default --create-namespace -i --history-max 3
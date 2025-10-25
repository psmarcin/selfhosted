add-repo:
	helm repo add rancher-stable https://releases.rancher.com/server-charts/stable --force-update

install:
	helm install rancher rancher-stable/rancher \
	  -f values.yaml \
      --namespace cattle-system \
      --create-namespace

upgrade:
	helm update rancher -f values.yaml

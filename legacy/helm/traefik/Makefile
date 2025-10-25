install:
	helm install traefik traefik/traefik

upgrade:
	helm upgrade -f values.yaml traefik traefik/traefik

uninstall:
	helm uninstall traefik

test-server1:
	helm upgrade test-server-1 ./test-server/
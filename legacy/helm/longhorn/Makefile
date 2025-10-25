add-repo:
	helm repo add longhorn https://charts.longhorn.io --force-update
remove-repo:
	helm repo remove longhorn
install:
	helm upgrade longhorn longhorn/longhorn --namespace longhorn-system --create-namespace --version 1.5.1 -i
uninstall:
	helm uninstall longhorn --namespace longhorn-system

lxc.idmap = u 1005 1005 1
lxc.idmap = g 1005 1005 1

lxc.idmap = u 0 100000 1197
lxc.idmap = g 0 100000 1000

lxc.idmap = u 1197 1197 1
lxc.idmap = g 1000 1000 1

lxc.idmap = u 1198 101006 64338
lxc.idmap = g 1001 101006 64535
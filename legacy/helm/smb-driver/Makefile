add-repo:
	helm repo add csi-driver-smb https://raw.githubusercontent.com/kubernetes-csi/csi-driver-smb/master/charts --force-update

install:
	helm upgrade -f user.values.yaml nas-storage-homes-ps ./nas-storage/ -i
	#helm upgrade csi-driver-smb csi-driver-smb/csi-driver-smb --namespace kube-system --version v1.16.0 -i && \
	helm upgrade nas-storage ./nas-storage/ -i && \

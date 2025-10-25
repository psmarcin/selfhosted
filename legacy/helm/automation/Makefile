add-repo:

install: install-n8n install-changedetection-io install-browserless-chrome

install-n8n:
	helm upgrade -f n8n.values.yaml n8n oci://tccr.io/truecharts/n8n --namespace=automation --create-namespace -i --history-max 3

install-changedetection-io:
	helm upgrade -f changedetection-io.values.yaml changedetection-io oci://tccr.io/truecharts/changedetection-io --namespace=automation --create-namespace -i --history-max 3

install-browserless-chrome:
	helm upgrade -f browserless-chrome.values.yaml browserless-chrome oci://tccr.io/truecharts/browserless-chrome --namespace=automation --create-namespace -i --history-max 3
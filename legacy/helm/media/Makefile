add-repo:

install: install-flaresolverr install-jackett install-bazarr install-sonarr install-radarr install-jellyseerr

install-flaresolverr:
	helm upgrade -f flaresolverr.values.yaml media-flaresolverr oci://tccr.io/truecharts/flaresolverr --namespace=media --create-namespace -i --history-max 3

install-jackett:
	helm upgrade -f jackett.values.yaml media-jackett oci://tccr.io/truecharts/jackett --namespace=media --create-namespace -i --history-max 3

install-bazarr:
	helm upgrade -f bazarr.values.yaml media-bazarr oci://tccr.io/truecharts/bazarr --namespace=media --create-namespace -i --history-max 3

install-sonarr:
	helm upgrade -f sonarr.values.yaml media-sonarr oci://tccr.io/truecharts/sonarr --namespace=media --create-namespace -i --history-max 3

install-radarr:
	helm upgrade -f radarr.values.yaml media-radarr oci://tccr.io/truecharts/radarr --namespace=media --create-namespace -i --history-max 3

install-jellyseerr:
	helm upgrade -f jellyseerr.values.yaml media-jellyseerr 0oci://tccr.io/truecharts/jellyseerr --namespace=media --create-namespace -i --history-max 3
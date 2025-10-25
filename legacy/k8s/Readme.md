1. Configure inventory in `./ansible/k3s/k3s-ansible/inventory/selfhosted.yaml` 
2. 
```shell
cd ./ansible/k3s/k3s-ansible/ && make install   
```
3. Configure inventory in `./ansible/k3s/helm/inventory.yaml`
4. 
```shell
cd ./ansible/k3s/helm/ && make install
```
5. 
```shell
make charts
```
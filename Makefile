.PHONY: all homer gatus ping inventory help

# Configuration
export ANSIBLE_CONFIG=ansible/ansible.cfg
INVENTORY=ansible/inventory.yaml
PLAYBOOKS_DIR=ansible/playbooks/
ANSIBLE_ARGS?=

help:
	@echo "Usage:"
	@echo "  make <playbook>   - Run a specific playbook"
	@echo ""
	@echo "  make ping         - Ping all hosts in the inventory"
	@echo "  make inventory    - Show the inventory"
	@echo ""
	@echo "  You can pass extra arguments via ANSIBLE_ARGS=\"...\""

all:
	ansible-playbook -i $(INVENTORY) $(PLAYBOOKS_DIR)site.yaml

homer:
	ansible-playbook -i $(INVENTORY) $(PLAYBOOKS_DIR)homer.yaml

gatus:
	ansible-playbook -i $(INVENTORY) $(PLAYBOOKS_DIR)gatus.yaml

ping:
	ansible -i $(INVENTORY) all -m ping

inventory:
	ansible-inventory -i $(INVENTORY) --list --yaml

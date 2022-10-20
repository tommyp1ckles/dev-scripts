SCRIPTS_DIR=/usr/sbin/
KDIR=k8s/

install: install-k8s install-network

install-k8s:
	install $(KDIR)setns $(SCRIPTS_DIR)setns
	install $(KDIR)kind_install_metallb $(SCRIPTS_DIR)kind_install_metallb
	install $(KDIR)install-cilium $(SCRIPTS_DIR)install-cilium
	install $(KDIR)cagent $(SCRIPTS_DIR)cagent
	install $(KDIR)clogs $(SCRIPTS_DIR)clogs
	install $(KDIR)cexec $(SCRIPTS_DIR)cexec
	install $(KDIR)dump-endpoint $(SCRIPTS_DIR)dump-endpoint

install-network:
	install network-testing/add_network_delay.sh $(SCRIPTS_DIR)/add_network_delay

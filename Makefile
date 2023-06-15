SCRIPTS_DIR=/usr/sbin/
KDIR=k8s/

install: install-k8s install-network install-scripts install-manpages

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

install-scripts:
	install scripts/cidr_to_range.py ${SCRIPTS_DIR}cidr_to_range

install-dotfiles:
	@cat dotfiles/.bashrc >> ~/.bashrc

install-manpages:
	@mkdir /usr/local/man/man1 || true
	@cp manpages/cheatsheet /usr/local/man/man1/cheatsheet.1
	@mandb

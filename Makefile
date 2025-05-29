SCRIPTS_DIR=/usr/sbin/
KDIR=k8s/

install: install-k8s install-network install-scripts install-manpages

install-k8s:
	@for thing in $(find k8s -type f); do install ${thing} $(SCRIPTS_DIR) ; done 

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

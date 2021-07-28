SPLIT_SCRIPTS = \
	openvpn-install-split.sh \
	functions/*.sh \

all: openvpn-install-merged.sh

openvpn-install-merged.sh: $(SPLIT_SCRIPTS)
	merge-shell.sh openvpn-install-split.sh > openvpn-install-merged.sh

test: openvpn-install-merged.sh
	@diff -u openvpn-install.sh openvpn-install-merged.sh
	@echo "Test passed"

clean:
	rm -f openvpn-install-merged.sh

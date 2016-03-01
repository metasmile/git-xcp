prefix = /usr/local
BIN_DIR   = $(prefix)/bin
LOADER    = git-xcp
COMMANDS  = git-xcp-beta git-xcp-submit git-xcp-archive git-xcp-new

all:
	@echo "usage: make [install|uninstall]"

install:
	./Makexcp beta
	./Makexcp submit
	./Makexcp archive
	./Makexcp new
	install -d -m 0755 $(BIN_DIR)
	install -m 0755 $(LOADER) $(BIN_DIR)
	install -m 0644 $(COMMANDS) $(BIN_DIR)

uninstall:
	test -d $(BIN_DIR) && \
	cd $(BIN_DIR) && \
	rm -f $(LOADER) $(COMMANDS)

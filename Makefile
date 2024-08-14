DESTDIR = /

CFG_DIR = etc
SYSTEMD_SVC_DIR = $(CFG_DIR)/systemd/system
all: install

install:
	install -d $(DESTDIR)$(SYSTEMD_SVC_DIR)
	install -m 0644 fortune.socket $(DESTDIR)$(SYSTEMD_SVC_DIR)
	install -m 0644 fortune@.service $(DESTDIR)$(SYSTEMD_SVC_DIR)

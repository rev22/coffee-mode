PREFIX=$(DESTDIR)/usr/share
ELINSTALLDIR=$(PREFIX)/emacs/site-lisp/coffee-mode
EMACS=emacs
ELFILE=coffee-mode.el

clean:
	rm -f *.tmp *.tmp.* loaddefs.el

install:
	mkdir -p $(ELINSTALLDIR)
	cp -a $(ELFILE) $(ELINSTALLDIR)/$(ELFILE)

# Recipe for loaddefs.el, useful to create site-lisp autoload code
loaddefs.el: $(ELFILE)
	$(EMACS) -q --batch --eval "(let ((generated-autoload-file \"$(PWD)/loaddefs.el\")) (update-file-autoloads \"$(ELFILE)\" t))"

all:

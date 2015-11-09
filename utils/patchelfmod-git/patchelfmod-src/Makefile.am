SUBDIRS = src tests

man1_MANS = man/patchelfmod.1

doc_DATA = README.md COPYING ChangeLog AUTHORS BUGS

strip: all
	$(STRIP) src/patchelfmod

test: check

install-data-hook:
	gzip -9f $(DESTDIR)/$(mandir)/man1/patchelfmod.1

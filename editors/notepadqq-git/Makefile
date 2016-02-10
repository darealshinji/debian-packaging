include ../../mk/include.mk

deps       = git
srcpkg     = notepadqq
builddir   = $(srcpkg)
cleanfiles = notepadqq* CodeMirror*

download: $(builddir)

$(builddir):
	git clone --depth 1 "https://github.com/notepadqq/notepadqq-packaging.git"
	git clone "https://github.com/notepadqq/notepadqq.git"
	mv notepadqq-packaging/Debian/debian $(builddir)
	git -C $(builddir) submodule init
	git -C $(builddir) submodule update

	@ # debian/changelog
	@ latestcommit=$$(git -C $(builddir) log -1 --format=%ci | head -c10 | sed -e 's/-//g'); \
	version=$$(grep -e 'POINTVERSION' $(builddir)/src/ui/include/notepadqq.h | cut -d' ' -f3 | sed -e 's/\"//g'); \
	tagver=$$(git -C $(builddir) describe --abbrev=0 --tags | sed -e 's/v//g'); \
	test "$$version" = "$$tagver" && git="+git" || git="~git"; \
	VERSION="$${version}$${git}$${latestcommit}"; \
	$(changelog-entry)

	@ # debian/copyright
	@ cat $(builddir)/debian/copyright.in > $(builddir)/debian/copyright
	for f in `find $(builddir)/src/extension_tools -name LICEN?E`; \
do \
  printf "\n\n\n" >> $(builddir)/debian/copyright; \
  printf "Files: `dirname $$f`/*\n\n" >> $(builddir)/debian/copyright; \
  cat $$f >> $(builddir)/debian/copyright; \
done

	rm -rf $(builddir)/.git notepadqq-packaging

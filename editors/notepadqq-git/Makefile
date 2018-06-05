include ../../mk/include.mk

deps       = git
builddir   = notepadqq
cleanfiles = debian/changelog debian/copyright

download:
	git clone "https://github.com/notepadqq/notepadqq.git"
	git -C $(builddir) submodule init
	git -C $(builddir) submodule update
	find $(builddir)/src/editor/libs/codemirror -name \*.js -exec chmod a-x '{}' \;
	find $(builddir)/src/editor/libs/codemirror -name \*.css -exec chmod a-x '{}' \;

	@ # debian/changelog
	@ latestcommit=$$(git -C $(builddir) log -1 --format=%ci | head -c10 | sed -e 's/-//g'); \
	version=$$(grep -e 'POINTVERSION' $(builddir)/src/ui/include/notepadqq.h | cut -d' ' -f3 | sed -e 's/\"//g'); \
	tagver=$$(git -C $(builddir) describe --abbrev=0 --tags | sed -e 's/v//g'); \
	test "$$version" = "$$tagver" && git="+git" || git="~git"; \
	VERSION="$${version}$${git}$${latestcommit}"; \
	$(changelog-entry)

	@ # debian/copyright
	@ cat debian/copyright.in > debian/copyright
	for f in `find $(builddir)/src/extension_tools -name LICEN?E`; \
do \
  printf "\n\n\n" >> debian/copyright; \
  printf "Files: `dirname $$f`/*\n\n" >> debian/copyright; \
  cat $$f >> debian/copyright; \
done

	rm -rf $(builddir)/.git


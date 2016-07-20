include ../../mk/include.mk

deps           = subversion
builddir       = llvm
d              = $(builddir)
distcleanfiles = $(d)-backup
changelog-msg  = Current SVN snapshot

download:
	if [ ! -d $(d) ]; then \
	  if [ -d $(d)-backup ]; then \
	    cp -rl $(d)-backup $(d); \
	  else \
	    svn co "http://llvm.org/svn/llvm-project/llvm/trunk" $(d) && \
	    cd $(d)/tools && svn co "http://llvm.org/svn/llvm-project/cfe/trunk" clang && \
	    cd clang/tools && svn co "http://llvm.org/svn/llvm-project/clang-tools-extra/trunk" extra && \
	    cd ../../../.. && \
	    cp -rl $(d) $(d)-backup; \
	  fi; \
	fi
	@ major=`grep 'set(LLVM_VERSION_MAJOR' $(d)/CMakeLists.txt | grep -o '[0-9]'`; \
	minor=`grep 'set(LLVM_VERSION_MINOR' $(d)/CMakeLists.txt | grep -o '[0-9]'`; \
	patch=`grep 'set(LLVM_VERSION_PATCH' $(d)/CMakeLists.txt | grep -o '[0-9]'`; \
	revision=`svn info $(d) | grep '^Revision:' | cut -d' ' -f2`; \
	VERSION="$${major}.$${minor}.$${patch}+svn$${revision}"; $(changelog-entry)


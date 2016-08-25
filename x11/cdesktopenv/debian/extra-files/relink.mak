CXX := g++
LDFLAGS := -Wl,-O1 -Wl,-rpath,'$$ORIGIN' -Wl,-Bsymbolic-functions -Wl,-z,relro -Wl,-z,defs

MAJ = 2
MIN = 1

LIBS = libcsa.so.$(MAJ).$(MIN) \
	libDtHelp.so.$(MAJ).$(MIN) \
	libDtMmdb.so.$(MAJ).$(MIN) \
	libDtMrm.so.$(MAJ).$(MIN) \
	libDtPrint.so.$(MAJ).$(MIN) \
	libDtSearch.so.$(MAJ).$(MIN) \
	libDtSvc.so.$(MAJ).$(MIN) \
	libDtTerm.so.$(MAJ).$(MIN) \
	libDtWidget.so.$(MAJ).$(MIN) \
	libtt.so.$(MAJ).$(MIN)

LIB_SO = `echo $$l | grep -o 'lib.*\.so'`
LIB_SO_N = `echo $$l | grep -o 'lib.*\.so\..'`


all: $(LIBS)
	for l in $(LIBS); do \
	  rm -f $(LIB_SO) $(LIB_SO_N); \
	  ln -s $$l $(LIB_SO); \
	  ln -s $$l $(LIB_SO_N); \
	done

libcsa.so.$(MAJ).$(MIN):
	$(CXX) -shared -Wl,-soname,libcsa.so.$(MAJ) $(LDFLAGS) -o $@ csa/*.o -lXt

libDtHelp.so.$(MAJ).$(MIN):
	$(CXX) -shared -Wl,-soname,libDtHelp.so.$(MAJ) $(LDFLAGS) -o $@ DtHelp/il/*.o DtHelp/*.o \
		-ljpeg -lX11 -lXm -lXt DtSvc/libDtSvc.so

libDtMmdb.so.$(MAJ).$(MIN):
	$(CXX) -shared -Wl,-soname,libDtMmdb.so.$(MAJ) $(LDFLAGS) -o $@ DtMmdb/*/*.o DtSvc/libDtSvc.so

libDtMrm.so.$(MAJ).$(MIN):
	$(CXX) -shared -Wl,-soname,libDtMrm.so.$(MAJ) $(LDFLAGS) -o $@ DtMrm/*.o \
		-lMrm DtHelp/libDtHelp.so DtPrint/libDtPrint.so DtTerm/libDtTerm.so DtWidget/libDtWidget.so

libDtPrint.so.$(MAJ).$(MIN):
	$(CXX) -shared -Wl,-soname,libDtPrint.so.$(MAJ) $(LDFLAGS) -o $@ DtPrint/*.o \
		-lX11 -lXm -lXt DtHelp/libDtHelp.so DtSvc/libDtSvc.so

libDtSearch.so.$(MAJ).$(MIN):
	$(CXX) -shared -Wl,-soname,libDtSearch.so.$(MAJ) $(LDFLAGS) -o $@ DtSearch/raima/*.o DtSearch/*.o

libDtSvc.so.$(MAJ).$(MIN):
	$(CXX) -shared -Wl,-soname,libDtSvc.so.$(MAJ) $(LDFLAGS) -o $@ DtSvc/*/*.o DtSvc/*.o \
		-lX11 -lXm -lXt tt/lib/libtt.so

libDtTerm.so.$(MAJ).$(MIN):
	$(CXX) -shared -Wl,-soname,libDtTerm.so.$(MAJ) $(LDFLAGS) -o $@ DtTerm/*/*.o \
		-lX11 -lXm -lXt DtHelp/libDtHelp.so DtSvc/libDtSvc.so

libDtWidget.so.$(MAJ).$(MIN):
	$(CXX) -shared -Wl,-soname,libDtWidget.so.$(MAJ) $(LDFLAGS) -o $@ DtWidget/*.o \
		-lX11 -lXm -lXt DtSvc/libDtSvc.so

libtt.so.$(MAJ).$(MIN):
	$(CXX) -shared -Wl,-soname,libtt.so.$(MAJ) $(LDFLAGS) -o $@ tt/lib/api/*/*.o tt/lib/*/*.o \
		-lX11 -lXt


include config.mak

CFLAGS   += $(CPPFLAGS)
CXXFLAGS += $(CPPFLAGS)


PROGS=bpgdec$(EXE) bpgenc$(EXE) bpgmux$(EXE)
ifeq ($(USE_BPGVIEW), y)
PROGS+=bpgview$(EXE)
endif # USE_BPGVIEW
ifeq ($(USE_EMCC), y)
PROGS+=bpgdec.js bpgdec8.js bpgdec8a.js
endif # USE_EMCC


all: $(PROGS)

LIBBPG_OBJS:=$(addprefix libavcodec/, \
hevc_cabac.o  hevc_filter.o  hevc.o      hevcpred.o  hevc_refs.o\
hevcdsp.o     hevc_mvs.o     hevc_ps.o   hevc_sei.o\
utils.o cabac.o golomb.o videodsp.o )
LIBBPG_OBJS+=$(addprefix libavutil/, mem.o buffer.o log2_tab.o frame.o pixdesc.o md5.o )
LIBBPG_OBJS+=libbpg.o

LIBBPG_JS_OBJS:=$(patsubst %.o, %.js.o, $(LIBBPG_OBJS)) tmalloc.js.o

LIBBPG_JS8_OBJS:=$(patsubst %.o, %.js8.o, $(LIBBPG_OBJS)) tmalloc.js8.o

LIBBPG_COMMON_FLAGS:=-D_ISOC99_SOURCE -D_POSIX_C_SOURCE=200112 -D_XOPEN_SOURCE=600 -DHAVE_AV_CONFIG_H -std=c99 -D_GNU_SOURCE=1

$(LIBBPG_OBJS): CFLAGS+=$(LIBBPG_COMMON_FLAGS) -DUSE_VAR_BIT_DEPTH -DUSE_PRED

$(LIBBPG_JS_OBJS): EMCFLAGS+=$(LIBBPG_COMMON_FLAGS) -DUSE_VAR_BIT_DEPTH

$(LIBBPG_JS8_OBJS): EMCFLAGS+=$(LIBBPG_COMMON_FLAGS)

$(LIBBPG_JS8A_OBJS): EMCFLAGS+=$(LIBBPG_COMMON_FLAGS) -DUSE_PRED

BPGENC_OBJS:=bpgenc.o
BPGENC_LIBS:=

ifeq ($(USE_X265), y)
BPGENC_OBJS+=x265_glue.o
BPGENC_LIBS+=-lx265
bpgenc.o: CFLAGS+=-DUSE_X265
endif # USE_X265

ifeq ($(USE_JCTVC), y)
JCTVC_OBJS=$(addprefix jctvc/TLibEncoder/, SyntaxElementWriter.o TEncSbac.o \
TEncBinCoderCABACCounter.o TEncGOP.o\
TEncSampleAdaptiveOffset.o TEncBinCoderCABAC.o TEncAnalyze.o\
TEncEntropy.o TEncTop.o SEIwrite.o TEncPic.o TEncRateCtrl.o\
WeightPredAnalysis.o TEncSlice.o TEncCu.o NALwrite.o TEncCavlc.o\
TEncSearch.o TEncPreanalyzer.o)
JCTVC_OBJS+=jctvc/TLibVideoIO/TVideoIOYuv.o
JCTVC_OBJS+=$(addprefix jctvc/TLibCommon/, TComWeightPrediction.o TComLoopFilter.o\
TComBitStream.o TComMotionInfo.o TComSlice.o ContextModel3DBuffer.o\
TComPic.o TComRdCostWeightPrediction.o TComTU.o TComPicSym.o\
TComPicYuv.o TComYuv.o TComTrQuant.o TComInterpolationFilter.o\
ContextModel.o TComSampleAdaptiveOffset.o SEI.o TComPrediction.o\
TComDataCU.o TComChromaFormat.o Debug.o TComRom.o\
TComPicYuvMD5.o TComRdCost.o TComPattern.o TComCABACTables.o)
JCTVC_OBJS+=jctvc/libmd5/libmd5.o
JCTVC_OBJS+=jctvc/TAppEncCfg.o jctvc/TAppEncTop.o jctvc/program_options_lite.o 

$(JCTVC_OBJS) jctvc_glue.o: CXXFLAGS+=-Ijctvc -Wno-sign-compare

jctvc/libjctvc.a: $(JCTVC_OBJS)
	$(AR) rcs $@ $^

BPGENC_OBJS+=jctvc_glue.o jctvc/libjctvc.a

bpgenc.o: CFLAGS+=-DUSE_JCTVC
endif # USE_JCTVC

ifdef win32
BPGMUX_LIBS:="-Wl,-dy -Wl,-dn"
BPGDEC_LIBS:="-Wl,-dy -lpng16 -lz -Wl,-dn $(XLIBS)"
BPGENC_LIBS+="-Wl,-dy -lpng16 -ljpeg -lz -Wl,-dn $(XLIBS)"
BPGVIEW_LIBS:="-lmingw32 -lSDLmain -Wl,-dy -lSDL_image -lSDL -Wl,-dn -mwindows $(XLIBS)"
else
BPGMUX_LIBS:=$(LIBS)
BPGDEC_LIBS:=-lpng16 $(LIBS) $(XLIBS)
BPGENC_LIBS+=-lpng16 -ljpeg $(LIBS) $(XLIBS)
BPGVIEW_LIBS:=-lSDL_image -lSDL $(LIBS) $(XLIBS)
endif

bpgenc.o: CFLAGS+=-Wno-unused-but-set-variable

libbpg.a: $(LIBBPG_OBJS) 
	$(AR) rcs $@ $^

bpgmux$(EXE): bpgmux.o bpgfmt.o
	$(LD) $(LDFLAGS) -o $@ $^ $(BPGMUX_LIBS)

bpgdec$(EXE): bpgdec.o libbpg.a
	$(LD) $(LDFLAGS) -o $@ $^ $(BPGDEC_LIBS)

bpgenc$(EXE): $(BPGENC_OBJS) bpgfmt.o
	$(LD) $(LDFLAGS) -o $@ $^ $(BPGENC_LIBS)

bpgview$(EXE): bpgview.o libbpg.a
	$(LD) $(LDFLAGS) -o $@ $^ $(BPGVIEW_LIBS)

bpgdec.js: $(LIBBPG_JS_OBJS) post.js
	$(EMCC) $(EMLDFLAGS) -s TOTAL_MEMORY=33554432 -o $@ $(LIBBPG_JS_OBJS)

bpgdec8.js: $(LIBBPG_JS8_OBJS) post.js
	$(EMCC) $(EMLDFLAGS) -s TOTAL_MEMORY=16777216 -o $@ $(LIBBPG_JS8_OBJS)

bpgdec8a.js: $(LIBBPG_JS8A_OBJS) post.js
	$(EMCC) $(EMLDFLAGS) -s TOTAL_MEMORY=16777216 -o $@ $(LIBBPG_JS8A_OBJS)

size:
	strip bpgdec
	size bpgdec libbpg.o libavcodec/*.o libavutil/*.o | sort -n
	gzip < bpgdec | wc

install: libbpg.pc
	install -m755 -d $(DESTDIR)$(bindir)
	install -m755 -d $(DESTDIR)$(libdir)/pkgconfig
	install -m755 -d $(DESTDIR)$(includedir)
	install -m755 -D $(PROGS) $(DESTDIR)$(bindir)
	install -m644 -D libbpg.a $(DESTDIR)$(libdir)
	install -m644 -D libbpg.pc $(DESTDIR)$(libdir)/pkgconfig
	install -m644 -D libbpg.h bpgenc.h $(DESTDIR)$(includedir)

CLEAN_DIRS=doc html libavcodec libavutil \
     jctvc jctvc/TLibEncoder jctvc/TLibVideoIO jctvc/TLibCommon jctvc/libmd5

clean:
	rm -f $(PROGS) libbpg.pc* *.o *.a *.d *~ $(addsuffix /*.o, $(CLEAN_DIRS)) \
          $(addsuffix /*.d, $(CLEAN_DIRS)) $(addsuffix /*~, $(CLEAN_DIRS)) \
          $(addsuffix /*.a, $(CLEAN_DIRS))

distclean: clean
	rm -f config.mak

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

%.js.o: %.c
	$(EMCC) $(EMCFLAGS) -c -o $@ $<

%.js8.o: %.c
	$(EMCC) $(EMCFLAGS) -c -o $@ $<

%.js8a.o: %.c
	$(EMCC) $(EMCFLAGS) -c -o $@ $<

config.mak:
	./configure

libbpg.pc:
	sed -e 's:@BPGENC_LIBS@:$(BPGENC_LIBS):' $@.in > $@

-include $(wildcard *.d)
-include $(wildcard libavcodec/*.d)
-include $(wildcard libavutil/*.d)
-include $(wildcard jctvc/*.d)
-include $(wildcard jctvc/TLibEncoder/*.d)
-include $(wildcard jctvc/TLibVideoIO/*.d)
-include $(wildcard jctvc/TLibCommon/*.d)
-include $(wildcard jctvc/libmd5/*.d)

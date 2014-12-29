CPPFLAGS = $(shell dpkg-buildflags --get CPPFLAGS)
CFLAGS   = -O3 $(filter-out -g -O2,$(shell dpkg-buildflags --get CFLAGS))
CXXFLAGS = -O3 $(filter-out -g -O2,$(shell dpkg-buildflags --get CXXFLAGS))
LDFLAGS  = $(shell dpkg-buildflags --get LDFLAGS) -Wl,--as-needed -Wl,-z,noexecstack


QMAKE_FLAGS := \
	QMAKE_CFLAGS_RELEASE='$(CFLAGS) $(CPPFLAGS)' \
	QMAKE_CFLAGS_DEBUG='$(CFLAGS) $(CPPFLAGS)' \
	QMAKE_CXXFLAGS_RELEASE='$(CXXFLAGS) $(CPPFLAGS)' \
	QMAKE_CXXFLAGS_DEBUG='$(CXXFLAGS) $(CPPFLAGS)' \
	QMAKE_LFLAGS_RELEASE='$(LDFLAGS)' \
	QMAKE_LFLAGS_DEBUG='$(LDFLAGS)'


FDK_CONFFLAGS = \
		--enable-static=yes \
		--enable-shared=no

X264_CONFFLAGS = \
		--extra-cflags='$(CFLAGS) $(CPPFLAGS)' \
		--extra-ldflags='$(LDFLAGS)' \
		--bit-depth=8 \
		--chroma-format=all \
		--disable-cli \
		--enable-static \
		--enable-strip \
		--disable-opencl \
		--disable-avs \
		--disable-swscale \
		--disable-lavf \
		--disable-ffms \
		--disable-gpac \
		--disable-lsmash

FFMPEG_CONFFLAGS = \
		--extra-cflags='$(CFLAGS) $(CPPFLAGS)  -I../x264 -I../fdk-aac/libAACenc/include -I../fdk-aac/libAACdec/include -I../fdk-aac/libSYS/include' \
		--extra-cxxflags='$(CXXFLAGS) $(CPPFLAGS)' \
		--extra-ldflags='$(LDFLAGS)  -L../x264 -L../fdk-aac/.libs' \
		--disable-debug \
		--disable-runtime-cpudetect \
		--disable-bzlib \
		--disable-ffplay \
		--disable-ffprobe \
		--disable-ffserver \
		--disable-doc \
		--disable-lzma \
		--enable-avresample \
		--enable-gpl \
		--enable-libx264 \
		--enable-nonfree \
		--enable-libfdk-aac

MP4BOX_CONFFLAGS = \
		--extra-cflags='-Wall -DXP_UNIX  $(CFLAGS) $(CPPFLAGS)' \
		--extra-ldflags='$(LDFLAGS)' \
		--strip \
		--disable-ipv6 \
		--disable-wx \
		--disable-platinum \
		--disable-alsa \
		--disable-oss-audio \
		--disable-jack \
		--disable-pulseaudio \
		--disable-x11-shm \
		--disable-x11-xv \
		--disable-ssl \
		--static-mp4box

APP    ?=  yua

CP     ?=  cp -rfv
RM     :=  rm -rf
MV     ?=  mv -v
MKDIR  ?=  mkdir -p

QMAKE  :=  qmake $(QMAKE_FLAGS)
QMAKE_QT4 := qmake-qt4 $(QMAKE_FLAGS)

ifeq ($(V),1)
MAKE   :=  make -j$(shell nproc) V=1
MP4BOX_CONFFLAGS += --verbose
else
MAKE   :=  make -j$(shell nproc)
endif
STRIP  ?=  strip


all: static-deps $(APP)_static.pro
	cd src && $(QMAKE_QT4) $(APP)_static.pro
	$(MAKE) -C src

clean:
	cd src && $(RM) $(APP) ../$(APP) *.o moc_*.cpp qrc_*.cpp
	$(foreach DIR, fdk-aac x264 mp4box ffmpeg, $(MAKE) -C $(DIR) clean || true)

distclean: clean
	$(RM) src/helpers/linux src/$(APP)_static.pro src/Makefile
	$(foreach DIR, fdk-aac x264 mp4box ffmpeg, $(MAKE) -C $(DIR) distclean || true)
	
static-deps:
	# fdk-aac
	cd fdk-aac && ./autogen.sh
	cd fdk-aac && \
	CFLAGS='$(CFLAGS)' CPPFLAGS='$(CPPFLAGS)' CXXFLAGS='$(CXXFLAGS)' LDFLAGS='$(LDFLAGS)' \
	./configure $(FDK_CONFFLAGS)
	$(MAKE) -C fdk-aac
	# fix fdk-aac detection for ffmpeg
	$(MKDIR) fdk-aac/libAACenc/include/fdk-aac
	$(MKDIR) fdk-aac/libAACdec/include/fdk-aac
	cd fdk-aac/libAACenc/include && $(CP) aacenc_lib.h fdk-aac
	cd fdk-aac/libAACdec/include && $(CP) aacdecoder_lib.h fdk-aac
	# x264
	cd x264 && ./configure $(X264_CONFFLAGS)
	$(MAKE) -C x264
	# mp4box
	cd gpac && ./configure $(MP4BOX_CONFFLAGS)
	$(MAKE) -C gpac lib
	$(MAKE) -C gpac apps
	# ffmpeg
	cd ffmpeg && ./configure $(FFMPEG_CONFFLAGS)
	$(MAKE) -C ffmpeg

	$(MKDIR) src/helpers/linux
	$(CP) src/helpers/nnedi3_weights.bin src/helpers/linux
	$(CP) gpac/bin/gcc/MP4Box src/helpers/linux/mp4box
	$(CP) ffmpeg/ffmpeg src/helpers/linux
	$(STRIP) src/helpers/linux/ffmpeg
	$(STRIP) src/helpers/linux/mp4box

$(APP)_static.pro:
	$(MKDIR) src/helpers/linux
ifeq ($(shell uname -p),x86_64)
	$(CP) src/helpers/nnedi3_weights.bin src/helpers/linux
endif
	cd src && ./make_qrc_linux.sh
	cat src/$(APP)_static.pro.in src/helpers/linux/qrc_list > src/$(APP)_static.pro
	echo $(APP)_icon.qrc >> src/$(APP)_static.pro


# build-dependencies on Debian/Ubuntu
#  i386: libenet-dev libsdl-mixer1.2-dev pkg-config
#  amd64: gcc-multilib libenet-dev:i386 libsdl-mixer1.2-dev:i386 pkg-config

CC     = gcc
CCLD   = $(CC)
MAKE   = make
AR     = ar
RANLIB = ranlib

ifneq ($(V),1)
V_CCLD   = @ echo '      CCLD   $@';
V_CC     = @ echo '        CC   $@';
V_AR     = @ echo '        AR   $@';
V_RANLIB = @ echo '    RANLIB   $@';
V_GEN    = @ echo '       GEN   $@';
endif


PKG_CONFIG_PATH="/usr/lib32/pkgconfig:/usr/lib/i386-linux-gnu/pkgconfig:/usr/local/lib/pkgconfig:/usr/lib/pkgconfig"

# don't use -O2/-O3/etc
D3D_CFLAGS = \
	-m32 -Wall $(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) pkg-config --cflags sdl SDL_mixer) \
	-fno-strict-aliasing -fstack-protector --param=ssp-buffer-size=4 \
	-Wno-unused-result -Wno-unused-function -Wno-unused-but-set-variable -Wno-parentheses \
	-Wno-maybe-uninitialized -Wno-pointer-sign -Wformat -Werror=format-security \
	-DPLATFORM_UNIX -D_FORTIFY_SOURCE=2

D3D_LDFLAGS = -m32 -s -Wl,-Bsymbolic-functions -Wl,-z,relro
D3D_LIBS    = $(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) pkg-config --libs sdl SDL_mixer)


GAME_SRCS = $(addprefix Game/src/, \
	actors.c animlib.c config.c console.c control.c cvar_defs.c cvars.c dummy_audiolib.c game.c gamedef.c global.c \
	keyboard.c menues.c player.c premap.c rts.c scriplib.c sector.c sounds.c midi/sdl_midi.c)

GAME_SRCS += $(addprefix Game/src/audiolib/, \
	fx_man.c dsl.c ll_man.c multivoc.c mv_mix.c mvreverb.c nodpmi.c pitch.c user.c)

ENGINE_SRCS = $(addprefix Engine/src/, \
	cache.c display.c draw.c dummy_multi.c engine.c filesystem.c fixedPoint_math.c mmulti.c network.c tiles.c)


GAME_OBJS   = $(GAME_SRCS:%.c=%.o)
ENGINE_OBJS = $(ENGINE_SRCS:%.c=%.o)

$(GAME_OBJS): OPT_CFLAGS= -IEngine/src
$(ENGINE_OBJS): OPT_CFLAGS= -IGame/src -IEngine/src/extra



all: chocolate-duke3d

# linking order 'libGame.a libEngine.a' is important
chocolate-duke3d: libGame.a libEngine.a
	$(V_CCLD)$(CCLD) $(D3D_LDFLAGS) $^ $(D3D_LIBS) -o $@

libEngine.a: $(ENGINE_OBJS)
	$(V_AR)$(AR) cru $@ $^
	$(V_RANLIB)$(RANLIB) $@

libGame.a: $(GAME_OBJS)
	$(V_AR)$(AR) cru $@ $^
	$(V_RANLIB)$(RANLIB) $@

# a little hack to use the system's enet.h
# without modifying the source code
Engine/src/mmulti.o: Engine/src/extra/enet.h
Engine/src/extra/enet.h:
	$(V_GEN)mkdir -p Engine/src/extra && echo '#include <enet/enet.h>' > $@

%.o: %.c
	$(V_CC)$(CC) -c $(D3D_CFLAGS) $(OPT_CFLAGS) -o $@ $<

clean:
	rm -f $(ENGINE_OBJS) $(GAME_OBJS)
	rm -f libEngine.a libGame.a chocolate-duke3d
	rm -rf Engine/src/extra

distclean: clean


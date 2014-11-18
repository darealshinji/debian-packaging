SYSARCH       = i386
ifeq ($(shell uname -m),x86_64)
SYSARCH       = x86_64
endif

LIBNAME       = libovr-0.2.so.0
LINK          = g++ -shared $(LDFLAGS) -Wl,-soname,$(LIBNAME) -o
LINKERLFAGS   = -lXrandr -ludev -lpthread -lX11 -lGL

DEBUG         = 0
ifeq ($(DEBUG), 1)
	RELEASETYPE   = Debug
else
	RELEASETYPE   = Release
endif

TARGET        = $(LIBNAME)
OBJPATH       = ./OculusSDK/LibOVR/Obj/Linux/$(RELEASETYPE)/$(SYSARCH)

all:
	$(LINK) $(TARGET) $(OBJPATH)/*.o $(LINKERLFAGS)

clean:
	rm -f $(TARGET)

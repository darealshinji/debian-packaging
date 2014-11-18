SYSARCH       = i386
ifeq ($(shell uname -m),x86_64)
SYSARCH       = x86_64
endif

SOVERSION     = 0.3
LINK          = g++ -shared $(LDFLAGS) -Wl,-soname,libovr.so.$(SOVERSION) -o
LINKERLFAGS   = -lXrandr -ludev -lpthread -lX11 -lGL

DEBUG         = 0
ifeq ($(DEBUG), 1)
	RELEASETYPE   = Debug
else
	RELEASETYPE   = Release
endif

TARGET        = libovr.so.$(SOVERSION)
OBJPATH       = ./OculusSDK/LibOVR/Obj/Linux/$(RELEASETYPE)/$(SYSARCH)

all:
	$(LINK) $(TARGET) $(OBJPATH)/*.o $(LINKERLFAGS)

clean:
	rm -f $(TARGET)

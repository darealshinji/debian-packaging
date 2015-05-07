% DCANEC(1)
% Alexander E. Patrakov <patrakov@gmail.com>
% September, 2014


NAME
====

dcaenc - encoder for the DTS Coherent Acoustics audio format

SYNOPSIS
========

**dcaenc** input.wav output.dts bitrate

DESCRIPTION
===========

**dcaenc** is an open-source implementation of the DTS Coherent Acoustics
lossy audio codec.  Only the core part of the encoder is implemented,
even though the full specification (ETSI TS 102 114 V1.3.1) is available
for download.

OPTIONS
=======

The dcaenc command line utility converts multichannel wav files to DTS. The
resulting DTS files can be written to an audio CD and played via a digital
connection (SPDIF or HDMI) to a receiver, or, after changing the endianness,
used as sound tracks for a DVD. Currently there are no options to select
28-bit encoding or change the endianness. This is a bug.

Usage: **dcaenc input.wav output.dts bitrate**

The input wav file should have the same channel order as defined by SMPTE,
i.e.: left, right, center, lfe, surround left, surround right.

Some destinations require a specific bitrate to be specified. To create a
CD-compatible DTS file from a multichannel file (that needs to have the sample
rate of 44100 Hz and either 16 or 32 bits per sample), run:

**dcaenc input.wav output.dts 1411200**

To create a DVD-compatible track from a multichannel wav file that has the
48 kHz sample rate:

**dcaenc input.wav output.dts 1509000**

or for a half-rate output:

**dcaenc input.wav output.dts 754500**

and then byte-swap the resulting output.dts file. Mux it with your MPEG2 video
track using the "mplex" tool from the mjpeg-tools package.

Known bug: wav files with floating-point samples are misinterpreted as
containing 32-bit integer samples.

ALSA Plugin
===========

The ALSA plugin may be useful for playing multichannel sound from arbitrary
ALSA applications through an SPDIF link. This is needed because the SPDIF
link cannot carry enough bits per second to transport the raw uncompressed
5.1 audio.

The "alsa-plugins" package contains a similar plugin for on-the-fly AC3
encoding.

The plugin should normally not be used with HDMI connections, because the
HDMI standard defines enough bandwidth so that the uncompressed 5.1 PCM
stream fits even at 192 kHz sample rate. So, attempting to encode that into
DTS in the majority of cases is only a waste of CPU time and sound quality.
There are, however, at least two valid use cases.

1. Radeon HD 6xxx video cards with open-source driver do not support more
   than two channels of PCM audio over HDMI. Encoding the output to DTS
   provides a useful workaround to the lack of multichannel capability in
   the driver.

2. Some soundbars are supposed to get the audio signal from the TV via the
   optical cable, while the TV itself is connected to the computer using
   HDMI.

If you know another valid use case, please send an e-mail to
*<patrakov@gmail.com>*.

The ALSA plugin should work in real time on any modern CPU. Here on Intel
Core i5 @ 1.20 GHz (i.e. in powersaving mode) it eats ~40% of a single core.

To use the ALSA plugin, add the following line to your *$HOME/.asoundrc*
file or to */etc/asound.conf*:

**<confdir:pcm/dca.conf>**

It will create an additional ALSA device for each of your sound cards that
have an SPDIF output. The name of the device will be similar to
"dca:CARD=Intel,DEV=0", or, for the default card, simply "dca". There are
also devices that encode to HDMI outputs, they have names like
"dcahdmi:CARD=Intel,DEV=0".

If you want to encode DTS and send it to something that is not SPDIF or HDMI,
add a snippet similar to the following:

	 pcm.dcacustom {
	     type dca
	     slave.pcm "custompcm"
	     # if your receiver requires it:
	     # iec61937 1
	 }

Unlike the AC3 encoder, there is no bitrate configuration. This is because
it does not make sense to have it. The hard-coded default (same bitrate as
stereo PCM, all bits used) provides the best possible quality and should work
for everyone. But it doesn't work with receivers that require IEC61937-5
wrapping of the DTS frames, that's why the "iec61937" option exists, which
can be set to 1 for such receivers.

To direct mplayer output to the default card via the encoder:

**mplayer -channels 6 -ao alsa:device=dca file.flac**

It is not possible to use dmix on top of the encoder. This is a limitation
of dmix: it only works on direct hardware devices providing mmap, and the
dca plugin is not a hardware device and provides (non-working) mmap only due
to what seems to be at least partially an ALSA bug. Please use PulseAudio
instead.

Known bug: the ALSA plugin doesn't report the supported sample rates correctly
and pretends to support mmap. Fixing this requires rewriting the plugin from
the extplug infrastructure to ioplug, or talking to ALSA developers. So you
may need to add one of the following flags to mplayer command line:

	 -af resample=44100
	 -af resample=48000

Use with PulseAudio
===================

The ALSA plugin can be used with PulseAudio. To do so, add the following lines
to the end of the */usr/share/pulseaudio/alsa-mixer/profile-sets/default.conf*
file:

	[Mapping iec958-dts-surround-51]
	device-strings = dca:%f
	channel-map = front-left,front-right,rear-left,rear-right,front-center,lfe
	paths-output = iec958-stereo-output
	priority = 3
	direction = output

	[Mapping hdmi-dts-surround-51]
	device-strings = dcahdmi:%f
	channel-map = front-left,front-right,rear-left,rear-right,front-center,lfe
	paths-output = hdmi-output-0
	priority = 1
	direction = output

Newer and/or patched versions of PulseAudio use the
*/usr/share/pulseaudio/alsa-mixer/profile-sets/extra-hdmi.conf* file instead
for Intel and NVidia sound cards. If that file exists, add the above lines
there, too, adjusting if needed for multiple HDMI outputs.

Note that the iec958-dts-surround-51 part of the above is already provided
by PulseAudio 3.0 or later.

After restarting PulseAudio, it will see additional output profiles having
"DTS" in their names and will allow you to select them in the volume control
application such as pavucontrol or gnome-volume-control.

COMPATIBILITY
=============

The author has an LG 47LM640T TV that can decode DTS on HDMI inputs. It works.
He also tests the encoder by decoding its output with ffmpeg, libdca or
ArcSoft DTS decoder (the same engine as used in WinDVD).

The ALSA plugin has been tested and found to work with the following receivers
by other people:

	 Logitech Z5500
	 JVC TH-A25
	 Samsung HT-Z310
	 Sony STR-DB780

Some receivers (including JVC TH-A25 and Sony STR-DB780) mute their outputs
when receiving full 32-bit DTS stream (as generated by the ALSA plugin) over
SPDIF with AES0=6 (the default for the "dca" and "dcahdmi" families of ALSA
devices). To overcome this problem, add the following line to the end
of .asoundrc :

**defaults.pcm.dca.aes0 0x04**

However, it can cause your receiver to unmute its output even if it does
not support DTS streams or does not detect them reliably. This will result
in very loud hiss that can damage the loudspeakers. So try this setting with
the lowest possible volume, and this is why it is not the default.

Similar settings exist for AES1, AES2 and AES3 SPDIF parameters.

Some other receivers (including the LG 47LM640T TV) need not raw DTS frames,
but DTS frames wrapped according to IEC61937-5, and either mute the output
or produce loud hiss otherwise. For such receivers, add the following line to
the end of .asoundrc:

**defaults.pcm.dca.iec61937 1**

This could not be made the default, because other receivers (such as Sony
STR-DB780) reject DTS frames wrapped into IEC61937-5.

QUALITY
=======

There are debates on the Internet about the relative quality of AC3 vs DTS.
AC3 uses more advanced compression algorithms, DTS allows for higher bit rates.
There were no blind tests comparing the output of the encoder with anything
else. However, this encoder uses only the most basic compression techniques
defined in the DTS specification, and thus cannot win any comparison with
commercial DTS encoders. Still, at 754 kbps, the internal psychoacoustical
model considers the distortions to be just below the threshold of detection by
human ears.

BUGS
====

short (< 10 seconds) flac sample that demonstrates the problem, and a patch
that fixes it.

SEE ALSO
========

**libdcaenc**(3)

The project page is at *http://aepatrakov.narod.ru/dcaenc/*

The latest code can be obtained from git:
**git clone git://gitorious.org/dtsenc/dtsenc.git**

THANKS
======

The following people helped me to test the encoder (including the versions that
did not work):

	 Arun Raghavan
	 Colin Guthrie
	 Mikhail Elovskikh
	 cryptonymous from the linux.org.ru forum
	 rulet from the linux.org.ru forum
	 Steven Newbury

The following people contributed useful information: Adam Thomas-Murphy

The following people reported bugs: LoRd_MuldeR from *https://gitorious.org/~mulder*

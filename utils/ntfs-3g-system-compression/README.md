NTFS-3G system compression plugin
=================================

Windows 10 introduced a new filesystem compression feature: System
Compression, also called "Compact OS". The feature allows rarely modified
files to be compressed more heavily than is possible with regular NTFS
compression (which uses the LZNT1 algorithm with 4096-byte chunks).
System-compressed files can only be read, not written; on Windows, if a
program attempts to write to such a file, it is automatically decompressed
and turned into an ordinary uncompressed file.


**Homepage**: http://jp-andre.pagesperso-orange.fr


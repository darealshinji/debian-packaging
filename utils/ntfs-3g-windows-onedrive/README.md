NTFS-3G plugin to access Windows OneDrive files
===============================================

Plugin for accessing through ntfs-3g OneDrive directories
created by Windows 10.

The feature has been implemented as a plugin to be used from ntfs-3g, thus
retaining the original organization in Windows. Its loading is delayed
until some OneDrive directory is accessed. The minimum version of ntfs-3g
which can use the plugin is 2017.3.23AR.1

When the plugin is activated, only the local copy of OneDrive files (those
configured on Windows as "always keep on this device") and subdirectories
can be accessed. The files only stored on the cloud (configured as "free
up space") cannot be accessed. Also no file or directory can be created
or removed from the OneDrive directory tree.


**Homepage**: http://jp-andre.pagesperso-orange.fr


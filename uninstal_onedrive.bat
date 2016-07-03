:: Uninstall OneDrive on both 32bit and 64bit Systems
:: Some of this script pulled directly from:
:: http://answers.microsoft.com/en-us/onedrive/forum/odoptions-oddesktop/how-to-uninstall-onedrive-completely-in-windows-10/e735a3b8-09f1-40e2-89c3-b93cf7fe6994
::
:: And:
:: http://www.msfn.org/board/topic/129674-how-can-i-identify-if-os-is-32-bit-or-64-bit-in-batch-file/

:: Kill the task if running
taskkill /f /im OneDrive.exe

:: Find out which platform is in use
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OSBIT=32BIT || set OSBIT=64BIT

:: Uninstall the version corresponding to the platform
if %OSBIT%==32BIT %SystemRoot%\System32\OneDriveSetup.exe /uninstall
if %OSBIT%==64BIT %SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall

:: Removing the leftover items
rd "%USERPROFILE%\OneDrive" /Q /S > NUL 2>&1
rd "C:\OneDriveTemp" /Q /S > NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S > NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S > NUL 2>&1

:: Removing the icon from the sidebar
REG DELETE "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f > NUL 2>&1
REG DELETE "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f > NUL 2>&1

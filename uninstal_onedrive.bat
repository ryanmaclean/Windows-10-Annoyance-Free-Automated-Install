:: Uninstall OneDrive on both 32bit and 64bit Systems

:: Kill the task if running
taskkill /f /im OneDrive.exe

:: Find out which platform is in use
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT

:: Uninstall the version corresponding to the platform
if %OS%==32BIT %SystemRoot%\System32\OneDriveSetup.exe /uninstall
if %OS%==64BIT %SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall

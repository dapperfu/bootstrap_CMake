@ECHO OFF
if "%PROJECT_ENV%"=="" (
set PROJECT_ENV=%~dp0
)

: If download URL is not defined (set through Jenkins, etc)
IF "%CMAKE_URL%"=="" (
: Use a known default
set URL=https://cmake.org/files/v3.11/cmake-3.11.0-rc4-win64-x64.zip
) ELSE (
: Otherwise use the given URL.
set URL=%CMAKE_URL%
)
: Set download package name.
set PKG=CMake.zip

cd %PROJECT_ENV%
: If the package doesn't exist locally, download it.
if not exist %PKG% %~dp0curl.exe -L -o %PROJECT_ENV%%PKG% %URL%
: If the package has not been 'installed' install it.
if not exist %PROJECT_ENV%cmake-3.11.0-rc4-win64-x64 7z x %PKG% -y -o%PROJECT_ENV%

attrib +r %~dp0cmake-3.11.0-rc4-win64-x64
attrib +h %~dp0.
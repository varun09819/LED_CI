rem
rem usage: build build-dir {Debug|Release} {all|clean}
rem

setlocal

if not [%3]==[] goto :get_args
echo "Insufficient arguments"
exit /b 1

:get_args

set "build_dir=%1"
set "build_type=%2"
set "target=%3"

cd "%build_dir%"

set PATH=C:\ST\STM32CubeIDE_1.13.1\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.11.3.rel1.win32_1.1.0.202305231506\tools\bin;C:\ST\STM32CubeIDE_1.13.1\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.make.win32_2.1.0.202305091550\tools\bin;C:/ST/STM32CubeIDE_1.13.1/STM32CubeIDE//plugins/com.st.stm32cube.ide.jre.win64_3.0.0.202305091045/jre/bin/server;C:/ST/STM32CubeIDE_1.13.1/STM32CubeIDE//plugins/com.st.stm32cube.ide.jre.win64_3.0.0.202305091045/jre/bin;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files\NVIDIA Corporation\NVIDIA NvDLISR;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Program Files (x86)\dotnet\;C:\Program Files\Git\cmd;C:\Program Files (x86)\GitExtensions\;C:\Users\svaru\AppData\Local\Microsoft\WindowsApps;C:\Users\svaru\AppData\Local\GitHubDesktop\bin;C:\ST\STM32CubeIDE_1.13.1\STM32CubeIDE

set compiler_prefix=arm-none-eabi-

set "version_file=..\App\gpio-app\version.h"

if [%BUILD_TAG%]==[] goto :do_make

echo #ifndef _VERSION_H_ >"%version_file%"
echo #define _VERSION_H_ >>"%version_file%"
echo #define VERSION "%BUILD_TAG%-%build_type%" >>"%version_file%"
echo #endif >>"%version_file%"

:do_make

make -j4 "%target%"

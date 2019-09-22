:: 名称：Windows图标缩略图缓存重置工具
:: 创建者：MMTStudio
:: 创建：2019年9月22日

@echo off
color 0F
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

echo.
echo 本工具为Windows 10家庭版安装组策略客户端工具及扩展包，用于管理自动更新
call :ColorText 0F "关注快手号 "
call :ColorText 0A "MMTSTUDIO"
call :ColorText 0F " ，不断扩充你的工具箱！"
echo.
echo.

::@echo off
pushd "%~dp0"

echo 将安装组策略客户端工具及扩展包安装
pause
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >GPCList.txt
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>GPCList.txt

for /f %%i in ('findstr /i . GPCList.txt 2^>nul') do dism /online /norestart /add-package:"C:\Windows\servicing\Packages\%%i"

echo 组策略客户端工具及扩展包安装完成
pause
exit /B

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
exit /B

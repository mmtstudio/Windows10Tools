:: ���ƣ�Windowsͼ������ͼ�������ù���
:: �����ߣ�MMTStudio
:: ������2019��9��22��

@echo off
color 0F
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

echo.
echo ������ΪWindows 10��ͥ�氲װ����Կͻ��˹��߼���չ�������ڹ����Զ�����
call :ColorText 0F "��ע���ֺ� "
call :ColorText 0A "MMTSTUDIO"
call :ColorText 0F " ������������Ĺ����䣡"
echo.
echo.

::@echo off
pushd "%~dp0"

echo ����װ����Կͻ��˹��߼���չ����װ
pause
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >GPCList.txt
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>GPCList.txt

for /f %%i in ('findstr /i . GPCList.txt 2^>nul') do dism /online /norestart /add-package:"C:\Windows\servicing\Packages\%%i"

echo ����Կͻ��˹��߼���չ����װ���
pause
exit /B

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
exit /B

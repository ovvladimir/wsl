@echo off

start "" /b C:\Users\ovvla\Documents\Ubuntu\config.xlaunch
ubuntu1804.exe run "if [ -z \"$(pidof lxde)\" ] ; then cd ~ ; export DISPLAY=$(ip route list default | awk '{print $3}'):0 ; export LIBGL_ALWAYS_INDIRECT=1 ; startlxde ; pkill '(gpg|ssh)-agent' ; fi ;"

taskkill.exe /t /im vcxsrv.exe > nul
timeout /t 1 /nobreak > nul
taskkill.exe /f /t /im vcxsrv.exe > nul

rem WMIC Process Where Caption="vcxsrv.exe" Call Terminate
rem taskkill /f /im explorer.exe && start explorer.exe

rem ОДИН РАЗ:
rem sudo /etc/init.d/dbus start &> /dev/null ; sudo service ssh start ;
rem sudo /etc/init.d/dbus status - проверка
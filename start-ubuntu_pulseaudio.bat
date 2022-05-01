@echo off

rem https://habr.com/ru/post/522726/

start "" /B C:\Users\ovvla\Documents\Ubuntu\config.xlaunch
start "" /B "C:\Users\ovvla\Documents\Ubuntu\pulseaudio\bin\pulseaudio.exe" --use-pid-file=false -D > nul

ubuntu1804.exe run "cd ~ ; hostip=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}') ; export LIBGL_ALWAYS_INDIRECT=1 ; export DISPLAY=$hostip:0 ; export PULSE_SERVER=tcp:$hostip ; startlxde ; pkill '(gpg|ssh)-agent' ;"

rem ubuntu1804.exe run "IP=$(host `hostname` | grep -oP '(\s)\d+(\.\d+){3}' | tail -1 | awk '{ print $NF }' | tr -d '\r') ; export LIBGL_ALWAYS_INDIRECT=Yes ; export DISPLAY=$IP:0.0 ; PULSE_SERVER=tcp:$IP ; startlxde ; pkill '(gpg|ssh)-agent' ;"

sleep 1
taskkill.exe /F /T /IM vcxsrv.exe > nul
taskkill.exe /F /IM pulseaudio.exe > nul

rem HOST_IP=$(host `hostname` | grep -oP '(\s)\d+(\.\d+){3}' | tail -1 | awk '{ print $NF }' | tr -d '\r')
rem HOST_IP=192.168.100.3

rem rem sudo apt install alsa-utils - не обязательно

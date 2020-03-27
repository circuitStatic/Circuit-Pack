@echo off

echo ==============================================
echo Remove Windows 10 Anti-Privacy Services v 0.1
echo ==============================================

sc delete lfsvc Geolocation
sc delete DcpSvc Data collection
sc delete icssvc - windows mobile hotspot service

echo ==============================================
echo Complete
echo Pausing for Diagnostic Purposes
echo ==============================================
pause


@echo off
cd /d "%~dp0"
rmdir "Antistasi.Altis" /S/Q
del *.pbo
mkdir "Antistasi.Altis"
xcopy "A3-Antistasi\*.*" "Antistasi.Altis" /E/Y
xcopy "A3-Antistasi\Templates\A3-AATemplate.Altis\*.*" "Antistasi.Altis" /E/Y
rmdir "Antistasi.Altis\Templates\A3-AA-BLUFORTemplate.Altis" /S/Q
rmdir "Antistasi.Altis\Templates\A3-ArmiaKrajowaTemplate.chernarus_summer" /S/Q
rmdir "Antistasi.Altis\Templates\A3-WotPTemplate.Tanoa" /S/Q
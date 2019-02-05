@echo off
cd /d "%~dp0"
rmdir "Antistasi.Altis" /S/Q
mkdir "Antistasi.Altis"
xcopy "A3-Antistasi\Templates\A3-AATemplate.Altis\*.*" "Antistasi.Altis" /E/Y
xcopy "A3-Antistasi\*.*" "Antistasi.Altis" /E/Y
rmdir "Antistasi.Altis\Templates" /S/Q
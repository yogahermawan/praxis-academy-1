@echo off
setlocal enabledelayedexpansion
echo Masukkan direktori file yang akan dicek:
set /p "dr=>"
dir %dr% /w /s /a
for /R %dr% %%f in (*.java) do (
	echo Ada file Java pada direktori %%f
	echo %%~nxf ada, diganti namanya (y/t^)^?
	set /p "vl=>"
	if "!vl!" == "y" (
		echo Input nama baru
		set /p "rn=>"
		REN %%f !rn!.java
		echo berhasil di ganti !rn!.java
	)
)
pause
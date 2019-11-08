@echo OFF
echo masukkan direktori file yang akan dicek
set /p "dr=>"
DIR %dr% /w /s /a
for /R %dr% %%f in (*.java) do (
    echo Ada file Java pada direktori %%f
)
pause
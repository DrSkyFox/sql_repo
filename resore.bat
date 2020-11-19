set FDB="127.0.0.1/3080:D:\SomeFolder\some.FDB"
set FBK="D:\SomeFolder\autobackup\some.FBK"

set EXE_gbak="C:\Program Files (x86)\Firebird\FireBird_2_5\bin\gbak.exe"


set resout=resultrestore.txt
set charset=win1251
if exist %resout% del %resout%
%EXE_gbak% -c -k -p 8192 %FBK% %FDB% -user ucs -password ucs -v -y %resout%

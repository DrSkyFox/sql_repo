set FDB="127.0.0.1/3080:D:\SomeFolder\some.FDB"
set FBK="D:\SomeFolder\autobackup\some.FBK"


set EXE_gbak="C:\Program Files (x86)\Firebird\FireBird_2_5\bin\gbak.exe"

if exist %FBK% del %FBK%
%EXE_gbak%  -user "ucs" -password "ucs"   -b  %FDB% %FBK%
pause
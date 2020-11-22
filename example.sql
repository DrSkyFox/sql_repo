begin 
select inireadstring('G:\TEST\__FITNESS\skins\skins.ini','buttons32','ifb_Guest_Folio','') from dummy;
select filetoblob('G:\TEST\__FITNESS\skins\') from dummy;
select inireadstring('G:\TEST\__FITNESS\skins\skins.ini','buttons32','ifb_Guest_Events','') from dummy
commit;

begin
insert into app_users_profile (kind,appname,userid,paramstr) values (:kind,:appname,:userid,:paramstr)
#call some triggers
#triggers can call procedure or function
commit;
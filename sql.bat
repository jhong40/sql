
@echo off
set result_file=result.log
 
set user_name=SOME_ORACLE_USER_NAME
set password=USERS_NAME_PASSWORD
set net_service_name=ALIAS_ON_TNS
 
if exists %result_file% (
   del %result_file%
)
echo exit | sqlplus -s %user_name%/%password%@%net_service_name% @ScriptToExecute.sql >> %result_file%

(
echo @FirstScriptToExecute.sql
echo @SecondScriptToExecute.sql
echo exit
) | sqlplus -s %user_name%/%password%@%net_service_name% >> %result_file%

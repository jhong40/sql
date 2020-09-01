rem # "echo off" prevents displaying all the commands on the screen, the "@" symbol prevents showing the echo off command.
@echo off
rem # "set result_file" creates a variable that stores the output messages given from the *.sql files.
rem # if you put only the file name, then it will be written on the same folder as the batch file.
set result_file=result.log
 
rem # define the variables that stores information to connect to the Oracle database.
set user_name=SOME_ORACLE_USER_NAME
set password=USERS_NAME_PASSWORD
set net_service_name=ALIAS_ON_TNS
 
rem # deletes the results file from the hard drive if this already exists from a previous batch execution.
if exists %result_file% (
   del %result_file%
)
 
rem # "echo exit |" adds the exit command to the standard input pipeline, so when sql*plus has finished reading its parameters reads the next input which in this case is "exit".
rem # This is the last part of the command issued, which instructs to sql*plus to terminate the session.
rem # "sqlplus -s" executes sql*plus in a silent mode, this means it won't show the messages when it connects or disconnects.
rem # "%user_name%/%password%@%net_service_name%" are the variables to connect to the Oracle database.
rem # "@ScriptToExecute.sql" is the file with the SQL instructions you want to execute.
rem # ">> %result_file%" is the file that appends results thanks to the >> operator.
echo exit | sqlplus -s %user_name%/%password%@%net_service_name% @ScriptToExecute.sql >> %result_file%
 
rem # using parentheses is the way to issue several commands on the same session of sql*plus.
(
echo @FirstScriptToExecute.sql
echo @SecondScriptToExecute.sql
echo exit
) | sqlplus -s %user_name%/%password%@%net_service_name% >> %result_file%

@ECHO OFF  

REM Version: 2.0.2
REM Author: Iain Mair
REM Release Date: 4th February 2018

TITLE Network Diagnostic Tests for %computername%

:start
ECHO.
ECHO  NETWORK DIAGNOSTIC TESTS.
ECHO.
ECHO  1. run ip config
ECHO.
ECHO  2. run ping on google.com
ECHO  3. run ping on 8.8.8.8
ECHO  4. run tracert on google.com
ECHO.
ECHO  5. run ping on a custom address 
ECHO  6. run tracert on a Custom Address
ECHO  7. run ping continuoiusly
ECHO.
ECHO  r. run tests 1-4 and save to file on desktop
ECHO  x. exit testing
ECHO.

SET /P CHOOSE=  Hello %USERNAME%, what do you want to do?: 
GOTO %CHOOSE%

:1
CLS
ECHO Running IPCONFIG to get IP and Network Details for the computer named %computername%
ipconfig /all | more
GOTO end

:2
CLS
ECHO Running PING on Domain Google.com
ping google.com
GOTO end

:3
CLS
ECHO Running PING on Google DNS
ping 8.8.8.8
GOTO end

:4
CLS
ECHO Running TRACE ROUTE on Domain Google.com
tracert google.com
GOTO end

:5
CLS
ECHO PING a Custom Address
SET /P CHOOSE= What Address do you want to PING?: 
ping %CHOOSE%
GOTO end

:6
CLS
ECHO Run TRACE ROUTE on a Custom Address
SET /P CHOOSE= What Address do you want to run TRACERT on?: 
tracert %CHOOSE%
GOTO end

:7
CLS
ECHO Continuous PING of a Custom Address
ECHO.
ECHO To Quit this Ping press CTRL+C and then when asked to terminate the Batch File say No
ECHO.
SET /P CHOOSE= What Address do you want to PING?: 
ping /t %CHOOSE%
GOTO end

:r
MKDIR C:\Users\%username%\Desktop\network_diags_results-%date:~0,2%%date:~3,2%%date:~6,8%-%time:~0,2%%time:~3,2%%time:~6,2%
CD C:\Users\%username%\Desktop\network_diags_results-%date:~0,2%%date:~3,2%%date:~6,8%-%time:~0,2%%time:~3,2%%time:~6,2%
CLS
ECHO Running tests and sending to file
ECHO.
ipconfig /all > IPCONFIG-%date:~0,2%_%date:~3,2%_%date:~6,8%-%time:~0,2%_%time:~3,2%_%time:~6,2%.txt
ECHO IPCONFIG saved
ECHO.
ping google.com > PING-%date:~0,2%_%date:~3,2%_%date:~6,8%-%time:~0,2%_%time:~3,2%_%time:~6,2%.txt
ECHO PING google.com saved
ECHO.
ping 8.8.8.8 > PINGDNS-%date:~0,2%_%date:~3,2%_%date:~6,8%-%time:~0,2%_%time:~3,2%_%time:~6,2%.txt
ECHO Ping 8.8.8.8 saved
ECHO.
tracert google.com > TRACERT-%date:~0,2%_%date:~3,2%_%date:~6,8%-%time:~0,2%_%time:~3,2%_%time:~6,2%.txt
ECHO TRACERT saved
ECHO.
ECHO All Files Saved to Desktop 
GOTO end

:x
GOTO leave

:end
ECHO.
PAUSE
CLS
GOTO start

:leave
exit

@echo off

:: Set the variables with the information of the remote computer and the service to be started
set remote_host=ip_or_name_conection
set service_name=name_service
set username=user_for_conecct
set password=password_user_for_connect

:: Run the net use command to connect to the remote computer
net use %remote_host% /user:%username% %password%

:: Run command to check service status.
sc %remote_host% query %service_name% | find "RUNNING"
if %errorlevel% equ 0 (
    :: If the service is already in use, stop the service
    echo stopping the service %service_name%...
    sc %remote_host% stop %service_name%
)

:: Disconnect from remote computer
net use %remote_host% /delete
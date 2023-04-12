@echo off
set SERVICE_NAME=name_service
set SERVER_IP=ip_or_name_conection
set USERNAME=user_for_conecct
set PASSWORD=password_user_for_connect

:CHECK_SERVICE
sc \\%SERVER_IP% query %SERVICE_NAME% | find "RUNNING"
if %errorlevel% neq 0 (
    echo %SERVICE_NAME% não está em execução. Reiniciando...
    sc \\%SERVER_IP% stop %SERVICE_NAME% /u %USERNAME% /p %PASSWORD%
    sc \\%SERVER_IP% start %SERVICE_NAME% /u %USERNAME% /p %PASSWORD%
) else (
    echo %SERVICE_NAME% está em execução.
)

EXIT
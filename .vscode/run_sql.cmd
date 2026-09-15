@echo off

chcp 65001 >nul
setlocal enabledelayedexpansion

set "FILE_PATH=%~1"
set "LINE_NUM=%~2"

:: ▼--- 設定 / Config ---▼
set "DOCKER_DIR=C:\Users\xxxxx\Ducuments\test_project\docker"
set "CONTAINER_NAME=mysql"
set "DB_USER=root"
set "DB_PASS=password"
set "DB_NAME=db_name"
:: ▲--- 設定 / Config ---▲

:: Set temporary file path
set "TMP_SQL=%TEMP%\query_%RANDOM%.sql"
set "TMP_RESULT=%TEMP%\sql_res_%RANDOM%.txt"
set "TMP_OUT=%TEMP%\out_%RANDOM%.txt"

:: Extract query from current line and write to temporary file
set /a current_line=0
(for /f "usebackq delims=" %%a in ("%FILE_PATH%") do (
    set /a current_line+=1
    if !current_line! equ %LINE_NUM% (
        echo %%a
    )
)) > "%TMP_SQL%"

:: Check if SQL file is empty
for %%I in ("%TMP_SQL%") do if %%~zI==0 (
    del "%TMP_SQL%" >nul 2>&1
    exit /b 1
)

:: Move to Docker directory and execute query via stdin
pushd "%DOCKER_DIR%"
docker compose exec -it %CONTAINER_NAME% mysql -u%DB_USER% -p%DB_PASS% --default-character-set=utf8mb4 %DB_NAME% < "%TMP_SQL%" > "%TMP_RESULT%" 2>nul
popd

:: Insert results into the next line of the active file
set /a current_line=0
(for /f "usebackq delims=" %%a in ("%FILE_PATH%") do (
    set /a current_line+=1
    echo %%a
    if !current_line! equ %LINE_NUM% (
        echo /* [SQL Result]
        type "%TMP_RESULT%"
        echo */
    )
)) > "%TMP_OUT%"

:: Replace original file and clean up temporary file
move /y "%TMP_OUT%" "%FILE_PATH%" >nul
del "%TMP_SQL%" >nul 2>&1
del "%TMP_RESULT%" >nul 2>&1

endlocal

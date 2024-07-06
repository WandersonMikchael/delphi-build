@echo off

REM Verifica se foi fornecido o caminho do projeto .dproj como parâmetro
if "%~1"=="" (
    echo Por favor, forneça o caminho para o arquivo .dproj.
    exit /b 1
)

REM Busca compilador
call "C:\Program Files (x86)\Embarcadero\Studio\23.0\bin\rsvars.bat"

REM Compila o projeto usando o caminho fornecido
msbuild "%~1" /p:Config=Debug /t:Build

REM Verifica o código de retorno do msbuild
if %ERRORLEVEL% neq 0 (
    echo Falha ao compilar o projeto: %~1
    pause
    exit /b %ERRORLEVEL%
)

@echo on

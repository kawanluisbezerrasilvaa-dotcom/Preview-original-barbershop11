@echo off
title GOAT Barber Shop - Iniciar site
cd /d "%~dp0"

where node >nul 2>nul
if errorlevel 1 (
  echo ERRO: Node.js nao foi encontrado.
  echo Instale a versao LTS em https://nodejs.org/ e abra este arquivo novamente.
  pause
  exit /b 1
)

where npm >nul 2>nul
if errorlevel 1 (
  echo ERRO: npm nao foi encontrado. Reinstale o Node.js LTS.
  pause
  exit /b 1
)

if not exist node_modules (
  echo Instalando dependencias. Isso pode demorar alguns minutos...
  call npm install
  if errorlevel 1 (
    echo.
    echo ERRO ao instalar dependencias. Confira a internet e as mensagens acima.
    pause
    exit /b 1
  )
)

echo.
echo Iniciando o site. Mantenha esta janela aberta.
echo Abra no navegador o endereco mostrado abaixo pelo Vite.
echo.
call npm run dev
pause

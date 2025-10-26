@echo off
chcp 65001 >nul
echo.
echo ═══════════════════════════════════════════════════════════════════
echo       مشروع أرض النور - OpenAI GPT-4
echo       Ard AlNoor Project - OpenAI GPT-4
echo ═══════════════════════════════════════════════════════════════════
echo.
echo تشغيل سكريبت PowerShell...
echo Running PowerShell script...
echo.

powershell -ExecutionPolicy Bypass -File ".\start.ps1"

if errorlevel 1 (
    echo.
    echo ✗ حدث خطأ في التشغيل
    echo ✗ An error occurred
    echo.
    pause
)

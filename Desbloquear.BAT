@echo off

:: By: zRafaX

:: https://github.com/zRafaX/Bloqueador-de-Apps-Windows

:: Verifica privilégios de administrador
net session >nul 2>&1
if not %errorlevel%==0 (
    echo.
    echo # Privilégios de administrador são necessários.
    echo.
    PowerShell -Command "Start-Process '%0' -Verb RunAs" 2>nul || (
        echo # Clique com o botão direito no script e selecione "Executar como administrador".
        pause >nul
        exit /b 1
    )
    exit /b 0
)

:: Restaurar o registro para o comportamento padrão
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 5 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /t REG_DWORD /d 1 /f

:: Desbloquear Discord (Adicione o caminho do executavel em file="Aqui")
set "file=C:\Users\Nome\AppData\Local\Discord\Update.exe"
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%file%" /f

:: Desbloquear Edge (Adicione o caminho do executavel em file="Aqui")
set "file=C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%file%" /f

:: Desbloquear Steam (Adicione o caminho do executavel em file="Aqui")
set "file=C:\Program Files (x86)\Steam\steam.exe"
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%file%" /f

:: Desbloquear Epic Games (Adicione o caminho do executavel em file="Aqui")
set "file=C:\Program Files (x86)\Epic Games\Launcher\Portal\Binaries\Win32\EpicGamesLauncher.exe"
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%file%" /f

exit

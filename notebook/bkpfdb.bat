REM Restore
REM "C:\Program Files\Firebird\Firebird_2_5\bin\gbak.exe" -c -user SYSDBA -password masterkey C:\Users\vlmbl\Dropbox\Baterias\Baterias.fbk C:\Users\vlmbl\Dropbox\Baterias\Baterias.fdb

@echo off

    call :MsgBox "Deseja fazer backup?"  "VBYesNo+VBQuestion" "Clique Yes para fazer backup"
    if errorlevel 7 (
        echo NO - Sair
    ) else if errorlevel 6 (
        
		echo YES - Fazendo backup
				
		del F:\Sistema\Baterias_bkp.log >nul 2>&1
		"C:\Program Files\Firebird\Firebird_2_5\bin\gbak.exe" -t -user SYSDBA -password masterkey -y F:\Sistema\Baterias_bkp.log F:\Sistema\BATERIAS.FDB F:\Sistema\BATERIAS.fbk
		"C:\Program Files\7-Zip\7z.exe" a -tzip F:\Sistema\BATERIAS.zip F:\Sistema\BATERIAS.fbk
		echo f | xcopy /y F:\Sistema\BATERIAS.zip C:\Users\vlmbl\Dropbox\Baterias\Baterias.zip
		echo f | xcopy /y F:\Sistema\BATERIAS.fbk C:\Users\vlmbl\Dropbox\Baterias\Baterias.fbk
		echo f | xcopy /y F:\Sistema\BATERIAS.FDB C:\Users\vlmbl\Dropbox\Baterias\Baterias.FDB
		
		
		echo msgbox "Backup feito com sucesso!" > %tmp%\tmp.vbs
		wscript %tmp%\tmp.vbs
		del %tmp%\tmp.vbs
	)

    exit /b

:MsgBox prompt type title
    setlocal enableextensions
    set "tempFile=%temp%\%~nx0.%random%%random%%random%vbs.tmp"
    >"%tempFile%" echo(WScript.Quit msgBox("%~1",%~2,"%~3") & cscript //nologo //e:vbscript "%tempFile%"
    set "exitCode=%errorlevel%" & del "%tempFile%" >nul 2>nul
    endlocal & exit /b %exitCode%
	
	





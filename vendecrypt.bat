
@echo off 

:menu 
cls 
echo Encrypt and Decrypt Tool v1.0.1
echo.
echo MENU 
echo. 
echo. 
echo Encrypt [ e ]
echo. 
echo Decrypt [ d ] 
echo. 
echo About [ a ] 
echo. 
echo Instructions [ i ]  
echo. 
echo Report a Bug [ r ] 
echo.
echo.
echo Note: This program currently does not have support for uppercase characters and punctuation marks, 
echo       but it is being worked on. 
echo. 
echo.
echo Type the appropriate letters for your selection. 

set /p OPTION=Your Selection:


:opee
if %OPTION%==e ( 
echo. 
echo Encrypt Selected. 
echo Type "OK" to Continue OR Press "b" to return to main menu OR "q" to quit. 
goto esel
) 

:opdi
if %OPTION%==d ( 
echo. 
echo Decrypt Selected. 
echo Type "OK" to Continue OR Press "b" to return to main menu OR "q" to quit. 
goto desel
)


:opay
if %OPTION%==a ( 
echo. 
echo About Selected. 
echo Type "OK" to Continue OR Press "b" to return to main menu OR "q" to quit. 
goto asel
)

:opai
if %OPTION%==i ( 
echo. 
echo Instructions Selected. 
echo Type "OK" to Continue OR Press "b" to return to main menu OR "q" to quit. 
goto isel  
)

:opar
if %OPTION%==r ( 
echo. 
echo Report a Bug Selected. 
echo Type "OK" to Continue OR Press "b" to return to main menu OR "q" to quit. A Browser window will take you to WhatsApp.com  
goto resel  
)



:esel 
set /p eselect= 

if %eselect%==OK (
goto encrypt 
) 

if %eselect%==b ( 
goto menu 
) 

if %eselect%==q ( 
goto end
) 


:desel 
set /p deselect= 

if %deselect%==OK (
goto decrypt  
) 

if %deselect%==b ( 
goto menu 
) 

if %deselect%==q ( 
goto end
) 

:asel 
set /p aselect= 

if %aselect%==OK (
goto about  
) 

if %aselect%==b ( 
goto menu 
) 

if %aselect%==q ( 
goto end
) 

:isel
set /p iselect= 

if %iselect%==OK (
goto steps   
) 

if %iselect%==b ( 
goto menu 
) 

if %iselect%==q ( 
goto end
) 

:resel
set /p rselect= 

if %rselect%==OK (
goto report   
) 

if %rselect%==b ( 
goto menu 
) 

if %rselect%==q ( 
goto end
) 

:gsel
set /p gselect= 

if %gselect%==OK (
goto Graphics   
) 

if %gselect%==b ( 
goto menu 
) 

if %gselect%==q ( 
goto end
) 


:encrypt
cls
setlocal enableDelayedExpansion

echo Encypting Tool v1.0.1 
echo.
echo To encrypt, please enter a PIN of your choice. You will need this PIN to decrypt the text. 

set /p inputcode=PIN: 
set /p code=Text: 
set chars=0123456789abcdefghijklmnopqrstuvwxyz 

for /L %%N in (10 1 36) do ( 

for /F %%C in ("!chars:~%%N,1!") do ( 

set /a MATH=%%N*%inputcode%

for /F %%F in ("!MATH!") do ( 
set "code=!code:%%C=-%%F!"
) 
)
) 



echo.
echo Your Encryption Key is: 
echo. 
echo !code!| clip 
echo !code! 
echo. 
echo Your encryption key has been copied to clipboard. 
echo. 
set /p wantto=Do You Want To Return To Main Menu? [ y/n ] 
 

if %wantto%==y ( 
goto menu 
)

if %wantto%==n (     
goto end  
)

:decrypt
cls


@echo off 
setlocal enableDelayedExpansion


echo Decypting Tool v1.0.1 
echo.
echo To Decrypt the encrypted text, please enter the right PIN. 

set /p inputcode1=PIN:
echo.
set /p code1=Please enter the encrypted text: 
set chars=0123456789abcdefghijklmnopqrstuvwxyz 

for /L %%N in (10 1 36) do ( 

for /F %%C in ("!chars:~%%N,1!") do ( 

set /a MATH1=%%N*%inputcode1%

for /F %%F in ("!MATH1!") do ( 
set "code1=!code1:%%F=-%%C!"
) 
)
) 

for /f %%F in ("!code1!") do ( 

set "code1=!code1:-=!"

)
cls 
echo. 
echo.
echo The decrypted text is: 
echo. 
echo !code1! 
echo. 
set /p want=Do You Want To Return To Main Menu? [ y/n ] 
 

if %want%==y ( 
goto menu 
)

if %want%==n (     
goto end  
)



:about 
cls
echo. 
echo About Encrypt and Decrypt Tool 
echo. 
echo Version: 1.0.1
echo. 
echo Developer: Vivek Kadre [ (C) 2020 VK ]  
echo. 
echo Description:
echo This is a tool which encrypts entered text with a code, and also decrypts it with the correct code. 
echo. 
echo. 
echo Press any key to return to Main Menu 
pause >nul 
goto menu 

:steps 
cls 
echo Instructions to use Encrypt and Decrypt Tool
echo. 
echo Revision: 1.0.0
echo.
echo.
echo Using the Encrypt Tool 
echo. 
echo 1. Choose a PIN ( any digits ) then type it in the PIN field. Press Enter  
echo 2. Enter the Text you want to encrypt 
echo 3. Your encryption key will be displayed on screen and will be copied to clipboard automatically. 
echo. 
echo Three steps and voila! Text encrypted. [ Note: You will need the PIN to decrypt your text. ] 
echo. 
echo. 
echo Using the Decrypt Tool 
echo. 
echo 1. Type the PIN you used to encrypt the text and press Enter. 
echo 2. Enter the encrypted text 
echo 3. The decrypted text will appear on screen. 
echo. 
echo Three steps and voila! Text decrypted. [ Note: Yo will need the correct PIN to decrypt your text. ]
echo.
echo. 
echo About section 
echo. 
echo You can go to the About section to view Version info and more. 
echo. 
echo. 
echo Press any key to return to Main Menu 
pause >nul 
goto menu  

:report 
start "" https://wa.me/message/CBYX3B4I6JCPJ1
goto menu



:end 



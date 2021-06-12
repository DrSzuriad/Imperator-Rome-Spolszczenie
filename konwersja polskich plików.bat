@echo off
SETLOCAL DisableDelayedExpansion
:: SCRIPT SETTINGS
set charset="polish"
set parser_version="0.1.11"

rd /s /q translations_temp
md translations_temp
echo Ten skrypt kopiuje pliki jezykowe z ".../EUIV/localisation/" oraz konwertuje je na format YAML. Przekonwertowane pliki zostana przeniesione do "translations/en/".
::set /p source="Podaj sciezke do folderu localisation z EUIV: "
echo Konwertowanie plikow...

set source=E:\Paradox\Imperator-Rome-Spolszczenie\pl

::generowanie filelist.txt
copy /y nul filelist.txt 
copy /y nul filelistnew.txt 
forfiles /s /p %source% /m *.yml /c "cmd /c echo @relpath" >>filelist.txt

for /f %%F in (filelist.txt) do (
    set "myVar=%%F"
    call :processLine myVar
)
goto :dalej

:processLine
SETLOCAL EnableDelayedExpansion
set "line=!%1!"
set "line=!line:".\=!"
set "line=!line:"=!"
echo !line!>>filelistnew.txt
ENDLOCAL
goto :eof

:dalej

for /f %%F in (filelistnew.txt) do xcopy /n "pl\%%F" "translations_temp\%%F"

for /f %%A in (filelistnew.txt) do (
	echo %cd%\%%A
	for %%F in (translations_temp\%%A) do (
	call jrepl "#[a-zA-Z0-9_ńąęóśłżźćńĘÓĄŚŁŻŹĆŃ$=,:;.'?!()/ -]*$"^
             "" /m /x /t "|" /f "%cd%\translations_temp\%%A" /o -
	)
)

del filelistnew.txt
del filelist.txt

::rd /s /q "pliki\\pl\\"

java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\" "przet\\pl\\" %charset%
::clausewitz
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\clausewitz\\localization\\" "przet\\pl\\replace\\clausewitz\\localization\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\clausewitz\\localization\\text_utils\\" "przet\\pl\\replace\\clausewitz\\localization\\text_utils\\" %charset%
::load_tips
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\load_tips\\" "przet\\pl\\replace\\load_tips\\" %charset%
::jomini
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\" "przet\\pl\\replace\\jomini\\localization\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\" "przet\\pl\\replace\\jomini\\localization\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\achievements\\" "przet\\pl\\replace\\jomini\\localization\\achievements\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\credits\\" "przet\\pl\\replace\\jomini\\localization\\credits\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\frontend\\" "przet\\pl\\replace\\jomini\\localization\\frontend\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\jomini\\" "przet\\pl\\replace\\jomini\\localization\\jomini\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\pops\\" "przet\\pl\\replace\\jomini\\localization\\pops\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\settings\\" "przet\\pl\\replace\\jomini\\localization\\settings\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\social\\" "przet\\pl\\replace\\jomini\\localization\\social\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\jomini\\coat_of_arms\\" "przet\\pl\\replace\\jomini\\localization\\jomini\\coat_of_arms\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\jomini\\map_editor\\" "przet\\pl\\replace\\jomini\\localization\\jomini\\map_editor\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\jomini\\multiplayer_gui\\" "przet\\pl\\replace\\jomini\\localization\\jomini\\multiplayer_gui\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\jomini\\script_system\\" "przet\\pl\\replace\\jomini\\localization\\jomini\\script_system\\" %charset%
::gui
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\gui\\" "przet\\pl\\replace\\gui\\" %charset%
::english
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\english\\" "przet\\pl\\replace\\english\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\english\\deities\\" "przet\\pl\\replace\\english\\deities\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\english\\missions\\" "przet\\pl\\replace\\english\\missions\\" %charset%



rd /s /q translations_temp

echo Koniec.
pause
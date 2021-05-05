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

set source=E:\Paradox\Imperator-Rome-Spolszczenie\source

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

for /f %%F in (filelistnew.txt) do xcopy /n "source\%%F" "translations_temp\%%F"

for /f %%A in (filelistnew.txt) do (
	echo %cd%\%%A
	for %%F in (translations_temp\%%A) do (
	call jrepl "#[a-zA-Z0-9_,:;.'()/ -]*$"^
             "" /m /x /t "|" /f "%cd%\translations_temp\%%A" /o -
	)
)

del filelistnew.txt
del filelist.txt

rd /s /q "pliki\\en\\"

java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\" "pliki\\en\\" %charset%
::clausewitz
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\clausewitz\\localization\\" "pliki\\en\\replace\\clausewitz\\localization\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\clausewitz\\localization\\text_utils\\" "pliki\\en\\replace\\clausewitz\\localization\\text_utils\\" %charset%
::load_tips
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\load_tips\\" "pliki\\en\\replace\\load_tips\\" %charset%
::jomini
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\" "pliki\\en\\replace\\jomini\\localization\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\" "pliki\\en\\replace\\jomini\\localization\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\achievements\\" "pliki\\en\\replace\\jomini\\localization\\achievements\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\credits\\" "pliki\\en\\replace\\jomini\\localization\\credits\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\frontend\\" "pliki\\en\\replace\\jomini\\localization\\frontend\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\jomini\\" "pliki\\en\\replace\\jomini\\localization\\jomini\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\pops\\" "pliki\\en\\replace\\jomini\\localization\\pops\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\settings\\" "pliki\\en\\replace\\jomini\\localization\\settings\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\social\\" "pliki\\en\\replace\\jomini\\localization\\social\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\jomini\\coat_of_arms\\" "pliki\\en\\replace\\jomini\\localization\\jomini\\coat_of_arms\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\jomini\\map_editor\\" "pliki\\en\\replace\\jomini\\localization\\jomini\\map_editor\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\jomini\\multiplayer_gui\\" "pliki\\en\\replace\\jomini\\localization\\jomini\\multiplayer_gui\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\jomini\\localization\\jomini\\script_system\\" "pliki\\en\\replace\\jomini\\localization\\jomini\\script_system\\" %charset%
::gui
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\gui\\" "pliki\\en\\replace\\gui\\" %charset%
::english
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\english\\" "pliki\\en\\replace\\english\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\english\\deities\\" "pliki\\en\\replace\\english\\deities\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_yaml" "translations_temp\\replace\\english\\missions\\" "pliki\\en\\replace\\english\\missions\\" %charset%



rd /s /q translations_temp

echo Koniec.
pause
@echo off
setlocal enabledelayedexpansion

rd /s /q translations_temp
md translations_temp
echo Ten skrypt kopiuje pliki jezykowe z ".../EUIV/localisation/" oraz konwertuje je na format YAML. Przekonwertowane pliki zostana przeniesione do "translations/en/".
::set /p source="Podaj sciezke do folderu localisation z EUIV: "
echo Konwertowanie plikow...

set source=D:\Paradox\Imperator-Rome-Spolszczenie\source\

xcopy "%source%\*" "translations_temp\" /s /y

for %%A in ("%source%") do (
    set "folder_length=%%~pA"
)

for /r "%source%" %%f in (*) do (
    set "relative_path=%%~pf"
    set "relative_path=!relative_path:%folder_length%=!"
    set "path=!relative_path!%%~nxf"
    ::echo %cd%\!path!
    for %%F in (translations_temp\!path!) do (
	echo %cd%\%%F
	endlocal
	SETLOCAL DisableDelayedExpansion
::	call jrepl "#[a-zA-Z0-9_,:;.'()/ -\x24\x7C]*$"^
::             "" /m /x /t "|" /f "%cd%\%%F" /o -
    call jrepl "#[^\x22]*\n"^ "\n" /m /x /t "|" /f "%cd%\%%F" /o -
	)
	endlocal
	setlocal enabledelayedexpansion
)

endlocal

rd /s /q "pliki\\en\\"

:: SCRIPT SETTINGS
set charset="polish"
set parser_version="0.1.16"

echo Parser...

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
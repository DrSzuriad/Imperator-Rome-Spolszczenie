@echo off
:: SCRIPT SETTINGS
set charset="polish"
set parser_version="0.1.16"

rd /s /q translations_temp 2>nul
md translations_temp

echo Ten skrypt kopiuje pliki jezykowe oraz konwertuje je na format YAML. Przekonwertowane pliki zostana przeniesione do "translations/en/".
set /p source="Podaj sciezke do folderu localisation z IR: "
echo Konwertowanie plikow...

set pattern=*_english.*
for %%A in ("%source%\%pattern%") do copy "%%A" "translations_temp\\"
for %%A in ("translations_temp\\*") do (
	echo %%A
	for %%F in (%%A) do (
	call jrepl "#[a-zA-Z0-9_,:;.'() ?]*$"^
             "" /m /x /t "|" /f "%%F" /o -
	)
)

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
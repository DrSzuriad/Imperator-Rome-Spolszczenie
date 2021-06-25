:: BUILDER SETTINGS
set language="pl"
set charset="empty"
set project_folder="Spolszczenie_IR\\localization"
set parser_version="0.1.11"


echo "Starting conversion of translated files from Transifex into the IR format for workshop delivery and automated mod building."
echo "Removing temp directory - might say does not exist. That is normal, just a precaution."
rd /s /q temp
echo "Starting compiling latest source strings directory for CK3 format into the temp supply directory"



java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\" "pliki\\en\\" "temp\\supply\\" yaml
::clausewitz
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\clausewitz\\localization\\" "pliki\\en\\replace\\clausewitz\\localization\\" "temp\\supply\\replace\\clausewitz\\localization\\" yaml
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\clausewitz\\localization\\text_utils\\" "pliki\\en\\replace\\clausewitz\\localization\\text_utils\\" "temp\\supply\\replace\\clausewitz\\localization\\text_utils\\" yaml
::load_tips
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\load_tips\\" "pliki\\en\\replace\\load_tips\\" "temp\\supply\\replace\\load_tips\\" yaml
::jomini
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\jomini\\localization\\" "pliki\\en\\replace\\jomini\\localization\\" "temp\\supply\\replace\\jomini\\localization\\" yaml
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\jomini\\localization\\" "pliki\\en\\replace\\jomini\\localization\\" "temp\\supply\\replace\\jomini\\localization\\" yaml
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\jomini\\localization\\achievements\\" "pliki\\en\\replace\\jomini\\localization\\achievements\\" "temp\\supply\\replace\\jomini\\localization\\achievements\\" yaml
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\jomini\\localization\\credits\\" "pliki\\en\\replace\\jomini\\localization\\credits\\" "temp\\supply\\replace\\jomini\\localization\\credits\\" yaml
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\jomini\\localization\\frontend\\" "pliki\\en\\replace\\jomini\\localization\\frontend\\" "temp\\supply\\replace\\jomini\\localization\\frontend\\" yaml
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\jomini\\localization\\jomini\\" "pliki\\en\\replace\\jomini\\localization\\jomini\\" "temp\\supply\\replace\\jomini\\localization\\jomini\\" yaml
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\jomini\\localization\\pops\\" "pliki\\en\\replace\\jomini\\localization\\pops\\" "temp\\supply\\replace\\jomini\\localization\\pops\\" yaml
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\jomini\\localization\\settings\\" "pliki\\en\\replace\\jomini\\localization\\settings\\" "temp\\supply\\replace\\jomini\\localization\\settings\\" yaml
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\jomini\\localization\\social\\" "pliki\\en\\replace\\jomini\\localization\\social\\" "temp\\supply\\replace\\jomini\\localization\\social\\" yaml
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\jomini\\localization\\jomini\\coat_of_arms\\" "pliki\\en\\replace\\jomini\\localization\\jomini\\coat_of_arms\\" "temp\\supply\\replace\\jomini\\localization\\jomini\\coat_of_arms\\" yaml
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\jomini\\localization\\jomini\\map_editor\\" "pliki\\en\\replace\\jomini\\localization\\jomini\\map_editor\\" "temp\\supply\\replace\\jomini\\localization\\jomini\\map_editor\\" yaml
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\jomini\\localization\\jomini\\multiplayer_gui\\" "pliki\\en\\replace\\jomini\\localization\\jomini\\multiplayer_gui\\" "temp\\supply\\replace\\jomini\\localization\\jomini\\multiplayer_gui\\" yaml
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\jomini\\localization\\jomini\\script_system\\" "pliki\\en\\replace\\jomini\\localization\\jomini\\script_system\\" "temp\\supply\\replace\\jomini\\localization\\jomini\\script_system\\" yaml
::gui
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\gui\\" "pliki\\en\\replace\\gui\\" "temp\\supply\\replace\\gui\\" yaml
::english
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\english\\" "pliki\\en\\replace\\english\\" "temp\\supply\\replace\\english\\" yaml
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\english\\deities\\" "pliki\\en\\replace\\english\\deities\\" "temp\\supply\\replace\\english\\deities\\" yaml
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_supply" "pliki\\pl\\replace\\english\\missions\\" "pliki\\en\\replace\\english\\missions\\" "temp\\supply\\replace\\english\\missions\\" yaml

echo "Starting compiling latest translations to desired language - in this case - polish."

java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\" "temp\\ir\\" %charset%
::clausewitz
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\clausewitz\\localization\\" "temp\\ir\\replace\\clausewitz\\localization\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\clausewitz\\localization\\text_utils\\" "temp\\ir\\replace\\clausewitz\\localization\\text_utils\\" %charset%
::load_tips
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\load_tips\\" "temp\\ir\\replace\\load_tips\\" %charset%
::jomini
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\jomini\\localization\\" "temp\\ir\\replace\\jomini\\localization\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\jomini\\localization\\" "temp\\ir\\replace\\jomini\\localization\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\jomini\\localization\\achievements\\" "temp\\ir\\replace\\jomini\\localization\\achievements\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\jomini\\localization\\credits\\" "temp\\ir\\replace\\jomini\\localization\\credits\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\jomini\\localization\\frontend\\" "temp\\ir\\replace\\jomini\\localization\\frontend\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\jomini\\localization\\jomini\\" "temp\\ir\\replace\\jomini\\localization\\jomini\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\jomini\\localization\\pops\\" "temp\\ir\\replace\\jomini\\localization\\pops\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\jomini\\localization\\settings\\" "temp\\ir\\replace\\jomini\\localization\\settings\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\jomini\\localization\\social\\" "temp\\ir\\replace\\jomini\\localization\\social\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\jomini\\localization\\jomini\\coat_of_arms\\" "temp\\ir\\replace\\jomini\\localization\\jomini\\coat_of_arms\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\jomini\\localization\\jomini\\map_editor\\" "temp\\ir\\replace\\jomini\\localization\\jomini\\map_editor\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\jomini\\localization\\jomini\\multiplayer_gui\\" "temp\\ir\\replace\\jomini\\localization\\jomini\\multiplayer_gui\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\jomini\\localization\\jomini\\script_system\\" "temp\\ir\\replace\\jomini\\localization\\jomini\\script_system\\" %charset%
::gui
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\gui\\" "temp\\ir\\replace\\gui\\" %charset%
::english
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\english\\" "temp\\ir\\replace\\english\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\english\\deities\\" "temp\\ir\\replace\\english\\deities\\" %charset%
java -jar "tools\\LocaleParser\\bin\\LocaleParser-%parser_version%-SNAPSHOT.jar" "folder_to_eu4" "temp\\supply\\replace\\english\\missions\\" "temp\\ir\\replace\\english\\missions\\" %charset%

cd "%project_folder%"
echo "Removing old localisations"
del /s /f /q replace
mkdir replace
del /s /f /q languages.yml
cd ../
echo "Copying new localisation"
xcopy /s temp\\ir "%project_folder%"
echo "Cleaning up temp directory."
rd /s /q temp
echo "Temp directory cleaned up, goodbye, have a nice day! :smile:
pause
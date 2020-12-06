!include "mui2.nsh"
!include "LogicLib.nsh"
!include "x64.nsh"

Unicode true
SetCompress auto
SetCompressor /SOLID LZMA
SetDatablockOptimize on
SilentInstall silent
RequestExecutionLevel user
CRCCheck on

ReserveFile /plugin "banner.dll"

Name "TeamTalk Classic de NVDA.ES"
VIProductVersion "5.6.3.0"
VIAddVersionKey "ProductName" "TeamTalk Classic de NVDA.ES"
VIAddVersionKey "FileDescription" "TeamTalk Classic de NVDA.ES"
VIAddVersionKey "ProductVersion" "5.6.3"
VIAddVersionKey "FileVersion" "5.6.3"
VIAddVersionKey "LegalCopyright" "Copyright 2020 Comunidad de NVDA en español"

OutFile "teamtalk_nvda.es.exe"
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_LANGUAGE "English" ; default language
!insertmacro MUI_LANGUAGE "Spanish"
!insertmacro MUI_LANGUAGE "SpanishInternational"

section "install"
SetAutoClose true
initPluginsDir
Banner::show /nounload
BringToFront

setOutPath "$PLUGINSDIR"
${If} ${RunningX64}
file /R "portable64\"
${Else}
file /R "portable32\"
${EndIf}
Banner::destroy
execWait "$PLUGINSDIR\TeamTalk5Classic.exe" $1
SectionEnd

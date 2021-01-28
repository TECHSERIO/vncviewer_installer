[Setup]
AppName=tvnviewer
AppVersion=0.9.2
AppVerName=TightVNC Viewer
WizardStyle=modern
DisableWelcomePage=yes
DefaultDirName={code:GetDataDir}
DisableProgramGroupPage=yes
UninstallDisplayIcon={code:GetDataDir}\tvnviewer.exe
PrivilegesRequired=lowest
UsePreviousLanguage= no
ShowLanguageDialog = no
LanguageDetectionMethod = uilanguage

OutputBaseFilename = vncviewer

Compression=lzma
ArchitecturesAllowed = x64 
ArchitecturesInstallIn64BitMode = x64
CloseApplications = yes

DirExistsWarning = no 
CreateUninstallRegKey = yes
RestartIfNeededByRun = no   
LicenseFile=license.txt
DisableReadyPage=yes
UserInfoPage=no
DisableDirPage=no

[Files]
Source: "tvnviewer.exe"; DestDir: "{code:GetDataDir}"
Source: "TightVNC Web Site.url"; DestDir: "{code:GetDataDir}"
Source: "LICENSE.txt"; DestDir: "{code:GetDataDir}"; 

[Registry]
Root: HKCU; Subkey: "Software\TightVNC\"; ValueType: String; ValueName: "tvnviewer"; ValueData: {code:GetDataDir}tvnviewer.exe;  Flags: uninsdeletekey deletekey

[Messages]
WizardLicense=TightVNC installer
LicenseLabel3=You must accept it before continuing with the installation.
LicenseAccepted=I &accept the agreement
LicenseNotAccepted=I &do not accept the agreement

[Dirs]
Name: {code:GetDataDir}; Flags: uninsneveruninstall

[Code]
procedure CurPageChanged(CurPageID: Integer); 
begin
  WizardForm.NextButton.Caption := 'Install';
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  if (PageID <> wpLicense) then result := true;
end;

function GetDataDir(Param: String): String;
begin
  Result := ExpandConstant('{%localappdata}')+'\TightVNC\';
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

Author:      François PIETTE @ OverByte
Web:         http://www.overbyte.be
             http://francois-piette.blogspot.be
Creation:    Dec 22, 2013
Description: INI file concept implemented for both Windows and Android.
             This source code is for Windows implementations.
Disclaimer:  I don't pretend this software is working. Use it at your own risks.
             Send your bug report to francois.piette@overbyte.be
Copyright:   (c) 2013 by Francois Piette All right reserved
             This is NOT public code. You can not publish this code whithout
             the prior written permisson of the author. However you can use
             the code for personal study programming.
             Any commercial use is prohibed without buying a licence.
             Any reference is welcome and must mention the blog article at
             http://francois-piette.blogspot.be
Version:     1.00
History:


 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{$IFNDEF OVERBYTE_INCLUDE_MODE}
unit FMX.Overbyte.Windows.IniFiles;
{$ENDIF}

interface

uses
    System.SysUtils, System.Classes, System.IniFiles,
    WinApi.Windows,
    WinApi.ShlObj;

const
    CompanyFolder = 'OverByte';

type
    // We are enhancing Embarcadero implementation
    TIniFile = class(System.IniFiles.TIniFile)
    public
        constructor Create(const AFileName : String);
    end;

implementation

{ TIniFile }

constructor TIniFile.Create(const AFileName: String);
var
    FileName     : String;
    Path         : array [0..1023] of Char;
    AppExeName   : array [0..1023] of Char;
    AppName      : String;
    LocalAppData : String;
begin
    // When the path is empty, Windows use Windows directory (C:\windows). This
    // is bad since Win7 which requires special permission to write to this
    // directory.
    // This implementation redirect the INI file to the user profile, that is
    // <user name>\Local Settings\Application Data (non roaming)
    // If you really want to write to Windows directory, then you must
    // specify that path name specifically.
    if ExtractFilePath(AFileName) = '' then begin
        GetModuleFileName(0, AppExeName, Sizeof(AppExeName));
        SHGetFolderPath(0, CSIDL_LOCAL_APPDATA, 0, SHGFP_TYPE_CURRENT, @Path[0]);
        AppName        := ChangeFileExt(ExtractFileName(AppExeName), '');
        LocalAppData   := IncludeTrailingPathDelimiter(Path) +
                           //CompanyFolder + '\'+
                           AppName + '\';
        FileName       := LocalAppData + AFileName;
        ForceDirectories(LocalAppData);
    end
    else
        FileName := AFileName;

    inherited Create(FileName);
end;

end.

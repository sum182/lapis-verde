{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

Author:      François PIETTE @ OverByte
Web:         http://www.overbyte.be
             http://francois-piette.blogspot.be
Creation:    Dec 22, 2013
Description: INI file concept implemented for both Windows and Android.
             This source code is for Android implementations.
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
unit FMX.Overbyte.Android.IniFiles;
{$ENDIF}

interface

uses
    System.SysUtils, System.Classes, System.IniFiles, System.StrUtils,
    FMX.Helpers.Android,
    Androidapi.NativeActivity,
    Androidapi.JNI,
    Androidapi.JNI.App,
    Androidapi.JNI.GraphicsContentViewText,
    Androidapi.JNI.JavaTypes;

type
    TIniFile = class(System.IniFiles.TCustomIniFile)
    private
        FPrefs : JSharedPreferences;
        function InitPrefs : JSharedPreferences;
        function Key(const Section, Ident : String) : JString;
        procedure ReadSectionKeysValues(const Section : String;
                                        const KeyOnly : Boolean;
                                        Strings       : TStrings);
    public
        constructor Create(const FileName: String);
        function  ReadString(const Section, Ident, Default: String): String; override;
        procedure WriteString(const Section, Ident, Value: String); override;
        procedure ReadSection(const Section: String; Strings: TStrings); override;
        procedure ReadSections(Strings: TStrings); override;
        procedure ReadSectionValues(const Section: String; Strings: TStrings); override;
        procedure DeleteKey(const Section, Ident: String); override;
        procedure EraseSection(const Section: string); override;
        procedure UpdateFile; override;
    end;

implementation

{ TIniFile }

constructor TIniFile.Create(const FileName: String);
begin
    // Under Android, just ignore the path part because Android has a well
    // known place to store preferences files
    inherited Create(ExtractFileName(FileName));
end;

procedure TIniFile.DeleteKey(const Section, Ident: String);
var
    Edit  : JSharedPreferences_Editor;
begin
    InitPrefs;
    Edit := FPrefs.Edit;
    Edit.Remove(Key(Section, Ident));
    Edit.Apply;
end;

procedure TIniFile.EraseSection(const Section: String);
var
    Idents : TStringList;
    Edit  : JSharedPreferences_Editor;
    I     : Integer;
begin
    Idents := TStringList.Create;
    ReadSectionKeysValues(Section, TRUE, Idents);
    InitPrefs;
    Edit := FPrefs.Edit;
    for I := 0 to Idents.Count - 1 do
        Edit.Remove(Key(Section, Idents[I]));
    Edit.Apply;
end;

function TIniFile.InitPrefs : JSharedPreferences;
begin
    if not Assigned(FPrefs) then
        FPrefs := SharedActivityContext.getSharedPreferences(
                      StringToJString(FileName),
                      TJActivity.JavaClass.MODE_PRIVATE);
    Result := FPrefs;
end;

function TIniFile.Key(const Section, Ident: String): JString;
begin
    Result := StringToJString('[' + Section + ']_' + Ident);
end;

procedure TIniFile.ReadSection(const Section: String; Strings: TStrings);
begin
    if Section = '' then begin
        if Assigned(Strings) then
            Strings.Clear;
    end
    else
        ReadSectionKeysValues(Section, TRUE, Strings);
end;

procedure TIniFile.ReadSections(Strings: TStrings);
begin
    ReadSectionKeysValues('', FALSE, Strings);
end;

procedure TIniFile.ReadSectionKeysValues(
    const Section : String;  // Section to read, or empty for keys and values
    const KeyOnly : Boolean;
    Strings       : TStrings);
var
    AMap     : JMap;
    ASet     : JSet;
    AIter    : JIterator;
    AObj     : JObject;
    AString  : JString;
    DString  : String;
    ASection : String;
    AIdent   : String;
    I, J     : Integer;
begin
    if not Assigned(Strings) then
        Exit;
    InitPrefs;
    Strings.Clear;
    AMap  := FPrefs.GetAll;
    if not Assigned(AMap) then
        Exit;
    ASet  := AMap.entrySet;
    if not Assigned(ASet) then
        Exit;
    AIter := ASet.iterator;
    Strings.BeginUpdate;
    while AIter.hasNext do begin
        AObj    := AIter.next;
        AString := AObj.toString;
        DString := JStringToString(AString);
        // We get "[Section]_Ident"
        if (Length(DString) > 3) and (DString[Low(DString)] = '[') then begin
            I := Pos(']', DString);
            if I > 0 then begin
                ASection := Copy(DString, 2, I - 2);
                if Section = '' then begin
                    // We are reading section names
                    if Strings.IndexOf(ASection) < 0 then
                        Strings.Add(ASection);
                end
                else if SameText(Section, ASection) then begin
                    // We are reading the key names (Ident)
                    if KeyOnly then
                        J := PosEx('=', DString)
                    else
                        J := Length(DString) + 1;
                    if J > 0 then begin
                        AIdent := Copy(DString, I + 2, J - I - 2);
                        Strings.Add(AIdent);
                    end;
                end;
            end;
        end;
    end;
    Strings.EndUpdate;
end;

procedure TIniFile.ReadSectionValues(const Section: String; Strings: TStrings);
begin
    if Section = '' then
        Strings.Clear
    else
        ReadSectionKeysValues(Section, FALSE, Strings);
end;

function TIniFile.ReadString(const Section, Ident, Default: String): String;
begin
    InitPrefs;
    Result := JStringToString(FPrefs.GetString(Key(Section, Ident),
                                               StringToJString(Default)));
end;

procedure TIniFile.UpdateFile;
begin
    // Nothing to do
end;

procedure TIniFile.WriteString(const Section, Ident, Value: String);
var
    Edit  : JSharedPreferences_Editor;
begin
    InitPrefs;
    Edit := FPrefs.Edit;
    Edit.PutString(Key(Section, Ident), StringToJString(Value));
    Edit.Apply;
end;

end.

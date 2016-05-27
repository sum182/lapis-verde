{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

Author:      François PIETTE @ OverByte
Web:         http://www.overbyte.be
             http://francois-piette.blogspot.be
Creation:    Dec 22, 2013
Description: INI file concept implemented for both Windows and Android.
             This source code is for Windows and Android implementations.
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
unit FMX.Overbyte.IniFiles;
{$DEFINE OVERBYTE_INCLUDE_MODE}
{$IFDEF ANDROID}
    {$I FMX.Overbyte.Android.IniFiles.pas}
{$ENDIF}
{$IFDEF MSWINDOWS}
    {$I FMX.Overbyte.Windows.IniFiles.pas}
{$ENDIF}



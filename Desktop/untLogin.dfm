object frmLogin: TfrmLogin
  Left = 700
  Top = 250
  BorderIcons = []
  Caption = 'Login'
  ClientHeight = 250
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 189
    Align = alBottom
    Style.LookAndFeel.SkinName = 'Black'
    StyleDisabled.LookAndFeel.SkinName = 'Black'
    StyleFocused.LookAndFeel.SkinName = 'Black'
    StyleHot.LookAndFeel.SkinName = 'Black'
    TabOrder = 1
    Height = 61
    Width = 313
    object btnLogin: TcxButton
      Left = 108
      Top = 20
      Width = 90
      Height = 25
      Align = alCustom
      Caption = 'Login'
      Default = True
      LookAndFeel.SkinName = 'Black'
      OptionsImage.ImageIndex = 36
      OptionsImage.Images = DM.ImageList1
      TabOrder = 0
      OnClick = btnLoginClick
    end
    object btnCancelar: TcxButton
      Left = 207
      Top = 20
      Width = 90
      Height = 25
      Align = alCustom
      Cancel = True
      Caption = 'Cancelar'
      LookAndFeel.SkinName = 'Black'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    Style.LookAndFeel.SkinName = 'Black'
    StyleDisabled.LookAndFeel.SkinName = 'Black'
    StyleFocused.LookAndFeel.SkinName = 'Black'
    StyleHot.LookAndFeel.SkinName = 'Black'
    TabOrder = 0
    Height = 189
    Width = 313
    object edtSenha: TcxTextEdit
      Left = 16
      Top = 116
      Properties.EchoMode = eemPassword
      Properties.OnChange = edtSenhaPropertiesChange
      TabOrder = 3
      Width = 279
    end
    object cxLabel1: TcxLabel
      Left = 16
      Top = 26
      Caption = 'CPF ou Email'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cxLabel2: TcxLabel
      Left = 16
      Top = 96
      Caption = 'Senha'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object lblStatus: TcxLabel
      Left = 16
      Top = 152
      Caption = 'lblStatus'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Visible = False
    end
    object edtLogin: TcxMaskEdit
      Left = 18
      Top = 49
      Properties.OnChange = edtLoginPropertiesChange
      TabOrder = 0
      Width = 279
    end
  end
end

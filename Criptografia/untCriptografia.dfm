object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Criptografia'
  ClientHeight = 202
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 51
    Width = 24
    Height = 13
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 106
    Width = 101
    Height = 13
    Caption = 'Valor - Criptografado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtValor: TEdit
    Left = 16
    Top = 64
    Width = 609
    Height = 21
    TabOrder = 0
  end
  object edtValorEncrypt: TEdit
    Left = 16
    Top = 122
    Width = 609
    Height = 21
    TabOrder = 1
  end
  object btnCriptografar: TButton
    Left = 419
    Top = 162
    Width = 100
    Height = 25
    Caption = 'Criptografar'
    TabOrder = 2
    OnClick = btnCriptografarClick
  end
  object btnDescriptografar: TButton
    Left = 525
    Top = 162
    Width = 100
    Height = 25
    Caption = 'Descriptografar'
    TabOrder = 3
    OnClick = btnDescriptografarClick
  end
end

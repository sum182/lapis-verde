object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 517
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 23
  object EdtNome: TLabeledEdit
    Left = 32
    Top = 104
    Width = 194
    Height = 31
    EditLabel.Width = 49
    EditLabel.Height = 23
    EditLabel.Caption = 'Nome'
    TabOrder = 0
  end
  object EdtEmail: TLabeledEdit
    Left = 32
    Top = 184
    Width = 194
    Height = 31
    EditLabel.Width = 45
    EditLabel.Height = 23
    EditLabel.Caption = 'Email'
    TabOrder = 1
  end
  object EdtTelefone: TLabeledEdit
    Left = 32
    Top = 256
    Width = 194
    Height = 31
    EditLabel.Width = 72
    EditLabel.Height = 23
    EditLabel.Caption = 'Telefone'
    TabOrder = 2
  end
  object BtnNome: TButton
    Left = 32
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Incuir'
    TabOrder = 3
    OnClick = BtnNomeClick
  end
  object BtnExcluir: TButton
    Left = 216
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 4
    OnClick = BtnExcluirClick
  end
  object BtnAlterar: TButton
    Left = 121
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 5
    OnClick = BtnAlterarClick
  end
  object BtnConsultar: TButton
    Left = 312
    Top = 320
    Width = 97
    Height = 25
    Caption = 'Consultar'
    TabOrder = 6
    OnClick = BtnConsultarClick
  end
  object Memo1: TMemo
    Left = 32
    Top = 360
    Width = 601
    Height = 137
    TabOrder = 7
  end
  object EdtCodigo: TLabeledEdit
    Left = 32
    Top = 32
    Width = 194
    Height = 31
    EditLabel.Width = 57
    EditLabel.Height = 23
    EditLabel.Caption = 'C'#243'digo'
    TabOrder = 8
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://localhost:8080/datasnap/rest/TContatoController/Contato'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 424
    Top = 32
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 368
    Top = 96
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'text/html'
    Left = 496
    Top = 96
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 524
    Top = 37
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = RESTResponse1
      FieldName = 'Content'
      Control = Memo1
      Track = False
    end
  end
end

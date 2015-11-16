object frm_principal: Tfrm_principal
  Left = 0
  Top = 0
  Caption = 'CRUD MESTRE DETALHE'
  ClientHeight = 491
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object btn_open: TBitBtn
    Left = 6
    Top = 8
    Width = 103
    Height = 35
    Caption = 'Open'
    TabOrder = 0
    OnClick = btn_openClick
  end
  object btn_incluir: TBitBtn
    Left = 115
    Top = 8
    Width = 103
    Height = 35
    Caption = 'Incluir'
    TabOrder = 1
    OnClick = btn_incluirClick
  end
  object btn_salvar: TBitBtn
    Left = 329
    Top = 8
    Width = 103
    Height = 35
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btn_salvarClick
  end
  object btn_cancelar: TBitBtn
    Left = 436
    Top = 8
    Width = 103
    Height = 35
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btn_cancelarClick
  end
  object btn_excluir: TBitBtn
    Left = 543
    Top = 8
    Width = 103
    Height = 35
    Caption = 'Excluir'
    TabOrder = 5
    OnClick = btn_excluirClick
  end
  object btn_editar: TBitBtn
    Left = 221
    Top = 8
    Width = 103
    Height = 35
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = btn_editarClick
  end
  object pnl_sub: TPanel
    Left = 8
    Top = 203
    Width = 681
    Height = 270
    TabOrder = 6
    object btn_sub_incluir: TBitBtn
      Left = 8
      Top = 10
      Width = 103
      Height = 35
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = btn_sub_incluirClick
    end
    object btn_sub_alvar: TBitBtn
      Left = 222
      Top = 10
      Width = 103
      Height = 35
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btn_sub_alvarClick
    end
    object btn_sub_cancelar: TBitBtn
      Left = 329
      Top = 10
      Width = 103
      Height = 35
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btn_sub_cancelarClick
    end
    object btn_sub_excluir: TBitBtn
      Left = 438
      Top = 10
      Width = 103
      Height = 35
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = btn_sub_excluirClick
    end
    object btn_sub_alterar: TBitBtn
      Left = 115
      Top = 10
      Width = 103
      Height = 35
      Caption = 'Alterar'
      TabOrder = 4
      OnClick = btn_sub_alterarClick
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 64
      Width = 601
      Height = 168
      DataSource = dts_detalhe
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 55
    Width = 638
    Height = 120
    DataSource = dts_mestre
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object fdq_mestre: TFDQuery
    CachedUpdates = True
    Connection = DM.FDConnection
    SchemaAdapter = fds_principal
    UpdateOptions.AutoIncFields = 'escola_id'
    SQL.Strings = (
      'select * from escola ')
    Left = 72
    Top = 336
    object fdq_mestreescola_id: TFDAutoIncField
      FieldName = 'escola_id'
      Origin = 'escola_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdq_mestrenome_fantasia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_fantasia'
      Origin = 'nome_fantasia'
      Size = 150
    end
    object fdq_mestrerazao_social: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'razao_social'
      Origin = 'razao_social'
      Size = 150
    end
    object fdq_mestrecnpj: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'cnpj'
      Origin = 'cnpj'
    end
    object fdq_mestreativo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ativo'
      Origin = 'ativo'
      FixedChar = True
      Size = 1
    end
    object fdq_mestredata_cadastro: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
    end
    object fdq_mestreemail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 200
    end
    object fdq_mestreinformacoes_gerais: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'informacoes_gerais'
      Origin = 'informacoes_gerais'
      BlobType = ftMemo
    end
  end
  object dts_mestre: TDataSource
    DataSet = fdq_mestre
    Left = 80
    Top = 400
  end
  object fdq_detalhe: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'escola_id'
    MasterSource = dts_mestre
    MasterFields = 'escola_id'
    DetailFields = 'escola_id'
    Connection = DM.FDConnection
    SchemaAdapter = fds_principal
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    UpdateOptions.AutoIncFields = 'escola_telefone_id'
    SQL.Strings = (
      'SELECT * FROM escola_telefone t'
      'where t.escola_id = :escola_id')
    Left = 624
    Top = 240
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftAutoInc
        ParamType = ptInput
        Size = 4
        Value = 3
      end>
  end
  object dts_detalhe: TDataSource
    DataSet = fdq_detalhe
    Left = 624
    Top = 304
  end
  object fds_principal: TFDSchemaAdapter
    Left = 184
    Top = 328
  end
end

object frmTeste: TfrmTeste
  Left = 0
  Top = 0
  Caption = 'frmTeste'
  ClientHeight = 468
  ClientWidth = 996
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 320
    Top = 48
    Width = 473
    Height = 120
    DataSource = dts_mestre
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'escola_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome_fantasia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'razao_social'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cnpj'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ativo'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_cadastro'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'informacoes_gerais'
        Width = 64
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 320
    Top = 224
    Width = 473
    Height = 120
    DataSource = dts_detalhe
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'escola_telefone_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'escola_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefone_tipo_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numero'
        Width = 76
        Visible = True
      end>
  end
  object btn_incluir: TBitBtn
    Left = 19
    Top = 24
    Width = 103
    Height = 35
    Caption = 'Incluir'
    TabOrder = 2
    OnClick = btn_incluirClick
  end
  object btn_salvar: TBitBtn
    Left = 193
    Top = 24
    Width = 103
    Height = 35
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btn_salvarClick
  end
  object DBNavigator1: TDBNavigator
    Left = 320
    Top = 193
    Width = 240
    Height = 25
    DataSource = dts_detalhe
    TabOrder = 4
  end
  object DBNavigator2: TDBNavigator
    Left = 320
    Top = 17
    Width = 240
    Height = 25
    DataSource = dts_mestre
    TabOrder = 5
  end
  object FDSchemaAdapter1: TFDSchemaAdapter
    Left = 168
    Top = 328
  end
  object dts_detalhe: TDataSource
    DataSet = fdq_detalhe
    Left = 168
    Top = 208
  end
  object fdq_detalhe: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'escola_id'
    MasterSource = dts_mestre
    MasterFields = 'escola_id'
    DetailFields = 'escola_id'
    Connection = DM.FDConnection
    SchemaAdapter = FDSchemaAdapter1
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    UpdateOptions.AutoIncFields = 'escola_telefone_id'
    SQL.Strings = (
      'SELECT * FROM escola_telefone t'
      'where t.escola_id = :escola_id')
    Left = 168
    Top = 144
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftAutoInc
        ParamType = ptInput
        Size = 4
        Value = 3
      end>
  end
  object fdq_mestre: TFDQuery
    CachedUpdates = True
    Connection = DM.FDConnection
    SchemaAdapter = FDSchemaAdapter1
    UpdateOptions.AutoIncFields = 'escola_id'
    SQL.Strings = (
      'select * from escola ')
    Left = 72
    Top = 144
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
    Left = 72
    Top = 208
  end
end

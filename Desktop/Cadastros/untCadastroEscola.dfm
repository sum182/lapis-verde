inherited frmCadastroEscola: TfrmCadastroEscola
  Caption = 'Cadastro de Escola'
  ClientHeight = 525
  ClientWidth = 1038
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 1054
  ExplicitHeight = 563
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToBaCadastro: TToolBar
    Width = 1038
    ExplicitWidth = 1038
    inherited ToolButton1: TToolButton
      ExplicitWidth = 14
    end
    inherited btnLocalizarTodosRegistros: TToolButton
      ExplicitWidth = 70
    end
  end
  inherited PaCoPadrao: TPageControl
    Width = 1038
    Height = 484
    ActivePage = TaShCadastro
    ExplicitWidth = 1038
    ExplicitHeight = 484
    inherited TaShConsulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 1030
      ExplicitHeight = 456
      inherited grbxPesquisa: TGroupBox
        Width = 1030
        ExplicitWidth = 1030
        inherited ToolBar1: TToolBar
          Width = 1020
          ExplicitWidth = 1020
          inherited ToolButton3: TToolButton
            ExplicitWidth = 24
          end
          inherited ToolButton4: TToolButton
            ExplicitWidth = 24
          end
          inherited ToolButton5: TToolButton
            ExplicitWidth = 24
          end
          inherited ToolButton6: TToolButton
            ExplicitWidth = 24
          end
        end
      end
      inherited grPesquisa: TsmDBGrid
        Width = 1030
        Height = 341
        DataSource = dsBusca
        Columns = <
          item
            Expanded = False
            FieldName = 'escola_id'
            Title.Caption = 'Escola ID'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'nome_fantasia'
            Title.Caption = 'Nome Fantasia'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'razao_social'
            Title.Caption = 'Raz'#227'o Social'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cnpj'
            Title.Caption = 'CNPJ'
            Width = 272
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ativo'
            Title.Caption = 'Ativo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'data_cadastro'
            Title.Caption = 'Data Cadastro'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'email'
            Title.Caption = 'Email'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'informacoes_adicionais'
            Visible = False
          end>
      end
      inherited stbrConsulta: TStatusBar
        Top = 438
        Width = 1030
        ExplicitTop = 438
        ExplicitWidth = 1030
      end
    end
    inherited TaShCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 1030
      ExplicitHeight = 456
      object cxPageControl1: TcxPageControl
        Left = 0
        Top = 0
        Width = 1030
        Height = 456
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = cxTabSheet1
        Properties.CustomButtons.Buttons = <>
        ClientRectBottom = 452
        ClientRectLeft = 4
        ClientRectRight = 1026
        ClientRectTop = 24
        object cxTabSheet1: TcxTabSheet
          Caption = 'Dados Principais'
          ImageIndex = 0
          object Label8: TLabel
            Left = 30
            Top = 221
            Width = 24
            Height = 13
            Caption = 'Email'
            FocusControl = cxDBTextEdit4
          end
          object Label7: TLabel
            Left = 376
            Top = 171
            Width = 70
            Height = 13
            Caption = 'Data Cadastro'
            FocusControl = cxDBDateEdit1
          end
          object Label5: TLabel
            Left = 30
            Top = 171
            Width = 25
            Height = 13
            Caption = 'CNPJ'
          end
          object Label4: TLabel
            Left = 30
            Top = 122
            Width = 60
            Height = 13
            Caption = 'Raz'#227'o Social'
            FocusControl = cxDBTextEdit2
          end
          object Label3: TLabel
            Left = 30
            Top = 69
            Width = 71
            Height = 13
            Caption = 'Nome Fantasia'
            FocusControl = cxDBTextEdit1
          end
          object Label9: TLabel
            Left = 30
            Top = 274
            Width = 93
            Height = 13
            Caption = 'Informa'#231#245'es Gerais'
          end
          object Label2: TLabel
            Left = 30
            Top = 16
            Width = 11
            Height = 13
            Caption = 'ID'
            FocusControl = cxDBTextEdit1
          end
          object cxDBTextEdit4: TcxDBTextEdit
            Left = 30
            Top = 239
            DataBinding.DataField = 'email'
            DataBinding.DataSource = dsCad
            TabOrder = 5
            Width = 481
          end
          object cxDBDateEdit1: TcxDBDateEdit
            Left = 376
            Top = 188
            DataBinding.DataField = 'data_cadastro'
            DataBinding.DataSource = dsCad
            TabOrder = 4
            Width = 137
          end
          object cxDBTextEdit2: TcxDBTextEdit
            Left = 30
            Top = 139
            DataBinding.DataField = 'razao_social'
            DataBinding.DataSource = dsCad
            TabOrder = 2
            Width = 481
          end
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 30
            Top = 88
            DataBinding.DataField = 'nome_fantasia'
            DataBinding.DataSource = dsCad
            TabOrder = 1
            Width = 481
          end
          object cxDBMemo1: TcxDBMemo
            Left = 30
            Top = 293
            DataBinding.DataField = 'informacoes_gerais'
            DataBinding.DataSource = dsCad
            TabOrder = 6
            Height = 113
            Width = 481
          end
          object chkEscola: TcxDBCheckBox
            Left = 561
            Top = 88
            Caption = 'Escola Ativa'
            DataBinding.DataField = 'ativo'
            DataBinding.DataSource = dsCad
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            TabOrder = 7
            Width = 96
          end
          object cxGroupBox1: TcxGroupBox
            Left = 563
            Top = 122
            Caption = 'Telefones'
            TabOrder = 8
            Height = 308
            Width = 456
            object Bevel1: TBevel
              Left = 208
              Top = 96
              Width = 50
              Height = 50
            end
            object Bevel2: TBevel
              Left = 2
              Top = 18
              Width = 452
              Height = 44
              Align = alTop
              ExplicitLeft = 3
              ExplicitTop = 12
              ExplicitWidth = 487
            end
            object DBNavigator1: TDBNavigator
              Left = 16
              Top = 28
              Width = 105
              Height = 25
              DataSource = dsTelefone
              VisibleButtons = [nbInsert, nbDelete, nbPost]
              Align = alCustom
              ConfirmDelete = False
              TabOrder = 0
            end
            object cxGrid1: TcxGrid
              Left = 2
              Top = 62
              Width = 452
              Height = 244
              Align = alClient
              TabOrder = 1
              object cxGrid1DBTableView1: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                DataController.DataSource = dsTelefone
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsView.GroupByBox = False
                object cxGrid1DBTableView1escola_telefone_id: TcxGridDBColumn
                  DataBinding.FieldName = 'escola_telefone_id'
                  Visible = False
                  Width = 108
                end
                object cxGrid1DBTableView1escola_id: TcxGridDBColumn
                  DataBinding.FieldName = 'escola_id'
                  Visible = False
                  Width = 74
                end
                object cxGrid1DBTableView1telefone_tipo_id: TcxGridDBColumn
                  DataBinding.FieldName = 'telefone_tipo_id'
                  Visible = False
                  Width = 107
                end
                object cxGrid1DBTableView1numero: TcxGridDBColumn
                  Caption = 'N'#250'mero'
                  DataBinding.FieldName = 'numero'
                  Width = 179
                end
                object cxGrid1DBTableView1TelefoneTipo: TcxGridDBColumn
                  Caption = 'Tipo'
                  DataBinding.FieldName = 'telefone_tipo_id'
                  PropertiesClassName = 'TcxLookupComboBoxProperties'
                  Properties.KeyFieldNames = 'telefone_tipo_id'
                  Properties.ListColumns = <
                    item
                      FieldName = 'descricao'
                    end>
                  Properties.ListOptions.ShowHeader = False
                  Properties.ListSource = dsTelefoneTipo
                  Width = 152
                end
              end
              object cxGrid1Level1: TcxGridLevel
                GridView = cxGrid1DBTableView1
              end
            end
          end
          object cxDBMaskEdit2: TcxDBMaskEdit
            Left = 30
            Top = 188
            DataBinding.DataField = 'cnpj'
            DataBinding.DataSource = dsCad
            Properties.EditMask = '99.999.999/9999-99;0;_'
            TabOrder = 3
            Width = 283
          end
          object cxDBTextEdit3: TcxDBTextEdit
            Left = 30
            Top = 32
            DataBinding.DataField = 'escola_id'
            DataBinding.DataSource = dsCad
            Enabled = False
            TabOrder = 0
            Width = 121
          end
        end
        object cxTabSheet2: TcxTabSheet
          Caption = 'Endere'#231'o'
          ImageIndex = 1
          object Label6: TLabel
            Left = 32
            Top = 24
            Width = 19
            Height = 13
            Caption = 'Cep'
          end
          object Label10: TLabel
            Left = 184
            Top = 24
            Width = 55
            Height = 13
            Caption = 'Logradouro'
            FocusControl = cxDBTextEdit6
          end
          object Label11: TLabel
            Left = 32
            Top = 72
            Width = 37
            Height = 13
            Caption = 'N'#250'mero'
          end
          object Label12: TLabel
            Left = 184
            Top = 72
            Width = 65
            Height = 13
            Caption = 'Complemento'
            FocusControl = cxDBTextEdit7
          end
          object Label13: TLabel
            Left = 32
            Top = 128
            Width = 33
            Height = 13
            Caption = 'Cidade'
            FocusControl = cxDBTextEdit8
          end
          object Label14: TLabel
            Left = 404
            Top = 72
            Width = 28
            Height = 13
            Caption = 'Bairro'
            FocusControl = cxDBTextEdit9
          end
          object Label15: TLabel
            Left = 404
            Top = 128
            Width = 13
            Height = 13
            Caption = 'UF'
          end
          object cxDBTextEdit6: TcxDBTextEdit
            Left = 184
            Top = 40
            DataBinding.DataField = 'logradouro'
            DataBinding.DataSource = dsEndereco
            TabOrder = 1
            Width = 659
          end
          object cxDBTextEdit7: TcxDBTextEdit
            Left = 184
            Top = 91
            DataBinding.DataField = 'complemento'
            DataBinding.DataSource = dsEndereco
            TabOrder = 3
            Width = 201
          end
          object cxDBTextEdit8: TcxDBTextEdit
            Left = 32
            Top = 145
            DataBinding.DataField = 'cidade'
            DataBinding.DataSource = dsEndereco
            TabOrder = 5
            Width = 353
          end
          object cxDBTextEdit9: TcxDBTextEdit
            Left = 404
            Top = 91
            DataBinding.DataField = 'bairro'
            DataBinding.DataSource = dsEndereco
            TabOrder = 4
            Width = 439
          end
          object cxDBMaskEdit1: TcxDBMaskEdit
            Left = 32
            Top = 40
            DataBinding.DataField = 'cep'
            DataBinding.DataSource = dsEndereco
            Properties.EditMask = '99999-999;0'
            TabOrder = 0
            Width = 121
          end
          object cxDBSpinEdit2: TcxDBSpinEdit
            Left = 32
            Top = 91
            DataBinding.DataField = 'numero'
            DataBinding.DataSource = dsEndereco
            Properties.SpinButtons.Visible = False
            TabOrder = 2
            Width = 121
          end
          object cxDBComboBox1: TcxDBComboBox
            Left = 404
            Top = 145
            DataBinding.DataField = 'uf'
            DataBinding.DataSource = dsEndereco
            Properties.Items.Strings = (
              'AC'
              'AL'
              'AM'
              'AP'
              'BA'
              'CE'
              'DF'
              'ES'
              'GO'
              'MA'
              'MG'
              'MS'
              'MT'
              'PA'
              'PB'
              'PE'
              'PI'
              'PR'
              'RJ'
              'RN'
              'RO'
              'RR'
              'RS'
              'SC'
              'SE'
              'SP'
              'TO')
            TabOrder = 6
            Width = 66
          end
        end
      end
    end
    inherited TaShRelatorio: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 1030
      ExplicitHeight = 456
    end
  end
  inherited smCadPadrao: TsmCadPadrao
    Tabela = 'escola'
    FieldsBusca = <
      item
        FieldName = 'escola_id'
        DisplayName = 'Escola_id'
        ShowCombo = True
        ShowGrid = True
        ShowSelect = True
        FieldType = ftAutoInc
      end
      item
        FieldName = 'nome_fantasia'
        DisplayName = 'Nome_fantasia'
        ShowCombo = True
        ShowGrid = True
        ShowSelect = True
        FieldType = ftString
      end
      item
        FieldName = 'razao_social'
        DisplayName = 'Razao_social'
        ShowCombo = True
        ShowGrid = True
        ShowSelect = True
        FieldType = ftString
      end
      item
        FieldName = 'cnpj'
        DisplayName = 'Cnpj'
        ShowCombo = True
        ShowGrid = True
        ShowSelect = True
        FieldType = ftSmallint
      end
      item
        FieldName = 'ativo'
        DisplayName = 'Ativo'
        ShowCombo = True
        ShowGrid = True
        ShowSelect = True
        FieldType = ftString
      end
      item
        FieldName = 'data_cadastro'
        DisplayName = 'Data_cadastro'
        ShowCombo = True
        ShowGrid = True
        ShowSelect = True
        FieldType = ftDate
      end
      item
        FieldName = 'email'
        DisplayName = 'Email'
        ShowCombo = True
        ShowGrid = True
        ShowSelect = True
        FieldType = ftString
      end
      item
        FieldName = 'informacoes_gerais'
        DisplayName = 'informacoes_gerais'
        ShowCombo = False
        ShowGrid = False
        ShowSelect = False
        FieldType = ftMemo
      end>
    KeyField = 'escola_id'
  end
  inherited fdqCad: TFDQuery
    AfterOpen = fdqCadAfterOpen
    OnNewRecord = fdqCadNewRecord
    CachedUpdates = True
    Connection = DM.FDConnection
    SchemaAdapter = FDSchemaAdapter
    UpdateOptions.AutoIncFields = 'escola_id'
    SQL.Strings = (
      'select * from escola '
      'where escola_id = :escola_id'
      '')
    Left = 616
    Top = 240
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqCadescola_id: TFDAutoIncField
      FieldName = 'escola_id'
      Origin = 'escola_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqCadnome_fantasia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_fantasia'
      Origin = 'nome_fantasia'
      Size = 150
    end
    object fdqCadrazao_social: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'razao_social'
      Origin = 'razao_social'
      Size = 150
    end
    object fdqCadcnpj: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'cnpj'
      Origin = 'cnpj'
    end
    object fdqCadativo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ativo'
      Origin = 'ativo'
      FixedChar = True
      Size = 1
    end
    object fdqCaddata_cadastro: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
    end
    object fdqCademail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 200
    end
    object fdqCadinformacoes_gerais: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'informacoes_gerais'
      Origin = 'informacoes_gerais'
      BlobType = ftMemo
    end
  end
  inherited dsCad: TDataSource
    Left = 616
    Top = 296
  end
  inherited dsBusca: TDataSource
    Left = 680
    Top = 296
  end
  inherited fdqBusca: TFDQuery
    BeforeOpen = fdqBuscaBeforeOpen
    Connection = DM.FDConnection
    SQL.Strings = (
      'select * from escola '
      'where escola_id = :escola_id')
    Left = 680
    Top = 240
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsEndereco: TDataSource [11]
    DataSet = fdqEndereco
    Left = 552
    Top = 296
  end
  object dsTelefone: TDataSource [12]
    DataSet = fdqTelefone
    Left = 480
    Top = 296
  end
  object fdqTelefoneTipo: TFDQuery [13]
    Connection = DM.FDConnection
    SQL.Strings = (
      'select * from telefone_tipo t'
      'order by t.descricao')
    Left = 400
    Top = 240
  end
  object dsTelefoneTipo: TDataSource [14]
    DataSet = fdqTelefoneTipo
    Left = 400
    Top = 296
  end
  inherited FDSchemaAdapter: TFDSchemaAdapter
    Left = 400
    Top = 360
  end
  object fdqTelefone: TFDQuery
    BeforeInsert = fdqTelefoneBeforeInsert
    BeforeEdit = fdqTelefoneBeforeEdit
    CachedUpdates = True
    IndexFieldNames = 'escola_id'
    MasterSource = dsCad
    MasterFields = 'escola_id'
    Connection = DM.FDConnection
    SchemaAdapter = FDSchemaAdapter
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    UpdateOptions.AutoIncFields = 'escola_telefone_id'
    SQL.Strings = (
      'SELECT * FROM escola_telefone t'
      'where t.escola_id = :escola_id')
    Left = 480
    Top = 240
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftAutoInc
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
  end
  object fdqEndereco: TFDQuery
    BeforeInsert = fdqEnderecoBeforeInsert
    BeforeEdit = fdqEnderecoBeforeEdit
    CachedUpdates = True
    IndexFieldNames = 'escola_id'
    MasterSource = dsCad
    MasterFields = 'escola_id'
    Connection = DM.FDConnection
    SchemaAdapter = FDSchemaAdapter
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    UpdateOptions.AutoIncFields = 'escola_endereco_id'
    SQL.Strings = (
      'SELECT * FROM escola_endereco e'
      'where e.escola_id = :escola_id')
    Left = 552
    Top = 240
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftAutoInc
        ParamType = ptInput
        Value = Null
      end>
  end
end

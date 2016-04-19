inherited frmCadastroResponsavel: TfrmCadastroResponsavel
  Caption = 'Cadastro de Respons'#225'veis'
  ClientHeight = 524
  ClientWidth = 1230
  OnClose = FormClose
  ExplicitWidth = 1246
  ExplicitHeight = 562
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToBaCadastro: TToolBar
    Width = 1230
    ExplicitWidth = 1230
    inherited ToolButton1: TToolButton
      ExplicitWidth = 14
    end
    inherited btnLocalizarTodosRegistros: TToolButton
      ExplicitWidth = 70
    end
  end
  inherited PaCoPadrao: TPageControl
    Width = 1230
    Height = 483
    ExplicitWidth = 1230
    ExplicitHeight = 483
    inherited TaShConsulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 1222
      ExplicitHeight = 455
      inherited grbxPesquisa: TGroupBox
        Width = 1222
        ExplicitWidth = 1222
        inherited ToolBar1: TToolBar
          Width = 1212
          ExplicitWidth = 1212
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
        Width = 1222
        Height = 340
        DataSource = dsBusca
        Columns = <
          item
            Expanded = False
            FieldName = 'responsavel_id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Nome'
            Width = 230
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sobrenome'
            Title.Caption = 'Sobrenome'
            Width = 245
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sexo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'rg'
            Title.Caption = 'RG'
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cpf'
            Title.Caption = 'CPF'
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ativo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'email'
            Title.Caption = 'Email'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'informacoes_gerais'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'escola_id'
            Visible = False
          end>
      end
      inherited stbrConsulta: TStatusBar
        Top = 437
        Width = 1222
        ExplicitTop = 437
        ExplicitWidth = 1222
      end
    end
    inherited TaShCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 1222
      ExplicitHeight = 455
      object cxPageControl1: TcxPageControl
        Left = 0
        Top = 0
        Width = 1222
        Height = 455
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = cxTabSheet1
        Properties.CustomButtons.Buttons = <>
        ClientRectBottom = 451
        ClientRectLeft = 4
        ClientRectRight = 1218
        ClientRectTop = 24
        object cxTabSheet1: TcxTabSheet
          Caption = 'Dados Principais'
          ImageIndex = 0
          object Label3: TLabel
            Left = 32
            Top = 14
            Width = 27
            Height = 13
            Caption = 'Nome'
            FocusControl = cxDBTextEdit1
          end
          object Label4: TLabel
            Left = 32
            Top = 67
            Width = 54
            Height = 13
            Caption = 'Sobrenome'
            FocusControl = cxDBTextEdit2
          end
          object Label7: TLabel
            Left = 32
            Top = 113
            Width = 14
            Height = 13
            Caption = 'RG'
          end
          object Label8: TLabel
            Left = 240
            Top = 113
            Width = 19
            Height = 13
            Caption = 'CPF'
          end
          object Label5: TLabel
            Left = 32
            Top = 166
            Width = 99
            Height = 13
            Caption = 'Tipo de Respons'#225'vel'
            FocusControl = cxDBTextEdit2
          end
          object Label6: TLabel
            Left = 240
            Top = 166
            Width = 24
            Height = 13
            Caption = 'Sexo'
          end
          object Label2: TLabel
            Left = 32
            Top = 215
            Width = 24
            Height = 13
            Caption = 'Email'
            FocusControl = cxDBTextEdit1
          end
          object Label9: TLabel
            Left = 32
            Top = 275
            Width = 93
            Height = 13
            Caption = 'Informa'#231#245'es Gerais'
          end
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 32
            Top = 31
            DataBinding.DataField = 'nome'
            DataBinding.DataSource = dsCad
            TabOrder = 0
            Width = 489
          end
          object cxDBTextEdit2: TcxDBTextEdit
            Left = 32
            Top = 84
            DataBinding.DataField = 'sobrenome'
            DataBinding.DataSource = dsCad
            TabOrder = 1
            Width = 489
          end
          object cxDBMaskEdit1: TcxDBMaskEdit
            Left = 32
            Top = 130
            DataBinding.DataField = 'rg'
            DataBinding.DataSource = dsCad
            Properties.EditMask = '00.000.000-a;0'
            TabOrder = 2
            Width = 185
          end
          object cxDBMaskEdit2: TcxDBMaskEdit
            Left = 240
            Top = 130
            DataBinding.DataField = 'cpf'
            DataBinding.DataSource = dsCad
            Properties.EditMask = '999.999.999-99;0;_'
            TabOrder = 3
            Width = 203
          end
          object cxDBLookupComboBox1: TcxDBLookupComboBox
            Left = 32
            Top = 183
            DataBinding.DataField = 'responsavel_tipo_id'
            DataBinding.DataSource = dsCad
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'responsavel_tipo_id'
            Properties.ListColumns = <
              item
                FieldName = 'descricao'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsResponsavelTipo
            TabOrder = 4
            Width = 185
          end
          object cxDBImageComboBox1: TcxDBImageComboBox
            Left = 240
            Top = 183
            DataBinding.DataField = 'sexo'
            DataBinding.DataSource = dsCad
            Properties.Items = <
              item
                Description = 'Masculino'
                ImageIndex = 0
                Value = 'M'
              end
              item
                Description = 'Feminino'
                Value = 'F'
              end>
            Style.Shadow = False
            Style.ButtonStyle = btsDefault
            Style.ButtonTransparency = ebtNone
            TabOrder = 5
            Width = 121
          end
          object cxDBTextEdit3: TcxDBTextEdit
            Left = 32
            Top = 234
            DataBinding.DataField = 'email'
            DataBinding.DataSource = dsCad
            TabOrder = 6
            Width = 489
          end
          object cxDBMemo1: TcxDBMemo
            Left = 32
            Top = 294
            DataBinding.DataField = 'informacoes_gerais'
            DataBinding.DataSource = dsCad
            TabOrder = 7
            Height = 113
            Width = 489
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
          object cxDBCheckBox1: TcxDBCheckBox
            Left = 592
            Top = 31
            Caption = 'Respons'#225'vel Ativo'
            DataBinding.DataField = 'ativo'
            DataBinding.DataSource = dsCad
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            TabOrder = 9
            Width = 113
          end
        end
        object cxTabSheet2: TcxTabSheet
          Caption = 'Alunos'
          ImageIndex = 1
          object grbxAlunos: TcxGroupBox
            Left = 33
            Top = 55
            TabOrder = 1
            Height = 369
            Width = 474
            object Bevel3: TBevel
              Left = 2
              Top = 5
              Width = 470
              Height = 50
              Align = alTop
              ExplicitLeft = 216
              ExplicitTop = 160
              ExplicitWidth = 50
            end
            object cxGridAlunos: TcxGrid
              Left = 2
              Top = 55
              Width = 470
              Height = 312
              Align = alClient
              TabOrder = 2
              object cxGridAlunosDBTableView1: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                DataController.DataSource = dsAlunos
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.GroupByBox = False
                object cxGridAlunosDBTableView1nome: TcxGridDBColumn
                  Caption = 'Nome'
                  DataBinding.FieldName = 'aluno_id'
                  PropertiesClassName = 'TcxLookupComboBoxProperties'
                  Properties.KeyFieldNames = 'aluno_id'
                  Properties.ListColumns = <
                    item
                      FieldName = 'nome'
                    end>
                  Properties.ListSource = dsAlunosLookup
                  Width = 182
                end
                object cxGridAlunosDBTableView1sobrenome: TcxGridDBColumn
                  Caption = 'Sobrenome'
                  DataBinding.FieldName = 'aluno_id'
                  PropertiesClassName = 'TcxLookupComboBoxProperties'
                  Properties.KeyFieldNames = 'aluno_id'
                  Properties.ListColumns = <
                    item
                      FieldName = 'sobrenome'
                    end>
                  Properties.ListSource = dsAlunosLookup
                  Width = 189
                end
              end
              object cxGridAlunosLevel1: TcxGridLevel
                GridView = cxGridAlunosDBTableView1
              end
            end
            object btnAlunosAdd: TcxButton
              Left = 20
              Top = 17
              Width = 50
              Height = 25
              OptionsImage.ImageIndex = 0
              OptionsImage.Images = imgEnabled
              TabOrder = 0
              OnClick = btnAlunosAddClick
            end
            object btnAlunosExcluir: TcxButton
              Left = 76
              Top = 17
              Width = 50
              Height = 25
              OptionsImage.ImageIndex = 1
              OptionsImage.Images = imgEnabled
              TabOrder = 1
              OnClick = btnAlunosExcluirClick
            end
          end
          object cxLabel1: TcxLabel
            Left = 35
            Top = 32
            Caption = 'Alunos v'#237'nculos ao respons'#225'vel'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clRed
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            Transparent = True
          end
        end
      end
    end
    inherited TaShRelatorio: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 1222
      ExplicitHeight = 455
    end
  end
  inherited smCadPadrao: TsmCadPadrao
    Tabela = 'responsavel'
    FieldsBusca = <
      item
        FieldName = 'responsavel_id'
        DisplayName = 'Responsavel_id'
        ShowCombo = False
        ShowGrid = False
        ShowSelect = True
        FieldType = ftAutoInc
      end
      item
        FieldName = 'nome'
        DisplayName = 'Nome'
        ShowCombo = True
        ShowGrid = True
        ShowSelect = True
        FieldType = ftString
      end
      item
        FieldName = 'sobrenome'
        DisplayName = 'Sobrenome'
        ShowCombo = True
        ShowGrid = True
        ShowSelect = True
        FieldType = ftString
      end
      item
        FieldName = 'sexo'
        DisplayName = 'Sexo'
        ShowCombo = False
        ShowGrid = False
        ShowSelect = False
        FieldType = ftString
      end
      item
        FieldName = 'rg'
        DisplayName = 'RG'
        ShowCombo = True
        ShowGrid = True
        ShowSelect = True
        FieldType = ftString
      end
      item
        FieldName = 'cpf'
        DisplayName = 'CPF'
        ShowCombo = True
        ShowGrid = True
        ShowSelect = True
        FieldType = ftString
      end
      item
        FieldName = 'ativo'
        DisplayName = 'Ativo'
        ShowCombo = False
        ShowGrid = False
        ShowSelect = False
        FieldType = ftString
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
        DisplayName = 'Informacoes_gerais'
        ShowCombo = False
        ShowGrid = False
        ShowSelect = False
        FieldType = ftMemo
      end
      item
        FieldName = 'escola_id'
        DisplayName = 'Escola_id'
        ShowCombo = False
        ShowGrid = False
        ShowSelect = False
        FieldType = ftInteger
      end>
    KeyField = 'responsavel_id'
    Left = 1152
    Top = 280
  end
  inherited AcLi: TActionList
    Left = 1152
    Top = 331
  end
  inherited imgEnabled: TImageList
    Left = 1152
    Top = 384
  end
  inherited imgDisabled: TImageList
    Left = 1152
    Top = 432
  end
  inherited fdqCad: TFDQuery
    AfterOpen = fdqCadAfterOpen
    OnNewRecord = fdqCadNewRecord
    CachedUpdates = True
    Connection = DM.FDConnection
    SchemaAdapter = FDSchemaAdapter
    UpdateOptions.AutoIncFields = 'responsavel_id'
    SQL.Strings = (
      'SELECT * FROM responsavel'#13#10#10
      'where responsavel_id = :responsavel_id')
    Left = 1008
    Top = 280
    ParamData = <
      item
        Name = 'RESPONSAVEL_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqCadresponsavel_id: TFDAutoIncField
      FieldName = 'responsavel_id'
      Origin = 'responsavel_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqCadnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 150
    end
    object fdqCadsobrenome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sobrenome'
      Origin = 'sobrenome'
      Size = 150
    end
    object fdqCadsexo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sexo'
      Origin = 'sexo'
      FixedChar = True
      Size = 1
    end
    object fdqCadrg: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'rg'
      Origin = 'rg'
      Size = 50
    end
    object fdqCadcpf: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'cpf'
      Origin = 'cpf'
    end
    object fdqCadativo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ativo'
      Origin = 'ativo'
      FixedChar = True
      Size = 1
    end
    object fdqCademail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 150
    end
    object fdqCadinformacoes_gerais: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'informacoes_gerais'
      Origin = 'informacoes_gerais'
      BlobType = ftMemo
    end
    object fdqCadescola_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'escola_id'
      Origin = 'escola_id'
    end
    object fdqCadresponsavel_tipo_id: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'responsavel_tipo_id'
      Origin = 'responsavel_tipo_id'
    end
    object fdqCadsenha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'senha'
      Origin = 'senha'
      Size = 150
    end
    object fdqCaddata_atualizacao: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data_atualizacao'
      Origin = 'data_atualizacao'
    end
  end
  inherited dsCad: TDataSource
    Left = 1008
    Top = 336
  end
  inherited dsBusca: TDataSource
    Left = 1072
    Top = 336
  end
  inherited fdqBusca: TFDQuery
    BeforeOpen = fdqBuscaBeforeOpen
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM responsavel'#13#10#10
      ''
      'where responsavel_id = :responsavel_id')
    Left = 1072
    Top = 280
    ParamData = <
      item
        Name = 'RESPONSAVEL_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited FDSchemaAdapter: TFDSchemaAdapter
    Left = 1072
    Top = 392
  end
  object fdqResponsavelTipo: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM responsavel_tipo'
      'order by descricao')
    Left = 934
    Top = 280
  end
  object dsResponsavelTipo: TDataSource
    DataSet = fdqResponsavelTipo
    Left = 934
    Top = 336
  end
  object fdqTelefoneTipo: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'select * from telefone_tipo t'
      'order by t.descricao')
    Left = 776
    Top = 280
  end
  object dsTelefoneTipo: TDataSource
    DataSet = fdqTelefoneTipo
    Left = 776
    Top = 336
  end
  object dsTelefone: TDataSource
    DataSet = fdqTelefone
    Left = 856
    Top = 336
  end
  object fdqTelefone: TFDQuery
    BeforeInsert = fdqTelefoneBeforeInsert
    BeforeEdit = fdqTelefoneBeforeEdit
    CachedUpdates = True
    IndexFieldNames = 'responsavel_id'
    ConstraintsEnabled = True
    MasterSource = dsCad
    MasterFields = 'responsavel_id'
    DetailFields = 'responsavel_id'
    Connection = DM.FDConnection
    SchemaAdapter = FDSchemaAdapter
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    UpdateOptions.AutoIncFields = 'responsavel_telefone_id'
    SQL.Strings = (
      'SELECT * FROM responsavel_telefone t'
      'where t.responsavel_id = :responsavel_id')
    Left = 856
    Top = 280
    ParamData = <
      item
        Name = 'RESPONSAVEL_ID'
        DataType = ftAutoInc
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqAlunos: TFDQuery
    BeforeInsert = fdqAlunosBeforeInsert
    BeforeEdit = fdqAlunosBeforeEdit
    BeforeDelete = fdqAlunosBeforeDelete
    AfterScroll = fdqAlunosAfterScroll
    CachedUpdates = True
    IndexFieldNames = 'responsavel_id'
    MasterSource = dsCad
    MasterFields = 'responsavel_id'
    Connection = DM.FDConnection
    SchemaAdapter = FDSchemaAdapter
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'select * from responsavel_aluno ra'#10' '
      'where responsavel_id = :responsavel_id'#10)
    Left = 616
    Top = 280
    ParamData = <
      item
        Name = 'RESPONSAVEL_ID'
        DataType = ftAutoInc
        ParamType = ptInput
        Value = Null
      end>
    object fdqAlunosresponsavel_id: TIntegerField
      FieldName = 'responsavel_id'
      Origin = 'responsavel_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqAlunosaluno_id: TIntegerField
      FieldName = 'aluno_id'
      Origin = 'aluno_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsAlunos: TDataSource
    DataSet = fdqAlunos
    OnStateChange = dsAlunosStateChange
    Left = 616
    Top = 336
  end
  object fdqAlunosLookup: TFDQuery
    BeforeOpen = fdqAlunosLookupBeforeOpen
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM  aluno '
      'where escola_id = :escola_id ')
    Left = 688
    Top = 280
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsAlunosLookup: TDataSource
    DataSet = fdqAlunosLookup
    Left = 688
    Top = 336
  end
end

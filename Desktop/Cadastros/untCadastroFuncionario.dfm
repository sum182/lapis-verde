inherited frmCadastroFuncionario: TfrmCadastroFuncionario
  Caption = 'Cadastro de Funcion'#225'rio'
  ClientHeight = 671
  ClientWidth = 1223
  OnClose = FormClose
  ExplicitWidth = 1239
  ExplicitHeight = 709
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToBaCadastro: TToolBar
    Width = 1223
    ExplicitWidth = 1223
  end
  inherited PaCoPadrao: TPageControl
    Width = 1223
    Height = 630
    ExplicitWidth = 1223
    ExplicitHeight = 630
    inherited TaShConsulta: TTabSheet
      ExplicitWidth = 1215
      ExplicitHeight = 602
      inherited grbxPesquisa: TGroupBox
        Width = 1215
        ExplicitWidth = 1215
        inherited ToolBar1: TToolBar
          Width = 1205
          ExplicitWidth = 1205
        end
      end
      inherited grPesquisa: TsmDBGrid
        Width = 1215
        Height = 487
        DataSource = dsBusca
        Columns = <
          item
            Expanded = False
            FieldName = 'funcionario_id'
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
            FieldName = 'funcionario_tipo_id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'escola_id'
            Visible = False
          end>
      end
      inherited stbrConsulta: TStatusBar
        Top = 584
        Width = 1215
        ExplicitTop = 584
        ExplicitWidth = 1215
      end
    end
    inherited TaShCadastro: TTabSheet
      ExplicitWidth = 1215
      ExplicitHeight = 602
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
      object Label6: TLabel
        Left = 286
        Top = 166
        Width = 24
        Height = 13
        Caption = 'Sexo'
      end
      object Label7: TLabel
        Left = 32
        Top = 113
        Width = 14
        Height = 13
        Caption = 'RG'
      end
      object Label8: TLabel
        Left = 286
        Top = 113
        Width = 19
        Height = 13
        Caption = 'CPF'
      end
      object Label9: TLabel
        Left = 32
        Top = 323
        Width = 93
        Height = 13
        Caption = 'Informa'#231#245'es Gerais'
      end
      object Label2: TLabel
        Left = 32
        Top = 215
        Width = 24
        Height = 13
        Caption = 'Email'
        FocusControl = cxDBTextEdit1
      end
      object Label5: TLabel
        Left = 32
        Top = 166
        Width = 93
        Height = 13
        Caption = 'Tipo de Funcion'#225'rio'
        FocusControl = cxDBTextEdit2
      end
      object Label10: TLabel
        Left = 32
        Top = 267
        Width = 30
        Height = 13
        Caption = 'Senha'
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
        TabOrder = 2
        Width = 489
      end
      object cxDBImageComboBox1: TcxDBImageComboBox
        Left = 286
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
        Style.ButtonStyle = btsSimple
        Style.ButtonTransparency = ebtAlways
        TabOrder = 6
        Width = 235
      end
      object cxDBMaskEdit1: TcxDBMaskEdit
        Left = 32
        Top = 130
        DataBinding.DataField = 'rg'
        DataBinding.DataSource = dsCad
        Properties.EditMask = '00.000.000-a;0'
        TabOrder = 3
        Width = 235
      end
      object cxDBMaskEdit2: TcxDBMaskEdit
        Left = 286
        Top = 130
        DataBinding.DataField = 'cpf'
        DataBinding.DataSource = dsCad
        Properties.EditMask = '999.999.999-99;0;_'
        TabOrder = 4
        Width = 235
      end
      object cxDBMemo1: TcxDBMemo
        Left = 32
        Top = 342
        DataBinding.DataField = 'informacoes_gerais'
        DataBinding.DataSource = dsCad
        TabOrder = 9
        Height = 113
        Width = 489
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = 592
        Top = 31
        Caption = 'Funcion'#225'rio Ativo'
        DataBinding.DataField = 'ativo'
        DataBinding.DataSource = dsCad
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        TabOrder = 1
        Width = 113
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 32
        Top = 234
        DataBinding.DataField = 'email'
        DataBinding.DataSource = dsCad
        TabOrder = 7
        Width = 489
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 32
        Top = 183
        DataBinding.DataField = 'funcionario_tipo_id'
        DataBinding.DataSource = dsCad
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'funcionario_tipo_id'
        Properties.ListColumns = <
          item
            FieldName = 'descricao'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsFuncionarioTipo
        TabOrder = 5
        Width = 235
      end
      object edtSenha: TcxTextEdit
        Left = 32
        Top = 286
        Properties.EchoMode = eemPassword
        TabOrder = 8
        Text = 'edtSenha'
        Width = 235
      end
    end
    inherited TaShRelatorio: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 1215
      ExplicitHeight = 602
    end
  end
  inherited smCadPadrao: TsmCadPadrao
    Tabela = 'funcionario'
    FieldsBusca = <
      item
        FieldName = 'funcionario_id'
        DisplayName = 'Funcionario_id'
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
        ShowSelect = True
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
        ShowSelect = True
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
        FieldName = 'funcionario_tipo_id'
        DisplayName = 'Funcionario_tipo_id'
        ShowCombo = False
        ShowGrid = False
        ShowSelect = True
        FieldType = ftSmallint
      end
      item
        FieldName = 'escola_id'
        DisplayName = 'Escola_id'
        ShowCombo = False
        ShowGrid = False
        ShowSelect = True
        FieldType = ftInteger
      end>
    KeyField = 'funcionario_id'
    Left = 1000
    Top = 248
  end
  inherited AcLi: TActionList
    Left = 1000
    Top = 299
  end
  inherited imgEnabled: TImageList
    Left = 1000
    Top = 352
  end
  inherited imgDisabled: TImageList
    Left = 1000
    Top = 400
  end
  inherited fdqCad: TFDQuery
    AfterOpen = fdqCadAfterOpen
    BeforePost = fdqCadBeforePost
    OnNewRecord = fdqCadNewRecord
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM funcionario'
      'where funcionario_id = :funcionario_id')
    Left = 864
    ParamData = <
      item
        Name = 'FUNCIONARIO_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqCadfuncionario_id: TFDAutoIncField
      FieldName = 'funcionario_id'
      Origin = 'funcionario_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqCadnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
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
      Required = True
    end
    object fdqCadativo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ativo'
      Origin = 'ativo'
      Required = True
      FixedChar = True
      Size = 1
    end
    object fdqCademail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Required = True
      Size = 150
    end
    object fdqCadinformacoes_gerais: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'informacoes_gerais'
      Origin = 'informacoes_gerais'
      BlobType = ftMemo
    end
    object fdqCadfuncionario_tipo_id: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'funcionario_tipo_id'
      Origin = 'funcionario_tipo_id'
    end
    object fdqCadescola_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'escola_id'
      Origin = 'escola_id'
    end
    object fdqCadsenha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'senha'
      Origin = 'senha'
      Size = 150
    end
  end
  inherited dsCad: TDataSource
    Left = 864
  end
  inherited dsBusca: TDataSource
    Left = 928
  end
  inherited fdqBusca: TFDQuery
    BeforeOpen = fdqBuscaBeforeOpen
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM agenda.funcionario'
      'where funcionario_id = :funcionario_id')
    Left = 928
    ParamData = <
      item
        Name = 'FUNCIONARIO_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited FDSchemaAdapter: TFDSchemaAdapter
    Left = 792
    Top = 352
  end
  object fdqFuncionarioTipo: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM funcionario_tipo'
      'order by descricao')
    Left = 792
    Top = 248
  end
  object dsFuncionarioTipo: TDataSource
    DataSet = fdqFuncionarioTipo
    Left = 792
    Top = 304
  end
end

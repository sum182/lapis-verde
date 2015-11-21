inherited frmCadastroFuncionarioTipo: TfrmCadastroFuncionarioTipo
  Caption = 'Cadastro de Tipos de Funcion'#225'rios'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited PaCoPadrao: TPageControl
    inherited TaShConsulta: TTabSheet
      ExplicitWidth = 108
      inherited grPesquisa: TsmDBGrid
        DataSource = dsBusca
        Columns = <
          item
            Expanded = False
            FieldName = 'funcionario_tipo_id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'informacoes_gerais'
            Visible = False
          end>
      end
    end
    inherited TaShCadastro: TTabSheet
      object Label3: TLabel
        Left = 30
        Top = 32
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = cxDBTextEdit1
      end
      object Label4: TLabel
        Left = 30
        Top = 104
        Width = 93
        Height = 13
        Caption = 'Informa'#231#245'es Gerais'
        FocusControl = cxDBTextEdit1
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 30
        Top = 51
        DataBinding.DataField = 'descricao'
        DataBinding.DataSource = dsCad
        TabOrder = 0
        Width = 512
      end
      object cxDBMemo1: TcxDBMemo
        Left = 30
        Top = 123
        DataBinding.DataField = 'informacoes_gerais'
        DataBinding.DataSource = dsCad
        TabOrder = 1
        Height = 158
        Width = 512
      end
    end
    inherited TaShRelatorio: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  inherited smCadPadrao: TsmCadPadrao
    Tabela = 'funcionario_tipo'
    FieldsBusca = <
      item
        FieldName = 'funcionario_tipo_id'
        DisplayName = 'Funcionario_tipo_id'
        ShowCombo = True
        ShowGrid = True
        ShowSelect = True
        FieldType = ftSmallint
      end
      item
        FieldName = 'descricao'
        DisplayName = 'Descricao'
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
      end>
    KeyField = 'funcionario_tipo_id'
  end
  inherited fdqCad: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM funcionario_tipo'
      'where funcionario_tipo_id = :funcionario_tipo_id')
    ParamData = <
      item
        Name = 'FUNCIONARIO_TIPO_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited fdqBusca: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM funcionario_tipo'
      'where funcionario_tipo_id = :funcionario_tipo_id')
    ParamData = <
      item
        Name = 'FUNCIONARIO_TIPO_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end

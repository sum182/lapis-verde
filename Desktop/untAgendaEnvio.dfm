object frmAgendaEnvio: TfrmAgendaEnvio
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Agenda'
  ClientHeight = 449
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 71
    Align = alClient
    Caption = 'Mensagem'
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 119
    ExplicitWidth = 625
    ExplicitHeight = 249
    Height = 330
    Width = 584
    object Label3: TLabel
      Left = 16
      Top = 73
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = memoDescricao
    end
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 26
      Height = 13
      Caption = 'T'#237'tulo'
      FocusControl = edtTitulo
    end
    object memoDescricao: TcxDBMemo
      Left = 16
      Top = 90
      DataBinding.DataField = 'descricao'
      DataBinding.DataSource = dsAgenda
      Properties.OnChange = memoDescricaoPropertiesChange
      TabOrder = 1
      Height = 225
      Width = 545
    end
    object edtTitulo: TcxDBTextEdit
      Left = 16
      Top = 33
      DataBinding.DataField = 'titulo'
      DataBinding.DataSource = dsAgenda
      Properties.OnChange = edtTituloPropertiesChange
      TabOrder = 0
      Width = 545
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 401
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 400
    ExplicitWidth = 660
    Height = 48
    Width = 584
    object btnEnviar: TcxButton
      Left = 400
      Top = 16
      Width = 78
      Height = 25
      Align = alCustom
      Caption = 'Enviar'
      Default = True
      OptionsImage.ImageIndex = 32
      OptionsImage.Images = DM.ImageList1
      TabOrder = 0
      OnClick = btnEnviarClick
    end
    object btnCancelar: TcxButton
      Left = 491
      Top = 16
      Width = 78
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object lblStatus: TcxLabel
      Left = 16
      Top = 16
      Caption = 'Status de Envio'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'Destino'
    TabOrder = 2
    ExplicitWidth = 595
    Height = 71
    Width = 584
    object cxLabel1: TcxLabel
      Left = 16
      Top = 17
      Caption = 'Tipo de Envio'
    end
    object lblAluno: TcxLabel
      Left = 200
      Top = 18
      Caption = 'Aluno'
    end
    object lblTurma: TcxLabel
      Left = 326
      Top = 17
      Caption = 'Turma'
    end
    object cmbbxAluno: TcxLookupComboBox
      Left = 200
      Top = 36
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'aluno_id'
      Properties.ListColumns = <
        item
          FieldName = 'nome_completo'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsAluno
      TabOrder = 3
      Width = 200
    end
    object cmbbxTurma: TcxLookupComboBox
      Left = 326
      Top = 36
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'turma_id'
      Properties.ListColumns = <
        item
          FieldName = 'nome'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsTurma
      TabOrder = 4
      Width = 200
    end
    object cmbbxTipo: TcxComboBox
      Left = 16
      Top = 36
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'Aluno'
        'Turma')
      Properties.OnChange = cmbbxTipoPropertiesChange
      TabOrder = 5
      Text = 'Aluno'
      Width = 161
    end
  end
  object fdqAgenda: TFDQuery
    BeforeOpen = fdqAgendaBeforeOpen
    OnNewRecord = fdqAgendaNewRecord
    Connection = DM.FDConnection
    SQL.Strings = (
      'select * from agenda'
      'where agenda.agenda_id = :agenda_id'
      'and escola_id = :escola_id')
    Left = 800
    Top = 72
    ParamData = <
      item
        Name = 'AGENDA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ESCOLA_ID'
        ParamType = ptInput
      end>
    object fdqAgendaagenda_id: TFDAutoIncField
      FieldName = 'agenda_id'
      Origin = 'agenda_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqAgendatitulo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'titulo'
      Origin = 'titulo'
      Size = 50
    end
    object fdqAgendadescricao: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      BlobType = ftMemo
    end
    object fdqAgendadata: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data'
      Origin = '`data`'
    end
    object fdqAgendaagenda_tipo_id: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'agenda_tipo_id'
      Origin = 'agenda_tipo_id'
    end
    object fdqAgendafuncionario_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'funcionario_id'
      Origin = 'funcionario_id'
    end
    object fdqAgendaescola_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'escola_id'
      Origin = 'escola_id'
    end
  end
  object dsAgenda: TDataSource
    DataSet = fdqAgenda
    Left = 800
    Top = 128
  end
  object fdqTurma: TFDQuery
    BeforeOpen = fdqTurmaBeforeOpen
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM turma t'#13#10#10
      'where escola_id = :escola_id'
      'order by nome')
    Left = 824
    Top = 216
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqAluno: TFDQuery
    BeforeOpen = fdqAlunoBeforeOpen
    Connection = DM.FDConnection
    SQL.Strings = (
      
        'SELECT a.*, concat(coalesce(a.nome,'#39#39'),'#39' '#39', coalesce(a.sobrenome' +
        ','#39#39')) as nome_completo '
      'FROM aluno a'
      'where 1=1'#10' '#10
      'and escola_id = :escola_id'#10
      'order by nome_completo'#10)
    Left = 768
    Top = 216
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsAluno: TDataSource
    DataSet = fdqAluno
    Left = 768
    Top = 272
  end
  object dsTurma: TDataSource
    DataSet = fdqTurma
    Left = 824
    Top = 272
  end
  object dsTurmaAluno: TDataSource
    DataSet = fdqTurmaAluno
    Left = 896
    Top = 272
  end
  object fdqTurmaAluno: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      #10'select '#10'  ta.*'
      'from turma_aluno ta'#13#10#10
      'where ta.turma_id = :turma_id'
      '')
    Left = 896
    Top = 216
    ParamData = <
      item
        Name = 'TURMA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqAgendaAluno: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM agenda_aluno '
      'where agenda_id = :agenda_id')
    Left = 872
    Top = 72
    ParamData = <
      item
        Name = 'AGENDA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqAgendaAlunoagenda_id: TIntegerField
      FieldName = 'agenda_id'
      Origin = 'agenda_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqAgendaAlunoaluno_id: TIntegerField
      FieldName = 'aluno_id'
      Origin = 'aluno_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsAgendaAluno: TDataSource
    DataSet = fdqAgendaAluno
    Left = 872
    Top = 128
  end
end

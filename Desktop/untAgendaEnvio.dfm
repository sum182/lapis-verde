object frmAgendaEnvio: TfrmAgendaEnvio
  Left = 0
  Top = 0
  Caption = 'Agenda'
  ClientHeight = 472
  ClientWidth = 1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 124
    Align = alCustom
    Caption = 'Mensagem'
    TabOrder = 0
    Height = 249
    Width = 625
    object Label3: TLabel
      Left = 24
      Top = 82
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = cxDBMemo1
    end
    object Label2: TLabel
      Left = 24
      Top = 16
      Width = 26
      Height = 13
      Caption = 'T'#237'tulo'
      FocusControl = cxDBTextEdit1
    end
    object cxDBMemo1: TcxDBMemo
      Left = 24
      Top = 101
      DataBinding.DataField = 'descricao'
      DataBinding.DataSource = dsAgenda
      TabOrder = 1
      Height = 132
      Width = 545
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 24
      Top = 35
      DataBinding.DataField = 'titulo'
      DataBinding.DataSource = dsAgenda
      TabOrder = 0
      Width = 545
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 358
    Align = alCustom
    TabOrder = 1
    Height = 65
    Width = 625
    object cxButton1: TcxButton
      Left = 442
      Top = 21
      Width = 75
      Height = 25
      Align = alCustom
      Caption = 'Enviar'
      Default = True
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 523
      Top = 21
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 8
    Top = 8
    Caption = 'Destino'
    TabOrder = 2
    Height = 105
    Width = 657
    object cxLabel1: TcxLabel
      Left = 40
      Top = 32
      Caption = 'Tipo de Envio'
    end
    object cxComboBox1: TcxComboBox
      Left = 40
      Top = 55
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'Aluno'
        'Turma')
      TabOrder = 1
      Text = 'Aluno'
      Width = 137
    end
    object cxLabel2: TcxLabel
      Left = 224
      Top = 33
      Caption = 'Aluno'
    end
    object cxLabel3: TcxLabel
      Left = 442
      Top = 32
      Caption = 'Turma'
    end
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 442
      Top = 55
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'turma_id'
      Properties.ListColumns = <
        item
          FieldName = 'nome'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsTurma
      TabOrder = 4
      Width = 183
    end
  end
  object DBGrid1: TDBGrid
    Left = 671
    Top = 176
    Width = 320
    Height = 120
    DataSource = dsAluno
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object cxLookupComboBox1: TcxLookupComboBox
    Left = 232
    Top = 64
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'aluno_id'
    Properties.ListColumns = <
      item
        FieldName = 'nome_completo'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsAluno
    TabOrder = 4
    Width = 185
  end
  object DBGrid2: TDBGrid
    Left = 664
    Top = 344
    Width = 320
    Height = 120
    DataSource = dsTurma
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
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
  end
  object dsAgendaAluno: TDataSource
    DataSet = fdqAgendaAluno
    Left = 872
    Top = 128
  end
end

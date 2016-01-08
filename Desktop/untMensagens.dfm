object frmMensagens: TfrmMensagens
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Mensagens'
  ClientHeight = 437
  ClientWidth = 981
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
    ExplicitLeft = 88
    ExplicitTop = 0
    Height = 249
    Width = 981
    object cxListView1: TcxListView
      Left = 16
      Top = 24
      Width = 377
      Height = 219
      Columns = <>
      TabOrder = 0
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 320
    Align = alBottom
    TabOrder = 1
    Height = 117
    Width = 981
    object btnEnviar: TcxButton
      Left = 399
      Top = 80
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
    object memoMensagem: TcxMemo
      Left = 16
      Top = 6
      Lines.Strings = (
        'memoMensagem')
      Properties.OnChange = memoMensagemPropertiesChange
      TabOrder = 1
      Height = 89
      Width = 377
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 584
    Height = 71
    Width = 981
    object cmbbxAluno: TcxLookupComboBox
      Left = 16
      Top = 36
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'aluno_id'
      Properties.ListColumns = <
        item
          FieldName = 'nome_completo'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsAluno
      Properties.OnChange = cmbbxAlunoPropertiesChange
      TabOrder = 0
      Width = 200
    end
    object lblAluno: TcxLabel
      Left = 16
      Top = 18
      Caption = 'Aluno'
    end
  end
  object cxGroupBox4: TcxGroupBox
    Left = 0
    Top = 71
    Align = alClient
    Caption = 'Mensagem'
    TabOrder = 3
    ExplicitLeft = 8
    Height = 249
    Width = 981
    object cxListView2: TcxListView
      Left = 16
      Top = 24
      Width = 377
      Height = 219
      Columns = <>
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 472
      Top = 24
      Width = 473
      Height = 201
      DataSource = dsMsgHistorico
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object fdqAluno: TFDQuery
    BeforeOpen = fdqAlunoBeforeOpen
    Connection = DM.FDConnection
    SQL.Strings = (
      
        'SELECT a.*, concat(coalesce(a.nome,'#39#39'),'#39' '#39', coalesce(a.sobrenome' +
        ','#39#39')) as nome_completo '#10
      'FROM aluno a'#13#10#10
      'left outer join turma_aluno ta on (ta.aluno_id = a.aluno_id)'#13#10#10
      'left outer join turma t on (t.turma_id = ta.turma_id)'#10
      'where 1=1'#13#10#10
      ''
      'and t.funcionario_id = :funcionario_id'
      'and a.escola_id = :escola_id'
      'group by a.aluno_id')
    Left = 809
    Top = 216
    ParamData = <
      item
        Name = 'FUNCIONARIO_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsAluno: TDataSource
    DataSet = fdqAluno
    Left = 809
    Top = 272
  end
  object fdqMensagem: TFDQuery
    Active = True
    BeforeOpen = fdqMensagemBeforeOpen
    OnNewRecord = fdqMensagemNewRecord
    Connection = DM.FDConnection
    SQL.Strings = (
      'select * from mensagem m'
      'where m.mensagem_id = :mensagem_id'
      'and m.escola_id = :escola_id')
    Left = 744
    Top = 216
    ParamData = <
      item
        Name = 'MENSAGEM_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqMensagemmensagem_id: TFDAutoIncField
      FieldName = 'mensagem_id'
      Origin = 'mensagem_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object fdqMensagemmsg: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'msg'
      Origin = 'msg'
      BlobType = ftMemo
    end
    object fdqMensagemdata: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data'
      Origin = '`data`'
    end
    object fdqMensagemmensagem_tipo_id: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'mensagem_tipo_id'
      Origin = 'mensagem_tipo_id'
    end
    object fdqMensagemfuncionario_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'funcionario_id'
      Origin = 'funcionario_id'
    end
    object fdqMensagemaluno_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'aluno_id'
      Origin = 'aluno_id'
    end
    object fdqMensagemescola_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'escola_id'
      Origin = 'escola_id'
    end
    object fdqMensagemresponsavel_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'responsavel_id'
      Origin = 'responsavel_id'
    end
  end
  object dsMensagem: TDataSource
    DataSet = fdqMensagem
    Left = 744
    Top = 272
  end
  object fdqMsgHistorico: TFDQuery
    BeforeOpen = fdqMsgHistoricoBeforeOpen
    Connection = DM.FDConnection
    SQL.Strings = (
      'select m.*,'
      '  r.nome as responsavel_nome, '
      '  r.sobrenome as responsavel_sobrenome, '
      
        '  concat(coalesce(r.nome,'#39#39'),'#39' '#39', coalesce(r.sobrenome,'#39#39')) as r' +
        'esponsavel_nome_completo, '
      ''
      ''
      '  a.nome as aluno_nome, '
      '  a.sobrenome as aluno_sobrenome, '
      
        '  concat(coalesce(a.nome,'#39#39'),'#39' '#39', coalesce(a.sobrenome,'#39#39')) as a' +
        'luno_nome_completo ,'
      '  '
      '  '
      '  f.nome as funcionario_nome, '
      '  f.sobrenome as funcionario_sobrenome, '
      
        '  concat(coalesce(f.nome,'#39#39'),'#39' '#39', coalesce(f.sobrenome,'#39#39')) as f' +
        'uncionario_nome_completo,'
      '  '
      '  ft.descricao as funcionario_tipo'
      '  '
      'from mensagem m'
      
        'left outer join responsavel r on (r.responsavel_id = m.responsav' +
        'el_id)'
      'left outer join aluno a on (a.aluno_id = m.aluno_id)'
      
        'left outer join funcionario f on (f.funcionario_id = m.funcionar' +
        'io_id)'
      
        'left outer join funcionario_tipo ft on (ft.funcionario_tipo_id =' +
        ' f.funcionario_tipo_id)'
      'where 1=1'
      'and m.funcionario_id = :funcionario_id'
      'and m.aluno_id = :aluno_id'
      'and m.escola_id = :escola_id'
      'order by m.data desc')
    Left = 664
    Top = 216
    ParamData = <
      item
        Name = 'FUNCIONARIO_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ALUNO_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'mensagem_id'
      Origin = 'mensagem_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object MemoField1: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'msg'
      Origin = 'msg'
      BlobType = ftMemo
    end
    object DateTimeField1: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data'
      Origin = '`data`'
    end
    object SmallintField1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'mensagem_tipo_id'
      Origin = 'mensagem_tipo_id'
    end
    object IntegerField1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'funcionario_id'
      Origin = 'funcionario_id'
    end
    object IntegerField2: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'aluno_id'
      Origin = 'aluno_id'
    end
    object IntegerField3: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'escola_id'
      Origin = 'escola_id'
    end
    object IntegerField4: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'responsavel_id'
      Origin = 'responsavel_id'
    end
  end
  object dsMsgHistorico: TDataSource
    DataSet = fdqMsgHistorico
    Left = 664
    Top = 272
  end
end

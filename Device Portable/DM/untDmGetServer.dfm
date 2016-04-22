object DmGetServer: TDmGetServer
  OldCreateOrder = False
  Height = 345
  Width = 466
  object fdStanStorageBinLink: TFDStanStorageBinLink
    Left = 194
    Top = 24
  end
  object fdqTabelaAtualizacao: TFDQuery
    IndexFieldNames = 'tabela'
    Connection = Dm.FDConnectionDB
    SQL.Strings = (
      'SELECT * FROM tabela_atualizacao'
      'where ((escola_id = :escola_id) or (escola_id = 0))'
      '')
    Left = 32
    Top = 24
    ParamData = <
      item
        Name = 'ESCOLA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
end

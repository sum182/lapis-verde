object SmTeste: TSmTeste
  OldCreateOrder = False
  Height = 242
  Width = 258
  object fdqAlunos: TFDQuery
    Connection = SmMain.FDConnection
    SQL.Strings = (
      'SELECT * FROM aluno ')
    Left = 48
    Top = 40
  end
end

object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 257
  Width = 355
  object FDConnectionSQLite: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\Agenda\BD\SQLite\db.s3db'
      'DriverID=SQLite'
      'LockingMode=Normal')
    LoginPrompt = False
    Left = 80
    Top = 32
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 80
    Top = 96
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 80
    Top = 152
  end
  object ImageList1: TImageList
    Source = <
      item
        MultiResBitmap.Height = 36
        MultiResBitmap.Width = 36
        MultiResBitmap.LoadSize = 2
        MultiResBitmap = <
          item
            Width = 36
            Height = 36
            PNG = {
              89504E470D0A1A0A0000000D4948445200000024000000240806000000E10098
              98000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              0299494441545847ED985BCB4C5118803F226729498EE5584A0E578A144A39DD
              2A7E08B9502E14914B89C89DFC026E7047E446E416A18808399F3DCFEC9969CF
              9E771FE7D3DC7C4F3DED35CD5E6BAFD9EB7DDFBDD78C8C51C2B8F6B10E33700F
              6EC3B5B81467A27CC027781F6FE015FC88FF85957811BFE0DF8A7EC60BB81C47
              8D29780A7F6274D12AFEC09338190762053EC4E8224D7429976123D6E36B8C06
              1EC45768EC85E405B577E616CE697D2AE60E7AEE1FDC841BB10C7FA8E73D6A7D
              2A612A5659A6F7B813B3EC40BF8BFAA475F92AC594011C0D90359A4C072715F5
              C97A020B31B5AB64D36D2CC373A2BE69CDBE9E201FDF3E76388413926621C64C
              1937DBC72226A2D7EC929E90D5765FD22CC5001E2DF6E3F4A4D93BA1DD6811AC
              82D954C6E6F6B18C69B82B69F6721EA375CED3C0CDC31F17F5C9F32CF67117A3
              93F334B5A34939191FB2519F3CBB49922E8C6F7076D2AC8585B113C02ED386A4
              590B0BE55C1BE909998246FD30F0DA936C64D37EE8A427E4BA0F0BE3B1457A42
              BEE955E1175EC303B805E7A1C554E7E3563C88D7F13756E171FBD84359DAFBA6
              78145BC15711277B1CBF623466C730EDADD2D1C9FA1C57615356E30B8CC6D6BD
              D8872FEFBE03471DB6E3A0E415CB4F68B56E918E2177079793661F6FDBC741B0
              CE455C426F4488BB036B42F65718F00BB0298BF11966C7FD8E6EA30A717790ED
              A84ECA58A8CB3A7C8AD198C7B0149FF80F301AC06C398CDD352FC0578A23F80D
              A3B1EE61AB3A57C1B7387707D1406A4C9D46037521FAC8D145E8AEF60CBEC3A8
              AFBEC425580BB72A45936AAA9359838DF04EB93B88066EA2CB54FBCE6471ABE2
              EE20CABEAA9A4D0670E598A98277CBC78B852CBA68A4E79EC3D2D4EED0E4EF18
              B3C777E0F4DF31B3507C6AFBA0ECFC1D7315738BDE18F51919F907CC979079E4
              A6C55F0000000049454E44AE426082}
            FileName = 
              'C:\Projetos\Agenda\Imagens\ic_account_circle_black_24dp\ic_accou' +
              'nt_circle_black_24dp\android\drawable-hdpi\ic_account_circle_bla' +
              'ck_24dp.png'
          end>
        Name = 'ic_account_circle_black_24dp'
      end
      item
        MultiResBitmap = <
          item
            Scale = 1.500000000000000000
            Width = 24
            Height = 24
            PNG = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              003449444154484B631805C31F30426938F80F04502659801108A04C306082D2
              A30027188D838107A37130F060340E46C1A0070C0C00E9AF100DFFFADF5C0000
              000049454E44AE426082}
            FileName = 
              'C:\Projetos\Agenda\Imagens\ic_view_headline_white_24dp\ic_view_h' +
              'eadline_white_24dp\android\drawable-mdpi\ic_view_headline_white_' +
              '24dp.png'
          end>
        Name = 'ic_view_headline_white_24dp'
      end
      item
        MultiResBitmap.Height = 18
        MultiResBitmap.Width = 18
        MultiResBitmap = <
          item
            Width = 18
            Height = 18
            PNG = {
              89504E470D0A1A0A0000000D494844520000001200000012080600000056CE8E
              57000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              003649444154384F6318050401239466F80F04502649801108C0349807044073
              1AA04C9200D01CB2F4D11E8C861161301A46430F30300000C87C1807033E4F31
              0000000049454E44AE426082}
            FileName = 
              'C:\Projetos\Agenda\Imagens\ic_menu_white_18dp\ic_menu_white_18dp' +
              '\android\drawable-mdpi\ic_menu_white_18dp.png'
          end>
        Name = 'ic_menu_white_18dp'
      end>
    Destination = <
      item
        Layers = <
          item
            Name = 'ic_account_circle_black_24dp'
            SourceRect.Right = 36.000000000000000000
            SourceRect.Bottom = 36.000000000000000000
          end>
      end
      item
        Layers = <
          item
            Name = 'ic_view_headline_white_24dp'
          end>
      end
      item
        Layers = <
          item
            Name = 'ic_menu_white_18dp'
            SourceRect.Right = 18.000000000000000000
            SourceRect.Bottom = 18.000000000000000000
          end>
      end>
    Left = 184
    Top = 152
  end
  object fgActivityDialog: TfgActivityDialog
    Left = 184
    Top = 32
  end
end

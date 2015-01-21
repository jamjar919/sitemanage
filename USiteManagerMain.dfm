object formMain: TformMain
  Left = 0
  Top = 0
  Caption = 'Site Manager'
  ClientHeight = 704
  ClientWidth = 981
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    981
    704)
  PixelsPerInch = 96
  TextHeight = 13
  object coolbarMain: TCoolBar
    Left = 0
    Top = 0
    Width = 981
    Height = 30
    Bands = <
      item
        Control = toolbarMain
        ImageIndex = -1
        Width = 975
      end>
    object toolbarMain: TToolBar
      Left = 11
      Top = 0
      Width = 966
      Height = 25
      Caption = 'Main Toolbar'
      Images = toolbarMainImages
      TabOrder = 0
      object toolbutNewProject: TToolButton
        Left = 0
        Top = 0
        Caption = 'New Project'
        ImageIndex = 0
      end
      object toolbutOpenProject: TToolButton
        Left = 23
        Top = 0
        Caption = 'Open Project'
        ImageIndex = 1
      end
    end
  end
  object pagecontrolMain: TPageControl
    Left = 0
    Top = 24
    Width = 981
    Height = 681
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object tabshInitial: TTabSheet
      Caption = 'Welcome'
    end
    object TabSheet1: TTabSheet
      Caption = 'Project Name'
      ImageIndex = 1
    end
  end
  object toolbarMainImages: TImageList
    Left = 864
    Top = 576
    Bitmap = {
      494C010107001800200010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3F9F40076B67A002E9234000C8711000C8610002B8D2F0073B17600F3F8
      F300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000047EB70002A9D60002A9D60003A8
      D60002A8D6000394C7000394C7000394C7000394C8000394C8000495C7000394
      C8000394C7000481BB00D9ECF5000000000000000000BC6D2800DEA76B00BB78
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001896
      260011A31B000FAA17000FA917000EA716000EA715000DA714000EA914000B9B
      11000C8411000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000680B70011E6FF0011E6FF0010E5
      FF0011E6FF0011E5FF0011E6FF0011E6FF0011E6FF0011E6FF0010E6FF0011E6
      FF0011E6FF000AB3E0003FA3D2000000000000000000EABF8D00FFDBA300C77E
      3C00BC7A4B000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000074BB7D0016AF
      220012AD1C0013AC1C0012AB1B0011AA1A0011AA190010A9180010A9180010AB
      17000EA717006CAC6E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000889BD0000D2FF0000CCFF0000C8
      FF0000C8FF0000C6FF0000C6FF0000C0FD0001A7EB003ADCF80046EBFF0046EB
      FF0047EBFF0047ECFF0031D1F400F3FAFE0000000000D7A37200DE9E5500FDD3
      9100FDCC8000BE7C4D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000032B34B002AC13E001FB4
      2C0015B0220018B1240018B12400000000000000000016AF200016AF200015AE
      1F0014AD1E0014AC1D00168C1D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A8EC10000DEFF0000DBFF0000D8
      FF0000D7FF0000D6FF0000D7FF0000D1FF0000CAFF0000A9EC000099DF000098
      DF000098DF000098DF000098DF006CC4ED000000000000000000D7A47400FDD5
      9A00FDD18C00C77C3700BF7F4F00000000000000000000000000000000000000
      000000000000000000000000000000000000F5FBF60053CE6A0051C95D004DC5
      580040C04C0019B427001BB42900000000000000000019B2260018B1250018B1
      240017B0240017B3230013A41E00F4F9F4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D9ACA0000E4FF0000E4FF0000E4
      FF0000E4FF0000E4FF0000E3FF0000E1FF0000DFFF0000D8FF0000D5FF0000D1
      FF0000D3FF000E9BCA000000000000000000000000000000000000000000DAA8
      7600DD9B5000FCC57200FBC36F00C18251000000000000000000000000000000
      00000000000000000000000000000000000085CF940077DB84006AD1760065D0
      710062CE6E005CCD6A0040C44F0000000000000000001FB82E001EB72E001EB7
      2D001DB62C001DB62B001DB92C0077B77C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000FA1CE0000E4FF0000E4FF0000E4
      FF0000E4FF0000E4FF0000E4FF0000E4FF0000E3FF0000E1FF0000DFFF0000DA
      FF0000DAFF0010A1CF0000000000000000000000000000000000000000000000
      0000DBAA7800FBCB8000FBC26C00BD6D2800C483530000000000000000000000
      00000000000000000000000000000000000051C16A0074D57F0072D67E006CD4
      790069D2760063D171005FCF6D00000000000000000022BB330022BB330021BA
      320021BA310020B9300021BA300033993C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000013AED80000E4FF0000E4FF0000E4
      FF0000E4FF0000E4FF0000E4FF0000E4FF0000E4FF0000E4FF0000E4FF0000E4
      FF0000E2FF0014AED80000000000000000000000000000000000000000000000
      000000000000DFAE7A00DC974900FABC5F00F9B95D00C7885600000000000000
      00000000000000000000000000000000000057CF76007FDB8C007FDD8D000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000027C03B0027C03B001B9C2A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000016B5DC000DE5FF000CE5FF000DE5
      FF000CE6FF000DE5FF000DE6FF000CE5FF000DE6FF000CE6FF000DE5FF000CE5
      FF000CE6FF0016B4DD0000000000000000000000000000000000000000000000
      00000000000000000000E0B07C00F8B95B00F9B85900CB7E3000B76A2E009F45
      0900A6501500DFBCA100000000000000000058D2780085DE930086E094000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002AC33F002AC3400023A738000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001AC1E60032EAFF0033E9FF0032E9
      FF0032E9FF0033E9FF0033E9FF0033E9FF0033E9FF0032EAFF0033E9FF0033E9
      FF0032EAFF0019C1E70000000000000000000000000000000000000000000000
      0000000000000000000000000000E3B48000DB954200F6B14C00F6B04900F5AC
      4300F7BC6600D5822800AD561500000000005AD078009BECAC0092E6A1008CE5
      9D008AE49B0084E2960081E29200000000000000000033CD4D0034CD4E0033CC
      4C0032CB4B0032CB4B0030C948003DAB4E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001BC7EB0049ECFF004AECFF0049EC
      FF0049ECFF004AECFF004AECFF0049ECFF004AECFF0049ECFF004AECFF004AEC
      FF004AECFF001BC8EB0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DA9D5800F6AF4800F6AE4600F4AA
      4000C4702200E6A55700C5701C00000000008CDEA100AAF5BE0097E8A70092E8
      A30090E7A1008BE69C0087E59900000000000000000037D1530036D1520037D0
      520036CF510036CF500037D1510080C78B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001FD2F40078F0FF0079F1FF0078F0
      FF0078F1FF0078F1FF0078F1FF0079F1FF0079F1FF0079F1FF0079F0FF0078F1
      FF0079F1FF001ED3F30000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DF9F4E00F6AC4200EEA43E00F6E8
      D80000000000E5C3A200A54C0F0000000000F4FCF6009CF4B700B4FAC8009FEE
      B1009DEDAF0098ECAA0094EBA700000000000000000089E79D006BE1830039D6
      59003BD65A0040DB600047DC6D00F5FBF6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001FD7F6008EF3FF008DF3FF008DF3
      FF008DF3FF008DF2FF008DF3FF008DF3FF008EF3FF008DF3FF008EF3FF008EF3
      FF008DF3FF0020D8F60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E8AD5D00F5AB3F00D9913E000000
      00000000000000000000E9CCAF00000000000000000060DD8400B6FFCF00A5F0
      B600A3EFB5009EEEB0009AEEAD0000000000000000008DEAA2008EEAA30065E2
      800050DE6D0059EA7F003EC45E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000022E0FD0022E0FD0022E0FC00ABF6
      FF00ABF6FF00ABF6FF0022DFFD0022DFFD0022E0FD0022E0FD0022E0FD0022E0
      FD0022DFFD0022DFFD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBE3BF00F4C58300F0A53A00EECB
      9D0000000000000000000000000000000000000000000000000087E5A100B9FD
      D000BBFDD000AAF4BD00A6F3BA00A0F1B5009FF1B30099F0AF0096EFAC009DF5
      B5009CFBBA007DD08E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000058EA
      FF008EF2FF0058EAFF007DEEFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFB35C00F1BC7400E2A6
      5900EDC7960000000000000000000000000000000000000000000000000060E1
      8600A0F5BC00BCFED100B2FAC700A8F6BE00A6F5BC00A5F7BD00A9FAC1008DF0
      AB004FCD6F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F5FDF80092E9AB0061DF860067E28A0064E087005DD87E008DE0A200F2FB
      F400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BC4D0400BC4D
      0400BB4D0400BB4D0400BB4D0400BB4D0400BC4D0400BB4D0300BB4D0300BC4D
      0400BC4D0400BC4D030000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BC4D0400BC4D
      0400BB4D0400BB4D0400BB4D0400BB4D0400BC4D0400BB4D0300BB4D0300BC4D
      0400BC4D0400BC4D03000000000000000000000000008A3200008A3100008A31
      00008A3100008A3200008A3100008B3100008A3100008A3100008A3200008A31
      00008A3100008A3200008A3100008A3100000000000000000000C0550D00FFFE
      F900FFFCF800FFFEF800FFFEF800FFFCF600FFFCF500FFFCF400FFFCF400FFFB
      F200FFFAF000C0550D000000000000000000057CB30000DCFF0000DBFF0000DB
      FF0000DBFF0000DAFF0001DBFF0002DBFF0004DCFF0008DDFF0009DCFF000DDD
      FF000ECDF3000A92C300B8DFEE00000000000000000000000000C0550D00FFFE
      F900FFFCF800FFFEF800FFFEF800FFFCF600FFFCF500FFFCF400FFFCF400FFFB
      F200FFFAF000C0550D0000000000000000008F370000BD7A0700BE7B0700FFFA
      E800FEFAE800882F0000882F0000FFFAE800FFFAE800FEFAE800FEFAE800FEFA
      E800FFFAE800BF7B0600BE7B06008F3700000000000000000000C35B1300FFFE
      F800FFFEF800FFFCF600FFFCF500FFFCF400FFFCF400FFFBF200FFFBF100FFFB
      EF00FFFBEF00C35B13000000000000000000067FB50000DAFF0000D9FF0000D9
      FF0001D9FF0003DBFF0004DBFF0007DBFF0009DAFF000CDCFF000EDDFF0013DE
      FF0015DEFF000FA6D30088CCE400000000000000000000000000C35B1300FFFE
      F800C35B1300C35B1300C35B1300C35B1300C35B1300C35B1300C35B1300C35B
      1300FFFBEF00C35B13000000000000000000933A0000C07E0B00C07E0B00FFF9
      DF00FFF9DF00882F0000882F0000FFF9DF00FEF9DF00FFF9DF00FFF9DF00FFF9
      DF00FFF8DF00C07F0B00C07E0B00923B00000000000000000000C9682000FFFC
      F400FFFBF300FFFBF200FFFCF100FFFBF000FFFAEF00FFFAEE00FFFAEC00FFF9
      EA00FFF9EA00CA68200000000000000000000A8DC00008E4FF000AE4FF000EE4
      FF0011E5FF0017E5FF001AE6FF0021E6FF0024E7FF002BE7FF002EE8FF0036E9
      FF003AE9FF0030D1EE002DAFD700000000000000000000000000C9682000FFFC
      F400FFFBF300FFFBF200FFFCF100FFFBF000FFFAEF00FFFAEE00FFFAEC00FFF9
      EA00FFF9EA00CA68200000000000000000009A420000C5861500C5851400FFF7
      D100FFF7D100882F0000882F0000FFF7D100FFF7D100FFF7D100FFF7D100FFF7
      D100FFF7D100C5851500C58515009A4200000000000000000000CC6E2400FFFB
      F300FFFBF200FFFBF000FFFAEF00FFFAED00FFFAEC00FFF9EB00FFF9EA00FFF9
      E800FFF7E600CC6E240000000000000000000C94C50010E0FA0013E7FF001AE6
      FF001DE7FF0024E8FF0027E9FF002EE9FF0032E9FF003AEAFF003EEAFF0046EB
      FF0049ECFF004AE4F90012AAD500000000000000000000000000CC6E2400FFFB
      F300CC6E2400CC6E2400CC6E2400CC6E2400CC6E2400CC6E2400CC6E2400CC6E
      2400FFF7E600CC6E240000000000000000009D460000C7891B00C88A1B00FFF7
      D700FEF8D700882F0000882F0000FFF8D700FFF8D600FEF8D600FFF8D600FFF8
      D600FEF7D600C8891B00C88A1A009D4600000000000000000000D37C3300FFFA
      EE00FFFAED00FFFAEB00FFF9EA00FFF9E800FFF9E700FFF7E600FFF7E400FFF6
      E200FFF6E100D37D330000000000000000000FA1CE0018B7DD002AE8FF0032E9
      FF0036EAFF003EEBFF0042EAFF0049EBFF004EECFF0056EDFF005AEDFF0062EE
      FF0066EEFF006DEFFF0032C8E800000000000000000000000000D37C3300FFFA
      EE00FFFAED00FFFAEB00FFF9EA00FFF9E800FFF9E700FFF7E600FFF7E400FFF6
      E200FFF6E100D37D33000000000000000000A64F0000CE922700CE922600FFFA
      E800FEFBE800FEFBE800FEFAE900FEFAE800FEFAE800FEFAE800FFFAE800FFFA
      E800FFFAE800CE912700CE922700A54F00000000000000000000D7843B00FFFA
      EB00FFF9EA00FFF9E800FFF9E800FFF7E500FFF7E500FFF7E200FFF6E100FFF6
      DF00FFF5DE00D7843A00000000000000000012A7D30015A5D00038EAFF0040EB
      FF0044ECFF004CEBFF004FECFF0057EDFF005CEEFF0064EFFF0068EFFF0070F0
      FF0073F0FF007BF1FF004CD7F100000000000000000000000000D7843B00FFFA
      EB00D7843B00D7843B00D7843B00D7843B00D7843B00D7843B00D7843B00D784
      3B00FFF5DE00D7843A000000000000000000AA540000D0962D00D1962D00E0B8
      6D00FEFBF100FEFCF000FEFCF000FEFBF000FEFBF000FEFBF100FEFBF000FEFB
      F100E1BA7200D0952D00D1962D00AA5400000000000000000000DD924900FFF7
      E600FFF7E500FFF6E300FFF6E200FFF5DF00FFF6DE00FFF4DC00FFF4DB00FFF4
      D900FFF2D400DD924900000000000000000016B5DC000B98CA000C95C5000D9A
      C9000E9DCC0010A3D00011A6D20070EEFE0078F0FF007EF2FF0082F2FF008AF2
      FF008DF3FF0093F4FF008FF1FE00F5FDFF000000000000000000DD924900FFF7
      E600FFF7E500FFF6E300FFF6E200FFF5DF00FFF6DE00FFF4DC00FFF4DB00FFF4
      D900FFF2D400DD9249000000000000000000B35D0000D79F3A00D79F3A00D79F
      3A00D79F3A00D79F3A00D79F3A00D79F3A00D79F3A00D79F3A00D79F3A00D79F
      3A00D79F3A00D79F3A00D79F3A00B35D00000000000000000000E0995000FFF6
      E300FFF6E100FFF6E000FFF5DF00FFF5DC00FFF4DB00FFF4D900FFF4D900FFF2
      D600FEECC800E1994E00000000000000000017BBE2000ED6FF000CD6FF000BD3
      FF000AD0FF000AD0FF000BD2FF0036C6E60083F1FF008AF2FF008EF3FF0094F4
      FF0097F4FF009DF4FF009FF5FF00CDF6FD000000000000000000E0995000FFF6
      E300E0995000E0995000E0995000E0995000E0995000E0995000E0995000E099
      5000FEECC800E1994E000000000000000000B8630000DAA34000DAA44100DAA3
      4000DAA44000DAA34100DBA34100DAA44000DAA44100DAA44100DAA44100DAA4
      4100DAA34100DAA34100DAA44100B86200000000000000000000E6A75D00FFF5
      DD00FFF5DC00FFF5DA00FFF4D900FFF4D700FFF2D600FFF1D300FFF1D300FFF0
      D000FEE4B400E6A75D0000000000000000001BC7EB003DE8FF003FE8FF0043EA
      FF0044EBFF0047EBFF0046EBFF0030E3FF001DCFF1009FF5FF00A2F5FF00A6F5
      FF00A9F6FF00ABF6FF00ABF6FF0078EAFC000000000000000000E6A75D00FFF5
      DD00FFF5DC00FFF5DA00FFF4D900FFF4D700FFF2D600FFF1D300FFF1D300FFF0
      D000FEE4B400E6A75D000000000000000000C06C0000E0AC4E00FFFAE300FFF7
      D500FFF8D500FFF7D600FFF8D600FFF7D600FFF7D500FFF8D600FFF8D600FEF8
      D600FEF7D500FFFAE300E0AC4D00C06C00000000000000000000EAAD6500FFF4
      DA00FFF2D900FFF4D600FFF4D500FFF2D400FFF1D300FFF1D100FFF0CF00FFF0
      CD00FDDFA900EAAD650000000000000000001CCDEF0060EEFF0060EFFF0060EF
      FF0061EEFF0061EEFF0062EFFF0051EAFF003EE5FF0054DDF5008EEEFC008FEF
      FD008FF0FD008FF0FE008FF1FE004FE6FD000000000000000000EAAD6500FFF4
      DA00FFF2D900FFF4D600FFF4D500FFF2D400FFF1D300FFF1D100FFF0CF00FFF0
      CD00FDDFA900EAAD65000000000000000000C5700000E3B15300FFF9E100FAE8
      B600FAE8B600FAE8B600FAE8B600FAE8B600FAE8B600FAE8B600FAE8B600FAE8
      B600FAE8B600FFF9E100E3B05400C57100000000000000000000F0B87000FFF1
      D400FFF2D300FFF0D100FFF1D000FFF0CE00FEE9BF00FDDFAB00FDDFAB00FDDF
      AA00FDDFAA00EFB86B0000000000000000001FD7F6008EF3FF008DF3FF008DF3
      FF008DF3FF008DF2FF008DF3FF008BF3FF0082F1FF0061EBFF0058E8FF005AE7
      FF0060E8FF0020D8F60000000000000000000000000000000000F0B87000FFF1
      D400FFF2D300FFF0D100FFF1D000FFF0CE00FEE9BF00FDDFAB00FDDFAB00FDDF
      AA00FDDFAA00EFB86B000000000000000000CD790000E9B96000FEFAE800FAEA
      BE00FAE9BE00FAEABE00F9EABE00FAE9BE00FAE9BE00FAE9BE00FAEABE00F9E9
      BE00FAE9BE00FFFBE800E9B95F00CD7900000000000000000000F1BE7400FFF1
      D100FFF1D100FFF1CE00FFF0CE00FFEFCC00FEE9BF0000000000000000000000
      0000FEFAF600F8DAAE00000000000000000021DCFA009EF5FF009FF4FF009FF4
      FF009EF4FF009FF5FF009EF4FF009FF4FF009DF4FF0084F1FF007AEFFF0082F0
      FF008AF1FF0021DCFA0000000000000000000000000000000000F1BE7400FFF1
      D100FFF1D100FFF1CE00FFF0CE00FFEFCC00FEE9BF0000000000000000000000
      0000FEFAF600F8DAAE000000000000000000D07D0000EBBD6400FEFBEC00FEFA
      E300FEF9E300FFF9E300FFFAE400FEFAE300FEF9E300FFFAE400FFF9E300FFFA
      E400FEF9E300FFFBEC00EBBC6400D07D00000000000000000000F6C67D00FFEF
      CC00FFF0CB00FFEFC900FFEFC900FFEDC600FEE4B3000000000000000000F9D6
      A600FBE1B70000000000000000000000000000000000000000000000000058EA
      FF008EF2FF0058EAFF007DEEFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F6C67D00FFEF
      CC00FFF0CB00FFEFC900FFEFC900FFEDC600FEE4B3000000000000000000F9D6
      A600FBE1B700000000000000000000000000D7840000EFC26D00FEFBF300FEFB
      F100FEFBF100FEFCF100FFFBF100FEFCF100FEFCF200FEFBF200FEFCF100FEFB
      F200FEFCF100FEFBF400F0C36E00D68400000000000000000000F8CA8200FEE7
      BD00FEE7BB00FEE3B100FEE3B100FDDDA500FCD99B0000000000FFFEFE00FCE2
      B7000000000000000000000000000000000000000000000000000000000088F0
      FF0043E8FF0088F0FF00DBFBFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F8CA8200FEE7
      BD00FEE7BB00FEE3B100FEE3B100FDDDA500FCD99B0000000000FFFEFE00FCE2
      B70000000000000000000000000000000000D9870000F2C57100FEFCF600FEFC
      F600FEFCF600FEFCF600FEFCF600FEFCF600FEFCF600FEFCF600FEFCF600FEFC
      F600FEFCF600FEFCF600F2C57100D98700000000000000000000FBCF8700FBCF
      8600FBD08700FBD08600FBD08600FBCF8600FBCF8700FBCF8700FEEACA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FBCF8700FBCF
      8600FBD08700FBD08600FBD08600FBCF8600FBCF8700FBCF8700FEEACA000000
      000000000000000000000000000000000000DE8C0000DE8C0000DE8C0000DE8C
      0000DE8C0000DE8C0000DE8C0000DE8C0000DE8C0000DE8C0000DE8C0000DE8C
      0000DE8C0000DE8C0000DE8C0000DE8C0000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFF00F000000018FFFE0070000
      000187FFC0030000000083FF818100000000C1FF018000000003E0FF01800000
      0003F07F018000000003F83F1FF800000003FC031FF800000003FE0101800000
      0003FF01018000000003FF09018000000003FF1D818100000003FF0FC0030000
      E1FFFF87E0070000FFFFFFFFF00F0000C003FFFFC0038000C0030001C0030000
      C0030001C0030000C0030001C0030000C0030001C0030000C0030001C0030000
      C0030001C0030000C0030000C0030000C0030000C0030000C0030000C0030000
      C0030000C0030000C0030003C0030000C0730003C0730000C067E1FFC0670000
      C04FE1FFC04F0000C01FFFFFC01F000000000000000000000000000000000000
      000000000000}
  end
end

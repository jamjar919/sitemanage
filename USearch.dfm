object formSearch: TformSearch
  Left = 0
  Top = 0
  Caption = 'formSearch'
  ClientHeight = 282
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmSearch
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblSearchFor: TLabel
    Left = 8
    Top = 8
    Width = 52
    Height = 13
    Caption = 'Search For'
  end
  object lblIn: TLabel
    Left = 319
    Top = 8
    Width = 8
    Height = 13
    Caption = 'in'
  end
  object editSearch: TEdit
    Left = 66
    Top = 8
    Width = 247
    Height = 21
    TabOrder = 0
  end
  object butttonSearch: TButton
    Left = 487
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Search'
    TabOrder = 1
    OnClick = butttonSearchClick
  end
  object comboboxData: TComboBox
    Left = 336
    Top = 8
    Width = 129
    Height = 21
    TabOrder = 2
    Text = 'comboboxData'
  end
  object dbgridDisplaySearch: TDBGrid
    Left = 8
    Top = 39
    Width = 554
    Height = 235
    DataSource = datamoduleSearch.datasourceSearch
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object mmSearch: TMainMenu
    Left = 16
    Top = 80
    object mmClose: TMenuItem
      Caption = 'Close'
    end
  end
end
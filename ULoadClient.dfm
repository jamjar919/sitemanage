object formLoadClient: TformLoadClient
  Left = 0
  Top = 0
  Caption = 'Load Client'
  ClientHeight = 37
  ClientWidth = 259
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbcomboClient: TDBLookupComboBox
    Left = 8
    Top = 8
    Width = 153
    Height = 21
    KeyField = 'ClientID'
    ListField = 'CompanyName'
    ListSource = datasourceClient
    TabOrder = 0
  end
  object buttonLoad: TButton
    Left = 176
    Top = 8
    Width = 73
    Height = 21
    Caption = 'Load'
    TabOrder = 1
    OnClick = buttonLoadClick
  end
  object datasetClient: TADODataSet
    Active = True
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 'SELECT * FROM client'
    Parameters = <>
    Left = 40
    Top = 8
  end
  object datasourceClient: TDataSource
    DataSet = datasetClient
    Left = 96
    Top = 8
  end
end

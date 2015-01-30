object formLoadProject: TformLoadProject
  Left = 0
  Top = 0
  Caption = 'Load Project'
  ClientHeight = 38
  ClientWidth = 260
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object loadButton: TButton
    Left = 177
    Top = 8
    Width = 75
    Height = 21
    Caption = 'Load'
    TabOrder = 0
    OnClick = loadButtonClick
  end
  object lookupboxProjectSelect: TDBLookupComboBox
    Left = 8
    Top = 8
    Width = 163
    Height = 21
    KeyField = 'ProjectID'
    ListField = 'ProjectName'
    ListSource = datamoduleMain.datasourceProject
    TabOrder = 1
  end
end

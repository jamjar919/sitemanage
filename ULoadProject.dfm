object formLoadProject: TformLoadProject
  Left = 0
  Top = 0
  Caption = 'Load Project'
  ClientHeight = 37
  ClientWidth = 254
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbcomboProject: TDBLookupComboBox
    Left = 8
    Top = 8
    Width = 145
    Height = 21
    KeyField = 'ProjectName'
    ListField = 'ProjectName'
    ListSource = tadodsourceProjectData
    TabOrder = 0
  end
  object buttonLoadProject: TButton
    Left = 168
    Top = 8
    Width = 75
    Height = 21
    Caption = 'Load'
    TabOrder = 1
    OnClick = buttonLoadProjectClick
  end
  object tadodsetLoadProject: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 'SELECT * FROM project;'
    Parameters = <>
    Left = 8
  end
  object tadodsourceProjectData: TDataSource
    DataSet = tadodsetLoadProject
    Left = 112
    Top = 8
  end
end

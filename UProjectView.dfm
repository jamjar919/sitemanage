object formProjectView: TformProjectView
  Left = 0
  Top = 0
  Caption = 'Project View'
  ClientHeight = 114
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmProjectView
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblProjectName: TLabel
    Left = 16
    Top = 11
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object lblClient: TLabel
    Left = 16
    Top = 40
    Width = 31
    Height = 13
    Caption = 'Client:'
  end
  object editProjectName: TEdit
    Left = 72
    Top = 8
    Width = 289
    Height = 21
    TabOrder = 0
  end
  object buttonCreateProject: TButton
    Left = 286
    Top = 73
    Width = 75
    Height = 25
    Caption = 'Create'
    TabOrder = 1
    OnClick = buttonCreateProjectClick
  end
  object dbcomboClient: TDBLookupComboBox
    Left = 72
    Top = 35
    Width = 289
    Height = 21
    KeyField = 'ClientID'
    ListField = 'CompanyName'
    ListSource = datasourceClient
    TabOrder = 2
  end
  object mmProjectView: TMainMenu
    Left = 312
    object mmClose: TMenuItem
      Caption = 'Close'
      OnClick = mmCloseClick
    end
  end
  object datasourceClient: TDataSource
    DataSet = datasetClient
    Left = 32
    Top = 64
  end
  object datasetClient: TADODataSet
    Active = True
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 'SELECT * FROM client;'
    Parameters = <>
    Left = 120
    Top = 64
  end
  object commandProject: TADOCommand
    CommandText = 
      'INSERT INTO `project` (`ProjectID`, `ClientID`, `ProjectName`) V' +
      'ALUES (NULL, :cid , :name);'
    Connection = datamoduleMain.ADONextnorth
    Parameters = <
      item
        Name = 'cid'
        DataType = ftInteger
        Value = 0
      end
      item
        Name = 'name'
        DataType = ftWideString
        Size = 1
        Value = ' '
      end>
    Left = 216
    Top = 64
  end
end
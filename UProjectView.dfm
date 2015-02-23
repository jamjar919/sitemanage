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
  object buttonUpdateProject: TButton
    Left = 16
    Top = 73
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 0
    OnClick = buttonUpdateProjectClick
  end
  object dbcomboClient: TDBLookupComboBox
    Left = 72
    Top = 35
    Width = 289
    Height = 21
    KeyField = 'ClientID'
    ListField = 'CompanyName'
    ListSource = datasourceClient
    TabOrder = 1
  end
  object buttonDeleteProject: TButton
    Left = 286
    Top = 73
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 2
    OnClick = buttonDeleteProjectClick
  end
  object dbeditProjectName: TDBEdit
    Left = 72
    Top = 8
    Width = 289
    Height = 21
    DataField = 'ProjectName'
    DataSource = datasourceProject
    TabOrder = 3
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
    Left = 184
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
  object datasetProject: TADODataSet
    Active = True
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 'SELECT * FROM project WHERE ProjectID = :pid;'
    Parameters = <
      item
        Name = 'pid'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 208
        Precision = 255
        Size = 255
        Value = 0
      end>
    Left = 120
  end
  object datasourceProject: TDataSource
    DataSet = datasetProject
    Left = 184
  end
end

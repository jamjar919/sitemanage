object formDatabaseView: TformDatabaseView
  Left = 0
  Top = 0
  Caption = 'Database View'
  ClientHeight = 357
  ClientWidth = 383
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmDatabaseView
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object llabelTitle: TLinkLabel
    Left = 8
    Top = 8
    Width = 82
    Height = 29
    Caption = 'example'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object gboxHostingDetails: TGroupBox
    Left = 8
    Top = 215
    Width = 367
    Height = 81
    Caption = 'Hosting Details'
    TabOrder = 1
    object Label1: TLabel
      Left = 14
      Top = 24
      Width = 40
      Height = 13
      Caption = 'Hosting:'
    end
    object Label2: TLabel
      Left = 14
      Top = 50
      Width = 73
      Height = 13
      Caption = 'Host Registrar:'
    end
    object dbcomboHosting: TDBLookupComboBox
      Left = 104
      Top = 19
      Width = 249
      Height = 21
      KeyField = 'HostingID'
      ListField = 'FTPServer'
      ListSource = datasourceHosting
      TabOrder = 0
    end
    object dbcomboHostReg: TDBLookupComboBox
      Left = 104
      Top = 46
      Width = 249
      Height = 21
      KeyField = 'RegistrarID'
      ListField = 'Name'
      ListSource = datasourceHostReg
      TabOrder = 1
    end
  end
  object gboxDatabaseDetails: TGroupBox
    Left = 8
    Top = 43
    Width = 367
    Height = 78
    Caption = 'Database Details'
    TabOrder = 2
    object lblHostname: TLabel
      Left = 12
      Top = 24
      Width = 52
      Height = 13
      Caption = 'Hostname:'
    end
    object lblDatabaseName: TLabel
      Left = 12
      Top = 51
      Width = 31
      Height = 13
      Caption = 'Name:'
    end
    object dbeditHostname: TDBEdit
      Left = 104
      Top = 21
      Width = 249
      Height = 21
      DataField = 'Hostname'
      DataSource = datasourceSingleDatabase
      TabOrder = 0
    end
    object dbeditDatabaseName: TDBEdit
      Left = 104
      Top = 48
      Width = 249
      Height = 21
      DataField = 'Name'
      DataSource = datasourceSingleDatabase
      TabOrder = 1
    end
  end
  object gboxControls: TGroupBox
    Left = 8
    Top = 302
    Width = 363
    Height = 49
    Caption = 'Controls'
    TabOrder = 3
    object buttonUpdate: TButton
      Left = 12
      Top = 17
      Width = 75
      Height = 25
      Hint = 'Update the database with data in the fields.'
      Caption = 'Update'
      CommandLinkHint = 'Update the database with data in the fields'
      ImageAlignment = iaRight
      TabOrder = 0
      OnClick = buttonUpdateClick
    end
    object buttonDelete: TButton
      Left = 278
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Delete'
      TabOrder = 1
      OnClick = buttonDeleteClick
    end
  end
  object gboxClientCredentials: TGroupBox
    Left = 8
    Top = 127
    Width = 365
    Height = 82
    Caption = 'Login Credentials'
    TabOrder = 4
    object lblUsername: TLabel
      Left = 12
      Top = 26
      Width = 52
      Height = 13
      Caption = 'Username:'
    end
    object lblPassword: TLabel
      Left = 14
      Top = 53
      Width = 50
      Height = 13
      Caption = 'Password:'
    end
    object dbeditUsername: TDBEdit
      Left = 104
      Top = 24
      Width = 249
      Height = 21
      DataField = 'Username'
      DataSource = datasourceSingleDatabase
      TabOrder = 0
    end
    object dbeditPassword: TDBEdit
      Left = 104
      Top = 51
      Width = 249
      Height = 21
      DataField = 'Password'
      DataSource = datasourceSingleDatabase
      TabOrder = 1
    end
  end
  object mmDatabaseView: TMainMenu
    Left = 352
    object mmClose: TMenuItem
      Caption = 'Close'
      OnClick = mmCloseClick
    end
  end
  object datasetSingleDatabase: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 'SELECT * FROM `dbase` WHERE `DatabaseID` = :dbid;'
    Parameters = <
      item
        Name = 'dbid'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 40
        Precision = 255
        Size = 255
        Value = 0
      end>
    Left = 136
    Top = 8
  end
  object datasourceSingleDatabase: TDataSource
    DataSet = datasetSingleDatabase
    Left = 256
    Top = 8
  end
  object datasetHosting: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 'SELECT * FROM hosting'
    Parameters = <>
    Left = 184
    Top = 207
  end
  object datasetHostReg: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 'SELECT * FROM hostregistrar;'
    Parameters = <>
    Left = 184
    Top = 271
  end
  object datasourceHosting: TDataSource
    DataSet = datasetHosting
    Left = 272
    Top = 208
  end
  object datasourceHostReg: TDataSource
    DataSet = datasetHostReg
    Left = 272
    Top = 272
  end
end

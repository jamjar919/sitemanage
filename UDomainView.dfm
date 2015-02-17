object formDomainView: TformDomainView
  Left = 0
  Top = 0
  Caption = 'Domain View'
  ClientHeight = 344
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmDomainView
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object llabelTitle: TLinkLabel
    Left = 8
    Top = 8
    Width = 127
    Height = 29
    Caption = 'example.com'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = llabelTitleClick
  end
  object gboxDomainDetails: TGroupBox
    Left = 8
    Top = 43
    Width = 361
    Height = 126
    Caption = 'Domain Details'
    TabOrder = 1
    object labelDomain: TLabel
      Left = 16
      Top = 22
      Width = 39
      Height = 13
      Caption = 'Domain:'
    end
    object labelDot: TLabel
      Left = 255
      Top = 21
      Width = 5
      Height = 19
      Caption = '.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object labelRenewalDate: TLabel
      Left = 16
      Top = 54
      Width = 71
      Height = 13
      Caption = 'Renewal Date:'
    end
    object labelRenewalCost: TLabel
      Left = 16
      Top = 88
      Width = 70
      Height = 13
      Caption = 'Renewal Cost:'
    end
    object dbcomboDomainExtension: TDBComboBox
      Left = 266
      Top = 19
      Width = 71
      Height = 21
      DataField = 'DomainExtension'
      DataSource = datasourceSingleDomain
      Items.Strings = (
        'com'
        'co.uk'
        'net'
        'org'
        'org.uk'
        'me'
        'io')
      TabOrder = 0
    end
    object dbeditDomainName: TDBEdit
      Left = 108
      Top = 19
      Width = 141
      Height = 21
      DataField = 'DomainName'
      DataSource = datasourceSingleDomain
      TabOrder = 1
    end
    object dtpickDomainRenewal: TDateTimePicker
      Left = 108
      Top = 50
      Width = 229
      Height = 21
      Date = 42040.000000000000000000
      Time = 42040.000000000000000000
      DateFormat = dfLong
      TabOrder = 2
    end
    object dbeditRenewalCost: TDBEdit
      Left = 108
      Top = 84
      Width = 121
      Height = 21
      DataField = 'RenewalCost'
      DataSource = datasourceSingleDomain
      TabOrder = 3
    end
  end
  object gboxOtherDetails: TGroupBox
    Left = 8
    Top = 175
    Width = 361
    Height = 98
    Caption = 'Other Details'
    TabOrder = 2
    object labelDomainReg: TLabel
      Left = 16
      Top = 32
      Width = 86
      Height = 13
      Caption = 'Domain Registrar:'
    end
    object labelProject: TLabel
      Left = 17
      Top = 67
      Width = 38
      Height = 13
      Caption = 'Project:'
    end
    object dbcomboDomainReg: TDBLookupComboBox
      Left = 108
      Top = 28
      Width = 145
      Height = 21
      KeyField = 'RegistrarID'
      ListField = 'Name'
      ListSource = datasourceDomainReg
      TabOrder = 0
    end
    object buttonDecrypt: TButton
      Left = 280
      Top = 25
      Width = 75
      Height = 25
      Caption = 'View'
      TabOrder = 1
    end
    object dbcomboProject: TDBLookupComboBox
      Left = 108
      Top = 63
      Width = 145
      Height = 21
      KeyField = 'ProjectID'
      ListField = 'ProjectName'
      ListSource = datasourceProject
      TabOrder = 2
    end
  end
  object gboxControls: TGroupBox
    Left = 8
    Top = 279
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
      Left = 280
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Delete'
      TabOrder = 1
      OnClick = buttonDeleteClick
    end
  end
  object mmDomainView: TMainMenu
    Left = 64
    object mmClose: TMenuItem
      Caption = 'Close'
    end
  end
  object datasetSingleDomain: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 'SELECT * FROM domain WHERE DomainID = :did;'
    Parameters = <
      item
        Name = 'did'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 64
        Precision = 255
        Size = 255
        Value = Null
      end>
    Left = 160
    object datasetSingleDomainDomainID: TAutoIncField
      FieldName = 'DomainID'
      ReadOnly = True
    end
    object datasetSingleDomainDomainName: TStringField
      FieldName = 'DomainName'
      Size = 128
    end
    object datasetSingleDomainDomainExtension: TStringField
      FieldName = 'DomainExtension'
      Size = 16
    end
    object datasetSingleDomainProjectID: TIntegerField
      FieldName = 'ProjectID'
    end
    object datasetSingleDomainDomainRegistrarID: TIntegerField
      FieldName = 'DomainRegistrarID'
    end
    object datasetSingleDomainRenewalDate: TDateField
      FieldName = 'RenewalDate'
    end
    object datasetSingleDomainRenewalCost: TFloatField
      FieldName = 'RenewalCost'
      currency = True
    end
  end
  object datasourceSingleDomain: TDataSource
    DataSet = datasetSingleDomain
    Left = 272
  end
  object datasetSingleDomainReg: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CommandText = 'SELECT * FROM domainregistrar WHERE RegistrarID = :rid;'
    Parameters = <
      item
        Name = 'rid'
        Size = -1
        Value = Null
      end>
    Left = 264
    Top = 120
  end
  object datasourceSingleDomainReg: TDataSource
    DataSet = datasetSingleDomainReg
    Left = 288
    Top = 168
  end
  object datasetDomainReg: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 'SELECT * FROM domainregistrar;'
    Parameters = <>
    Left = 152
    Top = 147
  end
  object datasourceDomainReg: TDataSource
    DataSet = datasetDomainReg
    Left = 48
    Top = 147
  end
  object datasetproject: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 'SELECT * FROM project;'
    Parameters = <>
    Left = 176
    Top = 287
  end
  object datasourceProject: TDataSource
    DataSet = datasetproject
    Left = 112
    Top = 287
  end
end

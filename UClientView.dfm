object formClientView: TformClientView
  Left = 0
  Top = 0
  Caption = 'Client View'
  ClientHeight = 615
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmClientView
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gboxClientDetails: TGroupBox
    Left = 8
    Top = 48
    Width = 365
    Height = 81
    Caption = 'Client Details'
    TabOrder = 0
    object lblName: TLabel
      Left = 16
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Name:'
    end
    object lblCompanyName: TLabel
      Left = 16
      Top = 51
      Width = 79
      Height = 13
      Caption = 'Company Name:'
    end
    object dbeditFirstName: TDBEdit
      Left = 120
      Top = 19
      Width = 106
      Height = 21
      DataField = 'FirstName'
      DataSource = datasourceClient
      TabOrder = 0
    end
    object dbeditCompanyName: TDBEdit
      Left = 120
      Top = 47
      Width = 233
      Height = 21
      DataField = 'CompanyName'
      DataSource = datasourceClient
      TabOrder = 1
    end
    object dbeditLastName: TDBEdit
      Left = 232
      Top = 19
      Width = 121
      Height = 21
      DataField = 'LastName'
      DataSource = datasourceClient
      TabOrder = 2
    end
  end
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
    TabOrder = 1
  end
  object gboxContactDetails: TGroupBox
    Left = 8
    Top = 143
    Width = 365
    Height = 186
    Caption = 'Contact Details'
    TabOrder = 2
    object lblTelephone: TLabel
      Left = 16
      Top = 24
      Width = 54
      Height = 13
      Caption = 'Telephone:'
    end
    object lblAddress: TLabel
      Left = 16
      Top = 57
      Width = 43
      Height = 13
      Caption = 'Address:'
    end
    object lblPostcode: TLabel
      Left = 16
      Top = 112
      Width = 48
      Height = 13
      Caption = 'Postcode:'
    end
    object lblEmail: TLabel
      Left = 16
      Top = 151
      Width = 70
      Height = 13
      Caption = 'Email Address:'
    end
    object dbeditTelephone: TDBEdit
      Left = 120
      Top = 19
      Width = 233
      Height = 21
      DataField = 'Telephone'
      DataSource = datasourceClient
      TabOrder = 0
    end
    object dbricheditAddress: TDBRichEdit
      Left = 120
      Top = 55
      Width = 233
      Height = 47
      DataField = 'Address'
      DataSource = datasourceClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TabOrder = 1
      Zoom = 100
    end
    object dbeditPostcode: TDBEdit
      Left = 120
      Top = 108
      Width = 233
      Height = 21
      DataField = 'Postcode'
      DataSource = datasourceClient
      TabOrder = 2
    end
    object dbeditEmail: TDBEdit
      Left = 120
      Top = 147
      Width = 233
      Height = 21
      DataField = 'Email'
      DataSource = datasourceClient
      TabOrder = 3
    end
  end
  object gboxSocialMedia: TGroupBox
    Left = 8
    Top = 344
    Width = 365
    Height = 89
    Caption = 'Social Media '
    TabOrder = 3
    object lblFacebook: TLabel
      Left = 16
      Top = 24
      Width = 50
      Height = 13
      Caption = 'Facebook:'
    end
    object lblTwitter: TLabel
      Left = 16
      Top = 56
      Width = 38
      Height = 13
      Caption = 'Twitter:'
    end
    object lblFacebookURL: TLabel
      Left = 120
      Top = 24
      Width = 71
      Height = 13
      Caption = 'facebook.com/'
    end
    object lblAt: TLabel
      Left = 181
      Top = 56
      Width = 10
      Height = 13
      Caption = '@'
    end
    object dbeditFacebook: TDBEdit
      Left = 197
      Top = 21
      Width = 156
      Height = 21
      DataField = 'FacebookPage'
      DataSource = datasourceClient
      TabOrder = 0
    end
    object dbeditTwitter: TDBEdit
      Left = 197
      Top = 52
      Width = 156
      Height = 21
      DataField = 'TwitterPage'
      DataSource = datasourceClient
      TabOrder = 1
    end
  end
  object gboxMisc: TGroupBox
    Left = 8
    Top = 448
    Width = 365
    Height = 105
    Caption = 'Miscellaneous'
    TabOrder = 4
    object lblNotes: TLabel
      Left = 16
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Notes:'
    end
    object dbricheditNotes: TDBRichEdit
      Left = 129
      Top = 16
      Width = 224
      Height = 79
      DataField = 'Notes'
      DataSource = datasourceClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TabOrder = 0
      Zoom = 100
    end
  end
  object gboxControls: TGroupBox
    Left = 8
    Top = 559
    Width = 365
    Height = 49
    Caption = 'Controls'
    TabOrder = 5
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
  object mmClientView: TMainMenu
    Left = 112
    Top = 8
    object mmClose: TMenuItem
      Caption = 'Close'
      OnClick = mmCloseClick
    end
  end
  object datasetSingleClient: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 'SELECT * FROM client WHERE ClientID = :clid'
    Parameters = <
      item
        Name = 'clid'
        DataType = ftInteger
        Size = -1
        Value = 0
      end>
    Left = 200
    Top = 8
  end
  object datasourceClient: TDataSource
    DataSet = datasetSingleClient
    Left = 296
    Top = 8
  end
end

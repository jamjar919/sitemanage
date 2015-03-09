object datamoduleSearch: TdatamoduleSearch
  OldCreateOrder = False
  Height = 147
  Width = 832
  object datasourceSearch: TDataSource
    DataSet = datasetSearchClient
    Left = 328
    Top = 88
  end
  object datasetSearchProject: TADODataSet
    Active = True
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 
      'SELECT project.ProjectID, project.ProjectName, client.CompanyNam' +
      'e'#13#10'FROM  `project` '#13#10'LEFT JOIN client ON project.ClientID = clie' +
      'nt.ClientID'#13#10'WHERE project.ProjectName LIKE  '#39':search'#39#13#10'OR clien' +
      't.CompanyName LIKE  '#39':search'#39#13#10
    Parameters = <>
    Left = 48
    Top = 24
    object datasetSearchProjectProjectID: TAutoIncField
      FieldName = 'ProjectID'
      ReadOnly = True
    end
    object datasetSearchProjectProjectName: TStringField
      FieldName = 'ProjectName'
      Size = 64
    end
    object datasetSearchProjectCompanyName: TStringField
      FieldName = 'CompanyName'
      Size = 32
    end
  end
  object datasetSearchDomain: TADODataSet
    Active = True
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 
      'SELECT domain.DomainID, domain.DomainName, domain.DomainExtensio' +
      'n, domain.RenewalDate, domain.RenewalCost, project.ProjectName, ' +
      'domainregistrar.Name FROM domain'#13#10'LEFT JOIN project '#13#10'ON project' +
      '.projectID = domain.ProjectID '#13#10'LEFT JOIN domainregistrar '#13#10'ON d' +
      'omain.DomainRegistrarID = domainregistrar.RegistrarID'#13#10'WHERE'#13#10'do' +
      'main.DomainName LIKE '#39':search'#39' OR domain.DomainExtension LIKE '#39':' +
      'search'#39' OR domain.RenewalDate LIKE '#39':search'#39' OR project.ProjectN' +
      'ame LIKE '#39':search'#39' OR domainregistrar.Name LIKE '#39':search'#39';'
    Parameters = <
      item
        Name = ':search'
        DataType = ftWideString
        Size = 1
        Value = ' '
      end>
    Left = 160
    Top = 24
    object datasetSearchDomainDomainID: TAutoIncField
      FieldName = 'DomainID'
      ReadOnly = True
    end
    object datasetSearchDomainDomainName: TStringField
      FieldName = 'DomainName'
      Size = 128
    end
    object datasetSearchDomainDomainExtension: TStringField
      FieldName = 'DomainExtension'
      Size = 16
    end
    object datasetSearchDomainRenewalDate: TDateField
      FieldName = 'RenewalDate'
    end
    object datasetSearchDomainRenewalCost: TFloatField
      FieldName = 'RenewalCost'
    end
    object datasetSearchDomainProjectName: TStringField
      FieldName = 'ProjectName'
      Size = 64
    end
    object datasetSearchDomainName: TStringField
      FieldName = 'Name'
      Size = 64
    end
  end
  object datasetSearchHosting: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 
      'SELECT hosting.FTPServer, hosting.FTPPort, hosting.RenewalDate, ' +
      'hosting.RenewalCost, project.ProjectName, domain.DomainName, dom' +
      'ain.DomainExtension, hostregistrar.Name FROM hosting '#13#10'LEFT JOIN' +
      ' project ON hosting.ProjectID = project.ProjectID'#13#10'LEFT JOIN dom' +
      'ain ON hosting.DomainID = domain.DomainID'#13#10'LEFT JOIN hostregistr' +
      'ar on hosting.HostRegistrarID = hostregistrar.RegistrarID'#13#10'WHERE' +
      #13#10'hosting.FTPServer LIKE '#39':search'#39' OR hosting.RenewalDate LIKE '#39 +
      ':search'#39' OR hosting.RenewalCost LIKE '#39':search'#39' OR project.Projec' +
      'tName LIKE '#39':search'#39' OR domain.DomainName LIKE '#39':search'#39' or doma' +
      'in.DomainExtension LIKE '#39':search'#39' or hostregistrar.Name LIKE '#39':s' +
      'earch'#39';'
    Parameters = <>
    Left = 272
    Top = 24
    object datasetSearchHostingFTPServer: TStringField
      FieldName = 'FTPServer'
      Size = 128
    end
    object datasetSearchHostingFTPPort: TIntegerField
      FieldName = 'FTPPort'
    end
    object datasetSearchHostingRenewalDate: TDateField
      FieldName = 'RenewalDate'
    end
    object datasetSearchHostingRenewalCost: TFloatField
      FieldName = 'RenewalCost'
    end
    object datasetSearchHostingProjectName: TStringField
      FieldName = 'ProjectName'
      Size = 64
    end
    object datasetSearchHostingDomainName: TStringField
      FieldName = 'DomainName'
      Size = 128
    end
    object datasetSearchHostingDomainExtension: TStringField
      FieldName = 'DomainExtension'
      Size = 16
    end
    object datasetSearchHostingName: TStringField
      FieldName = 'Name'
      Size = 64
    end
  end
  object datasetSearchCMS: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CommandText = 
      'SELECT cms.CMSID, cms.Directory, cms.TablePrefix, cms.ThemeName,' +
      ' hosting.FTPServer, dbase.Name, cmstype.Name'#13#10'FROM cms'#13#10'LEFT JOI' +
      'N cmstype ON cmstype.CMSTypeID = cms.CMSTypeID'#13#10'LEFT JOIN hostin' +
      'g ON hosting.HostingID = cms.HostingID'#13#10'LEFT JOIN dbase ON dbase' +
      '.DatabaseID = cms.DatabaseID'#13#10'WHERE cms.Directory LIKE  '#39':search' +
      #39#13#10'OR cms.TablePrefix LIKE  '#39':search'#39#13#10'OR cms.ThemeName LIKE  '#39':' +
      'search'#39#13#10'OR cmstype.Name LIKE  '#39':search'#39#13#10'OR hosting.FTPServer L' +
      'IKE  '#39':search'#39#13#10'OR dbase.Name LIKE  '#39':search'#39
    Parameters = <>
    Left = 376
    Top = 24
  end
  object datasetSearchDatabase: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CommandText = 
      'SELECT dbase.Name, dbase.Hostname, hosting.Hostname, hostregistr' +
      'ar.Name FROM dbase'#13#10'LEFT JOIN hosting ON hosting.HostingID = dba' +
      'se.HostingID'#13#10'LEFT JOIN hostregistrar ON dbase.HostRegistrarID =' +
      ' hostregistrar.RegistrarID'#13#10'WHERE dbase.Name LIKE :search OR dba' +
      'se.Hostname LIKE :search OR hosting.Hostname LIKE :search OR  ho' +
      'stregistrar.Name LIKE :search'
    Parameters = <
      item
        Name = 'search'
        DataType = ftWideString
        Size = 1
        Value = ' '
      end>
    Left = 488
    Top = 24
  end
  object datasetSearchClient: TADODataSet
    Parameters = <>
    Left = 600
    Top = 24
  end
  object datasetSearchTask: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    Parameters = <>
    Left = 696
    Top = 24
  end
end

object datamoduleSearch: TdatamoduleSearch
  OldCreateOrder = False
  Height = 147
  Width = 832
  object datasourceSearch: TDataSource
    Left = 328
    Top = 88
  end
  object datasetSearchProject: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 
      'SELECT project.ProjectID, project.ProjectName, client.CompanyNam' +
      'e'#13#10'FROM  `project` '#13#10'LEFT JOIN client ON project.ClientID = clie' +
      'nt.ClientID'#13#10'WHERE project.ProjectName LIKE  :search'#13#10'OR client.' +
      'CompanyName LIKE  :search'#13#10'OR :search = '#39#39';'#13#10#13#10
    Parameters = <
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 168
        Precision = 255
        Size = 255
        Value = ' '
      end
      item
        Name = 'search'
        DataType = ftWideString
        Size = 1
        Value = ' '
      end
      item
        Name = 'search'
        DataType = ftWideString
        Size = 1
        Value = ' '
      end>
    Left = 48
    Top = 24
    object datasetSearchProjectProjectID: TAutoIncField
      DisplayLabel = 'Project ID'
      FieldName = 'ProjectID'
      ReadOnly = True
    end
    object datasetSearchProjectProjectName: TStringField
      DisplayLabel = 'Project Name'
      DisplayWidth = 32
      FieldName = 'ProjectName'
      Size = 64
    end
    object datasetSearchProjectCompanyName: TStringField
      DisplayLabel = 'Company Name'
      FieldName = 'CompanyName'
      Size = 32
    end
  end
  object datasetSearchCMS: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 
      'SELECT cms.CMSID, cms.Directory, cms.TablePrefix, cms.ThemeName,' +
      ' hosting.FTPServer, dbase.Name, cmstype.Name'#13#10'FROM cms'#13#10'LEFT JOI' +
      'N cmstype ON cmstype.CMSTypeID = cms.CMSTypeID'#13#10'LEFT JOIN hostin' +
      'g ON hosting.HostingID = cms.HostingID'#13#10'LEFT JOIN dbase ON dbase' +
      '.DatabaseID = cms.DatabaseID'#13#10'WHERE cms.Directory LIKE  :search'#13 +
      #10'OR cms.TablePrefix LIKE  :search'#13#10'OR cms.ThemeName LIKE  :searc' +
      'h'#13#10'OR cmstype.Name LIKE  :search'#13#10'OR hosting.FTPServer LIKE  :se' +
      'arch'#13#10'OR dbase.Name LIKE  :search'#13#10'OR :search = '#39#39';'
    Parameters = <
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end>
    Left = 376
    Top = 24
    object datasetSearchCMSCMSID: TAutoIncField
      DisplayLabel = 'CMS ID'
      DisplayWidth = 3
      FieldName = 'CMSID'
      ReadOnly = True
    end
    object datasetSearchCMSDirectory: TStringField
      DisplayWidth = 16
      FieldName = 'Directory'
      Size = 64
    end
    object datasetSearchCMSTablePrefix: TStringField
      DisplayLabel = 'Table Prefix'
      DisplayWidth = 10
      FieldName = 'TablePrefix'
      Size = 16
    end
    object datasetSearchCMSThemeName: TStringField
      DisplayLabel = 'Theme Name'
      DisplayWidth = 16
      FieldName = 'ThemeName'
      Size = 64
    end
    object datasetSearchCMSFTPServer: TStringField
      DisplayLabel = 'FTP Server'
      DisplayWidth = 35
      FieldName = 'FTPServer'
      Size = 128
    end
    object datasetSearchCMSName: TStringField
      DisplayLabel = 'Database Name'
      DisplayWidth = 25
      FieldName = 'Name'
      Size = 128
    end
    object datasetSearchCMSName_1: TStringField
      DisplayLabel = 'CMS Type'
      DisplayWidth = 20
      FieldName = 'Name_1'
      Size = 64
    end
  end
  object datasetSearchClient: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 
      'SELECT client.ClientID, client.FirstName, client.LastName, clien' +
      't.CompanyName, client.Telephone, client.Email FROM client '#13#10'WHER' +
      'E client.ClientID LIKE :search '#13#10'OR client.FirstName LIKE :searc' +
      'h'#13#10'OR client.LastName LIKE :search'#13#10'OR client.CompanyName LIKE :' +
      'search'#13#10'OR client.Telephone LIKE :search'#13#10'OR client.Email LIKE :' +
      'search '#13#10'OR client.TwitterPage LIKE :search'#13#10'OR client.FacebookP' +
      'age LIKE :search'#13#10'OR client.Notes LIKE :search'#13#10'OR :search = '#39#39';'
    Parameters = <
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 80
        Precision = 255
        Size = 255
        Value = ' '
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 80
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 80
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 80
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 80
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 80
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 80
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 80
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 80
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 80
        Precision = 255
        Size = 255
        Value = Null
      end>
    Left = 600
    Top = 24
    object datasetSearchClientClientID: TAutoIncField
      DisplayLabel = 'Client ID'
      DisplayWidth = 4
      FieldName = 'ClientID'
      ReadOnly = True
    end
    object datasetSearchClientFirstName: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 16
      FieldName = 'FirstName'
      Size = 32
    end
    object datasetSearchClientLastName: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 16
      FieldName = 'LastName'
      Size = 32
    end
    object datasetSearchClientCompanyName: TStringField
      DisplayLabel = 'Company Name'
      DisplayWidth = 20
      FieldName = 'CompanyName'
      Size = 32
    end
    object datasetSearchClientTelephone: TStringField
      FieldName = 'Telephone'
      Size = 16
    end
    object datasetSearchClientEmail: TStringField
      DisplayWidth = 16
      FieldName = 'Email'
      Size = 32
    end
  end
  object datasetSearchTask: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 
      'SELECT task.TaskID, project.ProjectName, task.TaskDescription, t' +
      'ask.MinutesWorked, task.RatePerHour, task.Completed from task'#13#10'L' +
      'EFT JOIN project ON project.ProjectID = task.ProjectID'#13#10'WHERE ta' +
      'sk.TaskID LIKE :search'#13#10'OR project.ProjectName LIKE :search'#13#10'OR ' +
      'task.TaskDescription LIKE :search'#13#10'OR task.MinutesWorked LIKE :s' +
      'earch'#13#10'OR task.RatePerHour LIKE :search'#13#10'OR task.Completed LIKE ' +
      ':search'#13#10'OR :search = '#39#39';'
    Parameters = <
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 160
        Precision = 255
        Size = 255
        Value = ' '
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 160
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 160
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 160
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 160
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 160
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 160
        Precision = 255
        Size = 255
        Value = Null
      end>
    Left = 696
    Top = 24
    object datasetSearchTaskTaskID: TAutoIncField
      DisplayLabel = 'Task ID'
      DisplayWidth = 6
      FieldName = 'TaskID'
      ReadOnly = True
    end
    object datasetSearchTaskProjectName: TStringField
      DisplayLabel = 'Project Name'
      DisplayWidth = 30
      FieldName = 'ProjectName'
      Size = 64
    end
    object datasetSearchTaskTaskDescription: TStringField
      DisplayLabel = 'Task Description'
      DisplayWidth = 64
      FieldName = 'TaskDescription'
      Size = 128
    end
    object datasetSearchTaskMinutesWorked: TIntegerField
      DisplayLabel = 'Minutes Worked'
      DisplayWidth = 6
      FieldName = 'MinutesWorked'
    end
    object datasetSearchTaskRatePerHour: TFloatField
      DisplayLabel = 'Rate Per Hour'
      DisplayWidth = 6
      FieldName = 'RatePerHour'
      currency = True
    end
    object datasetSearchTaskCompleted: TIntegerField
      FieldName = 'Completed'
    end
  end
  object datasetSearchHosting: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 
      'SELECT hosting.HostingID, hosting.FTPServer, hosting.FTPPort, ho' +
      'sting.RenewalDate, hosting.RenewalCost, project.ProjectName, dom' +
      'ain.DomainName, domain.DomainExtension, hostregistrar.Name FROM ' +
      'hosting'#13#10'LEFT JOIN project ON hosting.ProjectID = project.Projec' +
      'tID'#13#10'LEFT JOIN domain ON hosting.DomainID = domain.DomainID'#13#10'LEF' +
      'T JOIN hostregistrar on hosting.HostRegistrarID = hostregistrar.' +
      'RegistrarID'#13#10'WHERE hosting.FTPServer LIKE :search OR hosting.Ren' +
      'ewalDate LIKE :search OR hosting.RenewalCost LIKE :search OR pro' +
      'ject.ProjectName LIKE :search OR domain.DomainName LIKE :search ' +
      'or domain.DomainExtension LIKE :search or hostregistrar.Name LIK' +
      'E :search'#13#10'OR :search = '#39#39'; '#13#10
    Parameters = <
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 128
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 128
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 128
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 128
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 128
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 128
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 128
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 128
        Precision = 255
        Size = 255
        Value = Null
      end>
    Left = 272
    Top = 24
    object datasetSearchHostingHostingID: TAutoIncField
      DisplayLabel = 'Hosting ID'
      DisplayWidth = 4
      FieldName = 'HostingID'
      ReadOnly = True
    end
    object datasetSearchHostingFTPServer: TStringField
      DisplayLabel = 'FTP Server'
      DisplayWidth = 35
      FieldName = 'FTPServer'
      Size = 128
    end
    object datasetSearchHostingFTPPort: TIntegerField
      DisplayLabel = 'FTP Port'
      DisplayWidth = 4
      FieldName = 'FTPPort'
    end
    object datasetSearchHostingRenewalDate: TDateField
      DisplayLabel = 'Renewal Date'
      FieldName = 'RenewalDate'
    end
    object datasetSearchHostingRenewalCost: TFloatField
      DisplayLabel = 'Renewal Cost'
      FieldName = 'RenewalCost'
      currency = True
    end
    object datasetSearchHostingProjectName: TStringField
      DisplayLabel = 'Project Name'
      DisplayWidth = 16
      FieldName = 'ProjectName'
      Size = 64
    end
    object datasetSearchHostingDomainName: TStringField
      DisplayLabel = 'Domain Name'
      DisplayWidth = 16
      FieldName = 'DomainName'
      Size = 128
    end
    object datasetSearchHostingDomainExtension: TStringField
      DisplayLabel = 'Domain Extension'
      DisplayWidth = 6
      FieldName = 'DomainExtension'
      Size = 16
    end
    object datasetSearchHostingName: TStringField
      DisplayLabel = 'Host Registrar'
      DisplayWidth = 16
      FieldName = 'Name'
      Size = 64
    end
  end
  object datasetSearchDomain: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 
      'SELECT domain.DomainID, domain.DomainName, domain.DomainExtensio' +
      'n, domain.RenewalDate, domain.RenewalCost, project.ProjectName, ' +
      'domainregistrar.Name FROM domain'#13#10'LEFT JOIN project ON project.p' +
      'rojectID = domain.ProjectID '#13#10'LEFT JOIN domainregistrar ON domai' +
      'n.DomainRegistrarID = domainregistrar.RegistrarID'#13#10'WHERE domain.' +
      'DomainName LIKE :search OR domain.DomainExtension LIKE :search O' +
      'R domain.RenewalDate LIKE :search OR project.ProjectName LIKE :s' +
      'earch OR domainregistrar.Name LIKE :search'#13#10'OR :search = '#39#39';'
    Parameters = <
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = ' '
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'search'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end>
    Left = 160
    Top = 24
    object datasetSearchDomainDomainID: TAutoIncField
      DisplayLabel = 'Domain ID'
      DisplayWidth = 3
      FieldName = 'DomainID'
      ReadOnly = True
    end
    object datasetSearchDomainDomainName: TStringField
      DisplayLabel = 'Domain Name'
      DisplayWidth = 16
      FieldName = 'DomainName'
      Size = 128
    end
    object datasetSearchDomainDomainExtension: TStringField
      DisplayLabel = 'Domain Extension'
      DisplayWidth = 6
      FieldName = 'DomainExtension'
      Size = 16
    end
    object datasetSearchDomainRenewalDate: TDateField
      DisplayLabel = 'Renewal Date'
      FieldName = 'RenewalDate'
    end
    object datasetSearchDomainRenewalCost: TFloatField
      DisplayLabel = 'Renewal Cost'
      FieldName = 'RenewalCost'
      currency = True
    end
    object datasetSearchDomainProjectName: TStringField
      DisplayLabel = 'Project Name'
      DisplayWidth = 16
      FieldName = 'ProjectName'
      Size = 64
    end
    object datasetSearchDomainName: TStringField
      DisplayLabel = 'Domain Registrar'
      DisplayWidth = 16
      FieldName = 'Name'
      Size = 64
    end
  end
  object datasetSearchDatabase: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 
      'SELECT dbase.DatabaseID, dbase.Name, dbase.Hostname, hosting.FTP' +
      'Server, hostregistrar.Name FROM dbase'#13#10'LEFT JOIN hosting ON host' +
      'ing.HostingID = dbase.HostingID'#13#10'LEFT JOIN hostregistrar ON dbas' +
      'e.HostRegistrarID = hostregistrar.RegistrarID'#13#10'WHERE dbase.Name ' +
      'LIKE :search OR dbase.Hostname LIKE :search OR hosting.FTPServer' +
      ' LIKE :search OR  hostregistrar.Name LIKE :search'#13#10'OR :search = ' +
      #39#39';'
    Parameters = <
      item
        Name = 'search'
        DataType = ftWideString
        Size = 1
        Value = ' '
      end
      item
        Name = 'search'
        DataType = ftWideString
        Size = 1
        Value = ' '
      end
      item
        Name = 'search'
        DataType = ftWideString
        Size = 1
        Value = ' '
      end
      item
        Name = 'search'
        DataType = ftWideString
        Size = 1
        Value = ' '
      end
      item
        Name = 'search'
        DataType = ftWideString
        Size = 1
        Value = ' '
      end>
    Left = 488
    Top = 24
    object datasetSearchDatabaseDatabaseID: TAutoIncField
      DisplayLabel = 'Database ID'
      DisplayWidth = 4
      FieldName = 'DatabaseID'
      ReadOnly = True
    end
    object datasetSearchDatabaseName: TStringField
      DisplayLabel = 'Database Name'
      DisplayWidth = 30
      FieldName = 'Name'
      Size = 128
    end
    object datasetSearchDatabaseHostname: TStringField
      DisplayLabel = 'Database Hostname'
      DisplayWidth = 32
      FieldName = 'Hostname'
      Size = 128
    end
    object datasetSearchDatabaseFTPServer: TStringField
      DisplayLabel = 'Hosting FTP Server'
      DisplayWidth = 32
      FieldName = 'FTPServer'
      Size = 128
    end
    object datasetSearchDatabaseName_1: TStringField
      DisplayLabel = 'Database Host Registrar'
      DisplayWidth = 32
      FieldName = 'Name_1'
      Size = 64
    end
  end
end

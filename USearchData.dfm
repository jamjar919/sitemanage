object datamoduleSearch: TdatamoduleSearch
  OldCreateOrder = False
  Height = 147
  Width = 832
  object datasourceSearch: TDataSource
    Left = 328
    Top = 88
  end
  object datasetSearchProject: TADODataSet
    Parameters = <>
    Left = 48
    Top = 24
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
  end
  object datasetSearchHosting: TADODataSet
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
  end
  object datasetSearchCMS: TADODataSet
    Parameters = <>
    Left = 376
    Top = 24
  end
  object datasetSearchDatabase: TADODataSet
    Parameters = <>
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

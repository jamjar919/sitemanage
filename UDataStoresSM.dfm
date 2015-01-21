object datamoduleMain: TdatamoduleMain
  OldCreateOrder = False
  Height = 187
  Width = 215
  object connectionMain: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=james;Dat' +
      'a Source=nextnorth'
    DefaultDatabase = 'north'
    LoginPrompt = False
    Left = 24
    Top = 8
  end
  object datasetProjects: TADODataSet
    Active = True
    Connection = connectionMain
    CursorType = ctStatic
    CommandText = 'SELECT * FROM project;'
    Parameters = <>
    Left = 24
    Top = 56
  end
  object datasourceProjects: TDataSource
    DataSet = datasetProjects
    Left = 24
    Top = 110
  end
end

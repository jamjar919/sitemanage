object datamoduleMain: TdatamoduleMain
  OldCreateOrder = False
  Height = 374
  Width = 400
  object ADOCmain: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=nextn' +
      'orth'
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object datasetProject: TADODataSet
    Active = True
    Connection = ADOCmain
    CursorType = ctStatic
    CommandText = 'select * from project'
    Parameters = <>
    Left = 112
    Top = 16
  end
  object datasourceProject: TDataSource
    DataSet = datasetProject
    Left = 208
    Top = 16
  end
  object datasetDomain: TADODataSet
    Active = True
    Connection = ADOCmain
    CursorType = ctStatic
    CommandText = 'select *  from domain;'
    Parameters = <>
    Left = 112
    Top = 72
  end
  object datasourceDomain: TDataSource
    DataSet = datasetDomain
    Left = 208
    Top = 72
  end
  object datasetHosting: TADODataSet
    Connection = ADOCmain
    CursorType = ctStatic
    CommandText = 'select * from hosting;'
    Parameters = <>
    Left = 112
    Top = 128
  end
  object datasourceHosting: TDataSource
    DataSet = datasetDomain
    Left = 208
    Top = 128
  end
end

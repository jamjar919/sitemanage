object datamoduleMain: TdatamoduleMain
  OldCreateOrder = False
  Height = 374
  Width = 400
  object ADOCmain: TADOConnection
    Connected = True
    ConnectionString = 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=nndb'
    Left = 24
    Top = 16
  end
  object datasetProject: TADODataSet
    Active = True
    Connection = ADOCmain
    CursorType = ctStatic
    CommandText = 'select * from project'
    Parameters = <>
    Left = 120
    Top = 16
  end
  object datasourceProject: TDataSource
    DataSet = datasetProject
    Left = 208
    Top = 16
  end
end

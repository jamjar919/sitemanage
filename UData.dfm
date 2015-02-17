object datamoduleMain: TdatamoduleMain
  OldCreateOrder = False
  Height = 64
  Width = 239
  object ADONextnorth: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=james;Dat' +
      'a Source=nextnorth;'
    DefaultDatabase = 'north'
    LoginPrompt = False
    Left = 32
    Top = 8
  end
  object datasetDelete: TADODataSet
    Connection = ADONextnorth
    CursorType = ctStatic
    Parameters = <>
    Left = 120
    Top = 8
  end
end

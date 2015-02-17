object datamoduleMain: TdatamoduleMain
  OldCreateOrder = False
  Height = 64
  Width = 304
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
  object commandDelete: TADOCommand
    CommandText = 'DELETE FROM domain WHERE DomainID = :did'
    Connection = ADONextnorth
    Parameters = <
      item
        Name = 'did'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 232
        Precision = 255
        Size = 255
        Value = Null
      end>
    Left = 216
    Top = 8
  end
end

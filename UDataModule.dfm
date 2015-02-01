object datamoduleMain: TdatamoduleMain
  OldCreateOrder = False
  Height = 374
  Width = 741
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
    Connection = ADOCmain
    CursorType = ctStatic
    CommandText = 'select * from project'
    Parameters = <>
    Left = 112
    Top = 16
  end
  object datasourceProject: TDataSource
    DataSet = datasetProject
    Left = 232
    Top = 16
  end
  object datasetDomain: TADODataSet
    Connection = ADOCmain
    CursorType = ctStatic
    CommandText = 'select *  from domain;'
    Parameters = <>
    Left = 112
    Top = 72
  end
  object datasourceDomain: TDataSource
    DataSet = datasetDomain
    Left = 232
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
    Left = 232
    Top = 128
  end
  object datasetSingleDomain: TADODataSet
    Active = True
    Connection = ADOCmain
    CursorType = ctStatic
    CommandText = 'SELECT *  FROM domain WHERE DomainID = :did;'
    Parameters = <
      item
        Name = 'did'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 88
        Precision = 255
        Size = 255
        Value = Null
      end>
    Left = 384
    Top = 72
  end
  object dataSourceSingleDomain: TDataSource
    DataSet = datasetSingleDomain
    Left = 528
    Top = 72
  end
  object datasetSingleProject: TADODataSet
    Active = True
    Connection = ADOCmain
    CursorType = ctStatic
    CommandText = 'SELECT * FROM project WHERE ProjectID = :pid;'
    Parameters = <
      item
        Name = 'pid'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 208
        Precision = 255
        Size = 255
        Value = Null
      end>
    Left = 384
    Top = 16
  end
  object datasourceSingleProject: TDataSource
    DataSet = datasetSingleProject
    Left = 528
    Top = 16
  end
  object datasetDomainReg: TADODataSet
    Connection = ADOCmain
    CursorType = ctStatic
    CommandText = 'SELECT * FROM domainregistrar;'
    Parameters = <>
    Left = 112
    Top = 184
  end
  object datasetSingleDomainReg: TADODataSet
    Active = True
    Connection = ADOCmain
    CursorType = ctStatic
    CommandText = 'SELECT *  FROM domainregistrar WHERE RegistrarID = :rid;'
    Parameters = <
      item
        Name = 'rid'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 232
        Precision = 255
        Size = 255
        Value = Null
      end>
    Left = 384
    Top = 184
  end
  object datasourceDomainReg: TDataSource
    DataSet = datasetDomainReg
    Left = 232
    Top = 184
  end
  object datasourceSingleDomainReg: TDataSource
    DataSet = datasetSingleDomainReg
    Left = 528
    Top = 184
  end
end

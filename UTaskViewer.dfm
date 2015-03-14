object formTaskViewer: TformTaskViewer
  Left = 0
  Top = 0
  Caption = 'Task Viewer'
  ClientHeight = 312
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblMinWorked: TLabel
    Left = 8
    Top = 258
    Width = 81
    Height = 13
    Caption = 'Minutes Worked:'
  end
  object lblRatePerHour: TLabel
    Left = 8
    Top = 285
    Width = 72
    Height = 13
    Caption = 'Rate Per Hour:'
  end
  object lblTitle: TLabel
    Left = 238
    Top = 8
    Width = 96
    Height = 16
    Caption = 'Unfinished Tasks'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dbricheditTaskDescription: TDBRichEdit
    Left = 8
    Top = 8
    Width = 224
    Height = 241
    DataField = 'TaskDescription'
    DataSource = datasourceTask
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    TabOrder = 0
    Zoom = 100
  end
  object dbeditMinutesWorked: TDBEdit
    Left = 95
    Top = 255
    Width = 137
    Height = 21
    DataField = 'MinutesWorked'
    DataSource = datasourceTask
    TabOrder = 1
  end
  object dbeditRatePerHour: TDBEdit
    Left = 95
    Top = 282
    Width = 137
    Height = 21
    DataField = 'RatePerHour'
    DataSource = datasourceTask
    TabOrder = 2
  end
  object buttonNextTask: TButton
    Left = 240
    Top = 62
    Width = 98
    Height = 25
    Caption = 'Next '
    TabOrder = 3
    OnClick = buttonNextTaskClick
  end
  object buttonPreviousTask: TButton
    Left = 240
    Top = 93
    Width = 98
    Height = 25
    Caption = 'Previous'
    TabOrder = 4
    OnClick = buttonPreviousTaskClick
  end
  object buttonSwitchFin: TButton
    Left = 240
    Top = 124
    Width = 98
    Height = 27
    Caption = 'Completed Tasks'
    TabOrder = 5
    OnClick = buttonSwitchFinClick
  end
  object buttonComplete: TButton
    Left = 240
    Top = 157
    Width = 98
    Height = 25
    Caption = 'Mark as Complete'
    TabOrder = 6
    OnClick = buttonCompleteClick
  end
  object buttonUpdateDetails: TButton
    Left = 240
    Top = 31
    Width = 98
    Height = 25
    Caption = 'Update Details'
    TabOrder = 7
    OnClick = buttonUpdateDetailsClick
  end
  object buttonDelete: TButton
    Left = 240
    Top = 188
    Width = 98
    Height = 25
    Caption = 'Delete '
    TabOrder = 8
    OnClick = buttonDeleteClick
  end
  object datasetTask: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 'SELECT * FROM task WHERE ProjectID = :pid AND Completed = :comp'
    Parameters = <
      item
        Name = 'pid'
        DataType = ftInteger
        Size = -1
        Value = 0
      end
      item
        Name = 'comp'
        DataType = ftInteger
        Size = -1
        Value = 0
      end>
    Left = 272
    Top = 216
    object datasetTaskTaskID: TAutoIncField
      FieldName = 'TaskID'
      ReadOnly = True
    end
    object datasetTaskProjectID: TIntegerField
      FieldName = 'ProjectID'
    end
    object datasetTaskTaskDescription: TStringField
      FieldName = 'TaskDescription'
      Size = 256
    end
    object datasetTaskMinutesWorked: TIntegerField
      FieldName = 'MinutesWorked'
    end
    object datasetTaskRatePerHour: TFloatField
      FieldName = 'RatePerHour'
      currency = True
    end
    object datasetTaskCompleted: TIntegerField
      FieldName = 'Completed'
    end
    object datasetTaskDateCompleted: TDateField
      FieldName = 'DateCompleted'
    end
  end
  object datasourceTask: TDataSource
    DataSet = datasetTask
    Left = 272
    Top = 264
  end
  object datasetLookupProject: TADODataSet
    Connection = datamoduleMain.ADONextnorth
    CursorType = ctStatic
    CommandText = 'SELECT ProjectID, Completed FROM task WHERE TaskID = :tid'
    Parameters = <
      item
        Name = 'tid'
        DataType = ftInteger
        Size = 1
        Value = 0
      end>
    Left = 208
    Top = 216
    object datasetLookupProjectProjectID: TIntegerField
      FieldName = 'ProjectID'
    end
    object datasetLookupProjectCompleted: TIntegerField
      FieldName = 'Completed'
    end
  end
end

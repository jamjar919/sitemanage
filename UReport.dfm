object formReportGenerator: TformReportGenerator
  Left = 0
  Top = 0
  Caption = 'Report Generator'
  ClientHeight = 234
  ClientWidth = 252
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gboxProjectReportGen: TGroupBox
    Left = 8
    Top = 8
    Width = 236
    Height = 89
    Caption = 'Project Report'
    TabOrder = 0
    object dbcomboProject: TDBLookupComboBox
      Left = 16
      Top = 24
      Width = 209
      Height = 21
      TabOrder = 0
    end
    object buttonGenerateProjectReport: TButton
      Left = 150
      Top = 51
      Width = 75
      Height = 25
      Caption = 'Generate'
      TabOrder = 1
    end
  end
end

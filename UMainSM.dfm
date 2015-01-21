object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'Site Manager'
  ClientHeight = 787
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  GlassFrame.Enabled = True
  Menu = menuMain
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    984
    787)
  PixelsPerInch = 96
  TextHeight = 13
  object panelSidebar: TPanel
    Left = 680
    Top = 35
    Width = 312
    Height = 724
    Alignment = taRightJustify
    Anchors = [akTop, akRight, akBottom]
    BevelEdges = [beLeft]
    BevelKind = bkFlat
    TabOrder = 0
  end
  object panelFooter: TPanel
    Left = 0
    Top = 757
    Width = 985
    Height = 34
    Anchors = [akLeft, akRight, akBottom]
    BevelEdges = [beTop]
    BevelKind = bkFlat
    TabOrder = 1
    object labelConnectionStatus: TLabel
      Left = 12
      Top = 6
      Width = 88
      Height = 13
      Caption = 'Connection Status'
    end
  end
  object pagecontrolMain: TPageControl
    Left = 0
    Top = 35
    Width = 681
    Height = 724
    ActivePage = tabProjectSelect
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object tabWelcome: TTabSheet
      Caption = 'Start Page'
    end
    object tabProjectSelect: TTabSheet
      Caption = 'Project Select'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 191
        Top = 131
        Width = 320
        Height = 120
        DataSource = datamoduleMain.datasourceProjects
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 3
        Top = 3
        Width = 145
        Height = 21
        KeyField = 'ProjectName'
        ListField = 'ProjectName'
        ListSource = datamoduleMain.datasourceProjects
        TabOrder = 1
      end
    end
  end
  object toolbarMain: TToolBar
    Left = 0
    Top = 0
    Width = 984
    Height = 29
    Caption = 'toolbarMain'
    TabOrder = 3
    object openProject: TToolButton
      Left = 0
      Top = 0
      Caption = 'openProject'
      ImageIndex = 0
      OnClick = openProjectClick
    end
  end
  object menuMain: TMainMenu
    Left = 72
    Top = 712
    object menuSites: TMenuItem
      Caption = 'Sites'
    end
    object menuTools: TMenuItem
      Caption = 'Tools'
    end
  end
  object popupSiteTree: TPopupMenu
    Left = 16
    Top = 712
    object popupSiteRefresh: TMenuItem
      Caption = 'Refresh'
    end
    object popupAddNew: TMenuItem
      Caption = 'Add New'
    end
  end
end

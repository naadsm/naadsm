object FormMain: TFormMain
  Left = 272
  Top = 167
  Width = 617
  Height = 479
  Hint = 'Open a file to start a new session'
  Caption = 'NAADSM 3.1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object ActionMainMenuBar1: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 609
    Height = 27
    UseSystemFont = False
    ActionManager = ActionManager1
    Caption = 'ActionMainMenuBar1'
    ColorMap.HighlightColor = 14410210
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 14410210
    EdgeInner = esNone
    EdgeOuter = esRaised
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentShowHint = False
    PersistentHotKeys = True
    ShowHint = False
    Spacing = 0
  end
  object pnlRunStatus: TPanel
    Left = 0
    Top = 417
    Width = 609
    Height = 35
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
    object pnlProgressBars: TPanel
      Left = 223
      Top = 1
      Width = 324
      Height = 33
      Align = alRight
      TabOrder = 0
      object pbrIterations: TProgressBar
        Left = 1
        Top = 1
        Width = 322
        Height = 15
        Align = alClient
        TabOrder = 0
      end
      object pbrIterationDays: TProgressBar
        Left = 1
        Top = 16
        Width = 322
        Height = 16
        Align = alBottom
        TabOrder = 1
        Visible = False
      end
    end
    object pnlCounters: TPanel
      Left = 75
      Top = 1
      Width = 148
      Height = 33
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object lblIterationCounter: TLabel
        Left = 0
        Top = 0
        Width = 148
        Height = 13
        Align = alTop
        Caption = 'lblIterationCounter'
        Layout = tlBottom
      end
      object lblDayCounter: TLabel
        Left = 0
        Top = 13
        Width = 148
        Height = 20
        Align = alClient
        Caption = 'lblDayCounter'
      end
    end
    object pnlStop: TPanel
      Left = 547
      Top = 1
      Width = 61
      Height = 33
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object btnStopSim: TSpeedButton
        Left = 0
        Top = 0
        Width = 62
        Height = 36
        Caption = 'Stop'
        Glyph.Data = {
          26050000424D260500000000000036040000280000000E0000000F0000000100
          080000000000F000000000000000000000000001000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000C0DCC000F0CA
          A600000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
          0707070707070707000007070707070000000007070707070000070707000000
          000000000007070700000707000000F9F9F9F90000000707000007070000F9F9
          F9F9F9F9000007077C00070000F9F9F9F9F9F9F9F90000070110070000F9F9F9
          F9F9F9F9F9000007E28D070000F9F9F9F9F9F9F9F9000007F400070000FFF9F9
          F9F9F9F9F90000070400070000FFFFF9F9F9F9F9F9000007030007070000FFFF
          F9F9F9F90000070791020707000000FFFFF9F900000007074E08070707000000
          000000000007070701000707070707000000000707070707FFFF070707070707
          07070707070707070000}
        OnClick = btnStopSimClick
      end
    end
    object pnlRunMessage: TPanel
      Left = 1
      Top = 1
      Width = 74
      Height = 33
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 7
      TabOrder = 3
      object lblRunMessage: TLabel
        Left = 24
        Top = 7
        Width = 43
        Height = 19
        Align = alRight
        Caption = 'Message'
        Layout = tlCenter
      end
    end
  end
  object btnTest: TButton
    Left = 428
    Top = 55
    Width = 77
    Height = 26
    Caption = 'btnTest'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BtnTestClick
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items.Customizable = False
        Items.HideUnused = False
        Items = <
          item
            Items.HideUnused = False
            Items = <
              item
                Items = <
                  item
                    Action = acnEmptyScenario
                    ShortCut = 16462
                  end
                  item
                    Action = acnSampleScenario
                  end>
                Action = ActionNew
                ImageIndex = 61
              end
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionOpen
                ImageIndex = 4
                ShortCut = 16463
              end
              item
                Items.HideUnused = False
                Items = <>
                Caption = '-'
              end
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionImport
                ImageIndex = 47
              end
              item
                Action = ActionExport
                ImageIndex = 48
              end
              item
                Items.HideUnused = False
                Items = <>
                Caption = '-'
              end
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionSave
                ImageIndex = 62
                ShortCut = 16467
              end
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionSaveAs
                Caption = 'S&ave As...'
                ImageIndex = 63
              end
              item
                Items.HideUnused = False
                Items = <>
                Caption = '-'
              end
              item
                Action = ActionClose
              end
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionExit
                ImageIndex = 3
                ShortCut = 16465
              end>
            Caption = '&File'
            ImageIndex = 4
            ShortCut = 16454
          end
          item
            Items.HideUnused = False
            Items = <
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionGeneralParams
                ImageIndex = 44
              end
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionProdType
                ImageIndex = 8
              end
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionHerdListEditor
                ImageIndex = 50
              end
              item
                Items = <
                  item
                    Action = ActionDiseaseOptions
                  end
                  item
                    Action = ActionDisease
                  end>
                Action = ActionDiseaseMenu
                ImageIndex = 12
              end
              item
                Items = <
                  item
                    Action = ActionSpreadOptions
                  end
                  item
                    Action = ActionProdTypePairs
                  end
                  item
                    Action = ActionContactSpread
                  end
                  item
                    Action = ActionAirborneSpread
                  end>
                Action = ActionSpreadMenu
                ImageIndex = 57
              end
              item
                Items = <
                  item
                    Action = ActionYesNoDetection
                  end
                  item
                    Action = ActionDetection
                  end>
                Action = ActionDetectionMenu
                ImageIndex = 56
              end
              item
                Items = <
                  item
                    Action = ActionTracingOptions
                  end
                  item
                    Action = ActionTracing
                  end>
                Action = ActionTracingMenu
                ImageIndex = 67
              end
              item
                Items = <
                  item
                    Action = ActionZonesOptions
                    Caption = '&Zone options'
                  end
                  item
                    Action = ActionZonesDefinition
                    Caption = '&Create/modify zones'
                  end
                  item
                    Action = ActionZones
                    Caption = '&Production type settings for zones'
                  end>
                Action = ActionZonesMenu
                Caption = '&Zones'
                ImageIndex = 70
              end
              item
                Items = <
                  item
                    Action = ActionDestrGlobal
                  end
                  item
                    Action = ActionDestrPriority
                  end
                  item
                    Action = ActionDestruction
                  end>
                Action = ActionDestructionMenu
                ImageIndex = 9
              end
              item
                Items = <
                  item
                    Action = ActionVaccGlobal
                  end
                  item
                    Action = ActionVaccPriority
                  end
                  item
                    Action = ActionVaccination
                  end>
                Action = ActionVaccinationMenu
                ImageIndex = 7
              end
              item
                Items = <
                  item
                    Action = ActionCostOptions
                  end
                  item
                    Action = ActionCostsZones
                  end
                  item
                    Action = ActionCostsDestr
                  end
                  item
                    Action = ActionCostsVacc
                  end>
                Action = ActionCostMenu
                ImageIndex = 16
              end
              item
                Caption = '-'
              end
              item
                Action = ActionOutputOptions
                Caption = '&Output options'
                ImageIndex = 51
              end
              item
                Items = <
                  item
                    Action = ActionCustomOutputOptions
                    Caption = '&Custom output options'
                  end
                  item
                    Action = ActionCustomOutputDefinitions
                    Caption = '&Define custom outputs'
                  end>
                Action = ActionCustomOutputMenu
                Caption = 'C&ustom outputs'
                ImageIndex = 24
              end
              item
                Caption = '-'
              end
              item
                Action = ActionVerifyScenario
                ImageIndex = 66
              end
              item
                Caption = '-'
              end
              item
                Action = ActionClearOutput
                Caption = 'C&lear scenario output'
                ImageIndex = 68
              end>
            Caption = '&Scenario parameters'
            ImageIndex = 18
            ShortCut = 16453
          end
          item
            Items.HideUnused = False
            Items = <
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionRunUntilDay
                Caption = '&Start and run until specified day...'
                ImageIndex = 17
              end
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionRunUntilDetection
                Caption = 'St&art and run until first detection(s)'
                ImageIndex = 17
              end
              item
                Action = ActionRunUntilDiseaseEnd
                Caption = 'Start a&nd run to the end of active disease phase(s)'
                ImageIndex = 17
              end
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionRunUntilOutbreakEnd
                Caption = 'Sta&rt and run until end of outbreak(s)'
                ImageIndex = 17
              end
              item
                Caption = '-'
              end
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionStop
                ImageIndex = 59
              end>
            Caption = '&Run'
            ImageIndex = 17
          end
          item
            ChangesAllowed = []
            ContextItems.Customizable = False
            ContextItems = <>
            Items.Customizable = False
            Items.HideUnused = False
            Items = <
              item
                Caption = '-'
              end
              item
                ChangesAllowed = []
                Items.HideUnused = False
                Items = <>
                Action = ActionMap
                ImageIndex = 28
              end
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionOutChart
                ImageIndex = 26
              end
              item
                Action = ActionOutZoneChart
                ImageIndex = 71
              end
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionSummary
                ImageIndex = 27
              end
              item
                Caption = '-'
              end
              item
                Action = ActionEvents
                ImageIndex = 33
              end
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionExposures
                Caption = 'C&ontact-exposure events by day'
                ImageIndex = 52
              end
              item
                Items.HideUnused = False
                Items = <>
                Caption = '-'
              end
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionOutputStats
                Caption = 'O&utput statistics'
                ImageIndex = 30
                ShortCut = 16474
              end
              item
                Action = ActionEpiCurve
                Caption = 'Summa&ry epidemic curves'
                ImageIndex = 36
              end
              item
                Caption = '-'
              end
              item
                Action = ActionCompareStats
                ImageIndex = 69
              end
              item
                Caption = '-'
              end
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionCascade
                ImageIndex = 32
                ShortCut = 119
              end
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionArrange
                ImageIndex = 31
                ShortCut = 120
              end
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionCloseWindows
                ImageIndex = 60
                ShortCut = 121
              end>
            Caption = '&Output windows'
            ImageIndex = 19
            ShortCut = 16463
          end
          item
            Items = <
              item
                Action = acnLanguageSettings
                ImageIndex = 11
              end>
            Caption = '&Tools'
            ImageIndex = 64
          end
          item
            Items.HideUnused = False
            Items = <
              item
                Items.HideUnused = False
                Items = <>
                Action = ActionAbout
                ImageIndex = 1
              end
              item
                Action = ActionWebsite
                ImageIndex = 11
              end>
            Caption = '&Help'
            ImageIndex = 0
            ShortCut = 112
          end>
        ActionBar = ActionMainMenuBar1
      end>
    Images = ImageList1
    Left = 368
    Top = 40
    StyleName = 'XP Style'
    object ActionExit: TAction
      Category = 'File actions'
      Caption = 'E&xit'
      ImageIndex = 3
      ShortCut = 16465
      OnExecute = ActionExitExecute
    end
    object ActionGeneralParams: TAction
      Tag = 1
      Category = 'Parameters'
      Caption = '&Start setup'
      ImageIndex = 44
      OnExecute = ActionScenarioParamExecute
    end
    object ActionProdType: TAction
      Tag = 4
      Category = 'Parameters'
      Caption = '&Production type(s)'
      ImageIndex = 8
      OnExecute = ActionScenarioParamExecute
    end
    object ActionHerdListEditor: TAction
      Tag = 3
      Category = 'Parameters'
      Caption = 'S&et up starting units'
      ImageIndex = 50
      OnExecute = ActionScenarioParamExecute
    end
    object ActionAbout: TAction
      Category = 'Help'
      Caption = '&About NAADSM...'
      ImageIndex = 1
      OnExecute = ActionAboutExecute
    end
    object ActionOpen: TAction
      Category = 'File actions'
      Caption = '&Open scenario file...'
      ImageIndex = 4
      ShortCut = 16463
      OnExecute = ActionOpenExecute
    end
    object ActionDiseaseMenu: TAction
      Category = 'Parameters'
      Caption = '&Disease'
      ImageIndex = 12
      OnExecute = ActionScenarioParamExecute
    end
    object ActionDiseaseOptions: TAction
      Category = 'Parameters'
      Caption = '&Disease options'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionDisease: TAction
      Tag = 6
      Category = 'Parameters'
      Caption = '&Production type settings for disease'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionSpreadMenu: TAction
      Category = 'Parameters'
      Caption = 'Disease Sp&read'
      ImageIndex = 57
      OnExecute = ActionScenarioParamExecute
    end
    object ActionSpreadOptions: TAction
      Category = 'Parameters'
      Caption = '&Spread options'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionProdTypePairs: TAction
      Tag = 5
      Category = 'Parameters'
      Caption = '&Production type combinations'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionContactSpread: TAction
      Category = 'Parameters'
      Caption = '&Contact spread'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionAirborneSpread: TAction
      Category = 'Parameters'
      Caption = '&Airborne Spread'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionDetectionMenu: TAction
      Category = 'Parameters'
      Caption = 'Detect&ion'
      ImageIndex = 56
      OnExecute = ActionScenarioParamExecute
    end
    object ActionYesNoDetection: TAction
      Tag = 18
      Category = 'Parameters'
      Caption = '&Detection options'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionDetection: TAction
      Category = 'Parameters'
      Caption = '&Production type settings for detection'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionTracingMenu: TAction
      Category = 'Parameters'
      Caption = '&Tracing'
      ImageIndex = 67
      OnExecute = ActionScenarioParamExecute
    end
    object ActionTracingOptions: TAction
      Category = 'Parameters'
      Caption = '&Global tracing options'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionTracing: TAction
      Category = 'Parameters'
      Caption = '&Production type settings for tracing'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionDestructionMenu: TAction
      Category = 'Parameters'
      Caption = 'Destructio&n'
      ImageIndex = 9
      OnExecute = ActionScenarioParamExecute
    end
    object ActionDestrGlobal: TAction
      Tag = 21
      Category = 'Parameters'
      Caption = '&Global destruction options'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionDestrPriority: TAction
      Category = 'Parameters'
      Caption = '&Destruction priorities'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionDestruction: TAction
      Category = 'Parameters'
      Caption = '&Production type settings for destruction'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionVaccinationMenu: TAction
      Category = 'Parameters'
      Caption = '&Vaccination'
      ImageIndex = 7
      OnExecute = ActionScenarioParamExecute
    end
    object ActionVaccGlobal: TAction
      Tag = 19
      Category = 'Parameters'
      Caption = '&Global vaccination options'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionVaccPriority: TAction
      Category = 'Parameters'
      Caption = '&Vaccination priorities'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionVaccination: TAction
      Category = 'Parameters'
      Caption = '&Production type settings for vaccination'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionCostMenu: TAction
      Category = 'Parameters'
      Caption = '&Cost accounting'
      ImageIndex = 16
      OnExecute = ActionScenarioParamExecute
    end
    object ActionCostOptions: TAction
      Tag = 25
      Category = 'Parameters'
      Caption = '&Cost accounting options'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionCostsDestr: TAction
      Category = 'Parameters'
      Caption = 'Production type settings for &destruction costs'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionCostsVacc: TAction
      Category = 'Parameters'
      Caption = 'Production type settings for &vaccination costs'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionCostsZones: TAction
      Category = 'Parameters'
      Caption = 'Production type settings for &zone surveillance costs'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionInteractive: TAction
      Tag = 13
      Category = 'Parameters'
      Caption = '&Interactive/advanced'
    end
    object ActionMap: TAction
      Category = 'Windows'
      Caption = '&Map of units for 1 iteration'
      ImageIndex = 28
      OnExecute = ActionOutputFormExecute
    end
    object ActionOutChart: TAction
      Category = 'Windows'
      Caption = '&Daily unit status for 1 iteration'
      ImageIndex = 26
      OnExecute = ActionOutputFormExecute
    end
    object ActionEvents: TAction
      Category = 'Windows'
      Caption = '&Events by day'
      Enabled = False
      ImageIndex = 33
      OnExecute = ActionOutputFormExecute
    end
    object ActionSummary: TAction
      Category = 'Windows'
      Caption = '&Summary of 1 iteration'
      ImageIndex = 27
      OnExecute = ActionOutputFormExecute
    end
    object ActionHelp: TAction
      Category = 'Help'
      Caption = 'Help'
      Hint = 'Opens the help file'
      ImageIndex = 0
      ShortCut = 112
    end
    object ActionOutputStats: TAction
      Tag = 1
      Category = 'Windows'
      Caption = 'Output statistics'
      ImageIndex = 30
      ShortCut = 16474
      OnExecute = ActionOutputFormExecute
    end
    object ActionEpiCurve: TAction
      Category = 'Windows'
      Caption = 'Summary epidemic curves'
      ImageIndex = 36
      OnExecute = ActionOutputFormExecute
    end
    object ActionRunUntilDay: TAction
      Tag = 2
      Category = 'Run'
      Caption = 'Start and run until specified day...'
      ImageIndex = 17
      OnExecute = ActionRunExecute
    end
    object ActionRunUntilDetection: TAction
      Tag = 1
      Category = 'Run'
      Caption = 'Start and run until first detection(s)'
      ImageIndex = 17
      OnExecute = ActionRunExecute
    end
    object ActionRunUntilDiseaseEnd: TAction
      Tag = 3
      Category = 'Run'
      Caption = 'Start and run to the end of active disease phase(s)'
      ImageIndex = 17
      OnExecute = ActionRunExecute
    end
    object ActionRunUntilOutbreakEnd: TAction
      Category = 'Run'
      Caption = 'Start and run until end of outbreak(s)'
      ImageIndex = 17
      OnExecute = ActionRunExecute
    end
    object ActionExposures: TAction
      Category = 'Windows'
      Caption = 'Contact-exposure events by day'
      ImageIndex = 52
      OnExecute = ActionOutputFormExecute
    end
    object ActionCascade: TAction
      Category = 'Windows'
      Caption = '&Cascade'
      ImageIndex = 32
      ShortCut = 119
      OnExecute = ActionCascadeExecute
    end
    object ActionArrange: TAction
      Category = 'Windows'
      Caption = '&Arrange'
      ImageIndex = 31
      ShortCut = 120
      OnExecute = ActionArrangeExecute
    end
    object ActionVUnits: TAction
      Category = 'Parameters'
      Caption = 'View current units'
      ImageIndex = 41
    end
    object ActionStop: TAction
      Category = 'Run'
      Caption = 'S&top simulation'
      ImageIndex = 59
      OnExecute = btnStopSimClick
    end
    object ActionCloseWindows: TAction
      Category = 'Windows'
      Caption = 'Close all &windows'
      ImageIndex = 60
      ShortCut = 121
      OnExecute = ActionCloseWindowsExecute
    end
    object ActionNew: TAction
      Category = 'File actions'
      Caption = '&New scenario file'
      ImageIndex = 61
      OnExecute = ActionNewExecute
    end
    object ActionSave: TAction
      Category = 'File actions'
      Caption = '&Save scenario file'
      ImageIndex = 62
      ShortCut = 16467
      OnExecute = ActionSaveExecute
    end
    object ActionSaveAs: TAction
      Category = 'File actions'
      Caption = 'Sa&ve As...'
      ImageIndex = 63
      OnExecute = ActionSaveAsExecute
    end
    object ActionAppendOutput: TAction
      Category = 'File actions'
      Caption = 'Append output'
      ImageIndex = 2
    end
    object ActionImport: TAction
      Category = 'File actions'
      Caption = '&Import scenario...'
      ImageIndex = 47
      OnExecute = ActionImportExecute
    end
    object ActionClose: TAction
      Category = 'File actions'
      Caption = '&Close scenario file'
      OnExecute = ActionCloseExecute
    end
    object ActionExport: TAction
      Category = 'File actions'
      Caption = '&Export scenario...'
      ImageIndex = 48
      OnExecute = ActionExportExecute
    end
    object ActionOutputOptions: TAction
      Category = 'Parameters'
      Caption = 'Output options'
      ImageIndex = 51
      OnExecute = ActionScenarioParamExecute
    end
    object ActionClearOutput: TAction
      Category = 'Parameters'
      Caption = 'Clear scenario output'
      ImageIndex = 68
      OnExecute = ActionClearOutputExecute
    end
    object ActionVerifyHerds: TAction
      Category = 'Parameters'
      Caption = 'Verify current units'
    end
    object ActionVerifyScenario: TAction
      Category = 'Parameters'
      Caption = 'C&heck scenario validity'
      ImageIndex = 66
      OnExecute = ActionVerifyScenarioExecute
    end
    object acnEmptyScenario: TAction
      Category = 'File actions'
      Caption = '&Empty scenario'
      ShortCut = 16462
      OnExecute = acnEmptyScenarioExecute
    end
    object acnSampleScenario: TAction
      Category = 'File actions'
      Caption = '&US Midwest scenario'
      OnExecute = acnSampleScenarioExecute
    end
    object ActionWebsite: TAction
      Category = 'Help'
      Caption = 'Go to the NAADSM &website'
      Hint = 'Opens the NAADSM website in your default browser'
      ImageIndex = 11
      OnExecute = ActionWebsiteExecute
    end
    object ActionCustomOutputMenu: TAction
      Category = 'Parameters'
      Caption = 'Custom outputs'
      ImageIndex = 24
      OnExecute = ActionScenarioParamExecute
    end
    object ActionCustomOutputOptions: TAction
      Category = 'Parameters'
      Caption = 'Custom output options'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionCustomOutputDefinitions: TAction
      Category = 'Parameters'
      Caption = 'Define custom outputs'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionZonesMenu: TAction
      Category = 'Parameters'
      Caption = 'Zones'
      ImageIndex = 70
      OnExecute = ActionScenarioParamExecute
    end
    object ActionZonesOptions: TAction
      Category = 'Parameters'
      Caption = 'Zone options'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionZonesDefinition: TAction
      Category = 'Parameters'
      Caption = 'Create/modify zones'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionZones: TAction
      Category = 'Parameters'
      Caption = 'Production type settings for zones'
      OnExecute = ActionScenarioParamExecute
    end
    object ActionCompareStats: TAction
      Category = 'Windows'
      Caption = 'Com&pare to another scenario...'
      ImageIndex = 69
      OnExecute = ActionOutputFormExecute
    end
    object ActionOutZoneChart: TAction
      Category = 'Windows'
      Caption = 'Da&ily zone status for 1 iteration'
      ImageIndex = 71
      OnExecute = ActionOutputFormExecute
    end
    object acnLanguageSettings: TAction
      Category = 'Tools'
      Caption = '&Language settings...'
      ImageIndex = 11
      OnExecute = ActionLanguageSettingsExecute
    end
  end
  object ImageList1: TImageList
    Left = 296
    Top = 32
    Bitmap = {
      494C010148004A00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003001000001002000000000000030
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042000000420000004200
      0000420000004200000042000000420000004200000042000000420000004200
      0000212121000000000000000000000000000000000000000000000000000000
      0000000000000000880000008800000088000000880000008800000000000000
      000000000000000000000000000000000000000000003939390000000000BDBD
      BD00393939003939390000000000BDBDBD000000000000000000393939000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084420000848400004242
      0000636300004242000063630000424200006363000042420000424200008484
      0000420000000000000000000000000000000000000000000000000000000000
      8800000088000000000000000000000000000000000000000000000088000000
      88000000000000000000000000000000000000000000FFFFFF00BDBDBD00FFFF
      FF00FFFFFF00FFFFFF00BDBDBD00FFFFFF00BDBDBD007B7B7B007B7B7B007B7B
      7B0000000000393939007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084420000848400003939
      39004242000039393900424200003939390042420000393939007B7B7B008484
      0000420000000000000000000000000000000000000000000000000088000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000008800000000000000000000000000000000008080000080800000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00FFFF
      FF00393939007B7B7B00BDBDBD00000000000000000000000000968CF900968C
      F900968CF900968CF900968CF900968CF9000000000000000000000000000000
      0000000000000000000000000000000000000000000084420000848400004242
      0000636300004242000063630000424200006363000042420000636300008484
      0000420000004200000021212100000000000000000000008800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000880000000000000000000000000080000000808000008080
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBDBD00FFFFFF00000000000000000000000000968CF900968C
      F900968CF900968CF900968CF900968CF90000000000968CF900000000000000
      0000000000000000000000000000000000000000000084420000848400003939
      3900424200003939390042420000393939004242000039393900424200008484
      0000420000008484000042000000000000000000000000008800000000000000
      0000000000000000000088000000880000008800000000000000000000000000
      00000000000000008800000000000000000000000000FFFFFF00FFFFFF008080
      0000808000008000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000968CF900968CF9000000
      0000000000000000000000000000000000000000000084420000848400004242
      0000636300004242000063630000424200006363000042420000636300008484
      0000420000008484000042000000000000000000880000000000000000000000
      0000000000008800000000000000000000000000000088000000000000000000
      00000000000000000000000088000000000000000000FFFFFF00FFFFFF00FFFF
      FF0080000000808000008000000080000000808000008080000080800000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000968C
      F900968CF900968CF900968CF900968CF900968CF90000000000968CF900968C
      F900000000000000000000000000000000000000000084420000848400003939
      3900424200003939390042420000393939004242000039393900424200008484
      0000420000008484000042000000000000000000880000000000000000000000
      0000880000000000000000000000000000000000000000000000880000000000
      00000000000000000000000088000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080800000808000008080000080800000FFFFFF00808000008080
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000968CF900968CF900968CF900968CF900968CF900968CF90000000000968C
      F900968CF9000000000000000000000000000000000084420000848400004242
      0000424200004242000042420000424200004242000042420000636300008484
      0000420000008484000042000000000000000000880000000000000000000000
      00008800000000000000000000000000FF000000000000000000880000000000
      00000000000000000000000088000000000000000000FFFFFF00000080000000
      8000000080000000800000008000000080008000000080000000800000008080
      000080800000FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000968CF900968CF900968CF900968CF900968CF900968CF9000000
      0000968CF900968CF90000000000000000000000000084420000848400007B7B
      7B00000000000000000000000000000000000000000000000000424200008484
      0000420000008484000042000000000000000000880000000000000000000000
      0000880000000000000000000000000000000000000000000000880000000000
      000000000000000000000000880000000000000000000000800000008000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000080000000800000008000000080000000
      8000808000000000800000008000000000000000000000000000000000000000
      00000000000000000000968CF900968CF900968CF900968CF900968CF900968C
      F90000000000968CF900968CF900000000000000000084420000848400004242
      0000424200004242000042420000424200004242000042420000636300008484
      0000420000008484000042000000000000000000880000000000000000000000
      0000000000008800000000000000000000000000000088000000000000000000
      0000000000000000000000008800000000000000000000008000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008000
      00008000000080800000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000968CF900968CF900968CF900968CF900968C
      F900968CF90000000000968CF900000000000000000021000000420000004200
      0000420000004200000042000000420000004200000042000000420000004200
      00005A3939008484000042000000000000000000000000008800000000000000
      0000000000000000000088000000880000008800000000000000000000000000
      00000000000000008800000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00800000008000000080800000000000000000000000000000000000000000
      000000000000000000000000000000000000968CF900968CF900968CF900968C
      F900968CF900968CF90000000000000000000000000000000000000000008442
      0000848400007B7B7B0000000000000000000000000000000000000000000000
      0000424200008484000042000000000000000000000000008800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000008800000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008442
      0000848400004242000042420000424200004242000042420000424200004242
      0000636300008484000042000000000000000000000000000000000088000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000880000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002100
      0000420000004200000042000000420000004200000042000000420000004200
      000042000000420000005A393900000000000000000000000000000000000000
      8800000088000000000000000000000000000000000000000000000088000000
      880000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000880000008800000088000000880000008800000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF00000084000000FF0000000000000000000000000000000000000000000000
      0000000000000000000084848400008484008484840000848400848484000084
      8400848484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      FF00000084000000FF0000000000008484000000000000000000000000000000
      0000000000000000000000848400848484000084840084848400008484008484
      8400008484008484840000000000000000000000000000000000000000000000
      0000000000000457040004890400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000084000000FF0000848400008484000000000000000000000000000000
      0000000000000000000084848400008484008484840000848400848484000084
      8400848484000084840000000000000000000000000000000000000000000000
      0000002B000054FD540045D74500004000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000084000000FF0000848400008484000000000000000000000000000000
      0000000000000000000000848400848484000084840084848400008484008484
      8400008484008484840000000000000000000000000000000000000000000024
      00003EE63E0078F778007AF07A002EBD2E000040000000000000000000000000
      00000000000000000000000000000000000000000000D0D0D000949494003838
      380000000000000000000000000000000000000000000000000000000000C2C2
      C200949494003838380000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      FF00000084000000FF0000848400000000000000000000000000000000000000
      0000000000000000000084848400008484008484840000848400848484000084
      8400848484000084840000000000000000000000000000000000001300002EDA
      2E006BE66B006BD86B006EE66E0084FF840026B5260000340000000000000000
      00000000000000000000000000000000000000000000D0D0D000949494003838
      380000000000000000000000000000000000000000000000000000000000CCCC
      CC0094949400383838000000000000000000000000007B7B7B00000000000000
      000000000000FFFFFF00000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000001C00002CC92C0063DD
      630066D2660065D9650091F391007FFB7F0088FF88002EBC2E00003100000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000FFFFFF00000000007B7B7B00000000000000000000000000000084000000
      84000000840000008400000084000000000084000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000CED6D600FFFFFF00CED6D600FFFFFF00CED6
      D600FFFFFF00000000000000000000000000000000000E890E0058EC580066CA
      66006DDF6D000CA50C0086EE8600D6FFD6008BFF8B008FFF8F002EC22E000030
      00000000000000000000000000000000000000000000D0D0D000949494003838
      3800000000003838380000000000000000005E5E5E00FFFFFF0000000000CCCC
      CC00949494005E5E5E0000000000000000000000000000000000000000000000
      0000000000007B7B7B0000000000000000000000000000848400008484000084
      84000000000000000000000000000000000084000000FFFFFF00000000000000
      0000FFFFFF0000000000008484000000000000FFFF00000000000000000000FF
      FF0000000000848484000000000000000000000000000B700B0060EB600066D8
      660028CC280000140000000B0000BCFFBC00E1FFE10085FF850092FF920027BC
      2700002A000000000000000000000000000000000000F5F5F500949494003838
      3800000000002D2D2D00FFFFFF003838380062626200FFFFFF0000000000F5F5
      F5009D9D9D006262620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400008484000000
      00000000000000000000000000000000000084000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000000000000000001171110062F462002CC6
      2C00005800000000000000000000003D0000C3FFC300DFFFDF0087FF87008CFF
      8C001CAE1C00002F0000000000000000000000000000FFFFFF00DDDDDD007777
      7700000000002D2D2D00FFFFFF005E5E5E0062626200FFFFFF0000000000FFFF
      FF009D9D9D006262620000000000000000000000000000000000000000000000
      0000000000000000000000000000008484000084840000848400000000000000
      00000000000000000000000000000000000084000000FFFFFF00000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000001A8A1A0030EA30000053
      000000000000000000000000000000000000002F0000BCFFBC00E0FFE00086FF
      860088FF88002AC42A0000370000000000000000000000000000333333002D2D
      2D00333333000000000000000000000000000000000038383800000000003333
      33002D2D2D000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400008484000084840000000000000000000000
      00000000000000000000000000000000000084000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008400000000000000000000000000
      0000000000000000000000000000000000000000000010B81000098709000000
      00000000000000000000000000000000000000000000002D0000CBFFCB00D6FF
      D60088FF88005EF25E000062000000000000000000000000000000000000FFFF
      FF006262620033333300000000000000000000000000FFFFFF00626262003838
      3800000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000848400008484000000000000000000000000000000
      00000000000000000000000000000000000084000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF008400000000000000000000000000
      00000000000000000000000000000000000000000000003E0000000000000000
      0000000000000000000000000000000000000000000000000000005E0000CEFF
      CE00E0FFE0003DD83D00004D0000000000000000000000000000000000000000
      0000333333002D2D2D000000000000000000000000002D2D2D00333333000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400000000000000000000000000000000007B7B
      7B00000000007B7B7B00000000000000000084000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000021
      0000E9FFE900CAFFCA00004B0000000000000000000000000000000000000000
      00003838380000000000000000000000000000000000000000005E5E5E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B00000000007B7B7B00000000000000000084000000FFFFFF00000000000000
      0000FFFFFF0084000000FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000F5F0F00A7FFA7001B621B00000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000008484000000
      00000000000000000000000000007B7B7B000000000000000000000000007B7B
      7B00000000007B7B7B00000000000000000084000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000050000009940900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000390000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000FFFFFF0000FFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      000000000000FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000848484008484
      840084848400848484000000FF000000FF008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000FF
      FF00000000000000000000000000848484000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF0000FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000
      000000FFFF00848484000000000000000000000000000000000084848400FFFF
      FF0000FFFF00000000000000FF000000FF0000FFFF000000000000FFFF000000
      000000FFFF00848484000000000000000000000000000000000000FFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF00000000000000000084848400000000000000000084848400FFFFFF0000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF00000000000000000084848400000000000000000000000000FFFFFF00FFFF
      FF0084000000FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000848484000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000084848400FFFFFF000000
      000000FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000
      0000848484000000000084848400000000000000000084848400FFFFFF000000
      000000FFFF00000000000000FF000000000000FFFF000000000000FFFF000000
      000084848400000000008484840000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008400000084000000FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000084848400FFFFFF000000000000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF000000000084848400848484000000000084848400FFFFFF000000000000FF
      FF000000000000FFFF000000FF000000FF000000000000FFFF000000000000FF
      FF00000000008484840084848400000000008400000084000000840000008400
      0000840000008400000084000000FFFFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000848484000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      84000000000000000000848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF008484
      8400000000000000000084848400000000008400000084000000840000008400
      000084000000840000008400000084000000FFFFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840000FFFF0084848400000000008484840084848400848484008484
      8400848484008484840084848400848484000000FF000000FF00848484008484
      84008484840000FFFF0084848400000000008400000084000000840000008400
      00008400000084000000840000008400000084000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF000000
      000000FFFF0000000000FF000000FF000000FF000000FF00000000FFFF000000
      000000FFFF000000000084848400000000000000000084848400FFFFFF000000
      00000000FF0000000000FF000000FF000000FF0000000000FF000000FF000000
      000000FFFF000000000084848400000000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF000000000000FFFF0000000000FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000084848400FFFFFF000000
      FF000000FF0000FFFF0000000000FF000000FF0000000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF000000
      000000FFFF0000000000FF000000FF000000FF000000FF000000848484008484
      8400848484008484840084848400000000000000000084848400FFFFFF000000
      FF000000FF000000FF00FF000000FF000000FF0000000000FF000000FF008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF00000084848400FF000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FF000000FF000000FF000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FF000000FF0000000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000313131009494940021210000212100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF0000000000000000000000
      00000000000000000000000000000000000000000000FF00FF0084848400C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003131
      310094949400212100005A9C7B005A5A39000000000000000000000000000000
      00000000000000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000840000008400000084
      0000008400000084000000840000008400000084000000000000848484008484
      8400C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000313131009494
      9400212100005A9C7B007B7B3900000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF000000000000FF
      FF00000000000000000000000000000000000000000000840000008400000084
      0000008400000084000000840000008400000084000000000000008484000000
      0000C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100949494002121
      00005A9C7B007B7B3900000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000840000008400000084
      0000008400000084000000840000008400000084000000000000008484000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600212100005A9C
      7B007B7B3900000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000840000008400000084
      0000008400000084000000840000008400000084000000000000008484000000
      00000000840084848400C6C6C600000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECE3100CECE3100CECE3100DEDE630000000000000000005A5A39005A5A
      3900000000000000000000000000000000000000000000FFFF0000FFFF000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000FFFF0000FFFF00000000000000000000840000008400000084
      0000008400000084000000840000008400000084000000000000008484000000
      0000000084008484840084848400C6C6C6000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300DEDE6300DEDE6300DEDE6300DEDE6300DEDE630000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000840000008400000084
      000000840000008400000084000000840000008400000000000000FFFF000000
      0000000084008400000000000000C6C6C6000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000DEDE6300EFEF
      3100BDBD7B00BDBD7B00BDBD7B00DEDEDE00FFFF3900DEDE6300000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000084848400008400000000
      000000000000000000000000000000000000000000000084000000FFFF000000
      0000000084008400000000000000C6C6C6000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000000000006B6B3100FFFF0000EFEF
      3100DEDE6300CECE3100CECE310094943100BDBD9C00FFFF3900DEDE63000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      000000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF00000000000000
      000000FFFF0000FFFF0000000000000000000084000000000000000000000084
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000084008400000000000000C6C6C6000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000000000000000000000000000000000000000DEDE6300FFFF7B00FFFF
      3900FFFF0000FFFF0000FFFF0000EFEF310094943100DEDEDE00DEDE63000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000848400C6C6C60000FF
      FF00008484000084840000848400008484000084840000848400008484000000
      8400000084008400000000000000C6C6C6000000000000000000000000000000
      0000FFFFFF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000000000000000000000000000000000000000DEDE6300FFFFBD00FFFF
      3900FFFF3900FFFF0000FFFF0000FFFF0000CECE3100BDBD7B00DEDE63000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      000000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000848400008484000084
      8400000084000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000008400FF00000000000000C6C6C6000000000000000000000000000000
      0000FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000FF000000
      FF000000000000000000000000000000000000000000CECE9400FFFF7B00FFFF
      BD00FFFF3900FFFF7B00FFFF7B00FFFF0000DEDE6300BDBD7B00DEDE63000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF000000
      000000FFFF0000FFFF000000000000000000000000000000000000008400C6C6
      C6000000FF000000840000008400000084000000840000008400000084000000
      840000000000FF00000000000000C6C6C6000000000000000000000000000000
      000000000000FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000063636300EFEF3100FFFF
      BD00FFFFBD00FFFFBD00FFFFBD00FFFF3900EFEF3100EFEF31005A5A21000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000084000000
      84000000840084000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000084848400000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000000094949400EFEF
      3100FFFF7B00FFFF7B00FFFF7B00FFFF3900EFEF3100CECE9400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FF000000C6C6C60084000000840000008400000084000000840000008400
      00008400000084000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300CECE9400DEDE6300DEDE6300CECE94006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A57B7300C6ADA500BD8C
      84009C7B7300DECECE00E7DED600E7DED600E7DED600E7DED600E7DED600E7DE
      D600E7DEDE00D6C6BD00BD8C7B00A57B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7CEC600DEBDB500F7EFE700E7CE
      C600DEBDAD00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7EF00E7C6BD00CEA59C00A55A2100A55A2100944A10000000
      0000FFFFF700A55A2100A55A2100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6B5AD00C6ADA500F7F7F700CEB5
      AD00CEBDB500F7F7F700C6ADAD00CEC6BD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700F7EFEF00A55A2100A55A2100A55A2100A55A
      2100A55A2100A55A2100A55A2100A55A2100A55A2100A55A2100A55A2100A55A
      2100A55A2100A55A2100A55A2100A55A21000000000000000000000000000000
      000000000000000000000000FF0000FF000000FF000000FF000000FF00000000
      000000000000000000000000000000000000000000000000000000000000BD00
      0000BD000000BD000000BD000000BD000000BD000000BD000000BD000000BD00
      0000BD000000000000000000000000000000CE9C9400AD7B6B00CEADA500C694
      84009C6B6300CEADAD00BD8C84009C6B6300E7DED600EFE7DE00EFE7DE00F7E7
      E700EFE7E700EFE7DE00F7EFEF00EFE7E700A55A2100A55A2100A55A2100A55A
      2100A55A2100A55A2100A55A2100A55A2100A55A2100A55A2100A55A2100A55A
      2100A55A2100A55A2100A55A2100A55A21000000000000000000000000000000
      000000FF000000FF000000FF000000FF00000000FF000000FF0000FF000000FF
      000000FF000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000D6C6C600DEC6BD00FFF7F700FFEF
      EF00E7CECE00FFF7F700F7E7DE00DEBDB500FFFFFF00FFFFFF00FFFFFF00E7DE
      DE00F7EFEF00FFFFFF00EFE7DE00EFE7E700A55A2100A55A2100A55A2100A55A
      2100A55A2100A55A2100A55A2100A55A2100A55A2100A55A2100A55A2100A55A
      2100A55A2100A55A210084421000A55A210000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF00000000FF0000FF000000FF
      000000FF000000FF0000000000000000000000000000BD00000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00BD000000000000000000000000000000A5847300A58C8400E7E7E700F7F7
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFE700EFE7E700EFEFE700D6BDBD00A573
      630094736B00CEBDB500A5736300946B6300A55A2100A55A2100A55A2100A55A
      2100A55A21006BB5B500A55A2100A55A2100A55A2100A55A2100A55A2100A55A
      2100A55A21006BADB5005A9C9400A55A210000000000000000000000000000FF
      000000FF00000000FF0000FF000000FF000000FF000000FF000000FF000000FF
      00000000FF0000FF0000000000000000000000000000BD00000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00BD00
      000000000000000000000000000000000000DEB5A500BD8C8400E7D6D600F7E7
      E700F7E7E700EFE7E700EFE7E700EFE7E700F7E7E700F7E7E700EFE7DE00DEBD
      AD00CEA59400EFDED600E7C6BD00CEA59C00A55A2100A55A2100A55A2100A55A
      2100A55A210052947B00A55A2100A55A2100944A10006B949C00A55A2100A55A
      2100A55A210084BDBD00944A1000AD5A210000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF00000000FF000000
      FF0000FF000000FF0000000000000000000000000000BD00000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      000000000000000000000000000000000000F7EFEF00F7EFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700FFF7F700FFFFFF00FFFFF700F7EFEF00A55A2100A55A2100A55A2100A55A
      2100ADE7DE0042AD7B00A55A2100A55A2100AD5A21005A9C9400A55A2100A55A
      2100A55A2100A55A21009CBDA500A55A2100000000000000000000FF000000FF
      000000FF000000FF00000000FF0000FF00000000FF0000FF000000FF00000000
      FF0000FF00000000FF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      000000000000000000000000000000000000EFE7E700E7E7DE00FFFFFF00EFEF
      EF00DED6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7DEDE00D6CECE00A55A2100A55A2100A55A2100A55A
      2100A55A21008CAD9400A55A2100A55A21004A8C73006B8CA500A55A2100A55A
      210084DECE00A55A2100A55A2100A55A21000000000000000000000000000000
      FF0000FF00000000FF0000FF000000FF000000FF00000000FF0000FF000000FF
      000000FF000000FF0000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      000000000000000000000000000000000000B5847B00946B5A00D6C6BD00BD94
      8400946B5A00C6B5B500EFE7E700EFE7E700EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7E700E7D6CE00B58473009C736300A55A2100A55A2100A55A2100A55A
      2100A55A2100A55A2100A55A2100ADCEF700F7FFFF009CBDDE00A55A29008CCE
      DE005A8C8400A55A2100A55A2100A55A210000000000000000000000000000FF
      000000FF000000FF000000FF00000000FF000000FF0000FF000000FF000000FF
      000000FF000000FF0000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00BD00
      000000000000000000000000000000000000E7CEC600CE9C8C00EFDED600EFD6
      CE00CEA59400E7CEC600FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700EFD6D600D6B5A500A55A2100A55A2100A55A210063AD
      9C00A55A2100A55A2100A55A210084ADBD00BDDEFF007B7B7B00C6CEE70084BD
      CE00CEEFEF00A55A2100A55A2100A55A210000000000000000000000000000FF
      00000000FF0000FF000000FF000000FF00000000FF0000FF000000FF000000FF
      000000FF0000000000000000000000000000000000000000000000000000BD00
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00BD000000000000000000000000000000BDADA500AD948C00F7EFEF00C6AD
      AD00B59C9400FFF7F700CEBDB500C6B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7EF00A55A2100A55A21004A422100ADDE
      EF004AA56B00A55A2100A55A2100A55A2100A55A210094C6E70094ADBD009CBD
      DE00ADCEEF00A5522100A55A2100A55A21000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00000000000000000000000000CE9C9400AD7B6B00C6A59C00C694
      84009C736300C6ADA500C69484009C736300CEB5B500E7D6D600E7D6CE00E7D6
      D600E7DED600E7D6CE00EFDEDE00E7DEDE00A55A2100A55A21009C9CA5006B9C
      9C0073ADAD006B737300A55A2100A55A2100527B730031634A0031734A005273
      6B00427B630042846300A55A2100A55A21000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD000000BD000000BD000000BD000000BD00
      0000BD000000000000000000000000000000DECECE00C6ADA500FFF7F700FFEF
      EF00E7CEC600F7F7EF00F7E7DE00DEBDB500F7F7EF00FFFFFF00FFFFFF00F7F7
      F700EFEFE700FFFFFF00F7EFEF00EFE7E700A55A210052735A00426B63008CCE
      BD00B5632100A55A2100A55A2100A55A21005A6B630052736B00316B5200316B
      520042634A0042735A004A8C8400428463000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C840094736B00DED6D600FFFF
      FF00FFF7F700FFF7F700F7F7F700F7F7F700F7F7F700F7F7F700F7EFEF00B58C
      84008C6B5A00CEC6BD00AD847B0094736B00000000000000000084ADCE00DEDE
      E7008C9494008C4A210000000000A55A2100A55A2100A55A21004A4221009C52
      21003152310031523100A55A21006B3108000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEBDB500C6948400D6C6BD00EFE7
      DE00EFDEDE00EFDEDE00EFDEDE00EFDEDE00EFDEDE00EFE7DE00EFE7DE00DEBD
      B500C6948400D6BDBD00DEBDB500C69C8C000000000000000000000000000000
      00000000000000000000FFF7F700FFF7F7000000000000000000000000000000
      0000F7F7F700FFF7F70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      000000000000000000000000000000000000000000007B7B7B00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF0000000000000000000000000000000000BDBDBD000000420000004200BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000007B7B7B0000006300000084000000
      6300BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000000000000000BDBDBD0000000000000084000000
      8400000063000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000BD00000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000000000000000BDBDBD00000021000000
      84000000840039395A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF008484840000000000BD0000000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000BDBDBD003939
      5A00000084000000840039395A00000000000000000000000000000000003939
      3900000000003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BD000000FFFF
      FF00C6C6C600BD000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000039395A000000840000008400393939000000000000000000000000000000
      000000000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00BD000000BD00
      0000BD00000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000003939390000006300000063003939390000000000BDBDBD002121
      21002121210000000000BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BD000000BD00
      0000BD00000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000039393900000042004242420042424200636363008484
      8400393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00BD000000BD00
      0000BD000000BD000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005A5A5A008484840084848400848484004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B008484840021212100212121007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000000000BDBD
      BD00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005A5A5A008484840021212100393939000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003939390084848400424242007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500949494000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00525252004242420042424200424242004242420021212100BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE007B7B7B007B7B7B007B7B
      FF007B7B7B007B7BBD007B7BBD007B7B7B007B7BBD007B7B7B007B7B7B007B7B
      BD007B7BBD007B7BFF00BDBDFF00A5A5A5000000000000000000000000007B7B
      7B007B7B7B00BDBDBD0000000000000000000000000000000000BDBDBD007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      00007B7B7B006363630063636300636363006363630063636300313131004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE0042427B000000FF000000
      7B00FFFFFF000000FF00FFFFFF000000390000007B00FFFFFF000000BD00FFFF
      FF000000FF000000FF007B7BBD00A5A5A50000000000BDBDBD00000063000000
      8400000084000000630039395A000000000000000000395A5A00006363000084
      84000084840000424200BDBDBD00000000000000000000000000000000000000
      0000000000006B6B6B0063636300636363006363630063636300525252002121
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000DEDEDE004242BD000000BD00FFFF
      FF000000BD0000007B00000039000000BD00FFFFFF0000007B00000039000000
      BD000000FF0000007B007B7BFF00A5A5A5000000000000005A000000BD000000
      9C0000009C0000008400000084007B7B7B007B7B7B0000BDBD00009C9C000084
      8400008484000084840000424200000000000000000000000000000000003939
      FF0000000000636363006363630063636300636363006363630063636300BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000DEDEDE004242BD00000039000000
      BD000000BD00FFFFFF000000BD0000003900000039000000BD00000039000000
      FF000000BD000000BD007B7BFF00A5A5A5007B7B7B000000DE000000DE000000
      BD0000009C0000009C000000840000004200005A5A0000DEDE0000BDBD00009C
      9C000084840000848400008484007B7B7B00000000000000FF000000FF000000
      FF007B7BFF00636363007B7B3900BDBD7B00FF7B7B007B7B7B00636363000000
      0000FF000000FF000000FF000000FF7B7B000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000FFFFFF0000000000DEDEDE0042427B000000BD000000
      FF00000039000000BD000000BD00FFFFFF000000FF00000039000000BD000000
      BD0000007B000000FF007B7BFF00A5A5A5007B7B7B000000DE000000DE000000
      FF000000BD0000009C0000009C0000005A00005A5A0000DEDE0000DEDE0000DE
      DE0000BDBD0000848400008484007B7B7B00000000000000FF00000000003939
      FF000000000063636300393939007B3900007B7B390039390000636363000000
      00000000000000000000FF7B7B00FF7B7B000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000DEDEDE004242BD000000FF000000
      7B0000007B000000FF00FFFFFF000000BD0000007B0000007B000000FF000000
      7B000000FF000000BD007B7BBD00A5A5A5007B7B7B000000FF000000FF000000
      DE000000FF0000009C0000009C0000004200007B7B0000DEDE0000DEDE0000BD
      BD0000DEDE00009C9C00008484007B7B7B00000000000000FF00000000000000
      0000000000006B6B6B00636363006363630063636300636363006B6B6B000000
      00000000000000000000FF7B7B00FF7B7B000000000000000000000000000000
      FF00000000000000000000000000FFFFFF0000000000BDBDBD00000000000000
      0000FFFFFF0000000000FFFFFF0000000000DEDEDE004242BD000000BD000000
      39000000FF00000039000000BD000000BD00000039000000FF00000039000000
      BD000000FF00000039007B7BFF00A5A5A5000000000000007B000000FF000000
      FF0000009C000000DE000000BD007B7B7B007B7B7B0000FFFF0000FFFF0000FF
      FF0000DEDE0000BDBD000042420000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF7B7B00FF7B7B000000000000000000000000000000
      FF000000FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000DEDEDE004242BD00000039000000
      FF000000BD00000039000000FF00000039000000BD0000007B0000007B000000
      FF00000039000000BD007B7BFF00A5A5A50000000000BDBDBD0000007B003939
      7B0039397B0000005A0039397B000000000000000000397B7B00009C9C000063
      630000DEDE00005A5A00BDBDBD0000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF7B7B00FF7B7B00000000000000FF000000FF000000
      FF000000FF000000FF0000000000FFFFFF000000000000000000FFFFFF000000
      000000000000000000000000000000000000DEDEDE0042427B000000BD000000
      FF00FFFFFF000000FF0000007B0000007B000000BD00FFFFFF000000FF000000
      390000007B000000FF007B7BBD00A5A5A5000000000000000000000000007B7B
      7B00BDBDBD000000000000000000000000000000000000000000BDBDBD003939
      39007B7B7B00000000000000000000000000000000000000FF00000000000000
      00007B7B7B00525252004242420042424200424242004242420021212100BDBD
      BD000000000000000000FF7B7B00FF7B7B00000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF000000000000000000DEDEDE004242BD000000FF000000
      39000000BD000000BD00000039000000FF00FFFFFF000000BD000000BD000000
      39000000FF000000BD007B7BBD00A5A5A5000000000000000000BDBDBD003939
      39000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B0039393900007B0000BDBDBD0000000000000000000000FF00000000000000
      00007B7B7B006363630063636300636363006363630063636300313131004242
      42000000000000000000FF7B7B00FF7B7B00000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000000000BDBDBD00FFFFFF000000
      0000FFFFFF00000000000000000000000000DEDEDE004242BD000000BD000000
      7B000000FF00000039000000BD0000003900000039000000BD00FFFFFF000000
      BD000000BD00000039007B7BFF00A5A5A5000000000000000000BDBDBD00BDBD
      BD000000000000000000000000000000000000000000397B390000FF0000007B
      0000BDBDBD0000BD0000007B000000000000000000000000FF00000000000000
      0000000000006B6B6B0063636300636363006363630063636300525252002121
      210000000000FFBDBD00FF7B7B00FF7B7B00000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000DEDEDE004242BD0000007B000000
      FF000000BD000000390000007B00FFFFFF000000FF00FFFFFF0000007B000000
      BD00FFFFFF000000FF007B7BFF00A5A5A5000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00007B0000007B0000BDBD
      BD0000000000BDBDBD007B7B7B0000000000000000000000FF007B7BFF007B7B
      FF00BDBDFF00636363006363630063636300636363006363630063636300BDBD
      BD00FF393900FF393900FF393900FF7B7B00000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00424242000000BD000000
      FF00FFFFFF000000BD00FFFFFF0000007B0000003900FFFFFF000000BD00FFFF
      FF0000007B000000FF007B7BBD00A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7BFF007B7BFF007B7B
      FF00BDBDFF00636363007B7B3900BDBDBD00FFBD7B007B393900636363000000
      0000FF393900FF393900FF7B7B00FFBDBD000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE0063639C004242BD004242
      7B0042427B00424242004242420042427B004242420042427B0042427B004242
      42004242BD00424242007B7B7B00A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000063636300393939007B3900007B7B390039390000636363000000
      000000000000FFBDBD0000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B6B6B0063636300636363006363630063636300393939000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD00000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD000000BD000000000000000000000000000000FFFFFF008484
      8400848484008484840084848400FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD000000BD000000BD00
      0000BD000000BD000000BD000000BD0000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD000000BD000000000000000000000000000000FFFFFF008484
      8400848484008484840084848400FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD00000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400848484008484840084848400FFFFFF000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000848400008484000084840000848400008484000084840000848400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000848400008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FFFFFF0000000000000000000000000000000000FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000848400008484000084840000848400008484000084840000848400000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484000084840000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      000000000000000000007B7B7B000000000000000000000000007B7B7B000000
      000000000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      84008484840084848400848484008484840084848400C6C6C600C6C6C600C6C6
      C600FFFFFF00C6C6C60084848400C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      00007B7B7B00000000007B7B7B00000000007B7B7B00000000007B7B7B000000
      00007B7B7B00000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      00000000000000000000848484008484840084848400FFFFFF00FFFFFF008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FF00FF00840084000000000000000000C6C6C600FFFFFF00FFFFFF008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      000084008400FF00FF008400840000000000FFFFFF00FFFFFF00FFFFFF008400
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000007B7B7B00000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      000084008400FF00FF008400840000000000FFFFFF00FFFF0000FFFFFF008400
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000848400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FF00FF0084008400FF00FF0000000000FFFFFF00FFFFFF00FFFFFF008400
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000007B7B7B007B7B7B00000000007B7B
      7B007B7B7B007B7B7B000000FF007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B000000FF007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000084840000848400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      000084008400FF00FF008400840000000000FFFFFF00FFFF0000FFFFFF008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000000000000000000008400
      0000FF00FF0084008400FF00FF0000000000FFFFFF00FFFFFF00FFFFFF008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000848400008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000000000000000000008400
      000084008400FF00FF008400840000000000FFFFFF00FFFF0000FFFFFF008400
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00848484000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000000000000000000008400
      0000FF00FF0084008400FF00FF0000000000FFFF0000FFFFFF00FFFF00008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000007B7B7B007B7B7B00000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000084840000848400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      000084008400FF00FF008400840000000000FFFFFF00FFFF0000FFFFFF008400
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FF00FF0084008400FF00FF0000000000FFFF0000FFFFFF00FFFF00008400
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B007B7B7B00000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDDE007B7BBD007B7B
      BD007B7BBD007B7BBD00BDBDDE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7BBD007B7BBD007B7B
      BD007B7BBD007B7BBD00BDBDDE00000000000000000000000000000000000000
      0000000000008400000084000000FF00000084000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7BBD00000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FF000000840000008400000084000000FF00000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B0000000000FFFFFF00FFFFFF0000000000000000007B7B7B007B7B
      7B0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00007B7BBD000000840000008400000084000000840000008400000000000000
      000000000000000000000000000000000000000000000000000084000000FF00
      0000840000000084840000848400840000008400000084000000840000008400
      00008400000000000000000000000000000000000000000000007B7B7B000000
      0000000000007B7B7B007B7B7B00FFFFFF000000000000000000000000000000
      00007B7B7B00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7BBD00000000000000000000000000000000007B7BBD00000000000000
      0000000000000000000000000000000000000000000084000000FF0000008400
      0000FF000000008484000084840084000000FF00000084000000FF0000008400
      000000848400008484000000000000000000000000007B7B7B00FFFFFF000000
      0000000000007B7B7B007B7B7B00FFFFFF00FFFFFF0000000000000000000000
      00007B7B7B007B7B7B00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      00007B7BBD00000000000000000000000000000000007B7BBD007B7BBD007B7B
      BD007B7BBD007B7BBD00BDBDDE00000000000000000084000000FF000000FF00
      0000FF0000000084840000848400008484008400000084000000840000008400
      000000848400008484000000000000000000000000007B7B7B00000000000000
      0000000000007B7B7B007B7B7B007B7B7B00FFFFFF0000000000000000000000
      00007B7B7B007B7B7B0000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7BBD0000000000000000000000000000000000BDBDDE007B7BBD007B7B
      BD007B7BBD007B7BBD00BDBDDE0000000000FF000000FF000000FF000000FF00
      0000FF000000008484000084840000848400FF000000FF000000FF0000008400
      0000FF0000008400000084000000000000007B7B7B00FFFFFF00000000000000
      0000FFFFFF007B7B7B007B7B7B007B7B7B00FFFFFF0000000000000000000000
      000000000000000000007B7B7B00FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000840000008400000084000000
      8400000084000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084000000FF000000FF0000000084
      840000848400008484000084840000848400FF000000FF000000FF0000008400
      00008400000084000000FF000000000000007B7B7B00FFFFFF00000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B00FFFFFF0000000000FFFFFF000000
      000000000000000000007B7B7B00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7BBD0000000000000000000000000000000000BDBDDE007B7BBD007B7B
      BD007B7BBD007B7BBD00BDBDDE0000000000FF00000084000000008484000084
      840000848400008484000084840000848400FF00000000848400FF0000008400
      0000FF000000FF000000FF000000000000007B7B7B00FFFFFF007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B00FFFFFF007B7B7B00FFFFFF00FFFF
      FF0000000000000000007B7B7B00FFFFFF000000000000000000FFFFFF000000
      000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7BBD00000000000000000000000000000000007B7BBD007B7BBD007B7B
      BD007B7BBD007B7BBD00BDBDDE000000000084000000FF000000FF0000000084
      840000848400008484000084840000848400008484000084840000848400FF00
      000084000000FF00000084000000000000007B7B7B00FFFFFF00000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B00FFFF
      FF0000000000000000007B7B7B00FFFFFF000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7BBD00000000000000000000000000000000007B7BBD00000000000000
      000000000000000000000000000000000000FF000000FF000000FF0000000084
      840000848400FF000000FF00000084000000008484000084840000848400FF00
      0000FF00000084000000FF000000000000007B7B7B0000000000FFFFFF007B7B
      7B007B7B7B000000000000000000FFFFFF007B7B7B007B7B7B007B7B7B00FFFF
      FF00FFFFFF00000000007B7B7B00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7BBD000000840000008400000084000000840000008400000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF00000000848400008484000084840000848400008484000084
      840084000000FF0000000000000000000000000000007B7B7B00FFFFFF000000
      0000FFFFFF00FFFFFF007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B00FFFFFF007B7B7B00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7BBD00000000000000
      0000000000000000000000000000000000000000000084000000FF0000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400FF000000FF0000000000000000000000000000007B7B7B00000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B00FFFFFF007B7B7B000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7BBD007B7BBD007B7B
      BD007B7BBD007B7BBD00BDBDDE00000000000000000000000000008484000084
      84000084840000848400FF000000FF00000000848400FF000000008484000084
      8400FF00000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B0000000000000000007B7B7B00000000007B7B7B007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDDE007B7BBD007B7B
      BD007B7BBD007B7BBD00BDBDDE00000000000000000000000000000000000084
      840000848400FF000000FF00000084000000FF00000084000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000084000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000390000003900000039
      0000003900000039000000390000003900000039000000390000003900000039
      0000003900000039000000390000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000313131006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B0039393900316B3100639C6300007B0000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B0000007B00000039000000000000DEDEDE009C9C9C008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400848484009C9C9C000000000000000000000000000000
      0000000000000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000006B6B6B00DEDEDE008CAD8C007394
      7300DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE009CBD9C00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE006B6B6B00316B310063DE63009CDE9C00427B
      4200217B210021BD210021DE210042BD420042BD420042BD420042BD420042BD
      420042BD420042BD4200007B000000390000BDBDBD0042000000420000004200
      0000420000004200000042000000420000004200000042000000420000004200
      0000420000004200000021212100848484000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      00000000000000000000C6C6C600000000006B6B6B00DEDEDE008CAD8C004284
      4200BDBDBD00DEDEDE00DEDEDE00DEDEDE00ADCEAD00428442005A9C5A00ADCE
      AD00DEDEDE00DEDEDE008CAD8C0021422100316B310063DE63009CDE9C0052CE
      5200000000000063000000DE000021DE210042BD420042BD420042BD420042BD
      420042BD420042BD4200007B0000003900007B7B7B0084420000848400004242
      0000636300004242000063630000424200006363000042420000424200004242
      0000424200008484000042000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000006B6B6B00DEDEDE008CAD8C004284
      42005A9C5A00DEDEDE00DEDEDE00DEDEDE008CAD8C0042844200529452008CAD
      8C00DEDEDE00DEDEDE00BDBDBD0021422100316B310063DE63007BFF7B00007B
      000021BD2100214221002184210021BD210021BD210021BD210000FF000052CE
      520042BD420042BD4200007B0000003900007B7B7B0084420000848400003939
      39004242000039393900424200003939390042420000393939007B7B7B007B7B
      7B00393939008484000042000000848484000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840000000000000000006B6B6B00ADCEAD00428442004284
      4200428442008CAD8C00DEDEDE00DEDEDE008CAD8C004284420042844200BDBD
      BD00DEDEDE00DEDEDE00DEDEDE006B6B6B00316B310063DE63009CDE9C002121
      21002163210042844200428442004284420042844200428442002184210000DE
      000052CE520042BD4200007B0000003900007B7B7B0084420000848400004242
      0000636300004242000063630000424200006363000042420000636300004242
      00006363000084840000420000008484840084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000006B6B6B008CAD8C00428442004284
      420073947300DEDEDE00DEDEDE009CBD9C004284420042844200428442004284
      4200BDBDBD00DEDEDE00DEDEDE006B6B6B00316B310063DE63009CDE9C00219C
      21000000000021212100212121002121210021212100636363004284420052AD
      520021DE210042BD4200007B0000003900007B7B7B0084420000848400003939
      3900424200003939390042420000393939004242000039393900424200003939
      3900424200008484000042000000848484008484840000000000000000000000
      000000000000000000008484840000000000FFFF0000FFFF0000FFFF0000FFFF
      000000000000C6C6C60084848400000000006B6B6B008CAD8C00739473008CAD
      8C00DEDEDE00DEDEDE00ADCEAD00428442004284420042844200428442006BAD
      6B00DEDEDE00DEDEDE00BDBDBD0031523100316B310063DE63009CDE9C0042BD
      420042BD420042BD420042BD420021DE210000DE0000215A2100638463004284
      420021DE210042BD4200007B0000003900007B7B7B0084420000848400004242
      0000636300004242000063630000424200006363000042420000636300004242
      0000636300008484000042000000848484000000000000000000000000000000
      00000000000000000000848484000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000C6C6C60084848400000000002142210073947300ADCEAD008CAD
      8C00DEDEDE00DEDEDE00CECECE00428442004284420042844200428442004284
      4200739473008CAD8C004284420052525200316B310063DE63009CDE9C0042BD
      420042BD420042BD4200217B2100638463006384630021422100428442004284
      420021DE210042BD4200007B0000003900007B7B7B0084420000848400003939
      3900424200003939390042420000393939004242000039393900424200003939
      3900424200008484000042000000848484008484840084848400848484008484
      840084848400848484008484840000000000FFFF000000000000FFFF0000FFFF
      000000000000C6C6C60084848400000000002142210042844200428442008CAD
      8C00DEDEDE00DEDEDE00DEDEDE008CAD8C009CBD9C008CAD8C00529452005A9C
      5A008CAD8C00428442004284420021422100316B310063DE63009CDE9C0042BD
      420042BD4200215A2100428442004284420042844200428442004284420063BD
      630021DE210042BD4200007B0000003900007B7B7B0084420000848400004242
      0000424200004242000042420000424200004242000042420000636300008484
      00008484000084840000420000008484840084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600848484000000000000000000FFFF0000FFFF00000000
      000000000000C6C6C60084848400000000002142210042844200428442004284
      42005A9C5A00DEDEDE00BDBDBD00428442007394730052945200428442004284
      42008CAD8C00428442004284420021422100316B310063DE63009CDE9C0042BD
      420042BD4200215A2100216321004284420021DE210000FF000000FF000000FF
      000000FF000021DE2100007B0000003900007B7B7B0084420000848400007B7B
      7B00000000000000000000000000000000000000000000000000424200008484
      0000848400008484000042000000848484008484840000000000848400008484
      0000848400008484000084848400000000000000000000000000000000000000
      0000000000000000000084848400000000002142210042844200428442004284
      420073947300ADCEAD00DEDEDE00ADCEAD004284420042844200428442004284
      420042844200428442004284420021422100316B310063DE63009CDE9C0042BD
      420042BD420042BD420021212100216321004284420042844200428442004284
      42002184210021DE2100007B0000003900007B7B7B0084420000848400004242
      0000424200004242000042420000424200004242000042420000636300008484
      00008484000084840000420000009C9C9C008484840000000000848400008484
      0000848400008484000084848400848484008484840084848400848484008484
      8400848484008484840084848400000000002142210042844200428442005A9C
      5A0042844200ADCEAD008CAD8C00DEDEDE007394730042844200428442004284
      420042844200428442004284420021422100316B310063DE63009CDE9C0042BD
      420042BD420042BD420042BD4200424242002121210021212100212121002121
      210021212100007B0000007B000000390000BDBDBD0021000000420000004200
      0000420000004200000042000000420000004200000042000000420000004200
      000042000000420000005A393900000000008484840000000000848400008484
      0000848400008484000084840000C6C6C6008484840000000000000000000000
      000000000000000000000000000000000000214221004284420073947300BDBD
      BD008CAD8C00DEDEDE00DEDEDE008CAD8C004284420073947300428442004284
      420042844200428442005A9C5A0021422100316B310063DE6300DEDEDE009CDE
      9C009CDE9C009CDE9C009CDE9C009CDE9C009CDE9C009CDE9C00393939000063
      00009CBD9C009CDE9C00007B0000003900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFF00008484
      0000848400008484000084840000C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000002121210021422100395A39005252
      5200395A39006B6B6B006B6B6B006B6B6B005252520021422100214221006B6B
      6B002142210021422100395A390000210000316B31006BEF6B007BFF7B007BFF
      7B007BFF7B007BFF7B007BFF7B007BFF7B007BFF7B007BFF7B007BFF7B000039
      0000006300007BDE7B0039BD3900003900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000390000397B3900397B3900397B
      3900397B3900397B3900397B3900397B3900397B3900397B3900397B3900397B
      3900397B3900397B3900397B3900003900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      000000000000000000000000000000000000000000003939390000000000BDBD
      BD00393939003939390000000000BDBDBD000000000000000000393939000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00000000000000000000000000000000000000000000FFFFFF00BDBDBD00FFFF
      FF00FFFFFF00FFFFFF00BDBDBD00FFFFFF00BDBDBD007B7B7B007B7B7B007B7B
      7B0000000000393939007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      00000000000000FFFF0000000000000000000000000000FFFF00000000000000
      000000FFFF00000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000000000000000000000000000000000003939FF00BDBDFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00FFFF
      FF00393939007B7B7B00BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000000FF000000FF
      00000000000000FF000000FF000000FF000000FF000000FF00000000000000FF
      000000FF000000000000000000000000000000000000FF7B7B007B39BD007B7B
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBDBD00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000FFFFFF000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000FF000000FF000000FF
      0000000000000000000000FF000000FF000000FF0000000000000000000000FF
      000000FF000000FF0000000000000000000000000000FFFFFF00FFFFFF00BDBD
      FF003939FF00FFBDBD00FF7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000000000FFFFFF007B7B7B00FFFFFF000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000FF000000FF000000FF
      000000FF0000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF0000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00BD397B003900BD00FFBDBD00FF393900BDBDFF007B7BFF007B7BFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000FFFFFF0000FFFF007B7B7B0000FFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF0000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBDFF003939FF003939FF00BDBDFF00FFFFFF00BDBDFF003939
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF000000000000FFFF00FFFFFF007B7B7B00FFFFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF0000000000000000000000000000FFFFFF00FFFFBD00FFFF
      3900FFFF7B00FFFF7B00FFFF3900FFBD7B00FF393900FF393900FF393900BD7B
      BD003939FF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000FF000000FF000000FF
      0000000000000000000000FF000000FF000000FF0000000000000000000000FF
      000000FF000000FF0000000000000000000000000000FFFFBD00FFFFBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFF3900FFFF7B00FFFF7B00FFFF7B00FFBD
      00007B7BBD00BDBD7B00FFFF7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000000000FFFFFF0000FFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000000000000000FF000000FF
      0000000000000000000000FF000000FF000000FF0000000000000000000000FF
      000000FF000000000000000000000000000000000000FFFF7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF7B
      7B00FFBDBD003939FF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FF393900BD7BBD003939FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF7B7B00FF393900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000212121003131
      3100525252000000000000000000000000000000000052525200212121004242
      4200313131000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006363630042BD
      BD0063DEDE000000000000000000000000000000000063DEDE0042BDBD0000FF
      FF00636363000000000000000000000000000000000000000000000000000000
      000000000000BD000000BD000000BD000000BD000000BD000000BD0000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002121210042424200424242004242
      4200424242004242420042424200424242004242420042424200424242004242
      42004242420042424200424242000000000000000000000000006363630042BD
      BD0063DEDE002121210021424200214242000021210063DEDE0042BDBD0000FF
      FF00636363002142420021424200002121000000000000000000000000000000
      0000BD000000BD000000BD00000000FFFF0000FFFF00BD000000BD000000BD00
      0000848484000000000000000000000000000000000021212100424242004242
      4200424242004242420042424200424242004242420042424200424242004242
      420042424200424242007B7B7B00000000007B7B7B00C6C6C600B5B5B500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500C6C6C6004242420000000000000000006363630042BD
      BD0063DEDE00316B6B0063DEDE0063DEDE00316B6B0063DEDE0042BDBD0000FF
      FF006363630063DEDE0063DEDE00214242000000000000000000FFFF0000BD00
      0000BD000000BD000000BD000000BD000000BD000000BD000000BD000000BD00
      0000BD00000084848400000000000000000000000000316B6B0063DEDE0063DE
      DE0063DEDE0063DEDE0063DEDE0063DEDE0063DEDE0063DEDE0063DEDE0063DE
      DE0063DEDE0063DEDE007B7B7B00000000007B7B7B0094949400424242004242
      4200424242004242420042424200424242004242420042424200424242004242
      42004242420063636300848484004242420000000000215A5A0031ADAD0031EF
      EF0031EFEF00007B7B00316B6B0063DEDE003131310063DEDE0052CECE0000FF
      FF0063636300639C9C0063DEDE002142420000000000FFFF0000BD000000BD00
      0000BD000000BD000000BD00000000FFFF0000FFFF00BD000000BD000000BD00
      0000BD000000BD000000848484000000000000000000007B7B0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF007B7B7B00000000007B7B7B0021212100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000848484004242420000393900427B7B0000FFFF0000FF
      FF0000FFFF0021DEDE00316B6B000000000073ADAD0042BDBD0031EFEF0000FF
      FF0073ADAD002121210063DEDE002142420000000000FFFF0000BD000000BD00
      0000BD000000BD000000BD00000000FFFF0000FFFF00BD000000BD000000BD00
      0000BD000000BD000000848484000000000000000000007B7B0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF007B7B7B00000000007B7B7B0042424200000000000000
      00000000000094949400BD7B7B00BD7B7B009494940000000000000000000000
      0000000000000000000084848400424242006363630042BDBD0000FFFF0000FF
      FF0000FFFF0042BDBD0063DEDE000000000042BDBD0042BDBD0000FFFF0000FF
      FF0042BDBD004242420063DEDE002142420000000000FFFF0000BD000000BD00
      0000BD000000BD000000BD000000BD00000000FFFF0000FFFF00BD000000BD00
      0000BD000000BD000000848484000000000000000000007B7B0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF007B7B7B00000000007B7B7B0042424200000000000000
      00006B6B6B0094313100DE390000FF000000AD3131006B6B6B00000000000000
      0000000000000000000084848400424242002121210021DEDE0052CECE0000FF
      FF0000FFFF0073ADAD00219C9C000039390042BDBD0042BDBD0000FFFF0000FF
      FF0042BDBD004242420063DEDE002142420000000000FFFF0000BD000000BD00
      0000BD000000BD000000BD000000BD000000BD00000000FFFF0000FFFF00BD00
      0000BD000000BD000000848484000000000000000000007B7B0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF007B7B7B00000000007B7B7B0042424200000000000000
      00007B7B7B0084000000FF7B0000FF000000BD0000007B7B7B00000000000000
      0000000000000000000084848400424242000000000042BDBD0052CECE0000FF
      FF0000FFFF0052CECE0052525200316B6B0042BDBD0063DEDE0000FFFF0000FF
      FF0063DEDE004242420063DEDE002142420000000000FFFF0000BD000000BD00
      0000BD00000000FFFF00BD000000BD000000BD00000000FFFF0000FFFF00BD00
      0000BD000000BD000000848484000000000000000000007B7B0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF007B7B7B00000000007B7B7B0021212100000000000000
      000031313100B59494009C390000BD000000B594940031313100000000000000
      000000000000000000008484840042424200000000000039390052CECE0031EF
      EF0063DEDE00219C9C0031ADAD0063DEDE00007B7B0052CECE0031EFEF0063DE
      DE00219C9C0031ADAD0063DEDE002142420000000000FFFF0000BD000000BD00
      0000BD00000000FFFF0000FFFF00BD000000BD00000000FFFF0000FFFF00BD00
      0000BD000000BD000000000000000000000000000000007B7B0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF007B7B7B00000000007B7B7B0000000000BDBD00005A5A
      000000000000313131007B7B7B007B7B7B003131310000000000000000005A5A
      0000BDBD000000000000848484004242420000000000000000000000000084BD
      BD005252520031ADAD0063DEDE0063DEDE0063DEDE000039390084BDBD005252
      520031ADAD0063DEDE0063DEDE00214242000000000000000000FFFF0000BD00
      0000BD000000BD00000000FFFF0000FFFF0000FFFF0000FFFF00BD000000BD00
      0000BD00000000000000000000000000000000000000397B7B00007B7B00007B
      7B00007B7B00007B7B00007B7B00007B7B00007B7B0042BDBD0042BDBD0042BD
      BD0042BDBD00007B7B00BDBDBD00000000007B7B7B0031313100636363006363
      6300636363000000000042424200424242004242420021212100000000003131
      31006363630031313100B5B5B5004242420000000000000000004242420000FF
      FF0042BDBD00316B6B0063DEDE0063DEDE0063DEDE004242420000FFFF0042BD
      BD00316B6B0063DEDE0063DEDE0021424200000000000000000000000000FFFF
      0000BD000000BD000000BD000000BD000000BD000000BD000000BD000000BD00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000397B7B00007B7B00007B
      7B00397B7B000000000000000000000000007B7B7B0094949400525252000000
      000052525200848484000000000084840000848400000000000021212100A5A5
      A5008484840094949400C6C6C60042424200000000000000000031313100316B
      6B006363630063DEDE0063DEDE0063DEDE0063DEDE00639C9C00316B6B006363
      630063DEDE0063DEDE0063DEDE00214242000000000000000000000000000000
      0000FFFF0000BD000000BD000000BD000000BD000000BD000000BD0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00ADADAD007B7B7B007B7B7B009C9C9C00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE005A5A5A000000000000000000316B6B0063DE
      DE0063DEDE0063DEDE0063DEDE0063DEDE0063DEDE0063DEDE0063DEDE0063DE
      DE0063DEDE0063DEDE0063DEDE00214242000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000393900316B
      6B00316B6B00316B6B00316B6B00316B6B00316B6B00316B6B00639C9C0063DE
      DE0063DEDE0052ADAD0052ADAD00214242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000316B
      6B00316B6B00316B6B00316B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF0000000000000000000000
      00000000000000000000000000000000000000000000FF00FF0084848400C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000008400000084
      0000008400000084000000840000008400000084000000000000848484008484
      8400C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000008400000084
      0000008400000084000000840000008400000084000000000000008484000000
      0000C6C6C600C6C6C60000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      000000000000BDBDBD00000000007B7B7B00000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000008400000084
      0000008400000084000000840000008400000084000000000000008484000000
      0000000000008484840000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000BDBDBD0000BD000000000000007B00000000000000FF0000003900000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000008400000084
      0000008400000084000000840000008400000084000000000000008484000000
      00000000840084848400C6C6C600000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000007B000000BD0000000000000000000000000000397B390000FF00007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000000000000000000084840000000000000000
      0000000000000000000000000000000000000000000000840000008400000084
      0000008400000084000000840000008400000084000000000000008484000000
      0000000084008484840084848400C6C6C6000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      00007B7B7B00BDBDBD000000000000000000000000007B7B7B0000FF00007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000848400000000000084840000848400000000
      0000000000000000000000000000000000000000000000840000008400000084
      000000840000008400000084000000840000008400000000000000FFFF000000
      0000000084008400000000000000C6C6C6000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000BD0000397B39000000
      0000000000000000000000000000000000000000000000000000848400008484
      0000848400008484000084840000848400008484000000000000848400008484
      0000000000000000000000000000000000000000000084848400008400000000
      000000000000000000000000000000000000000000000084000000FFFF000000
      0000000084008400000000000000C6C6C6000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000397B390000000000397B3900000000000000
      0000000000000000000000000000000000000000000000000000848400008484
      0000848400008484000084840000848400008484000084840000000000008484
      0000848400000000000000000000000000000084000000000000000000000084
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000084008400000000000000C6C6C6000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000BDBDBD00003900000000000000BD00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848400008484
      0000848400008484000084840000848400008484000000000000848400008484
      0000000000000000000000000000000000000000000000848400C6C6C60000FF
      FF00008484000084840000848400008484000084840000848400008484000000
      8400000084008400000000000000C6C6C6000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000397B390000FF000000000000BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000848400000000000084840000848400000000
      0000000000000000000000000000000000000000000000848400008484000084
      8400000084000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000008400FF00000000000000C6C6C6000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000007B0000397B3900000000000000000000000000BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000000000000000000084840000000000000000
      000000000000000000000000000000000000000000000000000000008400C6C6
      C6000000FF000000840000008400000084000000840000008400000084000000
      840000000000FF00000000000000C6C6C6000000000000000000BD000000BD00
      0000BD000000BD000000BD000000BD000000BD000000BD000000BD000000BD00
      0000BD000000BD00000084848400000000000000000000000000000000000000
      0000397B390000BD0000000000007B7B7B000000000000BD0000397B39000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      84000000840084000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000084848400000000000000000000000000BD000000BD00
      0000BD000000BD000000BD000000BD000000BD000000BD000000BD000000BD00
      0000BD000000BD00000084848400000000000000000000000000000000000000
      000000000000397B39000000000000FF000000000000397B3900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FF000000C6C6C60084000000840000008400000084000000840000008400
      00008400000084000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000290000006B0000007B0000007B0000007B00000029000000
      0000000000000000000000000000000000000000000021212100212121002121
      2100212121002121210021212100212121002121210021212100212121002121
      2100212121002121210021212100210000000000000000000000000000000000
      00007B7B7B00007B7B00007B7B00212100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      290000005A000000DE000000EF000000DE000000EF000000EF000000FF000000
      9C0000005A000000000000000000000000005A39390042424200424242009C9C
      5A009C9C5A00BDDE5A005A7B42007B5A5A009C9C5A009C9C5A009C9C5A009C9C
      5A0042424200424242009C9C5A007B7B39000000000000000000000000000000
      0000393939007BFFFF0021DEBD0042BD7B002121000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004200000063002100840000006300210084002100420021004200
      0000210000000000000000000000000000000000000000000000000000000000
      5A0000007B0000005A000000AD000000FF000000AD000000BD0000007B000000
      8C000000BD000000000000000000000000007B7B3900FFFF7B00FFFF7B00FFFF
      7B00FFFF7B00FFFF7B00FFFF7B00FFFF7B00FFFF7B00FFFF7B00FFFF7B00FFFF
      7B00DEBD7B00FFFF7B00FFFF7B007B7B39000000000000000000000000000000
      000000000000397B7B0000FFFF0021DEBD0042BD7B0021210000000000000000
      0000000000000000000000000000000000000000000000000000000000004200
      00008400210084004200840042009C007B0084004200BD009C00BD00BD009C00
      7B00840042002100210000000000000000000000000000000000000000000000
      6B00000039000000290000006B000000DE000000EF000000AD00000039000000
      39000000CE000000000000000000000000007B7B3900FFFF7B00FFFF7B00FFFF
      7B00FFFF7B00FFFF7B00FFFF7B00FFFF7B00FFFF7B00FFFF7B00397BFF007B7B
      FF00BDBDBD00FFFF7B00FFFF7B007B7B39000000000000000000000000003939
      390039FFFF0000FFFF0000FFFF0000FFFF0021DEBD0021DEBD00212100000000
      0000000000000000000000000000000000000000000000000000420000007B00
      3900840021009C009C00BD00BD009C009C009C009C009C009C00BD00BD009C00
      9C00840084009C009C0021002100000000000000000000000000000029000000
      29000000290000008C0000009C000000CE000000EF000000CE0000009C000000
      7B00000029000000000000000000000000007B7B3900FFFF7B00FFFF7B00FFFF
      7B00FFFF7B00FFFF7B00FFFF7B00FFFF7B00FFFF7B00FFFF7B00397BFF00397B
      FF00BDBDBD00FFFF7B00FFFF7B007B7B39000000000000000000000000000000
      00003939390039FFFF0000FFFF0021DEBD000039390000000000000000000000
      0000000000000000000000000000000000000000000000000000630021008400
      42009C009C009C009C009C009C00BD00BD009C009C00840084009C009C008400
      8400BD00BD00BD00BD00630063000000000000000000000000000000BD000000
      DE000000FF000000BD0000008C0000009C0000009C000000CE000000BD000000
      FF0000007B000000CE0000005A00000000007B7B3900FFFF7B00FFFF7B00FFFF
      7B00FFFF7B00FFFF7B00FFFF7B00FFFF7B00FFFF7B00FFFF7B00DEDE9C00DEDE
      9C00FFFF7B00FFFF7B00FFFF7B007B7B39000000000000000000420000008400
      0000840000009C39390039FFFF0000FFFF0042BD7B0000393900840000008400
      00008400000084000000210000000000000000000000420000009C007B009C00
      7B0084008400840084009C009C009C009C00BD00BD00BD00BD00BD00BD00BD00
      BD00BD00BD009C009C00BD00BD00000000000000000000000000000029000000
      7B00000000000000000000005A0000009C000000AD0000009C00000029000000
      0000000029000000BD0000005A00000000007B7B3900FFFF7B00FFFF7B00FFFF
      7B00FFFF7B00FFFF7B00FFFFBD00FFFFBD00FFFF7B00FFFF7B00ADADAD006BEF
      EF00FFFF7B00FFFFBD00FFFFFF007B7B7B004200000042000000420000004200
      00005A0000007B0000003939390039FFFF0000FFFF0042BD7B00003939007B00
      0000BD0000004200000042000000420000000000000084004200840042009C00
      7B0084008400BD00BD009C009C00DE00DE009C009C00BD00BD00BD00BD00BD00
      BD00DE00DE00DE00DE00BD00BD005A005A000000000000000000000000000000
      000000ADAD00006B6B0000295A0000006B0000006B0000000000005A5A0000BD
      BD00002929000000000000000000000000007B7B3900FFFF7B00FFFFBD00FFFF
      BD00FFFFFF00FFFFBD00FFFF7B00FFFF7B00FFFF7B00BDBD7B0000BDFF0000FF
      3900BD7B0000FFFF7B00FFFFBD007B7B3900BD000000BD000000BD000000BD00
      00000000000000000000000000003939390000BDBD0000FFFF0042BD7B000039
      39007B000000BD000000BD000000BD00000000000000630000009C005A009C00
      9C009C009C009C009C00BD00BD00BD00BD00DE00DE00DE00DE00DE00DE00BD00
      BD00DE00DE00BD00BD00BD00BD005A005A0000005A0000005A0000005A000000
      5A0000005A0000008C000000BD0000009C0000005A000000BD0000005A000000
      5A0000005A0000005A0000005A0000005A007B7B3900FFFF7B00FFFF7B00FFFF
      7B00FFFFBD00FFFFFF00FFFFFF00FFFF7B00BDBD7B0000BDFF0000FF3900BD39
      00009C0021005A399C00FFFF7B007B7B3900000000007B000000840000007B39
      3900427B7B00427B7B00427B7B00427B7B00427B7B00427B7B00427B7B00427B
      7B004200000084000000420000000000000021000000840000009C007B008400
      84009C009C00BD00BD00DE00DE00BD00BD00DE00DE00DE00DE00DE00DE00FF00
      FF00BD00BD00DE00DE00BD00BD005A005A00000029000000CE000000EF000000
      FF000000FF000000FF000000EF0000008C0000005A000000EF000000DE000000
      DE000000DE000000DE000000DE00000029007B7B3900FFFF7B00FFFF7B00FFFF
      7B00FFFFBD00FFFF7B00FFFF7B00FFFF7B0000BDFF0000FF3900BD3900009C00
      21002100DE0000BDFF007BDE7B007B7B390000000000000000009C000000BD00
      0000BD000000BD000000BD000000BD000000BD000000BD000000BD000000BD00
      0000BD0000007B000000000000000000000042000000840042009C009C009C00
      9C009C009C00BD00BD00BD00BD00BD00BD00DE00DE00BD00BD00FF00FF00DE00
      DE00FF00FF00DE00DE00DE00DE007B007B00000000000000290000005A000000
      DE000000FF0000009C0000005A0000008C0000008C0000005A000000EF000000
      FF000000DE000000AD0000002900000000007B7B3900FFFF7B00FFFF7B00FFFF
      7B00FFFF7B00FFFF7B00FFFF7B00FFFF7B0000FF3900BD3900009C0021002100
      DE0000BDFF00009C3900BD9C39007B7B39000000000000000000000000000000
      0000000000003939390039FFFF0000FFFF0000FFFF0000FFFF0021DEBD00007B
      7B00007B7B00215A3900000000000000000000000000840021009C009C009C00
      9C00BD00BD009C009C00BD00BD00DE00DE00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00DE00DE000000000000000000000000000000BD000000
      6B000000FF0000008C000000CE0000005A000000BD000000CE000000BD000000
      DE0000005A0000005A0000000000000000007B7B3900FFFFBD00FFFFFF00FFFF
      7B00FFFF7B00FFFF7B00FFFF7B00FFFF7B00BD3900009C0021002100DE0000BD
      FF00009C3900BD210000DE7B39007B7B39000000000000000000000000000000
      000000000000000000003939390039FFFF0000FFFF0000FFFF0000FFFF00427B
      39000000000000000000000000000000000000000000630000009C007B009C00
      9C00BD00BD00BD00BD00DE00DE00FF00FF00FF00FF00FF00FF00FF00FF00FF7B
      FF00FF7BFF00FF39FF00BD00BD0000000000000000000000000000005A000000
      9C000000FF000000EF000000DE0000009C000000EF000000EF000000FF000000
      6B000000BD000000290000000000000000007B7B3900FFFFFF00FFFFBD00FFFF
      FF00FFFFBD00FFFF7B00FFFF7B00FFFF7B00BD395A002100DE0000BDFF00009C
      3900BD2100009C002100DEBD9C007B7B39000000000000000000000000000000
      00000000000000000000000000003939390039FFFF0000FFFF0021DEBD0021DE
      BD00427B39000000000000000000000000000000000021000000840042009C00
      9C00BD00BD00BD00BD00DE00DE00DE00DE00DE00DE00FF00FF00FF39FF00FF39
      FF00FF7BFF00FF39FF0039003900000000000000000000000000000029000000
      8C000000FF000000FF000000FF000000AD000000FF000000FF000000FF000000
      8C0000008C000000000000000000000000007B7B3900FFFFBD00FFFFBD00FFFF
      FF00FFFFFF00FFFFBD00FFFF7B00FFFF7B00FFFF7B007BBDBD00009C3900BD21
      0000BD393900DEBD5A00FFFF7B007B7B39000000000000000000000000000000
      00003939390039FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0021DE
      BD0021DEBD00427B390000000000000000000000000000000000210021008400
      840084008400BD00BD00DE00DE00BD00BD00DE00DE00FF00FF00FF00FF00FF39
      FF00FF39FF003900390000000000000000000000000000000000000000000000
      8C000000DE000000FF000000FF000000BD000000FF000000FF000000EF000000
      BD00000029000000000000000000000000007B7B3900FFFF7B00FFFFFF00FFFF
      FF00FFFFBD00FFFFFF00FFFF7B00FFFF7B00FFFF7B00FFFF7B00FFFF7B00FFFF
      7B00FFFF7B00FFFF7B00FFFF7B007B7B39000000000000000000000000000000
      0000000000003939390039FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0021DEBD0021DEBD00427B3900000000000000000000000000000000002100
      21007B007B009C009C009C009C00BD00BD00DE00DE00DE00DE00DE00DE00BD00
      BD00390039000000000000000000000000000000000000000000000000000000
      00000000290000005A0000005A000000390000007B0000006B0000005A000000
      000000000000000000000000000000000000393900007B7B39007B7B39007B7B
      39007B7B39007B7B39007B7B39007B7B39007B7B39007B7B39007B7B39007B7B
      39007B7B39007B7B39007B7B3900393939000000000000000000000000000000
      0000000000000000000039393900007B7B00007B7B00007B7B00007B7B00007B
      7B00007B7B00007B7B00007B7B00000000000000000000000000000000000000
      0000000000000000000042004200420042005A005A0042004200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000007B7B00007B7B00007B7B00007B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003131310031313100210000002100000021000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEDEDE00BDBDBD00BDBDBD00DEDEDE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003131310094949400C6C6C60063636300393939007B7B7B003939
      3900000000000000000000000000000000000000000000000000000000000039
      3900007B7B0000BDBD0000FFFF0000FFFF0000FFFF0000FFFF0000BDBD00007B
      7B00003939000000000000000000000000000000000000000000000000000000
      00000000000073733100215A0000397B3900395A390042000000210000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BD424200FF000000FF000000BD2100007B420000BD424200BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      000094949400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60031313100BDBD
      BD00000000000000000000000000000000000000000000000000003939000000
      0000000000000039390000FFFF0000FFFF0000FFFF0000FFFF00003939000000
      000000BDBD000039390000000000000000000000000000000000000000000000
      0000210000005252310000BD000039FF39007BFF7B00395A3900420000000000
      000000000000000000000000000000000000000000000000000000000000BD7B
      7B00FF000000FF000000FF000000FF0000007B4200007B420000FF000000FF00
      0000BD7B7B000000000000000000000000000000000000000000000000009494
      94006363630000000000C6C6C6000000000063636300C6C6C600C6C6C6003939
      390000000000000000000000000000000000000000000039390000FFFF0000BD
      BD00007B7B00003939000039390000FFFF0000FFFF00003939000039390000BD
      BD0000FFFF0000FFFF0000393900000000000000000000000000210000002100
      00004221000052523100009C000000FF000039FF3900397B3900420000004200
      0000210000000000000000000000000000000000000000000000BD7B7B00FF00
      0000FF000000FF000000FF000000FF0000000084000000840000FF000000FF00
      0000FF000000BD7B7B000000000000000000000000000000000000000000C6C6
      C600CECECE00CECECE00CECECE00CECECE00C6C6C600C6C6C600C6C6C6003939
      3900000000000000000000000000000000000000000000BDBD0000FFFF0000FF
      FF0000FFFF0000FFFF00007B7B000000000000000000007B7B0000FFFF0000FF
      FF0000FFFF0000FFFF0000BDBD00000000000000000000000000636363005252
      3100422100007373310000210000004200000042000021210000523131002100
      00005231310031313100000000000000000000000000DEDEDE00DE212100FF00
      0000FF000000FF000000BD210000008400000084000000840000BD210000FF00
      0000FF000000DE212100DEDEDE0000000000000000000000000000000000DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00CECECE00C6C6C600C6C6C6007B7B
      7B00000000000000000000000000000000000000000000FFFF0000FFFF00007B
      7B0000BDBD00007B7B000039390000393900003939000039390000BDBD00007B
      7B0000BDBD0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000007373310042420000420000004200000042000000313131000000
      00000000000000000000000000000000000000000000ADADAD00FF000000FF00
      0000FF000000FF0000000084000000840000008400000084000000840000BD21
      0000FF000000FF000000ADADAD00000000000000000000000000000000009C9C
      9C00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00C6C6C600C6C6C6003131
      310000000000000000000000000000000000007B7B0000FFFF0000FFFF000039
      3900000000000039390000FFFF0000FFFF0000FFFF0000BDBD00000000000000
      000000BDBD0000FFFF0000FFFF00007B7B000000000000000000000000000000
      00000000000073733100215A3900397B7B00395A5A0042000000210000000000
      00000000000000000000000000000000000000000000CE525200FF000000FF00
      0000FF000000FF0000000084000000840000008400000084000000840000BD21
      0000FF000000FF00000052945200000000000000000000000000000000000000
      0000DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00C6C6C600C6C6C6000000
      000000000000000000000000000000000000007B7B0000FFFF0000FFFF0000BD
      BD0000BDBD0000FFFF0000FFFF00003939000039390000FFFF0000FFFF00007B
      7B0000FFFF0000FFFF0000FFFF00007B7B000000000000000000000000000000
      0000210000005252310000BDBD0039FFFF007BFFFF00395A5A00420000000000
      00000000000000000000000000000000000000000000BD424200FF000000FF00
      0000FF00000039630000BD2100007B4200007B420000BD210000BD210000FF00
      0000FF000000BD210000428442000000000000000000000000007B7B7B003939
      39006B6B6B00DEDEDE00DEDEDE00DEDEDE00DEDEDE00CECECE00C6C6C6006363
      630063636300636363000000000000000000007B7B0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00397B39007B7B00007B7B0000397B390000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00007B7B000000000000000000210000002100
      00004221000052523100009C9C0000FFFF0039FFFF00397B7B00420000004200
      00002100000000000000000000000000000000000000BD424200FF000000FF00
      00003963000039630000FF000000FF0000007B420000FF000000FF000000FF00
      0000BD21000000840000428442000000000000000000BDBDBD00BDBDBD00BDBD
      BD007B7B39003939000039393900ADADAD007B7B000000000000949494003131
      310063636300313131000000000000000000007B7B0000FFFF0000FFFF0000FF
      FF0000FFFF0000BDBD000000000039390000393900000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00007B7B000000000000000000636363005252
      3100422100007373310000212100004242000042420021210000523131002100
      00005231310031313100000000000000000000000000CE525200FF000000BD21
      00000084000039630000FF000000BD2100007B420000FF000000FF000000FF00
      00007B4200000084000052945200000000000000000000000000000000000000
      0000397B390039390000313131006B6B6B007B7B0000000000009C9C9C00007B
      7B00003939000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF00007B7B007B7B000039390000393900007B7B0000007B7B0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000007373310042420000420000004200000042000000313131000000
      00000000000000000000000000000000000000000000ADADAD00FF0000000084
      000000840000008400000084000000840000FF000000FF000000FF000000FF00
      0000FF00000039630000ADADAD00000000000000000000000000000000000039
      390000FFFF0039BDBD00DEDEDE00DEDEDE00DEDEDE00EFEFEF003939390000FF
      FF0000FFFF000000000000000000000000000000000000BDBD0000FFFF0000FF
      FF0000FFFF0000000000FFFF00007B7B00007B7B0000FFFF00000000000000FF
      FF0000FFFF0000FFFF0000BDBD00000000000000000000000000000000000000
      000000000000737331002121390021215A002121420042000000210000000000
      00000000000000000000000000000000000000000000DEDEDE00DE2121000084
      00000084000000840000008400000084000039630000FF000000FF000000FF00
      0000BD2100009C422100DEDEDE000000000000000000000000000000000000BD
      BD00007B7B000000000039393900BDBDBD00ADADAD0000000000000000000000
      000000BDBD00000000000000000000000000000000000039390000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000393900000000000000000000000000000000000000
      000021000000525231000000BD002121DE004242BD0021214200420000000000
      0000000000000000000000000000000000000000000000000000BD7B7B000084
      00000084000000840000008400000084000000840000FF000000FF0000007B42
      0000008400007B9C7B00000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000007B7B0000000000000000000000000000000000000000000039390000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000039390000000000000000000000000000000000210000002100
      0000422100005252310000009C000000FF002121DE0021215A00420000004200
      0000210000000000000000000000000000000000000000000000000000007B9C
      7B0000840000008400007B4200007B420000396300007B420000FF0000003963
      00007B9C7B00000000000000000000000000000000000000000000000000007B
      7B00003939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000039
      390000BDBD0000BDBD000000000000000000000000000000000000BDBD0000BD
      BD00003939000000000000000000000000000000000000000000636363005252
      3100422100007373310000002100000042000000420021210000523131002100
      0000523131003131310000000000000000000000000000000000000000000000
      0000BDBDBD00428442007B420000BD2100007B420000FF000000BD424200BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000393900000000000000000000393900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005252310031313100313131003131310031313100313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEDEDE00BDBDBD00BDBDBD00DEDEDE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C4242009C4242004221
      2100000000000021420000214200000000000000000000000000000000000000
      0000000000000042840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000021212100424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000052525200CE5252006321
      2100000000000021420000214200000000000000000000000000000000000000
      0000000000000042840000000000212121000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002121210021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      00000000000000000000000000000000000000000000AD313100CE5252006321
      2100002121000021630000214200002142000021420000214200002142000021
      4200002142000021630000212100424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000212121002121210000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000FF000000000000000000
      00000000000000000000000000000000000000000000CE525200CE5252006321
      210000212100216363006B8CAD006384A5006384A5006384A5006384A5006384
      A500002142000021420042426300424242000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A2100005A5A
      000039390000212121000000000000000000000000000000000084848400FFFF
      FF0000FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000
      000000FFFF0084848400000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000FF000000000000000000
      00000000000000000000000000000000000000000000DE636300CE5252006321
      210000000000215A2100DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600212121004242420021212100212121000000000000000000000000000000
      000000000000000000000000000000000000000000009C2100007B7B0000BDBD
      00005A5A39000000000000000000000000000000000084848400FFFFFF0000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF00000000000000000084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      00000000000000000000000000000000000000000000DE636300CE5252004221
      21000000000042424200DEDEDE00C6C6C600B5B5B500C6C6C600C6C6C600C6C6
      C600000000000000000042424200000000000000000000000000000000000000
      0000000000000000000000000000000000009C2100009C9C0000BDBD0000DEDE
      7B007B3900000000000000000000000000000000000084848400FFFFFF000000
      000000FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000
      00008484840000000000848484000000000000000000000000000000FF000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000007B007B0094527300BD6363006342
      420000000000212121007B7B7B007B7B7B007B7B7B006B6B6B006B6B6B009C9C
      9C00000000002121210021212100000000000000000000000000000000000000
      00000000000000000000000000009C2100007B7B0000BDBD0000DEDE7B00BD39
      00000000000000000000000000000000000084848400FFFFFF000000000000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF000000000084848400848484000000000000000000000000000000FF000000
      FF0000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000009C009C005A005A00BD6363000000
      2100000063000000420000002100000042004242840000002100393939003939
      3900212121000000000000000000000000000000000000000000313131000000
      000000000000000000005A212100BDBD0000BDBD0000DEDE7B00BD3900000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000084848400000000000000000000000000000000000000
      FF000000FF000000000000000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000000000000390000006B3131000000
      9C0000006300000042000000420000009C004242420039393900CECECE002121
      2100949494007373730000000000000000000000000000000000313131003131
      31003131310094949400525252005A5A2100DEDE7B00BD390000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840000FFFF0084848400000000000000000000000000000000000000
      00000000FF000000FF000000000000000000FF00000000000000000000000000
      000000000000000000000000000000000000000000000000000000005A000000
      BD000000DE000000DE0000009C00212121005A5A5A009C9C9C00B5B5B500CECE
      CE00A5A5A500C6C6C60021212100000000000000000000000000000000003131
      310094949400949494005A5A21005A5A5A005A21210000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF000000
      000000FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000
      000000FFFF000000000084848400000000000000FF000000FF00000000000000
      00000000FF000000FF00000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      210000004200000042002121210039395A003939390021212100CECECE00C6C6
      C600C6C6C600A5A5A50000000000000000000000000000000000000000000000
      0000313131007B7B0000BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF000000000000FFFF000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000FF000000FF00000000000000
      00000000FF000000FF00000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      21000000420000000000000000003939390000000000ADAD3100BDBD7B00CECE
      CE00C6C6C600C6C6C60000000000000000000000000000000000000000000000
      00007B7B0000313131009C9C9C00313131000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF000000
      000000FFFF000000000000FFFF0000000000FFFFFF0084848400848484008484
      840084848400848484008484840000000000000000000000FF000000FF000000
      FF000000FF0000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000039
      7B00397B7B000000420000000000000000000000000000000000BDBD0000BDBD
      7B00CECECE009494940000000000000000000000000021212100000000007B7B
      0000000000000000000031313100313131000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      000000000000000000000000000000000000000042000000210000000000397B
      BD00BDFFFF000000420000000000000000000000000000000000000000007B7B
      00008C8C8C0000000000000000000000000000000000393900005A5A21000000
      0000000000000000000000000000313131003131310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000002100000021000000
      2100215A7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000393900002121
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000042000000
      0000000042000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0084000000000000000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000084000000FFFF0000FFFF0000FF
      FF000084000000FFFF00008400000084000000FFFF000084000000FFFF000084
      00000084000000FFFF0000840000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0084000000000000000000000000FFFF00000000000084
      00000000000000FFFF00008400000000000000FFFF000000000000FFFF000084
      00000000000000FFFF0000840000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400848484000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000000FFFF00008400000084
      00000000000000FFFF00008400000000000000FFFF000000000000FFFF000084
      00000000000000FFFF0000840000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FFFF0000FFFF0000000000848484008484
      84000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFFFF008400
      0000840000008400000084000000000000000000000000FFFF0000FFFF000084
      0000000000000084000000FFFF0000FFFF00008400000000000000FFFF000084
      00000000000000FFFF0000840000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000848484000000000000FFFF0000FFFF00000000008484
      84000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000FFFFFF008400000000000000000000000000000000FFFF00008400000084
      00000084000000FFFF00008400000084000000FFFF000000000000FFFF000084
      00000000000000FFFF0000840000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000FFFF00008400000084
      00000000000000FFFF00008400000000000000FFFF000000000000FFFF000084
      00000000000000FFFF0000840000000000000000000000000000000000000000
      000000FFFF00000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000084000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF000000000000FFFF00008400000000000000FFFF000000000000FFFF000084
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      0000000000000084000000840000000000000084000000000000008400000000
      0000000000000000000000840000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      84000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300100000100010000000000800900000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF8007F83FA2DF
      FFFF8007E7CF8009807F8007DFF78001803F8001BFFB8001801F8001BC7B8001
      800F80017BBD8001C007800177DD8001E003800176DD8001F0018FC177DD8001
      F80080017BBD8001FC008001BC7B8001FE00E3F1BFFB8001FF00E001DFF78001
      FFFFE001E7CF8001FFFFFFFFF83F0000F862F801FFFFFFFF80E0F801F9FFFFFF
      01E0F801F0FF07C101E0F801E07F07C131E1F801C03F07C131C10001801F0101
      C1810001800F0001C307000180070001FE17000386030001CC37000F8F018003
      A877007F9F81C10740F7007FBFC1C10701E3007FFFE1E38FC1E300FFFFF1E38F
      C0E301FFFFF9E38FC83F03FFFFFDFFFFC000FFFFFFFFFFFF8000FFFFFFFFFFFF
      8000FFFFE000E0008010E00FC000C0008008E00FC550C4508000E00F8AA88AA8
      8000E00F955095500000E00F2AA028A00000E00F000400040000E00F00000000
      0001E00F9414941400FFE00F8A00820001FFE01F94018001F3FFE03FC03FC03F
      F7FFFFFFE0FFE0FFFFFFFFFFF3FFF3FFFFF0F81F000FFFFFFFE0F00F0007FFFF
      FFC0C0030003FC3FFF81C0030003F00FF08380010001E007C00700000000E007
      801F00000000C003801F00000000C003000F00000000C003000F00008000C003
      000F00008000C003000F8001C000E007000FC003C001E007801FC003E001F00F
      801FF00FE1FFFC3FE07FF81FFFFFFFFF8000FFFFFFFFFFFF000011FFFFFF1FF8
      00000000FC1F000000000000F007000000000000E003800700000000E003800F
      00000000E003801F00000000C003001F00000000E003001F00000000E003000F
      00000000E007E00700000000F007F00000000000FC1FF00000000000FFFFF1F8
      0000C200FFFFFFFF0000FCF3FFFFFFFFFFDFFFFFFFFFFFFFFFCF9FFFFFFFC007
      FFC70FFFFFFFC007000307FFFFFFC007000107FFFC7FC006000083FFFC7FC005
      0001C1E3FC7FC0030003F0E1E00FC0070007F841E00FC007000FFC07E00FC003
      001FFE0FFC7FC00F007FFE0FFC7FC00700FFFE1FFC7FC00701FFFC3FFFFFC007
      03FFF0FFFFFFFFFFFFFFFFFFFFFFFFFF8000FFFFF00FFFFF0000E3C7F00FFC00
      00008181F80FFC0000008001E80FFC00000000008010FC0000000000A81CEC00
      00000000B81CE40000008001BFFCE00000008181BFFC00000000E7C7B00C0001
      0000CFC1B00C00030000CF81B80800070000FF098000000F0000FFFF8010E3FF
      0000FFFFF81BE7FF0001FFFFF81FEFFFFFFFFF80FFFFFFFFFFFFFB80FFFFFFFF
      FFFFF980FF7FFEFFFEFF8080FF3FFCFFFE7FF980FF3FFCFFFE3FFB80FF1FF8FF
      E01FFF80C007E003E00FE080C003C003E007E080C003C003E00F80FFC007E003
      E01F80FFFF1FF8FFFE3F80FFFF3FFCFFFE7F81FFFF3FFCFFFEFF83FFFF7FFEFF
      FFFF87FFFFFFFFFFFFFFFFFFFFFFFFFFDDDDFFFF8000FFFFD555FFFF0000FFFF
      0000FFFFE00FE00FDFFFFF7FE00FE00F87FCFE7FE00FE007DBFBFC7FE00FE007
      0000F807E00FE003DDF7F007E00FE0039EEFE007E00FE00FDF1FF007E00FF83F
      0000F807E00FFC3FDFFFFC7FE00FF8BF9FFFFE7FFFFFF9FFDFFFFF7FF81FFFFF
      0000FFFFF81FFFFFFFFFFFFFF81FFFFFFC00FF81FFFFFC1FFC00FF81F83FF027
      FC00FFBFE00FE4CBFC00F03FC007D8F1E000F7BF80039871E100F7818003B872
      E000F7810001307CE00707FF0001205C8007F7810001000C8807F7810001200C
      8007F7BF00014605801FF03F80039001801FFFBF8003A003A01FFF81C007C347
      801FFF81E00FE40FFFFFFFFFF83FF83FFFFF8000FFFFFE01000000008000FC00
      000000000000FDFC000008000000FE0000000000000080010000000000000000
      0000000000007C08000000000000808000000000000000480000000000000098
      000000000FC000000000000000000001000000000001003F00000000FFFF003F
      00000000FFFF003FFFFF0000FFFF007FFEFFF83FFFFFFFFFFC7FE00FA2DFFFFF
      FC7FC0078009C007D83780038001E7E7E00F80038001F3F7E00F00018001F9F7
      C00700018001FCFFC00700018001FE7F000100018001FF3FC00700018001FE7F
      C00780038001FCFFE00F80038001F9F7E00FC0078001F3F7D837E00F8001E7E7
      FEFFF83F8001C007FEFFFFFF0000FFFFFFFFFFFFFFFFC307FC1FFFFFFFFFC307
      F80FFFFF0000C000F00780010000C000C0038001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100008000
      800380010000C000C00780010000C000E00FFF870000C000F01FFFFF0000C000
      F83FFFFF0000C000FFFFFFFFFFFFFFC0FFFFFFFF000FFFFFFFFFFFFF0007FFFF
      FD7FFFFF0003C001F83FFB7F0003C001F01FF93F0001C001F10FF81F0000C001
      F10F800F0000C001FD1F80070000C001FC3F80030000C001F07F80078000C001
      F07F800F8000C001F11FF81FC000C001F01FF93FC001C001F83FFB7FE001FFFF
      FC7FFFFFE1FFFFFFFD7FFFFFFFFFFFFFF00F8000F0FFF00FE0030000F07FE007
      E0030000F83FC003E0030000E01F800180010000F07F000080010000C0010000
      80010000000000000000000000000000000000008001000000000000C0030000
      80010000F803000080010000FC0F0000C0030000FE078001C0030000F003C003
      C0070000F801E007E00F0000FC01F00FFC1FF00FF01FFC3FF00FE007F01FF00F
      E007C003E00FE007C0078001C003C003C007000080038001C0070000F01F8001
      C0070000F01F8001E0030000E00F800100010000C00380010003000080038001
      80030000F01F8001E0030000F01F8001C0038001E00FC003C673C003C003E007
      C7F3E0078003F00FE3E7F00FF01FFC3FFFFFFFFF89FBFFFCFFFFFFC889FAFFF9
      E000FFB88000FFF3C000CFBF8000FF83C550CFBC8800FF078AA8FFBC880DFE07
      9550DFBF0809FC072AA0CF7C0007980F0004E6FC8003C01F0000F37FC001E03F
      955433BCE003F07F8A8033BCE683E0FF950187BFE3C304FFC07FFFB823E78E7F
      E0FFFFC887FFCF7FFFFFFFFFD7FFEFFFFEFFFFFFFFFFFFFFFC7FFE7FFFFFFFFF
      FEFFFC3FFC01FFFFFFFFF81FFC018000FEFFF00FFC010000FC7FF05F00010000
      FC7FF83F00010000FC7FF81F00010000FC3FFC0F00010000F61FFC0F00030000
      E30FF81F00070000E38FFC3F000F0000E00FFE1F00FF0000F01FFF0F01FF0001
      F83FFE1F03FFFFFFFFFFFF3FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'mdb'
    Filter = 'NAADSM scenario databases (*.mdb)|*.mdb|All files (*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 232
    Top = 88
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'mdb'
    Filter = 'NAADSM scenario databases (*.mdb)|*.mdb|All files (*.*)|*.*'
    Options = [ofOverwritePrompt, ofEnableSizing]
    Title = 'Name of database to save'
    Left = 48
    Top = 40
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 152
    Top = 152
  end
end

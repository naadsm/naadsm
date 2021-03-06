object FrameContactSpread: TFrameContactSpread
  Left = 0
  Top = 0
  Width = 447
  Height = 503
  TabOrder = 0
  object pnlSimpleParams: TPanel
    Left = 0
    Top = 0
    Width = 447
    Height = 161
    Align = alTop
    TabOrder = 0
    object pnlSimpleParamsTop: TPanel
      Left = 1
      Top = 1
      Width = 445
      Height = 104
      Align = alTop
      TabOrder = 0
      object lblFixedContactRate: TLabel
        Left = 72
        Top = 32
        Width = 289
        Height = 13
        Caption = 
          'Fixed baseline contact rate (integer) (recipient units/unit/day)' +
          ':'
        Visible = False
        WordWrap = True
      end
      object lblMeanContactRate: TLabel
        Left = 8
        Top = 80
        Width = 250
        Height = 13
        Caption = 'Mean baseline contact rate (recipient units/unit/day):'
      end
      object lblLatentUnits: TLabel
        Left = 296
        Top = 16
        Width = 261
        Height = 13
        Caption = '(Latent units cannot spread disease by indirect contact)'
        Visible = False
      end
      object cbxLatentCanInfect: TCheckBox
        Left = 8
        Top = 8
        Width = 329
        Height = 17
        Caption = 'Latent units can spread disease'
        TabOrder = 0
        OnClick = cbxLatentCanInfectClick
      end
      object cbxSubclinicalCanInfect: TCheckBox
        Left = 8
        Top = 32
        Width = 313
        Height = 17
        Caption = 'Subclinical units can spread disease'
        TabOrder = 1
        OnClick = cbxSubclinicalCanInfectClick
      end
      object cbxFixedContactRate: TCheckBox
        Left = 8
        Top = 56
        Width = 281
        Height = 17
        Caption = 'Use fixed baseline contact rate'
        TabOrder = 2
        OnClick = cbxFixedContactRateClick
      end
      object rleFixedContactRate: TREEdit
        Left = 360
        Top = 68
        Width = 65
        Height = 21
        EditAlign = eaLeft
        TabOrder = 3
        Visible = False
        OnExit = processText
        OnKeyDown = rleKeyDown
      end
      object rleMeanContactRate: TREEdit
        Left = 360
        Top = 76
        Width = 65
        Height = 21
        EditAlign = eaLeft
        TabOrder = 4
        OnExit = processText
        OnKeyDown = rleKeyDown
      end
    end
    object pnlSimpleParamsBottom: TPanel
      Left = 1
      Top = 105
      Width = 445
      Height = 55
      Align = alClient
      TabOrder = 1
      object lblInfectionProbability: TLabel
        Left = 8
        Top = 12
        Width = 268
        Height = 13
        Caption = 'Probability of infection transfer (if source positive) (0 to 1):'
        WordWrap = True
      end
      object rleInfectionProbability: TREEdit
        Left = 360
        Top = 8
        Width = 65
        Height = 21
        EditAlign = eaLeft
        TabOrder = 0
        OnExit = processText
        OnKeyDown = rleKeyDown
      end
    end
  end
  object pnlCharts: TPanel
    Left = 0
    Top = 161
    Width = 447
    Height = 342
    Align = alClient
    TabOrder = 1
    object lblDistanceDistr: TLabel
      Left = 40
      Top = 10
      Width = 178
      Height = 13
      Caption = 'Distance distribution of recipient units:'
    end
    object imgPdf1: TImage
      Left = 16
      Top = 8
      Width = 16
      Height = 16
      Hint = 'This parameter is a probability density function'
      ParentShowHint = False
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        000010000000010018000000000000030000120B0000120B0000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000E5E5E5E8E8E8F0F1F1E9F4F5E7F5F5E7F5F5E7F5F5E7F5F5E7F5F5
        E7F5F5E8F4F5EFF1F2E8E8E8E4E4E4000000000000A6A6A6717575602C2FA519
        1BB02023AD2023AD2023AD2023AD2023AF2023A91A1C63282B6A6E6EA2A2A200
        0000000000FFFFFFFDFEFECDC7C8A22D2DFE0000FF0000FF0000FF0000FF0000
        FF0000A72223C8C0BFFBFDFDFFFFFF000000000000FFFFFFFFFFFFFFFFFFCEDC
        DCA81718FF0000FF0000FF0000FF0000B11112C4D0D1FFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFA58787E40000FF0000FF0000E90000
        9C7273FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFD4E0E0AE0C0DFF0000FF0000BB0808CDD4D4FFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFF6FFFF9F4C4DFB0000FE0000A33B3C
        F2FEFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFB2A4A5D40000DA0000A59090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF6F69D62639B5859EBF1F1
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFAFFFFF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000}
      ShowHint = True
    end
    object lblTransportDelay: TLabel
      Left = 40
      Top = 106
      Width = 72
      Height = 13
      Caption = 'Shipping delay:'
    end
    object imgPdf2: TImage
      Left = 16
      Top = 104
      Width = 16
      Height = 16
      Hint = 'This parameter is a probability density function'
      ParentShowHint = False
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        000010000000010018000000000000030000120B0000120B0000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000E5E5E5E8E8E8F0F1F1E9F4F5E7F5F5E7F5F5E7F5F5E7F5F5E7F5F5
        E7F5F5E8F4F5EFF1F2E8E8E8E4E4E4000000000000A6A6A6717575602C2FA519
        1BB02023AD2023AD2023AD2023AD2023AF2023A91A1C63282B6A6E6EA2A2A200
        0000000000FFFFFFFDFEFECDC7C8A22D2DFE0000FF0000FF0000FF0000FF0000
        FF0000A72223C8C0BFFBFDFDFFFFFF000000000000FFFFFFFFFFFFFFFFFFCEDC
        DCA81718FF0000FF0000FF0000FF0000B11112C4D0D1FFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFA58787E40000FF0000FF0000E90000
        9C7273FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFD4E0E0AE0C0DFF0000FF0000BB0808CDD4D4FFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFF6FFFF9F4C4DFB0000FE0000A33B3C
        F2FEFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFB2A4A5D40000DA0000A59090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF6F69D62639B5859EBF1F1
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFAFFFFF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000}
      ShowHint = True
    end
    object lblMovementControl: TLabel
      Left = 40
      Top = 183
      Width = 385
      Height = 39
      Caption = 
        'Effect of movement controls on baseline contact rate, after dete' +
        'ction in any production type (Note: this effect does not apply w' +
        'ithin zones: movement controls must be specified separately for ' +
        'each zone):'
      WordWrap = True
    end
    object imgRel1: TImage
      Left = 16
      Top = 212
      Width = 16
      Height = 16
      Hint = 'This parameter is a relational function'
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        000010000000010018000000000000030000120B0000120B0000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000008000008000F6F5F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000080000080000080000080
        00008000008000F1F8F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFFFFFFFFF0EFF0008000008000C4E3C5FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFC7DFC7008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008000008000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFCFCFC008000008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008000
        F9F7F9FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED008000008000FFFFFFF5FAF5E1F1E200
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        008000008000008000008000008000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBE6CCA5D2A6F3F3F300800000800000
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000}
    end
    inline smcDistanceDistr: TFrameSMFunctionEditor
      Left = 18
      Top = 24
      Width = 399
      Height = 57
      Constraints.MinHeight = 50
      Constraints.MinWidth = 390
      TabOrder = 0
    end
    inline smcTransportDelay: TFrameSMFunctionEditor
      Left = 18
      Top = 120
      Width = 399
      Height = 50
      Constraints.MinHeight = 50
      Constraints.MinWidth = 390
      TabOrder = 1
    end
    inline smrMovementControl: TFrameSMFunctionEditor
      Left = 16
      Top = 236
      Width = 409
      Height = 49
      Constraints.MinHeight = 45
      Constraints.MinWidth = 390
      TabOrder = 2
    end
  end
end

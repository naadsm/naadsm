object FormSMOutputBase: TFormSMOutputBase
  Left = 629
  Top = 353
  Width = 755
  Height = 500
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'SM Output Base Class'
  Color = clBtnFace
  Constraints.MinHeight = 33
  Constraints.MinWidth = 525
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poMainFormCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlControls: TPanel
    Left = 0
    Top = 0
    Width = 747
    Height = 33
    Align = alTop
    TabOrder = 0
    object pnlProdTypes: TPanel
      Left = 333
      Top = 1
      Width = 413
      Height = 31
      Align = alClient
      TabOrder = 2
      object lblIteration: TLabel
        Left = 280
        Top = 8
        Width = 44
        Height = 13
        Caption = 'Iteration: '
      end
      object cboProdTypes: TComboBox
        Left = 16
        Top = 4
        Width = 124
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnCloseUp = cboProdTypesCloseUp
      end
      object pnlDecorator3: TPanel
        Left = 6
        Top = 3
        Width = 2
        Height = 25
        TabOrder = 1
      end
      object pnlDecorator4: TPanel
        Left = 10
        Top = 3
        Width = 2
        Height = 25
        TabOrder = 2
      end
      object cboZones: TComboBox
        Left = 144
        Top = 4
        Width = 124
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
        Visible = False
        OnCloseUp = cboZonesCloseUp
      end
      object cboIteration: TComboBox
        Left = 340
        Top = 4
        Width = 65
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 4
        OnChange = cboIterationChange
      end
    end
    object pnlButtons: TPanel
      Left = 129
      Top = 1
      Width = 204
      Height = 31
      Align = alLeft
      TabOrder = 1
      object btnSaveData: TBitBtn
        Left = 25
        Top = 5
        Width = 22
        Height = 22
        Hint = 'Save data to file'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D40000000000000000000000000000000000000000
          00000000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080
          8080808080808080808080808080808080808080808080FFFFFFC8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4000000008080008080000000000000C8D0D4C8D0D40000
          00008080000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
          8080808080808080FFFFFFC8D0D4808080808080808080FFFFFFC8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4000000008080008080000000000000C8D0D4C8D0D40000
          00008080000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
          8080808080808080FFFFFFFFFFFF808080808080808080FFFFFFC8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40000000080800080800080800080800080800080800080
          80008080000000C8D0D4C8D0D4FFFFFFFFFFFFFFFFFFFFFFFF80808080808080
          8080808080808080808080808080808080808080808080FFFFFF800000800000
          8000008000008000000000000080800080800000000000000000000000000080
          80008080000000C8D0D480808080808080808080808080808080808080808080
          8080808080808080808080808080808080808080808080FFFFFF800000FFFFFF
          FFFFFFFFFFFFFFFFFF000000008080000000C8D0D4C8D0D4C8D0D4C8D0D40000
          00008080000000C8D0D4808080FFFFFFC8D0D4FFFFFFFFFFFF80808080808080
          8080FFFFFFC8D0D4C8D0D4C8D0D4808080808080808080FFFFFF800000FFFFFF
          000000000000FFFFFF000000008080000000C8D0D4C8D0D4C8D0D4C8D0D40000
          FF008080000000C8D0D4808080FFFFFF808080808080C8D0D480808080808080
          8080FFFFFFC8D0D4C8D0D4C8D0D4808080808080808080FFFFFF800000FFFFFF
          FFFFFFFFFFFFFFFFFF000000008080000000C8D0D4C8D0D4C8D0D40000FF0000
          FF0000FF000000C8D0D4808080FFFFFFC8D0D4FFFFFFFFFFFF80808080808080
          8080FFFFFFC8D0D4C8D0D4808080808080808080808080FFFFFF800000FFFFFF
          000000000000000000000000008080000000C8D0D4C8D0D40000FF0000FF0000
          FF0000FF0000FFC8D0D4808080FFFFFF80808080808080808080808080808080
          8080FFFFFFFFFFFF808080808080808080808080808080FFFFFF800000FFFFFF
          FFFFFFFFFFFFFFFFFF0000000000000000000000000000FF0000FF0000FF0000
          FF0000FF0000FF0000FF808080FFFFFFC8D0D4FFFFFFFFFFFF80808080808080
          8080808080808080808080808080808080808080808080808080800000FFFFFF
          000000000000000000FFFFFFFFFFFFFFFFFF800000C8D0D4C8D0D40000FF0000
          FF0000FFC8D0D4C8D0D4808080FFFFFF808080808080808080C8D0D4FFFFFFFF
          FFFF808080FFFFFFC8D0D4808080808080808080FFFFFFC8D0D4800000FFFFFF
          FFFFFFFFFFFFFFFFFF800000800000800000800000C8D0D4C8D0D40000FF0000
          FF0000FFC8D0D4C8D0D4808080FFFFFFC8D0D4FFFFFFFFFFFF80808080808080
          8080808080C8D0D4C8D0D4808080808080808080FFFFFFC8D0D4800000FFFFFF
          000000000000FFFFFF800000FFFFFF800000C8D0D4C8D0D4C8D0D40000FF0000
          FF0000FFC8D0D4C8D0D4808080FFFFFF808080808080C8D0D4808080FFFFFF80
          8080C8D0D4FFFFFFFFFFFF808080808080808080C8D0D4C8D0D4800000FFFFFF
          FFFFFFFFFFFFFFFFFF800000800000C8D0D40000FF0000FF0000FF0000FF0000
          FFC8D0D4C8D0D4C8D0D4808080FFFFFFFFFFFFFFFFFFFFFFFF808080808080C8
          D0D4808080808080808080808080808080C8D0D4C8D0D4C8D0D4800000800000
          800000800000800000800000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4808080808080808080808080808080808080C8D0D4C8
          D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4}
        NumGlyphs = 2
      end
      object btnPrintData: TBitBtn
        Left = 79
        Top = 5
        Width = 22
        Height = 22
        Hint = 'Print data'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8D0D4C8D0D4C8D0D4C8D0D4
          0000000000000000000000000000000000000000000000000000000000000000
          00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080808080808080808080
          8080808080808080808080808080808080C8D0D4FFFFFFC8D0D4C8D0D4000000
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0
          D4000000C8D0D4C8D0D4C8D0D4808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF808080FFFFFF808080C8D0D4FFFFFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00C8D0D4000000C8D0D480808080808080808080808080808080808080808080
          8080808080808080808080808080808080FFFFFF808080FFFFFF000000C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400FFFF00FFFF00FFFFC8D0D4C8D0D40000
          00000000000000C8D0D4808080FFFFFFC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF
          FFFFFFFFFFFFFFFFFFFFFFC8D0D4808080808080808080FFFFFF000000C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080808080808080C8D0D4C8D0D40000
          00C8D0D4000000C8D0D4808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
          8080808080808080FFFFFFFFFFFF808080FFFFFF808080C8D0D4000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00C8D0D4C8D0D400000080808080808080808080808080808080808080808080
          8080808080808080808080808080808080C8D0D4FFFFFF808080000000C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0
          D4000000C8D0D4000000808080C8D0D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF808080C8D0D4808080C8D0D4808080C8D0D4000000
          000000000000000000000000000000000000000000000000000000C8D0D40000
          00C8D0D4000000000000C8D0D480808080808080808080808080808080808080
          8080808080808080808080C8D0D4808080C8D0D4808080808080C8D0D4C8D0D4
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C8D0
          D4000000C8D0D4000000C8D0D4C8D0D4808080C8D0D4FFFFFFC8D0D4FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF808080FFFFFF808080FFFFFF808080C8D0D4C8D0D4
          C8D0D4000000FFFFFF000000000000000000000000000000FFFFFF0000000000
          00000000000000C8D0D4C8D0D4C8D0D4C8D0D4808080FFFFFF80808080808080
          8080808080808080C8D0D4808080808080808080808080C8D0D4C8D0D4C8D0D4
          C8D0D4000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080C8D0D4FFFFFFC8D0D4FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFC8D0D4C8D0D4C8D0D4C8D0D4
          C8D0D4C8D0D4000000FFFFFF000000000000000000000000000000FFFFFF0000
          00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080FFFFFF80808080
          8080808080808080808080C8D0D4808080C8D0D4FFFFFFC8D0D4C8D0D4C8D0D4
          C8D0D4C8D0D4000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080C8D0D4FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFC8D0D4C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40000000000000000000000000000000000000000000000
          00000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
          8080808080808080808080808080808080808080C8D0D4C8D0D4C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
          D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4}
        NumGlyphs = 2
      end
      object btnCopyData: TBitBtn
        Left = 52
        Top = 5
        Width = 22
        Height = 22
        Hint = 'Copy data to clipboard'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40000000080800080808080800080808080800080808080
          80008080000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
          8080808080808080808080808080808080808080808080FFFFFFC8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40000000080808080800080808080800080808080800080
          80008080000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
          8080808080808080808080808080808080808080808080FFFFFFC8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40000000080800080808080800080808080800080808080
          80008080000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
          8080808080808080808080808080808080808080808080FFFFFFC8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40000000080808080800080808080800080808080800080
          80008080000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
          8080808080808080808080808080808080808080808080FFFFFFC8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40000000080800080800080800080800080800080800080
          80008080000000C8D0D4C8D0D4FFFFFFFFFFFFFFFFFFFFFFFF80808080808080
          8080808080808080808080808080808080808080808080FFFFFF800000800000
          8000008000008000000000000000000000000000000000000000000000000000
          00000000000000C8D0D480808080808080808080808080808080808080808080
          8080808080808080808080808080808080808080808080FFFFFF800000FFFFFF
          FFFFFFFFFFFFFFFFFF000000000000C8D0D4FFFFFFC8D0D4FFFFFFC8D0D4FFFF
          FF000000000000C8D0D4808080FFFFFFC8D0D4FFFFFFFFFFFF808080808080FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080FFFFFF800000FFFFFF
          000000000000FFFFFF00000000808000000000FFFF00000000000000FFFF0000
          FF808080000000C8D0D4808080FFFFFF808080808080C8D0D480808080808080
          8080808080808080808080808080808080808080808080C8D0D4800000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000FFFF00FFFF0000FF0000
          FF0000FFC8D0D4C8D0D4808080FFFFFFC8D0D4FFFFFFFFFFFFFFFFFF80808080
          8080808080808080808080808080808080808080FFFFFFFFFFFF800000FFFFFF
          000000000000000000000000FFFFFFFFFFFF0000000000000000FF0000FF0000
          FF0000FF0000FFC8D0D4808080FFFFFF808080808080808080808080C8D0D4C8
          D0D4808080808080808080808080808080808080808080FFFFFF800000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8000000000FF0000FF0000FF0000
          FF0000FF0000FF0000FF808080FFFFFFC8D0D4FFFFFFFFFFFFFFFFFFC8D0D4C8
          D0D4808080808080808080808080808080808080808080808080800000FFFFFF
          000000000000000000FFFFFFFFFFFFFFFFFF800000C8D0D4C8D0D40000FF0000
          FF0000FFC8D0D4C8D0D4808080FFFFFF808080808080808080C8D0D4FFFFFFFF
          FFFF808080FFFFFFC8D0D4808080808080808080FFFFFFC8D0D4800000FFFFFF
          FFFFFFFFFFFFFFFFFF800000800000800000800000C8D0D4C8D0D40000FF0000
          FF0000FFC8D0D4C8D0D4808080FFFFFFC8D0D4FFFFFFFFFFFF80808080808080
          8080808080C8D0D4C8D0D4808080808080808080FFFFFFC8D0D4800000FFFFFF
          000000000000FFFFFF800000FFFFFF800000C8D0D4C8D0D4C8D0D40000FF0000
          FF0000FFC8D0D4C8D0D4808080FFFFFF808080808080C8D0D4808080FFFFFF80
          8080C8D0D4FFFFFFFFFFFF808080808080808080C8D0D4C8D0D4800000FFFFFF
          FFFFFFFFFFFFFFFFFF800000800000C8D0D40000FF0000FF0000FF0000FF0000
          FFC8D0D4C8D0D4C8D0D4808080FFFFFFFFFFFFFFFFFFFFFFFF808080808080C8
          D0D4808080808080808080808080808080C8D0D4C8D0D4C8D0D4800000800000
          800000800000800000800000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4808080808080808080808080808080808080C8D0D4C8
          D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4}
        NumGlyphs = 2
      end
      object btnSaveCharts: TBitBtn
        Left = 120
        Top = 5
        Width = 22
        Height = 22
        Hint = 'Save chart to file'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D40000000000000000000000000000000000000000
          00000000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080
          8080808080808080808080808080808080808080808080FFFFFFC8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4000000008080008080000000000000C8D0D4C8D0D40000
          00008080000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
          8080808080808080FFFFFFC8D0D4808080808080808080FFFFFFC8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4000000008080008080000000000000C8D0D4C8D0D40000
          00008080000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
          8080808080808080FFFFFFFFFFFF808080808080808080FFFFFFC8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40000000080800080800080800080800080800080800080
          80008080000000C8D0D4C8D0D4FFFFFFFFFFFFFFFFFFFFFFFF80808080808080
          8080808080808080808080808080808080808080808080FFFFFF800000800000
          8000008000008000000000000080800080800000000000000000000000000080
          80008080000000C8D0D480808080808080808080808080808080808080808080
          8080808080808080808080808080808080808080808080FFFFFF800000FFFFFF
          FFFFFFFFFFFFFFFFFF000000008080000000C8D0D4C8D0D4C8D0D4C8D0D40000
          00008080000000C8D0D4808080FFFFFFC8D0D4C8D0D4C8D0D480808080808080
          8080FFFFFFC8D0D4C8D0D4C8D0D4808080808080808080FFFFFF800000FFFFFF
          FFFFFFFFFFFFFFFFFF000000008080000000C8D0D4C8D0D4C8D0D4C8D0D40000
          FF008080000000C8D0D4808080FFFFFFC8D0D4FFFFFFFFFFFF80808080808080
          8080FFFFFFC8D0D4C8D0D4C8D0D4808080808080808080FFFFFF800000FFFFFF
          FF00000000FFFF0000000000008080000000C8D0D4C8D0D4C8D0D40000FF0000
          FF0000FF000000C8D0D4808080FFFFFF80808080808080808080808080808080
          8080FFFFFFC8D0D4C8D0D4808080808080808080808080FFFFFF800000FFFFFF
          FF00000000FFFF0000000000008080000000C8D0D4C8D0D40000FF0000FF0000
          FF0000FF0000FFC8D0D4808080FFFFFF80808080808080808080808080808080
          8080FFFFFFFFFFFF808080808080808080808080808080FFFFFF800000FFFFFF
          FF00000000FFFF00000000000000000000000000000000FF0000FF0000FF0000
          FF0000FF0000FF0000FF808080FFFFFF80808080808080808080808080808080
          8080808080808080808080808080808080808080808080808080800000FFFFFF
          FF00000000FFFF0000FFFFFFFFFFFFFFFFFF800000C8D0D4C8D0D40000FF0000
          FF0000FFC8D0D4C8D0D4808080FFFFFF808080808080808080C8D0D4FFFFFFFF
          FFFF808080FFFFFFC8D0D4808080808080808080FFFFFFC8D0D4800000FFFFFF
          FF00000000FFFFFFFF800000800000800000800000C8D0D4C8D0D40000FF0000
          FF0000FFC8D0D4C8D0D4808080FFFFFF808080808080C8D0D480808080808080
          8080808080C8D0D4C8D0D4808080808080808080FFFFFFC8D0D4800000FFFFFF
          FF0000FFFFFFFFFFFF800000FFFFFF800000C8D0D4C8D0D4C8D0D40000FF0000
          FF0000FFC8D0D4C8D0D4808080FFFFFF808080C8D0D4C8D0D4808080FFFFFF80
          8080C8D0D4FFFFFFFFFFFF808080808080808080C8D0D4C8D0D4800000FFFFFF
          FFFFFFFFFFFFFFFFFF800000800000C8D0D40000FF0000FF0000FF0000FF0000
          FFC8D0D4C8D0D4C8D0D4808080FFFFFFFFFFFFFFFFFFFFFFFF808080808080C8
          D0D4808080808080808080808080808080C8D0D4C8D0D4C8D0D4800000800000
          800000800000800000800000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4808080808080808080808080808080808080C8D0D4C8
          D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4}
        NumGlyphs = 2
      end
      object btnCopyCharts: TBitBtn
        Left = 147
        Top = 5
        Width = 22
        Height = 22
        Hint = 'Copy chart to clipboard'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40000000080800080808080800080808080800080808080
          80008080000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
          8080808080808080808080808080808080808080808080FFFFFFC8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40000000080808080800080808080800080808080800080
          80008080000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
          8080808080808080808080808080808080808080808080FFFFFFC8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40000000080800080808080800080808080800080808080
          80008080000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
          8080808080808080808080808080808080808080808080FFFFFFC8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40000000080808080800080808080800080808080800080
          80008080000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
          8080808080808080808080808080808080808080808080FFFFFFC8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40000000080800080800080800080800080800080800080
          80008080000000C8D0D4C8D0D4FFFFFFFFFFFFFFFFFFFFFFFF80808080808080
          8080808080808080808080808080808080808080808080FFFFFF800000800000
          8000008000008000000000000000000000000000000000000000000000000000
          00000000000000C8D0D480808080808080808080808080808080808080808080
          8080808080808080808080808080808080808080808080FFFFFF800000FFFFFF
          FFFFFFFFFFFFFFFFFF000000000000C8D0D4FFFFFFC8D0D4FFFFFFC8D0D4FFFF
          FF000000000000C8D0D4808080FFFFFFC8D0D4C8D0D4C8D0D4808080808080FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080FFFFFF800000FFFFFF
          FFFFFFFFFFFFFFFFFF00000000808000000000FFFF00000000000000FFFF0000
          FF808080000000C8D0D4808080FFFFFFC8D0D4FFFFFFFFFFFF80808080808080
          8080808080808080808080808080808080808080808080C8D0D4800000FFFFFF
          FF00000000FFFF00000000FF00000000000000000000FFFF00FFFF0000FF0000
          FF0000FFC8D0D4C8D0D4808080FFFFFF80808080808080808080808080808080
          8080808080808080808080808080808080808080FFFFFFFFFFFF800000FFFFFF
          FF00000000FFFF00000000FFFF0000FFFFFF0000000000000000FF0000FF0000
          FF0000FF0000FFC8D0D4808080FFFFFF808080808080808080808080808080C8
          D0D4808080808080808080808080808080808080808080FFFFFF800000FFFFFF
          FF00000000FFFF00000000FFFFFFFFFFFFFF8000000000FF0000FF0000FF0000
          FF0000FF0000FF0000FF808080FFFFFF808080808080808080808080C8D0D4C8
          D0D4808080808080808080808080808080808080808080808080800000FFFFFF
          FF00000000FFFF0000FFFFFFFFFFFFFFFFFF800000C8D0D4C8D0D40000FF0000
          FF0000FFC8D0D4C8D0D4808080FFFFFF808080808080808080C8D0D4FFFFFFFF
          FFFF808080FFFFFFC8D0D4808080808080808080FFFFFFC8D0D4800000FFFFFF
          FF00000000FFFFFFFF800000800000800000800000C8D0D4C8D0D40000FF0000
          FF0000FFC8D0D4C8D0D4808080FFFFFF808080808080C8D0D480808080808080
          8080808080C8D0D4C8D0D4808080808080808080FFFFFFC8D0D4800000FFFFFF
          FF0000FFFFFFFFFFFF800000FFFFFF800000C8D0D4C8D0D4C8D0D40000FF0000
          FF0000FFC8D0D4C8D0D4808080FFFFFF808080C8D0D4C8D0D4808080FFFFFF80
          8080C8D0D4FFFFFFFFFFFF808080808080808080C8D0D4C8D0D4800000FFFFFF
          FFFFFFFFFFFFFFFFFF800000800000C8D0D40000FF0000FF0000FF0000FF0000
          FFC8D0D4C8D0D4C8D0D4808080FFFFFFFFFFFFFFFFFFFFFFFF808080808080C8
          D0D4808080808080808080808080808080C8D0D4C8D0D4C8D0D4800000800000
          800000800000800000800000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4808080808080808080808080808080808080C8D0D4C8
          D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4}
        NumGlyphs = 2
      end
      object btnPrintCharts: TBitBtn
        Left = 174
        Top = 5
        Width = 22
        Height = 22
        Hint = 'Print chart'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8D0D4C8D0D4C8D0D4C8D0D4
          0000000000000000000000000000000000000000000000000000000000000000
          00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080808080808080808080
          8080808080808080808080808080808080C8D0D4FFFFFFC8D0D4C8D0D4000000
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0
          D4000000C8D0D4C8D0D4C8D0D4808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF808080FFFFFF808080C8D0D4FFFFFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00C8D0D4000000C8D0D480808080808080808080808080808080808080808080
          8080808080808080808080808080808080FFFFFF808080FFFFFF000000C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400FFFF00FFFF00FFFFC8D0D4C8D0D40000
          00000000000000C8D0D4808080FFFFFFC8D0D4C8D0D4C8D0D4C8D0D4C8D0D480
          8080808080808080FFFFFFC8D0D4808080808080808080FFFFFF000000C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080808080808080C8D0D4C8D0D40000
          00C8D0D4000000C8D0D4808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
          8080808080808080FFFFFFFFFFFF808080FFFFFF808080C8D0D4000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00C8D0D4C8D0D400000080808080808080808080808080808080808080808080
          8080808080808080808080808080808080C8D0D4FFFFFF808080000000C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0
          D4000000C8D0D4000000808080C8D0D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF808080C8D0D4808080C8D0D4808080C8D0D4000000
          000000000000000000000000000000000000000000000000000000C8D0D40000
          00C8D0D4000000000000C8D0D480808080808080808080808080808080808080
          8080808080808080808080C8D0D4808080C8D0D4808080808080C8D0D4C8D0D4
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C8D0
          D4000000C8D0D4000000C8D0D4C8D0D4808080C8D0D4FFFFFFC8D0D4FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF808080FFFFFF808080FFFFFF808080C8D0D4C8D0D4
          C8D0D4000000FFFFFFFF00000000FFFF00000000FFFF0000FFFFFF0000000000
          00000000000000C8D0D4C8D0D4C8D0D4C8D0D4808080FFFFFF80808080808080
          8080808080808080FFFFFF808080808080808080808080C8D0D4C8D0D4C8D0D4
          C8D0D4000000FFFFFFFF00000000FFFF00000000FFFF0000FFFFFFFFFFFF0000
          00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080C8D0D480808080808080
          8080808080808080FFFFFFFFFFFF808080FFFFFFC8D0D4C8D0D4C8D0D4C8D0D4
          C8D0D4C8D0D4000000FFFFFFFF0000FFFFFFFFFFFF0000FFFF0000FFFFFF0000
          00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080FFFFFF808080C8
          D0D4C8D0D4808080808080C8D0D4808080C8D0D4FFFFFFC8D0D4C8D0D4C8D0D4
          C8D0D4C8D0D4000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080C8D0D4FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFC8D0D4C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40000000000000000000000000000000000000000000000
          00000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
          8080808080808080808080808080808080808080C8D0D4C8D0D4C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
          D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4}
        NumGlyphs = 2
      end
      object pnlDecorator1: TPanel
        Left = 8
        Top = 3
        Width = 2
        Height = 25
        TabOrder = 6
      end
      object pnlDecorator2: TPanel
        Left = 12
        Top = 3
        Width = 2
        Height = 25
        TabOrder = 7
      end
    end
    object pnlMenu: TPanel
      Left = 1
      Top = 1
      Width = 128
      Height = 31
      Align = alLeft
      TabOrder = 0
      object mainMenuBar: TActionMainMenuBar
        Left = 1
        Top = 1
        Width = 126
        Height = 29
        Caption = 'mainMenuBar'
        ColorMap.HighlightColor = 14410210
        ColorMap.BtnSelectedColor = clBtnFace
        ColorMap.UnusedColor = 14410210
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        PersistentHotKeys = True
        Spacing = 0
      end
    end
  end
  object dlgSaveWMF: TSaveDialog
    DefaultExt = 'wmf'
    Filter = 'Windows Metafile (*.wmf)|*.wmf|All files (*.*)|*.*'
    Left = 24
    Top = 57
  end
  object dlgSaveCSV: TSaveDialog
    DefaultExt = 'csv'
    Filter = 'CSV (Comma delimted) (*.csv)|*.csv|All files (*.*)|*.*'
    Title = 'Select a file name'
    Left = 56
    Top = 56
  end
  object dlgPrint: TPrintDialog
    Left = 88
    Top = 48
  end
end

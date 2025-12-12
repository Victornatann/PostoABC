object FormRelatorio: TFormRelatorio
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Abastecimentos por Per'#237'odo'
  ClientHeight = 115
  ClientWidth = 241
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 241
    Height = 62
    Align = alTop
    Caption = 'Per'#237'odo'
    TabOrder = 0
    ExplicitWidth = 876
    object Label1: TLabel
      Left = 122
      Top = 28
      Width = 6
      Height = 13
      Caption = #224
    end
    object dtpDataInicio: TDateTimePicker
      Left = 24
      Top = 24
      Width = 94
      Height = 24
      Date = 44821.000000000000000000
      Time = 0.411208252313372200
      TabOrder = 0
    end
    object dtpDataFim: TDateTimePicker
      Left = 135
      Top = 24
      Width = 94
      Height = 24
      Date = 44821.000000000000000000
      Time = 0.411208252313372200
      TabOrder = 1
    end
  end
  object btnGerarRelatorio: TBitBtn
    Left = 124
    Top = 65
    Width = 105
    Height = 41
    Caption = 'Relat'#243'rio'
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnGerarRelatorioClick
  end
end

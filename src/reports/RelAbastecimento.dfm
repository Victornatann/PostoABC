object FrmRelAbastecimento: TFrmRelAbastecimento
  Left = 0
  Top = 0
  Caption = 'RelAbastecimento'
  ClientHeight = 566
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 72
    Top = 107
    Width = 794
    Height = 1123
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBandTitle: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 75
      BandType = btHeader
      object RLLabelTitulo: TRLLabel
        Left = 2
        Top = 3
        Width = 400
        Height = 24
        Caption = 'Relat'#243'rio de Abastecimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPeriodo: TRLLabel
        Left = 2
        Top = 27
        Width = 400
        Height = 16
        AutoSize = False
        Caption = 'Periodo'
      end
      object lblHora: TRLLabel
        Left = 151
        Top = 56
        Width = 86
        Height = 16
        Alignment = taCenter
        Caption = 'HORA ABAS.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLitros: TRLLabel
        Left = 284
        Top = 56
        Width = 76
        Height = 16
        Caption = 'QTDE (LTS)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblValorLitro: TRLLabel
        Left = 506
        Top = 56
        Width = 100
        Height = 16
        Alignment = taRightJustify
        Caption = 'UNIT. (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblImposto: TRLLabel
        Left = 398
        Top = 56
        Width = 78
        Height = 16
        Alignment = taRightJustify
        Caption = 'IMPOSTO*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblValor: TRLLabel
        Left = 636
        Top = 56
        Width = 79
        Height = 16
        Alignment = taRightJustify
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 3
        Top = 73
        Width = 712
        Height = 1
        DrawKind = dkLine
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 672
        Top = 3
        Width = 46
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 628
        Top = 3
        Width = 40
        Height = 16
        Alignment = taRightJustify
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLDraw5: TRLDraw
        Left = 3
        Top = 54
        Width = 712
        Height = 1
        DrawKind = dkLine
      end
    end
    object RLGroupDia: TRLGroup
      Left = 38
      Top = 113
      Width = 718
      Height = 96
      DataFields = 'DATA'
      object RLBandDiaHeader: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 22
        BandType = btHeader
        object RLPanelDia: TRLPanel
          Left = 3
          Top = 0
          Width = 712
          Height = 22
          Color = 15066597
          ParentColor = False
          Transparent = False
          object RLLabel4: TRLLabel
            Left = 8
            Top = 3
            Width = 29
            Height = 16
            Caption = 'Dia:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLDBTextDia: TRLDBText
          Left = 43
          Top = 3
          Width = 38
          Height = 16
          DataField = 'DATA'
          DataSource = DataSource1
          DisplayMask = 'dd/mm/yyyy'
          Text = ''
        end
      end
      object RLGroupTanque: TRLGroup
        Left = 0
        Top = 22
        Width = 718
        Height = 50
        DataFields = 'TANQUE'
        object RLBandTanqueHeader: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 20
          BandType = btHeader
          object RLLabelTanque: TRLLabel
            Left = 10
            Top = 2
            Width = 50
            Height = 16
            Caption = 'Tanque:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBTextTanque: TRLDBText
            Left = 65
            Top = 2
            Width = 57
            Height = 16
            DataField = 'TANQUE'
            DataSource = DataSource1
            Text = ''
          end
        end
        object RLGroupBomba: TRLGroup
          Left = 0
          Top = 20
          Width = 718
          Height = 40
          DataFields = 'BOMBA'
          object RLBandBombaHeader: TRLBand
            Left = 0
            Top = 0
            Width = 718
            Height = 18
            BandType = btHeader
            object RLDBTextBomba: TRLDBText
              Left = 65
              Top = 2
              Width = 52
              Height = 16
              DataField = 'BOMBA'
              DataSource = DataSource1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Text = ''
            end
          end
          object RLBandDetail: TRLBand
            Left = 0
            Top = 18
            Width = 718
            Height = 25
            object RLDBTextHora: TRLDBText
              Left = 151
              Top = 2
              Width = 86
              Height = 15
              Alignment = taCenter
              DataField = 'HORA'
              DataSource = DataSource1
              DisplayMask = 'hh:nn'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = ''
            end
            object RLDBTextLitros: TRLDBText
              Left = 284
              Top = 2
              Width = 76
              Height = 15
              Alignment = taCenter
              DataField = 'LITROS'
              DataSource = DataSource1
              DisplayMask = '0.##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = ''
            end
            object RLDBTextValorLitro: TRLDBText
              Left = 506
              Top = 2
              Width = 100
              Height = 15
              Alignment = taRightJustify
              DataField = 'PRECO_LITRO'
              DataSource = DataSource1
              DisplayMask = 'R$ #,##0.000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = ''
            end
            object RLDBTextImposto: TRLDBText
              Left = 398
              Top = 3
              Width = 78
              Height = 15
              Alignment = taRightJustify
              DataField = 'IMPOSTO'
              DataSource = DataSource1
              DisplayMask = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = ''
            end
            object RLDBTextValor: TRLDBText
              Left = 636
              Top = 2
              Width = 80
              Height = 15
              Alignment = taRightJustify
              DataField = 'VALOR'
              DataSource = DataSource1
              DisplayMask = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = ''
            end
          end
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 72
        Width = 718
        Height = 31
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 632
          Top = 7
          Width = 83
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR'
          DataSource = DataSource1
          DisplayMask = 'R$ #,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBResult2: TRLDBResult
          Left = 284
          Top = 7
          Width = 76
          Height = 16
          Alignment = taCenter
          DataField = 'LITROS'
          DataSource = DataSource1
          DisplayMask = '0.##'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDraw4: TRLDraw
          Left = 6
          Top = 1
          Width = 712
          Height = 1
          DrawKind = dkLine
          Pen.Style = psDot
          Transparent = False
        end
        object RLLabel2: TRLLabel
          Left = 157
          Top = 7
          Width = 101
          Height = 16
          Alignment = taRightJustify
          Caption = 'TOTAIS DO DIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
    end
    object RLBandSummary: TRLBand
      Left = 38
      Top = 209
      Width = 718
      Height = 40
      BandType = btSummary
      object RLLabelTotal: TRLLabel
        Left = 379
        Top = 18
        Width = 229
        Height = 19
        Caption = 'TOTAL GERAL DO PER'#205'ODO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResultTotal: TRLDBResult
        Left = 609
        Top = 18
        Width = 109
        Height = 19
        Alignment = taRightJustify
        DataField = 'VALOR'
        DataSource = DataSource1
        DisplayMask = 'R$ #,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDraw2: TRLDraw
        Left = 6
        Top = 1
        Width = 712
        Height = 1
        DrawKind = dkLine
        Pen.Style = psDot
      end
      object RLDraw3: TRLDraw
        Left = 6
        Top = 4
        Width = 712
        Height = 1
        DrawKind = dkLine
        Pen.Style = psDot
      end
    end
  end
  object DataSource1: TDataSource
    Left = 64
    Top = 40
  end
end

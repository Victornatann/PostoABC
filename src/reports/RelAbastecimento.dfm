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
      Height = 67
      BandType = btHeader
      object RLLabelTitulo: TRLLabel
        Left = 10
        Top = 6
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
        Left = 10
        Top = 27
        Width = 400
        Height = 16
        AutoSize = False
        Caption = 'Periodo'
      end
      object lblHora: TRLLabel
        Left = 12
        Top = 48
        Width = 60
        Height = 16
        Caption = 'Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLitros: TRLLabel
        Left = 140
        Top = 48
        Width = 80
        Height = 16
        Caption = 'Litros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblValorLitro: TRLLabel
        Left = 250
        Top = 48
        Width = 100
        Height = 16
        Caption = 'Valor/Litro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblImposto: TRLLabel
        Left = 380
        Top = 48
        Width = 80
        Height = 16
        Caption = 'Imposto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblValor: TRLLabel
        Left = 500
        Top = 48
        Width = 80
        Height = 16
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 3
        Top = 65
        Width = 712
        Height = 1
        DrawKind = dkLine
      end
    end
    object RLGroupDia: TRLGroup
      Left = 38
      Top = 105
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
        end
        object RLDBTextDia: TRLDBText
          Left = 45
          Top = 3
          Width = 38
          Height = 16
          DataField = 'DATA'
          DataSource = DataSource1
          DisplayMask = 'dd/mm/yyyy'
          Text = ''
        end
        object RLLabelDia: TRLLabel
          Left = 10
          Top = 3
          Width = 30
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
            object RLLabelBomba: TRLLabel
              Left = 40
              Top = 2
              Width = 45
              Height = 16
              Caption = 'Bomba:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBTextBomba: TRLDBText
              Left = 95
              Top = 2
              Width = 52
              Height = 16
              DataField = 'BOMBA'
              DataSource = DataSource1
              Text = ''
            end
          end
          object RLBandDetail: TRLBand
            Left = 0
            Top = 18
            Width = 718
            Height = 20
            object RLDBTextHora: TRLDBText
              Left = 12
              Top = 2
              Width = 41
              Height = 16
              DataField = 'HORA'
              DataSource = DataSource1
              DisplayMask = 'hh:nn'
              Text = ''
            end
            object RLDBTextLitros: TRLDBText
              Left = 140
              Top = 2
              Width = 49
              Height = 16
              DataField = 'LITROS'
              DataSource = DataSource1
              DisplayMask = '#,##0.00'
              Text = ''
            end
            object RLDBTextValorLitro: TRLDBText
              Left = 250
              Top = 2
              Width = 93
              Height = 16
              DataField = 'PRECO_LITRO'
              DataSource = DataSource1
              DisplayMask = 'R$ #,##0.000'
              Text = ''
            end
            object RLDBTextImposto: TRLDBText
              Left = 380
              Top = 2
              Width = 63
              Height = 16
              DataField = 'IMPOSTO'
              DataSource = DataSource1
              DisplayMask = 'R$ #,##0.00'
              Text = ''
            end
            object RLDBTextValor: TRLDBText
              Left = 500
              Top = 2
              Width = 48
              Height = 16
              DataField = 'VALOR'
              DataSource = DataSource1
              DisplayMask = 'R$ #,##0.00'
              Text = ''
            end
          end
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 72
        Width = 718
        Height = 25
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 499
          Top = 7
          Width = 87
          Height = 16
          DataField = 'VALOR'
          DataSource = DataSource1
          DisplayMask = 'R$ #,##0.00'
          Info = riSum
          Text = ''
        end
        object RLLabel1: TRLLabel
          Left = 390
          Top = 6
          Width = 100
          Height = 16
          Caption = 'TOTAL DO DIA:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object RLBandSummary: TRLBand
      Left = 38
      Top = 201
      Width = 718
      Height = 40
      BandType = btSummary
      object RLLabelTotal: TRLLabel
        Left = 10
        Top = 10
        Width = 160
        Height = 16
        Caption = 'TOTAL GERAL DO PER'#205'ODO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResultTotal: TRLDBResult
        Left = 230
        Top = 10
        Width = 87
        Height = 16
        DataField = 'VALOR'
        DataSource = DataSource1
        DisplayMask = 'R$ #,##0.00'
        Info = riSum
        Text = ''
      end
      object RLDraw2: TRLDraw
        Left = 3
        Top = 1
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

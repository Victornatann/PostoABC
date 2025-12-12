object FormAbastecimentos: TFormAbastecimentos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Lan'#231'ar de Abastecimentos'
  ClientHeight = 270
  ClientWidth = 268
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 268
    Height = 270
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 20
    Padding.Top = 20
    Padding.Right = 20
    Padding.Bottom = 20
    TabOrder = 0
    object Label2: TLabel
      Left = 20
      Top = 44
      Width = 32
      Height = 13
      Caption = 'Bomba'
    end
    object lblTanqueInfo: TLabel
      Left = 20
      Top = 152
      Width = 47
      Height = 13
      Caption = 'Tanque: -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 20
      Top = 72
      Width = 26
      Height = 13
      Caption = 'Litros'
    end
    object Label7: TLabel
      Left = 20
      Top = 128
      Width = 74
      Height = 13
      Caption = 'Pre'#231'o por Litro:'
    end
    object Label5: TLabel
      Left = 20
      Top = 103
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label6: TLabel
      Left = 20
      Top = 181
      Width = 43
      Height = 13
      Caption = 'Imposto:'
    end
    object lblPrecoLitro: TLabel
      Left = 100
      Top = 128
      Width = 42
      Height = 13
      Caption = 'R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 20
      Top = 15
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object cmbBomba: TComboBox
      Left = 76
      Top = 41
      Width = 181
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnChange = cmbBombaChange
    end
    object edtLitros: TEdit
      Left = 76
      Top = 69
      Width = 181
      Height = 21
      TabOrder = 2
      OnChange = edtLitrosChange
      OnExit = edtLitrosExit
    end
    object edtValor: TEdit
      Left = 76
      Top = 99
      Width = 181
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtImposto: TEdit
      Left = 76
      Top = 180
      Width = 181
      Height = 21
      TabStop = False
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
    object btnLancar: TButton
      Left = 96
      Top = 213
      Width = 79
      Height = 44
      Caption = 'Lan'#231'ar'
      TabOrder = 5
      OnClick = btnLancarClick
    end
    object btnCancelar: TButton
      Left = 182
      Top = 213
      Width = 75
      Height = 44
      Caption = 'Cancelar'
      TabOrder = 6
      OnClick = btnCancelarClick
    end
    object dtpData: TDateTimePicker
      Left = 76
      Top = 14
      Width = 181
      Height = 21
      Date = 45292.000000000000000000
      Time = 0.603206018517084900
      TabOrder = 0
    end
  end
end

object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Posto ABC - Sistema de Gerenciamento'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 600
    Align = alClient
    BevelOuter = bvNone
    Caption = 'POSTO ABC'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 40
    Top = 40
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Abastecimentos1: TMenuItem
        Caption = 'Abastecimentos'
        OnClick = Abastecimentos1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object RelatriodeAbastecimentos1: TMenuItem
        Caption = 'Relat'#243'rio de Abastecimentos'
        OnClick = RelatriodeAbastecimentos1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end

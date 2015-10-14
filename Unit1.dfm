object Form1: TForm1
  Left = 265
  Top = 205
  BorderStyle = bsDialog
  Caption = 'CSV - WS'
  ClientHeight = 555
  ClientWidth = 1097
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 609
    Height = 537
    ColCount = 9
    RowCount = 31
    TabOrder = 0
  end
  object code2: TMemo
    Left = 624
    Top = 8
    Width = 465
    Height = 537
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Lucida Console'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
  end
  object XPManifest1: TXPManifest
    Left = 320
    Top = 432
  end
  object MainMenu1: TMainMenu
    Left = 256
    Top = 448
    object Datei1: TMenuItem
      Caption = 'File'
      object Open1: TMenuItem
        Caption = '&Open'
        OnClick = Open1Click
      end
      object BuildSave1: TMenuItem
        Caption = '&Build and Save'
        OnClick = BuildSave1Click
      end
      object Quit1: TMenuItem
        Caption = '&Quit'
        OnClick = Quit1Click
      end
    end
    object Ansicht1: TMenuItem
      Caption = 'View'
      object Simulator1: TMenuItem
        Caption = 'Simulator'
        OnClick = Simulator1Click
      end
    end
    object About1: TMenuItem
      Caption = 'Help'
      object About2: TMenuItem
        Caption = 'About'
      end
    end
  end
end

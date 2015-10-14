object Form1: TForm1
  Left = 255
  Top = 239
  Width = 1113
  Height = 583
  Caption = 'CSV - WS'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 609
    Height = 409
    ColCount = 9
    RowCount = 31
    TabOrder = 0
  end
  object code2: TMemo
    Left = 624
    Top = 8
    Width = 465
    Height = 529
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
  object Button3: TButton
    Left = 8
    Top = 424
    Width = 75
    Height = 25
    Caption = 'Open File'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Build'
    TabOrder = 3
    OnClick = Button4Click
  end
  object XPManifest1: TXPManifest
    Left = 320
    Top = 432
  end
end

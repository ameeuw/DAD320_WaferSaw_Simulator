object Form2: TForm2
  Left = 219
  Top = 189
  BorderStyle = bsToolWindow
  Caption = 'Simulation'
  ClientHeight = 609
  ClientWidth = 1161
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 72
    Width = 30
    Height = 13
    Caption = 'Scale:'
  end
  object Label2: TLabel
    Left = 8
    Top = 112
    Width = 38
    Height = 13
    Caption = 'Interval:'
  end
  object Label3: TLabel
    Left = 8
    Top = 216
    Width = 3
    Height = 13
    OnDblClick = Label3DblClick
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Simulate'
    TabOrder = 0
    OnClick = Button1Click
  end
  object SpinEdit1: TSpinEdit
    Left = 8
    Top = 88
    Width = 73
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 30
    OnChange = SpinEdit1Change
  end
  object Memo1: TMemo
    Left = 888
    Top = 8
    Width = 265
    Height = 593
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Lucida Console'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Button2: TButton
    Left = 8
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Reset Canvas'
    TabOrder = 3
    OnClick = Button2Click
  end
  object ScrollBox1: TScrollBox
    Left = 88
    Top = 8
    Width = 793
    Height = 593
    TabOrder = 4
    object Image1: TImage
      Left = 3
      Top = 3
      Width = 2000
      Height = 2000
    end
  end
  object SpinEdit2: TSpinEdit
    Left = 8
    Top = 128
    Width = 73
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 5
    Value = 30
    OnChange = SpinEdit2Change
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 6
    OnClick = BitBtn1Click
    Kind = bkIgnore
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 184
    Width = 73
    Height = 25
    TabOrder = 7
  end
  object Button3: TButton
    Left = 8
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Step'
    TabOrder = 8
    OnClick = Timer1Timer
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 296
    Width = 75
    Height = 33
    Caption = 'Show Cmd[0..8,1..30]'
    TabOrder = 9
    OnClick = BitBtn2Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 8
    Top = 272
  end
end

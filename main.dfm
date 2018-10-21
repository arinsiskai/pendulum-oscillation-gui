object Form1: TForm1
  Left = 257
  Top = 103
  Width = 953
  Height = 558
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnPaint = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 344
    Top = 8
    Width = 270
    Height = 24
    Alignment = taCenter
    Caption = 'Pendulum Oscillation Simulation'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 264
    Top = 344
    Width = 42
    Height = 13
    Caption = 'Damping'
  end
  object Label3: TLabel
    Left = 264
    Top = 384
    Width = 95
    Height = 13
    Caption = 'Initial angle (degree)'
  end
  object Label4: TLabel
    Left = 264
    Top = 432
    Width = 83
    Height = 13
    Caption = 'Forcing amplitudo'
  end
  object imagePendulum: TImage
    Left = 0
    Top = 48
    Width = 225
    Height = 265
  end
  object OscPlot: TChart
    Left = 232
    Top = 48
    Width = 681
    Height = 265
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Oscillation')
    BottomAxis.Automatic = False
    BottomAxis.AutomaticMaximum = False
    BottomAxis.AutomaticMinimum = False
    BottomAxis.Maximum = 100.000000000000000000
    BottomAxis.MinorTickLength = 0
    BottomAxis.TickLength = 0
    BottomAxis.TickOnLabelsOnly = False
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.Maximum = 3.000000000000000000
    LeftAxis.Minimum = -3.000000000000000000
    Legend.Visible = False
    View3D = False
    TabOrder = 0
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Oscillation'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object TrackBarDamping: TTrackBar
    Left = 368
    Top = 328
    Width = 150
    Height = 33
    TabOrder = 1
    TickMarks = tmBoth
    OnChange = TrackBarDampingChange
  end
  object TrackBarInitialAngle: TTrackBar
    Left = 368
    Top = 376
    Width = 150
    Height = 33
    TabOrder = 2
    TickMarks = tmBoth
    OnChange = TrackBarInitialAngleChange
  end
  object TrackBarForce: TTrackBar
    Left = 368
    Top = 424
    Width = 150
    Height = 33
    TabOrder = 3
    TickMarks = tmBoth
    OnChange = TrackBarForceChange
  end
  object Button1: TButton
    Left = 352
    Top = 472
    Width = 75
    Height = 25
    Caption = 'run'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 440
    Top = 472
    Width = 75
    Height = 25
    Caption = 'stop'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 536
    Top = 336
    Width = 65
    Height = 21
    TabOrder = 6
    Text = '0'
  end
  object Edit2: TEdit
    Left = 536
    Top = 384
    Width = 65
    Height = 21
    TabOrder = 7
    Text = '0'
  end
  object Edit3: TEdit
    Left = 536
    Top = 432
    Width = 65
    Height = 21
    TabOrder = 8
    Text = '0'
  end
  object GroupBox1: TGroupBox
    Left = 680
    Top = 328
    Width = 233
    Height = 81
    Caption = 'About'
    TabOrder = 9
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 216
      Height = 13
      Caption = 'This program build with Euler-Cromer algorithm'
    end
    object Label6: TLabel
      Left = 8
      Top = 32
      Width = 122
      Height = 13
      Caption = 'Developed by; Arin Siska '
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 224
    Top = 8
  end
end

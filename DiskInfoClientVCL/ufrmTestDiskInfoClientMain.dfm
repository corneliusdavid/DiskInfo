object frmTestDiskInfoClientMain: TfrmTestDiskInfoClientMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Disk Info Service Tester'
  ClientHeight = 211
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    619
    211)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 280
    Top = 21
    Width = 39
    Height = 13
    Caption = 'Results:'
  end
  object edtServiceURL: TLabeledEdit
    Left = 24
    Top = 40
    Width = 232
    Height = 21
    EditLabel.Width = 61
    EditLabel.Height = 13
    EditLabel.Caption = 'Service URL:'
    TabOrder = 0
    Text = 'http://173.248.153.144:8099/bin'
  end
  object btnGetServerTime: TButton
    Left = 24
    Top = 80
    Width = 113
    Height = 33
    Caption = 'Get Server Time'
    TabOrder = 1
    OnClick = btnGetServerTimeClick
  end
  object btnGetCurrDiskType: TButton
    Left = 24
    Top = 119
    Width = 113
    Height = 33
    Caption = 'Get Curr Disk Type'
    TabOrder = 2
    OnClick = btnGetCurrDiskTypeClick
  end
  object btnGetCurrDiskName: TButton
    Left = 24
    Top = 158
    Width = 113
    Height = 33
    Caption = 'Get Curr Disk Name'
    TabOrder = 3
    OnClick = btnGetCurrDiskNameClick
  end
  object btnGetCurrVolName: TButton
    Left = 143
    Top = 80
    Width = 113
    Height = 33
    Caption = 'Get Curr Vol Name'
    TabOrder = 4
    OnClick = btnGetCurrVolNameClick
  end
  object btnGetCurrDiskSize: TButton
    Left = 143
    Top = 119
    Width = 113
    Height = 33
    Caption = 'Get Curr Disk Size'
    TabOrder = 5
    OnClick = btnGetCurrDiskSizeClick
  end
  object btnGetCurrDiskFree: TButton
    Left = 143
    Top = 158
    Width = 113
    Height = 33
    Caption = 'Get Curr Disk Free'
    TabOrder = 6
    OnClick = btnGetCurrDiskFreeClick
  end
  object lbResults: TListBox
    Left = 280
    Top = 40
    Width = 319
    Height = 151
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 7
    ExplicitWidth = 329
  end
  object RORemoteService: TRORemoteService
    Channel = ROWinInetHTTPChannel
    Message = ROBinMessage
    Left = 408
    Top = 56
  end
  object ROBinMessage: TROBinMessage
    Envelopes = <>
    Left = 328
    Top = 80
  end
  object ROWinInetHTTPChannel: TROWinInetHTTPChannel
    UserAgent = 'RemObjects SDK'
    DispatchOptions = []
    ServerLocators = <>
    TargetUrl = 'http://127.0.0.1:8099/bin'
    TrustInvalidCA = False
    Left = 408
    Top = 104
  end
end

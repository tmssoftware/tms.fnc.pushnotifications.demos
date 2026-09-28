object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TMS FNC Web Push Notification Server Demo'
  ClientHeight = 336
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    413
    336)
  TextHeight = 15
  object lblTitle: TLabel
    Left = 8
    Top = 61
    Width = 86
    Height = 15
    Caption = 'Notification title'
  end
  object lblBody: TLabel
    Left = 8
    Top = 93
    Width = 93
    Height = 15
    Caption = 'Notification body'
  end
  object lblLog: TLabel
    Left = 8
    Top = 202
    Width = 28
    Height = 15
    Caption = 'Logs:'
  end
  object btnStart: TButton
    Left = 8
    Top = 8
    Width = 395
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Start push server'
    TabOrder = 0
    OnClick = btnStartClick
  end
  object memLog: TMemo
    Left = 8
    Top = 223
    Width = 395
    Height = 106
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
  end
  object btnSendToAll: TButton
    Left = 8
    Top = 160
    Width = 395
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Send to all'
    TabOrder = 2
    OnClick = btnSendToAllClick
  end
  object edtTitle: TEdit
    Left = 100
    Top = 58
    Width = 303
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Text = 'My notification title'
  end
  object edtBody: TEdit
    Left = 107
    Top = 90
    Width = 296
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Text = 'My notification body'
  end
  object chkUrl: TCheckBox
    Left = 8
    Top = 128
    Width = 57
    Height = 17
    Caption = 'URL'
    TabOrder = 5
  end
  object edtUrl: TEdit
    Left = 71
    Top = 125
    Width = 332
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 6
    Text = 'https://tmssoftware.com'
  end
  object TMSFNCWebPushDB1: TTMSFNCWebPushDB
    Left = 304
    Top = 240
  end
  object TMSFNCWebPushSender1: TTMSFNCWebPushSender
    PushDB = TMSFNCWebPushDB1
    OnNotificationSent = TMSFNCWebPushSender1NotificationSent
    OnNotificationError = TMSFNCWebPushSender1NotificationError
    Left = 192
    Top = 264
  end
  object TMSFNCWebPushServer1: TTMSFNCWebPushServer
    PushDB = TMSFNCWebPushDB1
    Active = False
    OnHTTPRequest = TMSFNCWebPushServer1HTTPRequest
    Left = 80
    Top = 240
  end
end

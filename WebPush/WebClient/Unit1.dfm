object Form2: TForm2
  Width = 1000
  Height = 750
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Tahoma'
  Font.Style = []
  FormContainer = 'appcontent'
  ParentFont = False
  OnCreate = WebFormCreate
  OnExit = WebFormExit
  PixelsPerInch = 150
  object WebLabel1: TWebLabel
    Left = 13
    Top = 17
    Width = 68
    Height = 24
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'UserID:'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel3: TWebLabel
    Left = 488
    Top = 52
    Width = 205
    Height = 24
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Push Notification demo'
    ElementID = 'title'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel4: TWebLabel
    Left = 488
    Top = 102
    Width = 288
    Height = 24
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Usage of TWebPushNotifications'
    ElementID = 'description'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebEdit1: TWebEdit
    Left = 89
    Top = 13
    Width = 338
    Height = 29
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnChange = WebEdit1Change
  end
  object WebButton1: TWebButton
    Left = 13
    Top = 52
    Width = 414
    Height = 39
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Subscribe for push notifications'
    ChildOrder = 1
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebButton1Click
  end
  object WebButton2: TWebButton
    Left = 13
    Top = 100
    Width = 414
    Height = 39
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Unsubscribe from push notifications'
    ChildOrder = 2
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebButton2Click
  end
  object WebPushNotifications1: TWebPushNotifications
    RegisterSubscriptionURL = 'http://localhost:8081/registerSubscription'
    UnregisterSubscriptionURL = 'http://localhost:8081/unregisterSubscription'
    VapidPublickeyURL = 'http://localhost:8081/vapidPublicKey'
    Left = 168
    Top = 120
  end
end

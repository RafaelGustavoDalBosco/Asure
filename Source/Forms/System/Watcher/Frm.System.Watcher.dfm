inherited FrmSystemWatcher: TFrmSystemWatcher
  Caption = 'Aguarde...'
  ClientHeight = 141
  ClientWidth = 500
  ExplicitWidth = 504
  ExplicitHeight = 145
  TextHeight = 11
  inherited PnlMain: TPanel
    Width = 500
    Height = 141
    ExplicitWidth = 500
    ExplicitHeight = 141
    object LblMainExecution: TLabel [0]
      Left = 125
      Top = 27
      Width = 372
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = '[Main execution]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblSubExecution: TLabel [1]
      Left = 125
      Top = 50
      Width = 372
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Caption = '[Sub execution]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object LblAction: TLabel [2]
      Left = 125
      Top = 79
      Width = 375
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Caption = '[Action]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited PnlUpper: TPanel
      Width = 500
      TabOrder = 1
      ExplicitWidth = 500
      inherited BtMaximize: TcxButton
        Left = 456
        Enabled = False
        Visible = False
        ExplicitLeft = 456
      end
      inherited BtMinimize: TcxButton
        Left = 434
        Enabled = False
        Visible = False
        ExplicitLeft = 434
      end
      inherited BtClose: TcxButton
        Left = 478
        Enabled = False
        Visible = False
        ExplicitLeft = 478
      end
    end
    object ProgressBar: TcxProgressBar
      AlignWithMargins = True
      Left = 3
      Top = 110
      Align = alBottom
      ParentColor = False
      ParentFont = False
      Properties.BeginColor = 16744448
      Properties.OverloadBeginColor = clBlue
      Style.BorderStyle = ebsNone
      Style.Color = clWhite
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.BorderStyle = ebsNone
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.BorderStyle = ebsNone
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      ExplicitTop = 117
      Width = 494
    end
    object ActivityIndicator: TdxActivityIndicator
      Left = 0
      Top = 21
      Width = 119
      Height = 86
      Align = alLeft
      PropertiesClassName = 'TdxActivityIndicatorCircularDotsProperties'
      Properties.OverlayColor = -1
      Properties.DotColor = -16776961
      Properties.DotCount = 10
      Properties.DotSize = 8
      Active = True
    end
  end
end

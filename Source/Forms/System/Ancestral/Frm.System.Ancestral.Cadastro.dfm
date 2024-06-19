inherited FrmSystemAncestralCadastro: TFrmSystemAncestralCadastro
  Caption = 'FrmSystemAncestralCadastro'
  ClientHeight = 296
  ClientWidth = 514
  ExplicitWidth = 518
  ExplicitHeight = 300
  TextHeight = 11
  inherited PnlMain: TPanel
    Width = 514
    Height = 296
    ExplicitWidth = 514
    ExplicitHeight = 296
    inherited PnlUpper: TPanel
      Width = 514
      ExplicitWidth = 514
      inherited BtMaximize: TcxButton
        Left = 470
        ExplicitLeft = 470
      end
      inherited BtMinimize: TcxButton
        Left = 448
        ExplicitLeft = 448
      end
      inherited BtClose: TcxButton
        Left = 492
        ExplicitLeft = 492
      end
    end
    object PgMain: TcxPageControl
      Left = 0
      Top = 41
      Width = 514
      Height = 255
      Align = alClient
      TabOrder = 1
      Properties.ActivePage = TabSheetDados
      Properties.CustomButtons.Buttons = <>
      Properties.Images = FSystemCompAssistence.IconList32
      ClientRectBottom = 251
      ClientRectLeft = 4
      ClientRectRight = 510
      ClientRectTop = 41
      object TabSheetDados: TcxTabSheet
        ImageIndex = 0
        object GrbButtons: TcxGroupBox
          Left = 0
          Top = 155
          Align = alBottom
          Style.BorderStyle = ebsNone
          TabOrder = 0
          Height = 55
          Width = 506
          object BtConfirm: TcxButton
            Left = 292
            Top = 16
            Width = 106
            Height = 37
            Align = alRight
            Caption = '&Confirmar'
            Colors.Default = clWhite
            LookAndFeel.NativeStyle = True
            OptionsImage.Glyph.SourceDPI = 96
            OptionsImage.Glyph.Data = {
              3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
              462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
              617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
              2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
              77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
              22307078222076696577426F783D2230203020333220333222207374796C653D
              22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
              3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
              303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
              63653D227072657365727665223E2E426C75657B66696C6C3A23313137374437
              3B7D262331333B262331303B2623393B2E59656C6C6F777B66696C6C3A234646
              423131353B7D262331333B262331303B2623393B2E426C61636B7B66696C6C3A
              233732373237323B7D262331333B262331303B2623393B2E477265656E7B6669
              6C6C3A233033394332333B7D262331333B262331303B2623393B2E5265647B66
              696C6C3A234431314331433B7D262331333B262331303B2623393B2E7374307B
              6F7061636974793A302E37353B7D262331333B262331303B2623393B2E737431
              7B6F7061636974793A302E353B7D3C2F7374796C653E0D0A3C672069643D2243
              6865636B436972636C6564223E0D0A09093C7061746820636C6173733D224772
              65656E2220643D224D31362C3443392E342C342C342C392E342C342C31366330
              2C362E362C352E342C31322C31322C31327331322D352E342C31322D31324332
              382C392E342C32322E362C342C31362C347A204D31342C32326C2D362D366C32
              2D326C342C346C382D386C322C3220202623393B2623393B4C31342C32327A22
              2F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
            TabOrder = 0
            Visible = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BtConfirmClick
          end
          object BtCancel: TcxButton
            Left = 398
            Top = 16
            Width = 106
            Height = 37
            Align = alRight
            Caption = 'C&ancelar'
            Colors.Default = clWhite
            LookAndFeel.NativeStyle = True
            OptionsImage.Glyph.SourceDPI = 96
            OptionsImage.Glyph.Data = {
              3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
              462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
              617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
              2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
              77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
              22307078222076696577426F783D2230203020333220333222207374796C653D
              22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
              3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
              303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
              63653D227072657365727665223E2E426C75657B66696C6C3A23313137374437
              3B7D262331333B262331303B2623393B2E59656C6C6F777B66696C6C3A234646
              423131353B7D262331333B262331303B2623393B2E426C61636B7B66696C6C3A
              233732373237323B7D262331333B262331303B2623393B2E477265656E7B6669
              6C6C3A233033394332333B7D262331333B262331303B2623393B2E5265647B66
              696C6C3A234431314331433B7D262331333B262331303B2623393B2E7374307B
              6F7061636974793A302E37353B7D262331333B262331303B2623393B2E737431
              7B6F7061636974793A302E353B7D3C2F7374796C653E0D0A3C672069643D2244
              656C657465436972636C6564223E0D0A09093C7061746820636C6173733D2252
              65642220643D224D31362C3443392E342C342C342C392E342C342C313673352E
              342C31322C31322C31327331322D352E342C31322D31325332322E362C342C31
              362C347A204D32332E312C32302E326C2D322E382C322E384C31362C31382E38
              6C2D342E322C342E3220202623393B2623393B6C2D322E382D322E386C342E32
              2D342E326C2D342E322D342E326C322E382D322E386C342E322C342E326C342E
              322D342E326C322E382C322E384C31382E382C31364C32332E312C32302E327A
              222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
            TabOrder = 1
            Visible = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BtCancelClick
          end
        end
        object GrbID: TcxGroupBox
          Left = 3
          Top = 3
          Caption = 'ID'
          ParentFont = False
          Style.BorderColor = clWhite
          Style.BorderStyle = ebsFlat
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Segoe UI Semibold'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.BorderStyle = ebsNone
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 1
          Height = 49
          Width = 41
          object EdtID: TcxTextEdit
            Left = 2
            Top = 18
            Align = alClient
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            TabOrder = 0
            Width = 37
          end
        end
        object GrbStatus: TcxGroupBox
          Left = 48
          Top = 3
          Caption = 'Status'
          ParentFont = False
          Style.BorderColor = clWhite
          Style.BorderStyle = ebsFlat
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Segoe UI Semibold'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.BorderStyle = ebsNone
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 2
          Height = 49
          Width = 166
          object TsStatus: TdxToggleSwitch
            Left = 2
            Top = 18
            Align = alClient
            Checked = True
            ParentFont = False
            Properties.StateIndicator.Kind = sikText
            Properties.StateIndicator.OffText = 'Inativo'
            Properties.StateIndicator.OnText = 'Ativo'
            Style.BorderStyle = ebsNone
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -12
            Style.Font.Name = 'Segoe UI Semibold'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
          end
        end
      end
    end
    object PnlHeader: TPanel
      Left = 0
      Top = 21
      Width = 514
      Height = 20
      Align = alTop
      BevelOuter = bvNone
      Caption = '[STATUS FORM]'
      Color = clGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
    end
  end
end

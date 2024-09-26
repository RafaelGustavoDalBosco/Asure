inherited FrmCadastroPagamentoFormas: TFrmCadastroPagamentoFormas
  Caption = 'Cadastro de Formas de Pagamento'
  ClientHeight = 236
  ClientWidth = 366
  ExplicitWidth = 370
  ExplicitHeight = 240
  TextHeight = 11
  inherited PnlMain: TPanel
    Width = 366
    Height = 236
    ExplicitWidth = 366
    ExplicitHeight = 236
    inherited PnlUpper: TPanel
      Width = 366
      ExplicitWidth = 366
      inherited BtMaximize: TcxButton
        Left = 322
        ExplicitLeft = 322
      end
      inherited BtMinimize: TcxButton
        Left = 300
        ExplicitLeft = 300
      end
      inherited BtClose: TcxButton
        Left = 344
        ExplicitLeft = 344
      end
    end
    inherited PgMain: TcxPageControl
      Width = 366
      Height = 195
      ExplicitWidth = 366
      ExplicitHeight = 195
      ClientRectBottom = 191
      ClientRectRight = 362
      inherited TabSheetDados: TcxTabSheet
        ExplicitWidth = 358
        ExplicitHeight = 150
        inherited GrbButtons: TcxGroupBox
          Top = 95
          ExplicitTop = 95
          ExplicitWidth = 358
          Width = 358
          inherited BtConfirm: TcxButton
            Left = 144
            ExplicitLeft = 144
          end
          inherited BtCancel: TcxButton
            Left = 250
            ExplicitLeft = 250
          end
        end
        inherited GrbID: TcxGroupBox
          inherited EdtID: TcxTextEdit
            ExplicitHeight = 29
          end
        end
        inherited GrbStatus: TcxGroupBox
          inherited TsStatus: TdxToggleSwitch
            ExplicitWidth = 162
            ExplicitHeight = 29
          end
        end
        object GrbTipo: TcxGroupBox
          Left = 220
          Top = 3
          Caption = 'Tipo'
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
          TabOrder = 3
          Height = 49
          Width = 133
          object CbTipo: TcxComboBox
            Left = 2
            Top = 18
            Align = alClient
            Style.BorderStyle = ebsNone
            StyleFocused.BorderStyle = ebsNone
            StyleHot.BorderStyle = ebsNone
            TabOrder = 0
            TextHint = '< selecione o tipo >'
            Width = 129
          end
        end
        object GrbDescricao: TcxGroupBox
          Left = 3
          Top = 56
          Caption = 'Descri'#231#227'o'
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
          TabOrder = 4
          Height = 49
          Width = 350
          object EdtDescricao: TcxTextEdit
            Left = 2
            Top = 18
            Align = alClient
            Properties.CharCase = ecUpperCase
            Properties.MaxLength = 20
            Style.BorderStyle = ebsNone
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            TextHint = '< digite a descri'#231#227'o da forma de pagamento >'
            Width = 346
          end
        end
      end
    end
    inherited PnlHeader: TPanel
      Width = 366
      ExplicitWidth = 366
    end
  end
end

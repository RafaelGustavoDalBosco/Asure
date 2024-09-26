inherited FrmCadastroBancoContaCartao: TFrmCadastroBancoContaCartao
  Caption = 'Cadastro Cart'#227'o de Cr'#233'dito'
  ClientHeight = 346
  ClientWidth = 462
  ExplicitWidth = 466
  ExplicitHeight = 350
  TextHeight = 11
  inherited PnlMain: TPanel
    Width = 462
    Height = 346
    ExplicitWidth = 462
    ExplicitHeight = 346
    inherited PnlUpper: TPanel
      Width = 462
      ExplicitWidth = 462
      inherited BtMaximize: TcxButton
        Left = 418
        ExplicitLeft = 418
      end
      inherited BtMinimize: TcxButton
        Left = 396
        ExplicitLeft = 396
      end
      inherited BtClose: TcxButton
        Left = 440
        ExplicitLeft = 440
      end
    end
    inherited PgMain: TcxPageControl
      Width = 462
      Height = 305
      ExplicitWidth = 462
      ExplicitHeight = 305
      ClientRectBottom = 301
      ClientRectRight = 458
      inherited TabSheetDados: TcxTabSheet
        ExplicitWidth = 454
        ExplicitHeight = 260
        inherited GrbButtons: TcxGroupBox
          Top = 205
          ExplicitTop = 205
          ExplicitWidth = 454
          Width = 454
          inherited BtConfirm: TcxButton
            Left = 240
            ExplicitLeft = 240
          end
          inherited BtCancel: TcxButton
            Left = 346
            ExplicitLeft = 346
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
        object GrbBancoConta: TcxGroupBox
          Left = 220
          Top = 3
          Caption = 'Conta Banc'#225'ria'
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
          Width = 230
          object CbBancoConta: TcxComboBox
            Left = 2
            Top = 18
            Align = alClient
            Style.BorderStyle = ebsNone
            StyleFocused.BorderStyle = ebsNone
            StyleHot.BorderStyle = ebsNone
            TabOrder = 0
            TextHint = '< selecione a conta >'
            Width = 226
          end
        end
        object GrbNumero: TcxGroupBox
          Left = 220
          Top = 56
          Caption = 'N'#250'mero'
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
          Width = 230
          object EdtNumero: TcxTextEdit
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
            TextHint = '< digite o n'#250'mero do cart'#227'o >'
            Width = 226
          end
        end
        object GrbBandeira: TcxGroupBox
          Left = 3
          Top = 56
          Caption = 'Bandeira'
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
          TabOrder = 5
          Height = 49
          Width = 211
          object CbBandeira: TcxComboBox
            Left = 2
            Top = 18
            Align = alClient
            Properties.OnChange = CbBandeiraPropertiesChange
            Style.BorderStyle = ebsNone
            StyleFocused.BorderStyle = ebsNone
            StyleHot.BorderStyle = ebsNone
            TabOrder = 0
            TextHint = '< selecione a bandeira >'
            Width = 168
          end
          object CxImgBandeira: TcxImage
            Left = 170
            Top = 18
            Align = alRight
            Style.BorderStyle = ebsNone
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.BorderStyle = ebsNone
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.BorderStyle = ebsNone
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            Height = 29
            Width = 39
          end
        end
        object GrbCVV: TcxGroupBox
          Left = 112
          Top = 109
          Caption = 'CVV'
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
          TabOrder = 6
          Height = 49
          Width = 55
          object EdtCVV: TcxTextEdit
            Left = 2
            Top = 18
            Align = alClient
            Properties.CharCase = ecUpperCase
            Properties.EchoMode = eemPassword
            Properties.MaxLength = 3
            Properties.PasswordChar = '*'
            Properties.ShowPasswordRevealButton = True
            Style.BorderStyle = ebsNone
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            TextHint = '< CVV >'
            Width = 51
          end
        end
        object GrbValidade: TcxGroupBox
          Left = 3
          Top = 109
          Caption = 'Validade'
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
          TabOrder = 7
          Height = 49
          Width = 103
          object EdtDataValidade: TcxDateEdit
            Left = 2
            Top = 18
            Align = alClient
            Properties.AssignedValues.EditFormat = True
            Properties.DateOnError = deToday
            Properties.DisplayFormat = '##/##'
            Style.BorderStyle = ebsNone
            StyleFocused.BorderStyle = ebsNone
            StyleHot.BorderStyle = ebsNone
            TabOrder = 0
            TextHint = '< validade >'
            Width = 99
          end
        end
        object GrbNome: TcxGroupBox
          Left = 173
          Top = 109
          Caption = 'Nome no Cart'#227'o'
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
          TabOrder = 8
          Height = 49
          Width = 277
          object EdtNome: TcxTextEdit
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
            TextHint = '< digite o nome no cart'#227'o >'
            Width = 273
          end
        end
        object GrbLimite: TcxGroupBox
          Left = 3
          Top = 162
          Caption = 'Limite R$'
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
          TabOrder = 9
          Height = 49
          Width = 103
          object EdtLimite: TcxCurrencyEdit
            Left = 2
            Top = 18
            Align = alClient
            Style.BorderStyle = ebsNone
            StyleFocused.BorderStyle = ebsNone
            StyleHot.BorderStyle = ebsNone
            TabOrder = 0
            TextHint = '0,00'
            Width = 99
          end
        end
        object GrbLimiteUtilizado: TcxGroupBox
          Left = 112
          Top = 162
          Caption = 'Limite Utilizado R$'
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
          TabOrder = 10
          Height = 49
          Width = 109
          object EdtLimiteUtilizado: TcxCurrencyEdit
            Left = 2
            Top = 18
            Align = alClient
            Style.BorderStyle = ebsNone
            StyleFocused.BorderStyle = ebsNone
            StyleHot.BorderStyle = ebsNone
            TabOrder = 0
            TextHint = '0,00'
            Width = 105
          end
        end
        object GrbTotalProximasFaturas: TcxGroupBox
          Left = 227
          Top = 162
          Caption = 'Total pr'#243'ximas Faturas R$'
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
          TabOrder = 11
          Height = 49
          Width = 223
          object EdtTotalProximasFaturas: TcxCurrencyEdit
            Left = 2
            Top = 18
            Align = alClient
            Style.BorderStyle = ebsNone
            StyleFocused.BorderStyle = ebsNone
            StyleHot.BorderStyle = ebsNone
            TabOrder = 0
            TextHint = '0,00'
            Width = 219
          end
        end
      end
    end
    inherited PnlHeader: TPanel
      Width = 462
      ExplicitWidth = 462
    end
  end
end

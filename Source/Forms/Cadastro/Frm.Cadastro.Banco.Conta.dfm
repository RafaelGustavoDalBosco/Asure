inherited FrmCadastroBancoConta: TFrmCadastroBancoConta
  Caption = 'Cadastro de Conta Banc'#225'ria'
  ClientHeight = 349
  ClientWidth = 460
  ExplicitWidth = 464
  ExplicitHeight = 353
  TextHeight = 11
  inherited PnlMain: TPanel
    Width = 460
    Height = 349
    ExplicitWidth = 460
    ExplicitHeight = 349
    inherited PnlUpper: TPanel
      Width = 460
      ExplicitWidth = 460
      inherited BtMaximize: TcxButton
        Left = 416
        ExplicitLeft = 416
      end
      inherited BtMinimize: TcxButton
        Left = 394
        ExplicitLeft = 394
      end
      inherited BtClose: TcxButton
        Left = 438
        ExplicitLeft = 438
      end
    end
    inherited PgMain: TcxPageControl
      Width = 460
      Height = 308
      ExplicitWidth = 460
      ExplicitHeight = 308
      ClientRectBottom = 304
      ClientRectRight = 456
      inherited TabSheetDados: TcxTabSheet
        ExplicitWidth = 452
        ExplicitHeight = 263
        inherited GrbButtons: TcxGroupBox
          Top = 208
          TabOrder = 9
          ExplicitTop = 208
          ExplicitWidth = 452
          Width = 452
          inherited BtConfirm: TcxButton
            Left = 238
            ExplicitLeft = 238
          end
          inherited BtCancel: TcxButton
            Left = 344
            ExplicitLeft = 344
          end
        end
        inherited GrbID: TcxGroupBox
          TabOrder = 0
          inherited EdtID: TcxTextEdit
            ExplicitHeight = 29
          end
        end
        inherited GrbStatus: TcxGroupBox
          TabOrder = 1
          inherited TsStatus: TdxToggleSwitch
            ExplicitWidth = 162
            ExplicitHeight = 29
          end
        end
        object GrbCpfCnpj: TcxGroupBox
          Left = 218
          Top = 58
          Caption = 'CPF/CNPJ'
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
          object EdtCpfCnpj: TcxMaskEdit
            Left = 2
            Top = 18
            Align = alClient
            Style.BorderColor = clWhite
            Style.BorderStyle = ebsNone
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            TextHint = '< CPF/CNPJ >'
            Width = 226
          end
        end
        object GrbBanco: TcxGroupBox
          Left = 218
          Top = 3
          Caption = 'Banco'
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
          Width = 230
          object EdtBanco: TcxTextEdit
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
            TextHint = '< digite o nome do banco >'
            Width = 226
          end
        end
        object RgTipoPessoa: TcxRadioGroup
          Left = 3
          Top = 58
          Caption = 'Tipo Pessoa'
          ParentFont = False
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = 'F'#237'sica'
            end
            item
              Caption = 'Jur'#237'dica'
            end>
          ItemIndex = 0
          Style.BorderColor = clWhite
          Style.BorderStyle = ebsFlat
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Segoe UI Semibold'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 3
          Height = 49
          Width = 211
        end
        object GrbNumero: TcxGroupBox
          Left = 3
          Top = 111
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
          TabOrder = 5
          Height = 49
          Width = 211
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
            TextHint = '< digite o n'#250'mero da conta >'
            Width = 207
          end
        end
        object GrbAgencia: TcxGroupBox
          Left = 218
          Top = 111
          Caption = 'Ag'#234'ncia'
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
          Width = 230
          object EdtAgencia: TcxTextEdit
            Left = 2
            Top = 18
            Align = alClient
            Properties.CharCase = ecUpperCase
            Properties.MaxLength = 4
            Style.BorderStyle = ebsNone
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            TextHint = '< digite a ag'#234'ncia da conta >'
            Width = 226
          end
        end
        object GrbSaldo: TcxGroupBox
          Left = 3
          Top = 164
          Caption = 'Saldo R$'
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
          Width = 211
          object EdtSaldo: TcxCurrencyEdit
            Left = 2
            Top = 18
            Align = alClient
            Style.BorderStyle = ebsNone
            StyleFocused.BorderStyle = ebsNone
            StyleHot.BorderStyle = ebsNone
            TabOrder = 0
            TextHint = '0,00'
            Width = 207
          end
        end
        object GrbValorAplicado: TcxGroupBox
          Left = 218
          Top = 165
          Caption = 'Valor Aplicado R$'
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
          Width = 230
          object EdtValorAplicado: TcxCurrencyEdit
            Left = 2
            Top = 18
            Align = alClient
            Style.BorderStyle = ebsNone
            StyleFocused.BorderStyle = ebsNone
            StyleHot.BorderStyle = ebsNone
            TabOrder = 0
            TextHint = '0,00'
            Width = 226
          end
        end
      end
    end
    inherited PnlHeader: TPanel
      Width = 460
      ExplicitWidth = 460
    end
  end
end

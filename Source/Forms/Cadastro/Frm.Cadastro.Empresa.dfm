inherited FrmCadastroEmpresa: TFrmCadastroEmpresa
  Caption = 'Cadastro de Empresa'
  ClientHeight = 233
  ClientWidth = 523
  ExplicitWidth = 527
  ExplicitHeight = 237
  TextHeight = 11
  inherited PnlMain: TPanel
    Width = 523
    Height = 233
    ExplicitWidth = 523
    ExplicitHeight = 233
    inherited PnlUpper: TPanel
      Width = 523
      ExplicitWidth = 523
      inherited BtMaximize: TcxButton
        Left = 479
        ExplicitLeft = 479
      end
      inherited BtMinimize: TcxButton
        Left = 457
        ExplicitLeft = 457
      end
      inherited BtClose: TcxButton
        Left = 501
        ExplicitLeft = 501
      end
    end
    inherited PgMain: TcxPageControl
      Width = 523
      Height = 192
      ExplicitWidth = 523
      ExplicitHeight = 192
      ClientRectBottom = 188
      ClientRectRight = 519
      inherited TabSheetDados: TcxTabSheet
        ExplicitWidth = 515
        ExplicitHeight = 147
        inherited GrbButtons: TcxGroupBox
          Top = 92
          ExplicitTop = 92
          ExplicitWidth = 515
          Width = 515
          inherited BtConfirm: TcxButton
            Left = 301
            ExplicitLeft = 301
          end
          inherited BtCancel: TcxButton
            Left = 407
            ExplicitLeft = 407
          end
        end
        object RgTipoPessoa: TcxRadioGroup
          Left = 220
          Top = 3
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
          Properties.OnChange = RgTipoPessoaPropertiesChange
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
          Width = 161
        end
        object GrbRazaoSocial: TcxGroupBox
          Left = 3
          Top = 56
          Caption = 'Raz'#227'o Social'
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
          Width = 510
          object EdtRazaoSocial: TcxTextEdit
            Left = 2
            Top = 18
            Align = alClient
            Properties.CharCase = ecUpperCase
            Properties.MaxLength = 60
            Style.BorderStyle = ebsNone
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            TextHint = '< digite o nome da empresa >'
            Width = 506
          end
        end
        object GrbCpfCnpj: TcxGroupBox
          Left = 387
          Top = 3
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
          TabOrder = 5
          Height = 49
          Width = 126
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
            Width = 122
          end
        end
      end
    end
    inherited PnlHeader: TPanel
      Width = 523
      ExplicitWidth = 523
    end
  end
end

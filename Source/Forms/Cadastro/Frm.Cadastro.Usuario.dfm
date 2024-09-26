inherited FrmCadastroUsuario: TFrmCadastroUsuario
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 342
  ClientWidth = 533
  ExplicitWidth = 537
  ExplicitHeight = 346
  TextHeight = 11
  inherited PnlMain: TPanel
    Width = 533
    Height = 342
    ExplicitWidth = 533
    ExplicitHeight = 342
    inherited PnlUpper: TPanel
      Width = 533
      ExplicitWidth = 533
      inherited BtMaximize: TcxButton
        Left = 489
        ExplicitLeft = 489
      end
      inherited BtMinimize: TcxButton
        Left = 467
        ExplicitLeft = 467
      end
      inherited BtClose: TcxButton
        Left = 511
        ExplicitLeft = 511
      end
    end
    inherited PgMain: TcxPageControl
      Width = 533
      Height = 301
      ExplicitWidth = 533
      ExplicitHeight = 301
      ClientRectBottom = 297
      ClientRectRight = 529
      inherited TabSheetDados: TcxTabSheet
        ExplicitWidth = 525
        ExplicitHeight = 256
        inherited GrbButtons: TcxGroupBox
          Top = 201
          ExplicitTop = 201
          ExplicitWidth = 525
          Width = 525
          inherited BtConfirm: TcxButton
            Left = 311
            ExplicitLeft = 311
          end
          inherited BtCancel: TcxButton
            Left = 417
            ExplicitLeft = 417
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
        object GrbNome: TcxGroupBox
          Left = 220
          Top = 3
          Caption = 'Nome'
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
          Width = 301
          object EdtNome: TcxTextEdit
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
            TextHint = '< digite o nome >'
            Width = 297
          end
        end
        object GrbTitleColor: TcxGroupBox
          Left = 3
          Top = 112
          Caption = 'Cor dos t'#237'tulos'
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
          Width = 518
          object CeTitleColor: TdxColorEdit
            Left = 2
            Top = 18
            Align = alClient
            TabOrder = 0
            Width = 514
          end
        end
        object GrbMainColor: TcxGroupBox
          Left = 3
          Top = 164
          Caption = 'Cor principal'
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
          Width = 518
          object CeMainColor: TdxColorEdit
            Left = 2
            Top = 18
            Align = alClient
            TabOrder = 0
            Width = 514
          end
        end
        object GrbUserName: TcxGroupBox
          Left = 3
          Top = 56
          Caption = 'User Name'
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
          Width = 246
          object EdtUserName: TcxTextEdit
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
            TextHint = '< digite o USERNAME >'
            Width = 242
          end
        end
        object GrbSenha: TcxGroupBox
          Left = 255
          Top = 56
          Caption = 'Senha'
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
          Width = 266
          object EdtSenha: TcxTextEdit
            Left = 2
            Top = 18
            Align = alClient
            Properties.CharCase = ecUpperCase
            Properties.MaxLength = 60
            Properties.PasswordChar = '*'
            Style.BorderStyle = ebsNone
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            TextHint = '< digite a SENHA >'
            Width = 262
          end
        end
      end
    end
    inherited PnlHeader: TPanel
      Width = 533
      ExplicitWidth = 533
    end
  end
end

inherited FrmCadastroDocumentoTipo: TFrmCadastroDocumentoTipo
  Caption = 'Cadastro de Tipos de Documento'
  ClientHeight = 182
  ClientWidth = 560
  ExplicitWidth = 564
  ExplicitHeight = 186
  TextHeight = 11
  inherited PnlMain: TPanel
    Width = 560
    Height = 182
    ExplicitWidth = 560
    ExplicitHeight = 182
    inherited PnlUpper: TPanel
      Width = 560
      ExplicitWidth = 560
      inherited BtMaximize: TcxButton
        Left = 516
        ExplicitLeft = 516
      end
      inherited BtMinimize: TcxButton
        Left = 494
        ExplicitLeft = 494
      end
      inherited BtClose: TcxButton
        Left = 538
        ExplicitLeft = 538
      end
    end
    inherited PgMain: TcxPageControl
      Width = 560
      Height = 141
      ExplicitWidth = 560
      ExplicitHeight = 141
      ClientRectBottom = 137
      ClientRectRight = 556
      inherited TabSheetDados: TcxTabSheet
        ExplicitWidth = 552
        ExplicitHeight = 96
        inherited GrbButtons: TcxGroupBox
          Top = 41
          ExplicitTop = 41
          ExplicitWidth = 552
          Width = 552
          inherited BtConfirm: TcxButton
            Left = 338
            ExplicitLeft = 338
          end
          inherited BtCancel: TcxButton
            Left = 444
            ExplicitLeft = 444
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
        object GrbDescricao: TcxGroupBox
          Left = 220
          Top = 3
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
          TabOrder = 3
          Height = 49
          Width = 330
          object EdtDescricao: TcxTextEdit
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
            TextHint = '< digite a descri'#231#227'o do tipo de documento >'
            Width = 326
          end
        end
      end
    end
    inherited PnlHeader: TPanel
      Width = 560
      ExplicitWidth = 560
    end
  end
end

inherited FrmCadastroDocumento: TFrmCadastroDocumento
  Caption = 'Cadastro de Documento'
  ClientHeight = 498
  ClientWidth = 593
  ExplicitWidth = 597
  ExplicitHeight = 502
  TextHeight = 11
  inherited PnlMain: TPanel
    Width = 593
    Height = 498
    inherited PnlUpper: TPanel
      Width = 593
      inherited BtMaximize: TcxButton
        Left = 549
      end
      inherited BtMinimize: TcxButton
        Left = 527
      end
      inherited BtClose: TcxButton
        Left = 571
      end
    end
    inherited PgMain: TcxPageControl
      Width = 593
      Height = 457
      ClientRectBottom = 453
      ClientRectRight = 589
      inherited TabSheetDados: TcxTabSheet
        inherited GrbButtons: TcxGroupBox
          Top = 357
          Width = 585
          inherited BtConfirm: TcxButton
            Left = 371
          end
          inherited BtCancel: TcxButton
            Left = 477
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
      end
    end
    inherited PnlHeader: TPanel
      Width = 593
    end
  end
end

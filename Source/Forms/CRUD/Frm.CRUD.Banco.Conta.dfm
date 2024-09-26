inherited FrmCRUDBancoConta: TFrmCRUDBancoConta
  Caption = 'Contas Banc'#225'rias'
  ClientWidth = 517
  ExplicitWidth = 521
  TextHeight = 11
  inherited PnlMain: TPanel
    Width = 517
    inherited PnlUpper: TPanel
      Width = 517
      inherited BtMaximize: TcxButton
        Left = 473
      end
      inherited BtMinimize: TcxButton
        Left = 451
      end
      inherited BtClose: TcxButton
        Left = 495
      end
    end
    inherited GrbButtons: TcxGroupBox
      Width = 517
      inherited BtCancel: TcxButton
        Left = 409
      end
    end
    inherited GrbGrid: TcxGroupBox
      Width = 517
      inherited CxgRecords: TcxGrid
        Width = 513
        inherited RecordDB: TcxGridDBTableView
          inherited GridColID: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
          inherited GridColIndexObject: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
          object GridColBanco: TcxGridDBColumn [2]
            Caption = 'Banco'
            DataBinding.FieldName = 'BANCO'
            MinWidth = 250
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringWithFindPanel = False
            Options.IgnoreTimeForFiltering = False
            Options.IncSearch = False
            Options.FilteringAddValueItems = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringFilteredItemsListShowFilteredItemsOnly = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Options.AutoWidthSizable = False
            Options.ExpressionEditing = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Width = 250
          end
          object GridColCpfCnpj: TcxGridDBColumn [3]
            Caption = 'CPF/CNPJ'
            DataBinding.FieldName = 'CPF_CNPJ'
            MinWidth = 110
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringWithFindPanel = False
            Options.IgnoreTimeForFiltering = False
            Options.IncSearch = False
            Options.FilteringAddValueItems = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringFilteredItemsListShowFilteredItemsOnly = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Options.AutoWidthSizable = False
            Options.ExpressionEditing = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Width = 110
          end
          object GridColSaldo: TcxGridDBColumn [4]
            Caption = 'Saldo R$'
            DataBinding.FieldName = 'Saldo'
            MinWidth = 80
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringWithFindPanel = False
            Options.IgnoreTimeForFiltering = False
            Options.IncSearch = False
            Options.FilteringAddValueItems = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringFilteredItemsListShowFilteredItemsOnly = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Options.AutoWidthSizable = False
            Options.ExpressionEditing = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Width = 80
          end
          inherited GridColActive: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
        end
      end
    end
    inherited GrbSearch: TcxGroupBox
      Width = 517
      inherited EdtSearch: TcxTextEdit
        ExplicitHeight = 23
        Width = 483
      end
      inherited BtExport: TcxButton
        Left = 485
      end
    end
  end
end

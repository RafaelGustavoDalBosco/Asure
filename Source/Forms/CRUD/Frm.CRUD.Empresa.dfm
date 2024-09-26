inherited FrmCRUDEmpresa: TFrmCRUDEmpresa
  Caption = 'Empresas'
  ClientWidth = 571
  ExplicitWidth = 575
  TextHeight = 11
  inherited PnlMain: TPanel
    Width = 571
    inherited PnlUpper: TPanel
      Width = 571
      inherited BtMaximize: TcxButton
        Left = 527
      end
      inherited BtMinimize: TcxButton
        Left = 505
      end
      inherited BtClose: TcxButton
        Left = 549
      end
    end
    inherited GrbButtons: TcxGroupBox
      Width = 571
    end
    inherited GrbGrid: TcxGroupBox
      Width = 571
      inherited CxgRecords: TcxGrid
        Width = 567
        inherited RecordDB: TcxGridDBTableView
          inherited GridColID: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
          inherited GridColIndexObject: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
          object GridColRazaoSocial: TcxGridDBColumn [2]
            Caption = 'Raz'#227'o Social'
            DataBinding.FieldName = 'RAZAO_SOCIAL'
            MinWidth = 300
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
            Width = 300
          end
          object GridColCPF: TcxGridDBColumn [3]
            DataBinding.FieldName = 'CPF'
            MinWidth = 100
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
            Width = 100
          end
          object GridColCNPJ: TcxGridDBColumn [4]
            DataBinding.FieldName = 'CNPJ'
            MinWidth = 100
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
            Width = 100
          end
          inherited GridColActive: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
        end
      end
    end
    inherited GrbSearch: TcxGroupBox
      Width = 571
      inherited EdtSearch: TcxTextEdit
        Properties.OnChange = EdtSearchPropertiesChange
        Width = 537
      end
      inherited BtExport: TcxButton
        Left = 539
      end
    end
  end
end

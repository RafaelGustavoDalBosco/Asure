inherited FrmCRUDPagamentoFormas: TFrmCRUDPagamentoFormas
  Caption = 'Formas de Pagamento'
  ClientWidth = 468
  ExplicitWidth = 472
  TextHeight = 11
  inherited PnlMain: TPanel
    Width = 468
    inherited PnlUpper: TPanel
      Width = 468
      inherited BtMaximize: TcxButton
        Left = 424
      end
      inherited BtMinimize: TcxButton
        Left = 402
      end
      inherited BtClose: TcxButton
        Left = 446
      end
    end
    inherited GrbButtons: TcxGroupBox
      Width = 468
      inherited BtCancel: TcxButton
        Left = 360
      end
    end
    inherited GrbGrid: TcxGroupBox
      Width = 468
      inherited CxgRecords: TcxGrid
        Width = 464
        inherited RecordDB: TcxGridDBTableView
          inherited GridColID: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
          inherited GridColIndexObject: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
          inherited GridColActive: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
          object GridColDescricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'DESCRICAO'
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
          object GridColTipo: TcxGridDBColumn
            Caption = 'Tipo'
            DataBinding.FieldName = 'TIPO'
            MinWidth = 90
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
            Width = 90
          end
        end
      end
    end
    inherited GrbSearch: TcxGroupBox
      Width = 468
      inherited EdtSearch: TcxTextEdit
        ExplicitHeight = 23
        Width = 434
      end
      inherited BtExport: TcxButton
        Left = 436
      end
    end
  end
end

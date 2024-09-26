inherited FrmCRUDBancoContaCartao: TFrmCRUDBancoContaCartao
  Caption = 'Cart'#245'es de Cr'#233'dito'
  TextHeight = 11
  inherited PnlMain: TPanel
    inherited GrbGrid: TcxGroupBox
      inherited CxgRecords: TcxGrid
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
            DataBinding.IsNullValueType = True
            MinWidth = 160
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
            Width = 160
          end
          object GridColBandeira: TcxGridDBColumn [3]
            Caption = 'Bandeira'
            DataBinding.FieldName = 'BANDEIRA'
            DataBinding.IsNullValueType = True
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
          object GridColNumero: TcxGridDBColumn [4]
            Caption = 'N'#250'mero'
            DataBinding.FieldName = 'NUMERO'
            DataBinding.IsNullValueType = True
            MinWidth = 195
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
            Width = 195
          end
          object GridColLimite: TcxGridDBColumn [5]
            Caption = 'Limite R$'
            DataBinding.FieldName = 'LIMITE'
            DataBinding.IsNullValueType = True
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
          object GridColLimiteUtilizado: TcxGridDBColumn [6]
            Caption = 'Limite Utilizado R$'
            DataBinding.FieldName = 'LIMITE_UTILIZADO'
            DataBinding.IsNullValueType = True
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
          inherited GridColActive: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
        end
      end
    end
    inherited GrbSearch: TcxGroupBox
      inherited EdtSearch: TcxTextEdit
        ExplicitHeight = 23
      end
    end
  end
end

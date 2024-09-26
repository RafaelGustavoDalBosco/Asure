inherited FrmCRUDUsuario: TFrmCRUDUsuario
  Caption = 'Usu'#225'rios'
  ClientWidth = 554
  ExplicitWidth = 558
  TextHeight = 11
  inherited PnlMain: TPanel
    Width = 554
    inherited PnlUpper: TPanel
      Width = 554
      inherited BtMaximize: TcxButton
        Left = 510
      end
      inherited BtMinimize: TcxButton
        Left = 488
      end
      inherited BtClose: TcxButton
        Left = 532
      end
    end
    inherited GrbButtons: TcxGroupBox
      Width = 554
      inherited BtCancel: TcxButton
        Left = 446
      end
    end
    inherited GrbGrid: TcxGroupBox
      Width = 554
      inherited CxgRecords: TcxGrid
        Width = 550
        inherited RecordDB: TcxGridDBTableView
          inherited GridColID: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
          object GridColNome: TcxGridDBColumn [1]
            Caption = 'Nome'
            DataBinding.FieldName = 'NOME'
            DataBinding.IsNullValueType = True
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
          inherited GridColIndexObject: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
          object GridColUserName: TcxGridDBColumn [3]
            Caption = 'UserName'
            DataBinding.FieldName = 'USERNAME'
            MinWidth = 180
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
            Width = 180
          end
          inherited GridColActive: TcxGridDBColumn
            DataBinding.IsNullValueType = True
          end
        end
      end
    end
    inherited GrbSearch: TcxGroupBox
      Width = 554
      inherited EdtSearch: TcxTextEdit
        ExplicitHeight = 23
        Width = 520
      end
      inherited BtExport: TcxButton
        Left = 522
      end
    end
  end
end

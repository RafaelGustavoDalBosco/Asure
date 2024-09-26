inherited FrmCRUDDocumentoTipo: TFrmCRUDDocumentoTipo
  Caption = 'Tipos de Documento'
  ClientWidth = 579
  ExplicitWidth = 583
  TextHeight = 11
  inherited PnlMain: TPanel
    Width = 579
    inherited PnlUpper: TPanel
      Width = 579
      inherited BtMaximize: TcxButton
        Left = 535
      end
      inherited BtMinimize: TcxButton
        Left = 513
      end
      inherited BtClose: TcxButton
        Left = 557
      end
    end
    inherited GrbButtons: TcxGroupBox
      Width = 579
      inherited BtCancel: TcxButton
        Left = 471
      end
    end
    inherited GrbGrid: TcxGroupBox
      Width = 579
      inherited CxgRecords: TcxGrid
        Width = 575
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
            MinWidth = 500
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
            Width = 500
          end
        end
      end
    end
    inherited GrbSearch: TcxGroupBox
      Width = 579
      inherited EdtSearch: TcxTextEdit
        ExplicitHeight = 23
        Width = 545
      end
      inherited BtExport: TcxButton
        Left = 547
      end
    end
  end
end

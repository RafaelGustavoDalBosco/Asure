inherited FrmSystemSearch: TFrmSystemSearch
  Caption = 'Pesquisa'
  ClientHeight = 415
  ClientWidth = 437
  ExplicitWidth = 441
  ExplicitHeight = 419
  TextHeight = 11
  inherited PnlMain: TPanel
    Width = 437
    Height = 415
    ExplicitWidth = 437
    ExplicitHeight = 415
    inherited PnlUpper: TPanel
      Width = 437
      ExplicitWidth = 437
      inherited BtMaximize: TcxButton
        Left = 393
        ExplicitLeft = 393
      end
      inherited BtMinimize: TcxButton
        Left = 371
        ExplicitLeft = 371
      end
      inherited BtClose: TcxButton
        Left = 415
        ExplicitLeft = 415
      end
    end
    inherited GrbButtons: TcxGroupBox
      Top = 360
      ExplicitTop = 360
      ExplicitWidth = 437
      Width = 437
      inherited BtConfirm: TcxButton
        Left = 223
        OnClick = BtConfirmClick
        ExplicitLeft = 223
      end
      inherited BtCancel: TcxButton
        Left = 329
        OnClick = BtCancelClick
        ExplicitLeft = 329
      end
    end
    object GrbGrid: TcxGroupBox
      Left = 0
      Top = 66
      Align = alClient
      Caption = 'Registros'
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsItalic]
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Height = 294
      Width = 437
      object CxgRecords: TcxGrid
        Left = 2
        Top = 20
        Width = 433
        Height = 272
        Align = alClient
        BevelEdges = []
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = cxcbsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object RecordDB: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnHorzSizing = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = '<N'#227'o h'#225' registros>'
          OptionsView.ScrollBars = ssVertical
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          OnColumnHeaderClick = RecordDBColumnHeaderClick
        end
        object CxgRecordsLevel: TcxGridLevel
          GridView = RecordDB
        end
      end
    end
    object GrbSearch: TcxGroupBox
      Left = 0
      Top = 21
      Align = alTop
      Caption = 'Pesquisar'
      ParentFont = False
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Height = 45
      Width = 437
      object EdtSearch: TcxTextEdit
        Left = 2
        Top = 20
        Align = alClient
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        TextHint = 'Clique na coluna desejada para filtrar'
        Width = 433
      end
    end
  end
end

object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'FrmMain'
  ClientHeight = 391
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 0
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Gerar SQL'
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object MemoSQL: TMemo
    Left = 0
    Top = 39
    Width = 513
    Height = 266
    Lines.Strings = (
      'MemoSQL')
    TabOrder = 1
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 536
    Top = 96
  end
end

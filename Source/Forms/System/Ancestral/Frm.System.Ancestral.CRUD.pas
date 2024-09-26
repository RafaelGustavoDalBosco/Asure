unit Frm.System.Ancestral.CRUD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer,
  cxEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, Data.DB, cxDBData, dxToggleSwitch, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, dxBevel, cxGroupBox, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, App.System.Classes.Collection, App.Common.Utils,
  Frm.System.Ancestral.Cadastro, dxScrollbarAnnotations,
{$REGION '| FIREDAC |'}
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
{$ENDREGION}
  App.System.Types, App.Common.Types;

type

   TFrmSystemAncestralCRUD = class(TFrmSystemAncestral)
      GrbButtons: TcxGroupBox;
      DxblEdgeMiddle: TdxBevel;
      DxblEdgeBegin: TdxBevel;
      DxblEdgeEnd: TdxBevel;
      BtDelete: TcxButton;
      BtUpdate: TcxButton;
      BtInsert: TcxButton;
      GrbGrid: TcxGroupBox;
      CxgRecords: TcxGrid;
      RecordDB: TcxGridDBTableView;
      GridColID: TcxGridDBColumn;
      GridColIndexObject: TcxGridDBColumn;
      GridColActive: TcxGridDBColumn;
      CxgRecordsLevel: TcxGridLevel;
      GrbSearch: TcxGroupBox;
      EdtSearch: TcxTextEdit;
      BtExport: TcxButton;
      PopupExport: TPopupMenu;
      XML: TMenuItem;
      XLS: TMenuItem;
      TXT: TMenuItem;
      HTML: TMenuItem;
      CSV: TMenuItem;
      XLSX: TMenuItem;
      BtCancel: TcxButton;
      procedure BtInsertClick(Sender: TObject);
      procedure BtUpdateClick(Sender: TObject);
      procedure BtDeleteClick(Sender: TObject);
      procedure RecordDBDblClick(Sender: TObject);
      procedure RecordDBColumnHeaderClick(Sender: TcxGridTableView; AColumn: TcxGridColumn);
      procedure EdtSearchPropertiesChange(Sender: TObject);
      procedure BtExportClick(Sender: TObject);
      procedure XMLClick(Sender: TObject);
      procedure XLSClick(Sender: TObject);
      procedure TXTClick(Sender: TObject);
      procedure HTMLClick(Sender: TObject);
      procedure CSVClick(Sender: TObject);
      procedure XLSXClick(Sender: TObject);
      procedure BtCancelClick(Sender: TObject);
   private
      FFieldLocate: UnicodeString;
      FCollection: TCommonCollection;
      FSearchText: UnicodeString;
      FMemoryTable: TFDMemTable;
      FLoadFromCollection: Boolean;
      procedure SetCollection(const Value: TCommonCollection);
      procedure SetSearchText(const Value: UnicodeString);
      procedure SetMemoryTable(const Value: TFDMemTable);
      procedure SetLoadFromCollection(const Value: Boolean);

      function GetSearchText: UnicodeString;
      function GetCollection: TCommonCollection;
      function GetMemoryTable: TFDMemTable;
   strict protected
      /// <summary>
      ///    Método Call Close
      /// </summary>
      procedure ClosingForm; override;

      /// <summary>
      ///    Método Call Open
      /// </summary>
      procedure OpeningForm; override;
   protected
      /// <summary>
      ///    Get Class Parent [TEntyDataTransferObject]
      /// </summary>
      function GetParentClass: TClass; virtual; abstract;

      /// <summary>
      ///    Get Form Parent [TFrmSystemAncestralCadastro]
      /// </summary>
      function GetParentForm: TClass; virtual; abstract;

      /// <summary>
      ///   Obtém uma SQL custom de carregamento dos dados
      /// </summary>
      function GetCustomSQL: UnicodeString; virtual;

      /// <summary>
      ///    Insere os dados no CxGrid
      /// </summary>
      procedure InputValuesOnGrid; virtual;
   strict private
      /// <summary>
      ///   Abre a tela ParentForm com o tipo da ação
      /// </summary>
      procedure OpenParentForm(const AAction: TTypeAction);
   public
      property Collection: TCommonCollection read GetCollection write SetCollection;
      property SearchText: UnicodeString read GetSearchText write SetSearchText;
      property MemoryTable: TFDMemTable read GetMemoryTable write SetMemoryTable;
      property LoadFromCollection: Boolean read FLoadFromCollection write SetLoadFromCollection;
   end;

var
  FrmSystemAncestralCRUD: TFrmSystemAncestralCRUD;

implementation

{$R *.dfm}

uses App.System.Wrapper;

{ TFrmSystemAncestralCRUD }

procedure TFrmSystemAncestralCRUD.BtCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmSystemAncestralCRUD.BtDeleteClick(Sender: TObject);
begin
   OpenParentForm(taDelete);
end;

procedure TFrmSystemAncestralCRUD.BtExportClick(Sender: TObject);
begin
   SysComp.ShowPopUpMenu(PopupExport, BtExport);
end;

procedure TFrmSystemAncestralCRUD.BtInsertClick(Sender: TObject);
begin
   OpenParentForm(taInsert);
end;

procedure TFrmSystemAncestralCRUD.BtUpdateClick(Sender: TObject);
begin
   OpenParentForm(taUpdate);
end;

procedure TFrmSystemAncestralCRUD.ClosingForm;
begin
   inherited;

   if Assigned(FCollection) then
      FreeAndNil(FCollection);

   SysGrid.FreeSource(RecordDB);
end;

procedure TFrmSystemAncestralCRUD.CSVClick(Sender: TObject);
begin
   SysGrid.ExportToFile(CxgRecords, teCSV);
end;

procedure TFrmSystemAncestralCRUD.EdtSearchPropertiesChange(Sender: TObject);
begin
   SysGrid.Locate(RecordDB, FFieldLocate, SearchText);
end;

function TFrmSystemAncestralCRUD.GetCollection: TCommonCollection;
begin
   if (not Assigned(FCollection)) then
      FCollection := SysColl.GetCollectionOf(GetParentClass);

   Result := FCollection;
end;

function TFrmSystemAncestralCRUD.GetCustomSQL: UnicodeString;
begin
   Result := '';
end;

function TFrmSystemAncestralCRUD.GetMemoryTable: TFDMemTable;
var
   LSQL: UnicodeString;
   LQuery: TQuery;
begin
   if (not Assigned(FMemoryTable)) then
   begin
      LSQL := GetCustomSQL;

      if (LSQL.IsEmpty) then
      begin
         LQuery := SysColl.GetCollectionOfCustom(GetParentClass);
         try
            FMemoryTable := SysGrid.GetDataFromQuery(LQuery);
         finally
            FreeAndNil(LQuery);
         end;
      end
      else
        FMemoryTable := SysGrid.GetDataFromQuery(SysDB.CreateQuery(LSQL));
   end;

   Result := FMemoryTable;
end;

function TFrmSystemAncestralCRUD.GetSearchText: UnicodeString;
begin
   Result := SysComp.GetTextFrom(EdtSearch);
end;

procedure TFrmSystemAncestralCRUD.HTMLClick(Sender: TObject);
begin
   inherited;
   SysGrid.ExportToFile(CxgRecords, teHTML);
end;

procedure TFrmSystemAncestralCRUD.InputValuesOnGrid;
begin
   SysGrid.FreeSource(RecordDB);

   if (not LoadFromCollection) then
    SysGrid.SetDataOnGrid(RecordDB, MemoryTable);
end;

procedure TFrmSystemAncestralCRUD.OpeningForm;
begin
   inherited;
   InputValuesOnGrid;
end;

procedure TFrmSystemAncestralCRUD.OpenParentForm(const AAction: TTypeAction);
var
   LForm: TFrmSystemAncestralCadastro;
   LCanContinue: Boolean;
   LID: Int64;
begin
   if AAction in [taUpdate, taDelete] then
   begin
      LID := SysGrid.GetValueInt64(RecordDB, GridColID.Index);

      LCanContinue := (LID > 0);
   end
   else
   begin
      LCanContinue := True;
      LID := 0;
   end;

   if (LCanContinue) then
   begin
      LForm := TFrmSystemAncestralCadastro(GetParentForm).Create(nil);
      try
         if (LID > 0) then
            LForm.EdtID.Text := SysCon.IntegerToString(LID);

         LForm.TypeAction := AAction;
         LForm.ShowModal;

         if (LForm.TypeResult = trConfirmed) then
         begin
            InputValuesOnGrid;
            SysGrid.SetFocusedRow(RecordDB, SysGrid.RowCount(RecordDB));
         end;
      finally
         FreeAndNil(LForm);
      end;
   end;
end;

procedure TFrmSystemAncestralCRUD.RecordDBColumnHeaderClick(Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
   SysGrid.SetFilterToSearch(AColumn, EdtSearch, GrbSearch, FFieldLocate);
end;

procedure TFrmSystemAncestralCRUD.RecordDBDblClick(Sender: TObject);
begin
   OpenParentForm(taUpdate)
end;

procedure TFrmSystemAncestralCRUD.SetCollection(const Value: TCommonCollection);
begin
   FCollection := Value;
end;

procedure TFrmSystemAncestralCRUD.SetLoadFromCollection(const Value: Boolean);
begin
   FLoadFromCollection := Value;
end;

procedure TFrmSystemAncestralCRUD.SetMemoryTable(const Value: TFDMemTable);
begin
   FMemoryTable := Value;
end;

procedure TFrmSystemAncestralCRUD.SetSearchText(const Value: UnicodeString);
begin
   FSearchText := Value;
end;

procedure TFrmSystemAncestralCRUD.TXTClick(Sender: TObject);
begin
   SysGrid.ExportToFile(CxgRecords, teTXT);
end;

procedure TFrmSystemAncestralCRUD.XLSClick(Sender: TObject);
begin
   SysGrid.ExportToFile(CxgRecords, teXLS)
end;

procedure TFrmSystemAncestralCRUD.XLSXClick(Sender: TObject);
begin
   SysGrid.ExportToFile(CxgRecords, teXLSx);
end;

procedure TFrmSystemAncestralCRUD.XMLClick(Sender: TObject);
begin
   SysGrid.ExportToFile(CxgRecords, teXML);
end;

end.

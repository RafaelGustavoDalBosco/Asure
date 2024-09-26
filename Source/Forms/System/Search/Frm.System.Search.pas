unit Frm.System.Search;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral.Execution,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls,
  cxContainer, cxEdit, cxGroupBox, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, dxToggleSwitch,
  cxTextEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,  App.System.Types;

type

   TFrmSystemSearch = class(TFrmSystemAncestralExecution)
      GrbGrid: TcxGroupBox;
      CxgRecords: TcxGrid;
      RecordDB: TcxGridDBTableView;
      CxgRecordsLevel: TcxGridLevel;
      GrbSearch: TcxGroupBox;
      EdtSearch: TcxTextEdit;
      procedure RecordDBColumnHeaderClick(Sender: TcxGridTableView; AColumn: TcxGridColumn);
      procedure BtConfirmClick(Sender: TObject);
      procedure BtCancelClick(Sender: TObject);
   private
      FFieldLocate: UnicodeString;
      FIDSelected: Int64;
      FSearchText: UnicodeString;
      FTypeResult: TTypeResult;
      FIndexColumn: Integer;
      procedure SetIDSelected(const Value: Int64);
      procedure SetSearchText(const Value: UnicodeString);
      procedure SetTypeResult(const Value: TTypeResult);
      procedure SetIndexColumn(const Value: Integer);

      function GetIDSelected: Int64;
      function GetSearchText: UnicodeString;
   public
      property IDSelected: Int64 read GetIDSelected write SetIDSelected;
      property SearchText: UnicodeString read GetSearchText write SetSearchText;
      property TypeResult: TTypeResult read FTypeResult write SetTypeResult;
      property IndexColumn: Integer read FIndexColumn write SetIndexColumn;
   end;

var
  FrmSystemSearch: TFrmSystemSearch;

implementation

{$R *.dfm}

uses App.Common.Utils;

{ TFrmSystemSearch }

procedure TFrmSystemSearch.BtCancelClick(Sender: TObject);
begin
   inherited;
   FTypeResult := trCanceled;
   Close;
end;

procedure TFrmSystemSearch.BtConfirmClick(Sender: TObject);
begin
   inherited;
   if (IDSelected > 0) then
   begin
      FTypeResult := trConfirmed;
      Close;
   end;
end;

function TFrmSystemSearch.GetIDSelected: Int64;
begin
   Result := SysGrid.GetValueInt64(RecordDB, IndexColumn);
end;

function TFrmSystemSearch.GetSearchText: UnicodeString;
begin
   Result := SysComp.GetTextFrom(EdtSearch);
end;

procedure TFrmSystemSearch.RecordDBColumnHeaderClick(Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
  inherited;
   SysGrid.SetFilterToSearch(AColumn, EdtSearch, GrbSearch, FFieldLocate);
end;

procedure TFrmSystemSearch.SetIDSelected(const Value: Int64);
begin
   FIDSelected := Value;
end;

procedure TFrmSystemSearch.SetIndexColumn(const Value: Integer);
begin
   FIndexColumn := Value;
end;

procedure TFrmSystemSearch.SetSearchText(const Value: UnicodeString);
begin
   FSearchText := Value;
end;

procedure TFrmSystemSearch.SetTypeResult(const Value: TTypeResult);
begin
   FTypeResult := Value;
end;

end.

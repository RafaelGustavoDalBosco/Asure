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
  Frm.System.Ancestral.Cadastro, dxScrollbarAnnotations;

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
   private
      FCollection: TCommonCollection;
      FSearchText: UnicodeString;
      procedure SetCollection(const Value: TCommonCollection);
      procedure SetSearchText(const Value: UnicodeString);

      function GetSearchText: UnicodeString;
      function GetCollection: TCommonCollection;
   protected
      /// <summary>
      ///    Get Class Parent [TEntyDataTransferObject]
      /// </summary>
      function GetParentClass: TClass; virtual; abstract;

      /// <summary>
      ///    Get Form Parent [TFrmSystemAncestralCadastro]
      /// </summary>
      function GetParentForm: TFrmSystemAncestralCadastro; virtual; abstract;

      /// <summary>
      ///    Insere os dados no CxGrid
      /// </summary>
      procedure InputValuesOnGrid; virtual;

      /// <summary>
      ///    Seta os valores do grid
      /// </summary>
      procedure SetValuesOnGrid; virtual; abstract;
   public
      property Collection: TCommonCollection read GetCollection write SetCollection;
      property SearchText: UnicodeString read GetSearchText write SetSearchText;
   end;

var
  FrmSystemAncestralCRUD: TFrmSystemAncestralCRUD;

implementation

{$R *.dfm}

{ TFrmSystemAncestralCRUD }

function TFrmSystemAncestralCRUD.GetCollection: TCommonCollection;
begin
   if (not Assigned(FCollection)) then
      FCollection := SysColl.GetCollectionOf(GetParentClass);

   Result := FCollection;
end;

function TFrmSystemAncestralCRUD.GetSearchText: UnicodeString;
begin
   Result := SysComp.GetTextFrom(EdtSearch);
end;

procedure TFrmSystemAncestralCRUD.InputValuesOnGrid;
begin
   if (Collection.Count > 0) then
   begin

   end;
end;

procedure TFrmSystemAncestralCRUD.SetCollection(const Value: TCommonCollection);
begin
   FCollection := Value;
end;

procedure TFrmSystemAncestralCRUD.SetSearchText(const Value: UnicodeString);
begin
   FSearchText := Value;
end;

end.

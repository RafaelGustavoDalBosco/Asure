unit Frm.CRUD.Documento.Tipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral.CRUD, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer,
  cxEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, dxToggleSwitch,
  cxTextEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxBevel, cxGroupBox,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls;

type

   TFrmCRUDDocumentoTipo = class(TFrmSystemAncestralCRUD)
      GridColDescricao: TcxGridDBColumn;
   protected
      /// <summary>
      ///    Get Class Parent [TEntyDataTransferObject]
      /// </summary>
      function GetParentClass: TClass; override;

      /// <summary>
      ///    Get Form Parent [TFrmSystemAncestralCadastro]
      /// </summary>
      function GetParentForm: TClass; override;
   end;

var
  FrmCRUDDocumentoTipo: TFrmCRUDDocumentoTipo;

implementation

{$R *.dfm}

uses App.Objects.Enty.Documento.Tipo, Frm.Cadastro.Documento.Tipo;

{ TFrmCRUDDocumentoTipo }

function TFrmCRUDDocumentoTipo.GetParentClass: TClass;
begin
   Result := TEntyDocumentoTipo;
end;

function TFrmCRUDDocumentoTipo.GetParentForm: TClass;
begin
   Result := TFrmCadastroDocumentoTipo;
end;

end.

unit Frm.CRUD.Pagamento.Formas;

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

   TFrmCRUDPagamentoFormas = class(TFrmSystemAncestralCRUD)
      GridColDescricao: TcxGridDBColumn;
      GridColTipo: TcxGridDBColumn;
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
  FrmCRUDPagamentoFormas: TFrmCRUDPagamentoFormas;

implementation

{$R *.dfm}

uses App.Objects.Enty.Pagamento.Formas, Frm.Cadastro.Pagamento.Formas;

{ TFrmCRUDPagamentoFormas }

function TFrmCRUDPagamentoFormas.GetParentClass: TClass;
begin
   Result := TEntyPagamentoFormas;
end;

function TFrmCRUDPagamentoFormas.GetParentForm: TClass;
begin
   Result := TFrmCadastroPagamentoFormas;
end;

end.

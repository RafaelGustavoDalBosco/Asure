unit Frm.CRUD.Empresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral.CRUD, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer,
  cxEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, dxToggleSwitch,
  cxTextEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxBevel, cxGroupBox,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  App.Objects.Enty.Empresa, Frm.Cadastro.Empresa;

type

   TFrmCRUDEmpresa = class(TFrmSystemAncestralCRUD)
      GridColRazaoSocial: TcxGridDBColumn;
      GridColCPF: TcxGridDBColumn;
      GridColCNPJ: TcxGridDBColumn;
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
  FrmCRUDEmpresa: TFrmCRUDEmpresa;

implementation

{$R *.dfm}

{ TFrmCRUDEmpresa }

function TFrmCRUDEmpresa.GetParentClass: TClass;
begin
   Result := TEntyEmpresa;
end;

function TFrmCRUDEmpresa.GetParentForm: TClass;
begin
   Result := TFrmCadastroEmpresa;
end;

end.

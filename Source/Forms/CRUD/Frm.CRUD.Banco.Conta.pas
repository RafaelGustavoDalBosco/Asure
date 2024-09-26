unit Frm.CRUD.Banco.Conta;

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

   TFrmCRUDBancoConta = class(TFrmSystemAncestralCRUD)
      GridColBanco: TcxGridDBColumn;
      GridColCpfCnpj: TcxGridDBColumn;
      GridColSaldo: TcxGridDBColumn;
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
  FrmCRUDBancoConta: TFrmCRUDBancoConta;

implementation

{$R *.dfm}

uses Frm.Cadastro.Banco.Conta, App.Objects.Enty.Banco.Conta;

{ TFrmCRUDBancoConta }

function TFrmCRUDBancoConta.GetParentClass: TClass;
begin
   Result := TEntyBancoConta;
end;

function TFrmCRUDBancoConta.GetParentForm: TClass;
begin
   Result := TFrmCadastroBancoConta;
end;

end.

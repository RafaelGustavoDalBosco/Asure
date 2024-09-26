unit Frm.CRUD.Usuario;

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

   TFrmCRUDUsuario = class(TFrmSystemAncestralCRUD)
      GridColNome: TcxGridDBColumn;
      GridColUserName: TcxGridDBColumn;
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
  FrmCRUDUsuario: TFrmCRUDUsuario;

implementation

{$R *.dfm}

uses Frm.Cadastro.Usuario, App.Objects.Enty.Usuario;

{ TFrmCRUDUsuario }

function TFrmCRUDUsuario.GetParentClass: TClass;
begin
   Result := TEntyUser;
end;

function TFrmCRUDUsuario.GetParentForm: TClass;
begin
   Result := TFrmCadastroUsuario;
end;

end.

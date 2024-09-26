unit Frm.CRUD.Banco.Conta.Cartao;

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

   TFrmCRUDBancoContaCartao = class(TFrmSystemAncestralCRUD)
      GridColBanco: TcxGridDBColumn;
      GridColBandeira: TcxGridDBColumn;
      GridColNumero: TcxGridDBColumn;
      GridColLimite: TcxGridDBColumn;
      GridColLimiteUtilizado: TcxGridDBColumn;
   protected
      /// <summary>
      ///    Get Class Parent [TEntyDataTransferObject]
      /// </summary>
      function GetParentClass: TClass; override;

      /// <summary>
      ///    Get Form Parent [TFrmSystemAncestralCadastro]
      /// </summary>
      function GetParentForm: TClass; override;

      /// <summary>
      ///   Obtém uma SQL custom de carregamento dos dados
      /// </summary>
      function GetCustomSQL: UnicodeString; override;
   end;

var
  FrmCRUDBancoContaCartao: TFrmCRUDBancoContaCartao;

implementation

{$R *.dfm}

uses App.Objects.Enty.Banco.Conta.Cartao, Frm.Cadastro.Banco.Conta.Cartao,
     App.Common.SQL.Custom;

{ TFrmCRUDBancoContaCartao }

function TFrmCRUDBancoContaCartao.GetCustomSQL: UnicodeString;
begin
   Result := SQLCustom.GetBancoContaCartaoCRUD;
end;

function TFrmCRUDBancoContaCartao.GetParentClass: TClass;
begin
   Result := TEntyBancoContaCartao;
end;

function TFrmCRUDBancoContaCartao.GetParentForm: TClass;
begin
   Result := TFrmCadastroBancoContaCartao;
end;

end.

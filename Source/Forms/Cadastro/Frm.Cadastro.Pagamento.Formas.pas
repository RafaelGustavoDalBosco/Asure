unit Frm.Cadastro.Pagamento.Formas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral.Cadastro,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxBarBuiltInMenu, cxControls, cxContainer, cxEdit, cxCheckBox, dxToggleSwitch,
  cxTextEdit, cxGroupBox, cxPC, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  cxMaskEdit, cxDropDownEdit;

type

   TFrmCadastroPagamentoFormas = class(TFrmSystemAncestralCadastro)
      GrbTipo: TcxGroupBox;
      CbTipo: TcxComboBox;
      GrbDescricao: TcxGroupBox;
      EdtDescricao: TcxTextEdit;
   private
      FDescricao: UnicodeString;
      FTipo: ShortInt;
      procedure SetDescricao(const Value: UnicodeString);
      procedure SetTipo(const Value: ShortInt);

      function GetDescricao: UnicodeString;
      function GetTipo: ShortInt;
   protected
      /// <summary>
      ///    Insere os dados no objeto do form
      /// </summary>
      procedure SetValuesOnObject; override;

      /// <summary>
      ///    Preenche os campos do form
      /// </summary>
      procedure AssignSelfFields; override;

      /// <summary>
      ///    Obtém a Class Parent do Form
      /// </summary>
      function GetParentClass: TClass; override;

      /// <summary>
      ///    Valida as informações digitadas no FORM
      /// </summary>
      function Validate: Boolean; override;
   public
      property Descricao: UnicodeString read GetDescricao write SetDescricao;
      property Tipo: ShortInt read GetTipo write SetTipo;
   end;

var
  FrmCadastroPagamentoFormas: TFrmCadastroPagamentoFormas;

implementation

{$R *.dfm}

uses App.Objects.Enty.Pagamento.Formas, App.Common.Utils;

{ TFrmCadastroPagamentoFormas }

procedure TFrmCadastroPagamentoFormas.AssignSelfFields;
var
   LInstance: TEntyPagamentoFormas;
   LTipoObject: Integer;
begin
   inherited;
   LInstance := TEntyPagamentoFormas(Enty);
   EdtDescricao.Text := LInstance.Descricao;

   LTipoObject := SysComp.GetIndexOfObject(CbTipo, LInstance.Tipo);

   if (LTipoObject > -1) then
      CbTipo.ItemIndex := SysComp.GetIndexOfObject(CbTipo, LTipoObject);
end;

function TFrmCadastroPagamentoFormas.GetDescricao: UnicodeString;
begin
   Result := SysComp.GetTextFrom(EdtDescricao);
end;

function TFrmCadastroPagamentoFormas.GetParentClass: TClass;
begin
   Result := TEntyPagamentoFormas;
end;

function TFrmCadastroPagamentoFormas.GetTipo: ShortInt;
begin
   Result := Integer(CbTipo.ItemObject);
end;

procedure TFrmCadastroPagamentoFormas.SetDescricao(const Value: UnicodeString);
begin
   FDescricao := Value;
end;

procedure TFrmCadastroPagamentoFormas.SetTipo(const Value: ShortInt);
begin
   FTipo := Value;
end;

procedure TFrmCadastroPagamentoFormas.SetValuesOnObject;
var
   LInstance: TEntyPagamentoFormas;
begin
   inherited;
   LInstance := TEntyPagamentoFormas(Enty);
   LInstance.Descricao := Descricao;
   LInstance.Tipo := Tipo;
end;

function TFrmCadastroPagamentoFormas.Validate: Boolean;
begin
   if (Descricao.IsEmpty) then
   begin
      SysComp.ShowWarnFocus(GrbDescricao);
      Exit(False);
   end;

   if (Tipo < -1) then
   begin
      SysComp.ShowWarnFocus(GrbTipo);
      Exit(False);
   end;

   Result := True;
end;

end.

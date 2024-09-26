unit Frm.Cadastro.Banco.Conta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral.Cadastro,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxBarBuiltInMenu, cxControls, cxContainer, cxEdit, cxCheckBox, dxToggleSwitch,
  cxTextEdit, cxGroupBox, cxPC, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  cxMaskEdit, cxRadioGroup, cxCurrencyEdit;

type

   TFrmCadastroBancoConta = class(TFrmSystemAncestralCadastro)
      GrbCpfCnpj: TcxGroupBox;
      EdtCpfCnpj: TcxMaskEdit;
      GrbBanco: TcxGroupBox;
      EdtBanco: TcxTextEdit;
      RgTipoPessoa: TcxRadioGroup;
      GrbNumero: TcxGroupBox;
      EdtNumero: TcxTextEdit;
      GrbAgencia: TcxGroupBox;
      EdtAgencia: TcxTextEdit;
      GrbSaldo: TcxGroupBox;
      EdtSaldo: TcxCurrencyEdit;
      GrbValorAplicado: TcxGroupBox;
      EdtValorAplicado: TcxCurrencyEdit;
   private
      FBanco: UnicodeString;
      FCpfCnpj: UnicodeString;
      FNumero: UnicodeString;
      FValorAplicado: Currency;
      FSaldo: Currency;
      FAgencia: UnicodeString;
      FTipo: ShortInt;
      procedure SetAgencia(const Value: UnicodeString);
      procedure SetBanco(const Value: UnicodeString);
      procedure SetCpfCnpj(const Value: UnicodeString);
      procedure SetNumero(const Value: UnicodeString);
      procedure SetSaldo(const Value: Currency);
      procedure SetTipo(const Value: ShortInt);
      procedure SetValorAplicado(const Value: Currency);

      function GetBanco: UnicodeString;
      function GetTipo: ShortInt;
      function GetCpfCnpj: UnicodeString;
      function GetNumero: UnicodeString;
      function GetAgencia: UnicodeString;
      function GetSaldo: Currency;
      function GetValorAplicado: Currency;
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
      property Banco: UnicodeString read GetBanco write SetBanco;
      property Tipo: ShortInt read GetTipo write SetTipo;
      property CpfCnpj: UnicodeString read GetCpfCnpj write SetCpfCnpj;
      property Numero: UnicodeString read GetNumero write SetNumero;
      property Agencia: UnicodeString read GetAgencia write SetAgencia;
      property Saldo: Currency read GetSaldo write SetSaldo;
      property ValorAplicado: Currency read GetValorAplicado write SetValorAplicado;
   end;

var
  FrmCadastroBancoConta: TFrmCadastroBancoConta;

implementation

{$R *.dfm}

uses App.Consts.Common, App.Common.Types, App.Common.Utils, App.Objects.Enty.Banco.Conta;

{ TFrmCadastroBancoConta }

procedure TFrmCadastroBancoConta.AssignSelfFields;
var
   LInstance: TEntyBancoConta;
begin
   inherited;
   LInstance := TEntyBancoConta(Enty);
   EdtBanco.Text := LInstance.Banco;
   RgTipoPessoa.ItemIndex := LInstance.Tipo;
   EdtCpfCnpj.Text := LInstance.CpfCnpj;
   EdtNumero.Text := LInstance.Numero;
   EdtAgencia.Text := LInstance.Agencia;
   EdtSaldo.Value := LInstance.Saldo;
   EdtValorAplicado.Value := LInstance.ValorAplicado;
end;

function TFrmCadastroBancoConta.GetAgencia: UnicodeString;
begin
   Result := SysComp.GetTextFrom(EdtAgencia);
end;

function TFrmCadastroBancoConta.GetBanco: UnicodeString;
begin
   Result := SysComp.GetTextFrom(EdtBanco);
end;

function TFrmCadastroBancoConta.GetCpfCnpj: UnicodeString;
begin
   Result := SysComp.GetTextFrom(EdtCpfCnpj);
end;

function TFrmCadastroBancoConta.GetNumero: UnicodeString;
begin
   Result := SysComp.GetTextFrom(EdtNumero);
end;

function TFrmCadastroBancoConta.GetParentClass: TClass;
begin
   Result := TEntyBancoConta;
end;

function TFrmCadastroBancoConta.GetSaldo: Currency;
begin
   Result := EdtSaldo.Value;
end;

function TFrmCadastroBancoConta.GetTipo: ShortInt;
begin
   Result := RgTipoPessoa.ItemIndex;
end;

function TFrmCadastroBancoConta.GetValorAplicado: Currency;
begin
   Result := EdtValorAplicado.Value;
end;

procedure TFrmCadastroBancoConta.SetAgencia(const Value: UnicodeString);
begin
   FAgencia := Value;
end;

procedure TFrmCadastroBancoConta.SetBanco(const Value: UnicodeString);
begin
   FBanco := Value;
end;

procedure TFrmCadastroBancoConta.SetCpfCnpj(const Value: UnicodeString);
begin
   FCpfCnpj := Value;
end;

procedure TFrmCadastroBancoConta.SetNumero(const Value: UnicodeString);
begin
   FNumero := Value;
end;

procedure TFrmCadastroBancoConta.SetSaldo(const Value: Currency);
begin
   FSaldo := Value;
end;

procedure TFrmCadastroBancoConta.SetTipo(const Value: ShortInt);
begin
   FTipo := Value;
end;

procedure TFrmCadastroBancoConta.SetValorAplicado(const Value: Currency);
begin
   FValorAplicado := Value;
end;

procedure TFrmCadastroBancoConta.SetValuesOnObject;
var
   LInstance: TEntyBancoConta;
begin
   inherited;
   LInstance := TEntyBancoConta(Enty);
   LInstance.Banco := Banco;
   LInstance.Tipo := Tipo;
   LInstance.CpfCnpj := CpfCnpj;
   LInstance.Numero := Numero;
   LInstance.Agencia := Agencia;
   LInstance.Saldo := Saldo;
   LInstance.ValorAplicado := ValorAplicado;
end;

function TFrmCadastroBancoConta.Validate: Boolean;
begin
   if (Banco.IsEmpty) then
   begin
      SysComp.ShowWarnFocus(GrbBanco);
      Exit(False);
   end;

   if (CpfCnpj.IsEmpty) then
   begin
      SysComp.ShowWarnFocus(GrbCpfCnpj);
      Exit(False);
   end;

   if (Numero.IsEmpty) then
   begin
      SysComp.ShowWarnFocus(GrbNumero);
      Exit(False);
   end;

   if (Agencia.IsEmpty) then
   begin
      SysComp.ShowWarnFocus(GrbAgencia);
      Exit(False);
   end;

   Result := True;
end;

end.

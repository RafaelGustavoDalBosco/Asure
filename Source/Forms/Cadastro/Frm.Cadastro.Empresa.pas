unit Frm.Cadastro.Empresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral.Cadastro,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxBarBuiltInMenu, cxControls, cxContainer, cxEdit, cxCheckBox, dxToggleSwitch,
  cxTextEdit, cxGroupBox, cxPC, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  cxRadioGroup, cxMaskEdit;

type

   TFrmCadastroEmpresa = class(TFrmSystemAncestralCadastro)
      RgTipoPessoa: TcxRadioGroup;
      GrbRazaoSocial: TcxGroupBox;
      EdtRazaoSocial: TcxTextEdit;
      GrbCpfCnpj: TcxGroupBox;
      EdtCpfCnpj: TcxMaskEdit;
      procedure RgTipoPessoaPropertiesChange(Sender: TObject);
   private
      FTipoPessoa: Integer;
      FCpfCnpj: UnicodeString;
      FRazaoSocial: UnicodeString;
      procedure SetCpfCnpj(const Value: UnicodeString);
      procedure SetRazaoSocial(const Value: UnicodeString);
      procedure SetTipoPessoa(const Value: Integer);

      function GetRazaoSocial: UnicodeString;
      function GetTipoPessoa: Integer;
      function GetCpfCnpj: UnicodeString;
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
      property RazaoSocial: UnicodeString read GetRazaoSocial write SetRazaoSocial;
      property TipoPessoa: Integer read GetTipoPessoa write SetTipoPessoa;
      property CpfCnpj: UnicodeString read GetCpfCnpj write SetCpfCnpj;
   end;

var
   FrmCadastroEmpresa: TFrmCadastroEmpresa;

implementation

{$R *.dfm}

uses
  App.Consts.Common, App.Common.Types, App.Common.Utils, App.Objects.Enty.Empresa;

{ TFrmCadastroEmpresa }

procedure TFrmCadastroEmpresa.AssignSelfFields;
var
   LInstance: TEntyEmpresa;
begin
   inherited;
   LInstance := TEntyEmpresa(Enty);
   EdtRazaoSocial.Text := LInstance.RazaoSocial;
   RgTipoPessoa.ItemIndex := LInstance.TipoPessoa;
   RgTipoPessoa.Properties.OnChange(nil);

   case TEntyEmpresa(Enty).TipoPessoa of
     0: EdtCpfCnpj.Text := LInstance.CPF;
     1: EdtCpfCnpj.Text := LInstance.CNPJ;
   end;
end;

function TFrmCadastroEmpresa.GetCpfCnpj: UnicodeString;
begin
  Result := SysComp.GetTextFrom(EdtCpfCnpj);
end;

function TFrmCadastroEmpresa.GetParentClass: TClass;
begin
  Result := TEntyEmpresa;
end;

function TFrmCadastroEmpresa.GetRazaoSocial: UnicodeString;
begin
  Result := SysComp.GetTextFrom(EdtRazaoSocial);
end;

function TFrmCadastroEmpresa.GetTipoPessoa: Integer;
begin
  Result := RgTipoPessoa.ItemIndex;
end;

procedure TFrmCadastroEmpresa.RgTipoPessoaPropertiesChange(Sender: TObject);
begin
  inherited;
   case TipoPessoa of
     0: EdtCpfCnpj.Properties.EditMask := MaskCPF;
     1: EdtCpfCnpj.Properties.EditMask := MaskCNPJ;
   end;
end;

procedure TFrmCadastroEmpresa.SetCpfCnpj(const Value: UnicodeString);
begin
   FCpfCnpj := Value;
end;

procedure TFrmCadastroEmpresa.SetRazaoSocial(const Value: UnicodeString);
begin
   FRazaoSocial := Value;
end;

procedure TFrmCadastroEmpresa.SetTipoPessoa(const Value: Integer);
begin
   FTipoPessoa := Value;
end;

procedure TFrmCadastroEmpresa.SetValuesOnObject;
var
   LInstance: TEntyEmpresa;
begin
   inherited;
   LInstance := TEntyEmpresa(Enty);
   LInstance.RazaoSocial := RazaoSocial;
   LInstance.TipoPessoa := TipoPessoa;

   case TipoPessoa of
      0: LInstance.CPF := CpfCnpj;
      1: LInstance.CNPJ := CpfCnpj;
   end;
end;

function TFrmCadastroEmpresa.Validate: Boolean;
begin
   if (TipoPessoa <= -1) then
   begin
      SysComp.ShowWarnFocus(RgTipoPessoa, 'Tipo Pessoa');
      Exit(False);
   end;

   if (CpfCnpj.IsEmpty) then
   begin
      SysComp.ShowWarnFocus(GrbCpfCnpj, 'Cpf/Cnpj');
      Exit(False);
   end;

   if (RazaoSocial.IsEmpty) then
   begin
      SysComp.ShowWarnFocus(GrbRazaoSocial, 'Razão Social');
      Exit(False);
   end;

   Result := True;
end;

end.

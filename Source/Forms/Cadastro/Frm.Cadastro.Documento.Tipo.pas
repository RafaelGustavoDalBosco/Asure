unit Frm.Cadastro.Documento.Tipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral.Cadastro,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxBarBuiltInMenu, cxControls, cxContainer, cxEdit, cxCheckBox, dxToggleSwitch,
  cxTextEdit, cxGroupBox, cxPC, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls;

type

   TFrmCadastroDocumentoTipo = class(TFrmSystemAncestralCadastro)
      GrbDescricao: TcxGroupBox;
      EdtDescricao: TcxTextEdit;
   private
      FDescricao: UnicodeString;
      procedure SetDescricao(const Value: UnicodeString);

      function GetDescricao: UnicodeString;
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
   end;

var
  FrmCadastroDocumentoTipo: TFrmCadastroDocumentoTipo;

implementation

{$R *.dfm}

uses App.Common.Utils, App.Objects.Enty.Documento.Tipo;

{ TFrmCadastroDocumentoTipo }

procedure TFrmCadastroDocumentoTipo.AssignSelfFields;
var
   LInstance: TEntyDocumentoTipo;
begin
   inherited;
   LInstance := TEntyDocumentoTipo(Enty);
   EdtDescricao.Text := LInstance.Descricao;
end;

function TFrmCadastroDocumentoTipo.GetDescricao: UnicodeString;
begin
   Result := SysComp.GetTextFrom(EdtDescricao);
end;

function TFrmCadastroDocumentoTipo.GetParentClass: TClass;
begin
   Result := TEntyDocumentoTipo;
end;

procedure TFrmCadastroDocumentoTipo.SetDescricao(const Value: UnicodeString);
begin
   FDescricao := Value;
end;

procedure TFrmCadastroDocumentoTipo.SetValuesOnObject;
var
   LInstance: TEntyDocumentoTipo;
begin
   inherited;
   LInstance := TEntyDocumentoTipo(Enty);
   LInstance.Descricao := Descricao;
end;

function TFrmCadastroDocumentoTipo.Validate: Boolean;
begin
   if (Descricao.IsEmpty) then
   begin
      SysComp.ShowWarnFocus(GrbDescricao);
      Exit(False);
   end;

   Result := True;
end;

end.

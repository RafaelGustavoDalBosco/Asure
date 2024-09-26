unit Frm.Cadastro.Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral.Cadastro,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxBarBuiltInMenu, cxControls, cxContainer, cxEdit, cxCheckBox, dxToggleSwitch,
  cxTextEdit, cxGroupBox, cxPC, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  cxMaskEdit, cxDropDownEdit, cxColorComboBox, cxClasses, dxColorDialog,
  System.ImageList, Vcl.ImgList, cxImageList, dxCore, dxColorEdit;

type

   TFrmCadastroUsuario = class(TFrmSystemAncestralCadastro)
      GrbNome: TcxGroupBox;
      EdtNome: TcxTextEdit;
      GrbTitleColor: TcxGroupBox;
      GrbMainColor: TcxGroupBox;
      GrbUserName: TcxGroupBox;
      EdtUserName: TcxTextEdit;
      GrbSenha: TcxGroupBox;
      EdtSenha: TcxTextEdit;
      CeTitleColor: TdxColorEdit;
      CeMainColor: TdxColorEdit;
   private
      FMainColor: Integer;
      FPassWord: UnicodeString;
      FTitleColor: Integer;
      FNome: UnicodeString;
      FUserName: UnicodeString;
      procedure SetMainColor(const Value: Integer);
      procedure SetNome(const Value: UnicodeString);
      procedure SetPassWord(const Value: UnicodeString);
      procedure SetTitleColor(const Value: Integer);
      procedure SetUserName(const Value: UnicodeString);

      function GetMainColor: Integer;
      function GetTitleColor: Integer;
      function GetPassWord: UnicodeString;
      function GetUserName: UnicodeString;
      function GetNome: UnicodeString;
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
      property Nome: UnicodeString read GetNome write SetNome;
      property UserName: UnicodeString read GetUserName write SetUserName;
      property PassWord: UnicodeString read GetPassWord write SetPassWord;
      property TitleColor: Integer read GetTitleColor write SetTitleColor;
      property MainColor: Integer read GetMainColor write SetMainColor;
   end;

var
  FrmCadastroUsuario: TFrmCadastroUsuario;

implementation

{$R *.dfm}

uses
   App.Objects.Enty.Usuario, App.Common.Utils;

{ TFrmCadastroUsuario }

procedure TFrmCadastroUsuario.AssignSelfFields;
var
   LInstance: TEntyUser;
begin
   inherited;
   LInstance := TEntyUser(Enty);
   EdtNome.Text := LInstance.Nome;
   EdtUserName.Text := LInstance.UserName;
   EdtSenha.Text := LInstance.PassWord;
   CeMainColor.ColorValue := LInstance.MainColor;
   CeTitleColor.ColorValue := LInstance.TitleColor;
end;

function TFrmCadastroUsuario.GetMainColor: Integer;
begin
   Result := CeMainColor.ColorValue;
end;

function TFrmCadastroUsuario.GetNome: UnicodeString;
begin
   Result := SysComp.GetTextFrom(EdtNome);
end;

function TFrmCadastroUsuario.GetParentClass: TClass;
begin
   Result := TEntyUser;
end;

function TFrmCadastroUsuario.GetPassWord: UnicodeString;
begin
   Result := SysComp.GetTextFrom(EdtSenha);
end;

function TFrmCadastroUsuario.GetTitleColor: Integer;
begin
   Result := CeTitleColor.ColorValue;
end;

function TFrmCadastroUsuario.GetUserName: UnicodeString;
begin
   Result := SysComp.GetTextFrom(EdtUserName);
end;

procedure TFrmCadastroUsuario.SetMainColor(const Value: Integer);
begin
   FMainColor := Value;
end;

procedure TFrmCadastroUsuario.SetNome(const Value: UnicodeString);
begin
   FNome := Value;
end;

procedure TFrmCadastroUsuario.SetPassWord(const Value: UnicodeString);
begin
   FPassWord := Value;
end;

procedure TFrmCadastroUsuario.SetTitleColor(const Value: Integer);
begin
   FTitleColor := Value;
end;

procedure TFrmCadastroUsuario.SetUserName(const Value: UnicodeString);
begin
   FUserName := Value;
end;

procedure TFrmCadastroUsuario.SetValuesOnObject;
var
   LInstance: TEntyUser;
begin
   inherited;
   LInstance := TEntyUser(Enty);
   LInstance.Nome := Nome;
   LInstance.UserName := UserName;
   LInstance.PassWord := PassWord;
   LInstance.TitleColor := TitleColor;
   LInstance.MainColor := MainColor;
end;

function TFrmCadastroUsuario.Validate: Boolean;
begin
   if (Nome.IsEmpty) then
   begin
      SysComp.ShowWarnFocus(GrbNome);
      Exit(False);
   end;

   if (UserName.IsEmpty) then
   begin
      SysComp.ShowWarnFocus(GrbUserName);
      Exit(False);
   end;

   if (PassWord.IsEmpty) then
   begin
      SysComp.ShowWarnFocus(GrbSenha);
      Exit(False);
   end;

   Result := True;
end;

end.

unit Frm.Cadastro.Banco.Conta.Cartao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral.Cadastro,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxBarBuiltInMenu, cxControls, cxContainer, cxEdit, cxCheckBox, dxToggleSwitch,
  cxTextEdit, cxGroupBox, cxPC, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  cxMaskEdit, cxDropDownEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar,
  cxCurrencyEdit, cxImage;

type

   TFrmCadastroBancoContaCartao = class(TFrmSystemAncestralCadastro)
      GrbBancoConta: TcxGroupBox;
      CbBancoConta: TcxComboBox;
      GrbNumero: TcxGroupBox;
      EdtNumero: TcxTextEdit;
      GrbBandeira: TcxGroupBox;
      CbBandeira: TcxComboBox;
      GrbCVV: TcxGroupBox;
      EdtCVV: TcxTextEdit;
      GrbValidade: TcxGroupBox;
      EdtDataValidade: TcxDateEdit;
      GrbNome: TcxGroupBox;
      EdtNome: TcxTextEdit;
      GrbLimite: TcxGroupBox;
      EdtLimite: TcxCurrencyEdit;
      GrbLimiteUtilizado: TcxGroupBox;
      EdtLimiteUtilizado: TcxCurrencyEdit;
      GrbTotalProximasFaturas: TcxGroupBox;
      EdtTotalProximasFaturas: TcxCurrencyEdit;
      CxImgBandeira: TcxImage;
      procedure CbBandeiraPropertiesChange(Sender: TObject);
   private
      FIdBandeira: Int64;
      FTotalProximasFaturas: Currency;
      FLimiteUtilizado: Currency;
      FIdContaBancaria: Int64;
      FNumero: UnicodeString;
      FLimite: Currency;
      FNome: UnicodeString;
      FCVV: Integer;
      FValidade: TDate;
      procedure SetCVV(const Value: Integer);
      procedure SetIdBandeira(const Value: Int64);
      procedure SetIdContaBancaria(const Value: Int64);
      procedure SetLimite(const Value: Currency);
      procedure SetLimiteUtilizado(const Value: Currency);
      procedure SetNome(const Value: UnicodeString);
      procedure SetNumero(const Value: UnicodeString);
      procedure SetTotalProximasFaturas(const Value: Currency);
      procedure SetValidade(const Value: TDate);

      function GetIdContaBancaria: Int64;
      function GetIdBandeira: Int64;
      function GetNumero: UnicodeString;
      function GetValidade: TDate;
      function GetCVV: Integer;
      function GetNome: UnicodeString;
      function GetLimite: Currency;
      function GetLimiteUtilizado: Currency;
      function GetTotalProximasFaturas: Currency;
   strict protected
      /// <summary>
      ///    Carrega as bandeiras dentro do ComboBox
      /// </summary>
      procedure LoadBandeirasIntoComboBox;
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

      /// <summary>
      ///    Método de abertura do Form
      /// </summary>
      procedure OpeningForm; override;
   public
      property IdContaBancaria: Int64 read GetIdContaBancaria write SetIdContaBancaria;
      property IdBandeira: Int64 read GetIdBandeira write SetIdBandeira;
      property Numero: UnicodeString read GetNumero write SetNumero;
      property Validade: TDate read GetValidade write SetValidade;
      property CVV: Integer read GetCVV write SetCVV;
      property Nome: UnicodeString read GetNome write SetNome;
      property Limite: Currency read GetLimite write SetLimite;
      property LimiteUtilizado: Currency read GetLimiteUtilizado write SetLimiteUtilizado;
      property TotalProximasFaturas: Currency read GetTotalProximasFaturas write SetTotalProximasFaturas;
   end;

var
  FrmCadastroBancoContaCartao: TFrmCadastroBancoContaCartao;

implementation

{$R *.dfm}

uses App.Common.Utils, App.Common.Arrays, App.Common.Records,
     App.Objects.Enty.Banco.Conta.Cartao;

procedure TFrmCadastroBancoContaCartao.AssignSelfFields;
var
  LBandeiraObject, LContaObject: Integer;
  LInstance: TEntyBancoContaCartao;
begin
  inherited;

  LInstance := TEntyBancoContaCartao(Enty);

  LBandeiraObject := SysComp.GetIndexOfObject(CbBandeira, LInstance.Bandeira);

  if (LBandeiraObject > -1) then
    CbBandeira.ItemIndex := LBandeiraObject;

  LContaObject := SysComp.GetIndexOfObject(CbBancoConta, LInstance.IdConta);

  if (LContaObject > -1) then
    CbBancoConta.ItemIndex := LContaObject;

  EdtNumero.Text := LInstance.Numero;
  EdtDataValidade.Date := LInstance.Validade;
  EdtCVV.Text := SysCon.IntegerToString(LInstance.CVV);
  EdtNome.Text := LInstance.Nome;
  EdtLimite.Value := LInstance.Limite;
  EdtLimiteUtilizado.Value := LInstance.LimiteUtilizado;
  EdtTotalProximasFaturas.Value := LInstance.TotalProximasFaturas;
end;

procedure TFrmCadastroBancoContaCartao.CbBandeiraPropertiesChange(Sender: TObject);
begin
   if (IdBandeira = 0) then
      CxImgBandeira.Picture.Bitmap.LoadFromResourceName(HInstance, 'VisaPNG')
   else
      CxImgBandeira.Picture.Bitmap.LoadFromResourceName(HInstance, 'MasterCardPNG');
end;

function TFrmCadastroBancoContaCartao.GetCVV: Integer;
begin
   Result := SysCon.StringToInteger(SysComp.GetTextFrom(EdtCVV));
end;

function TFrmCadastroBancoContaCartao.GetIdBandeira: Int64;
begin
   Result := Integer(CbBandeira.ItemObject);
end;

function TFrmCadastroBancoContaCartao.GetIdContaBancaria: Int64;
begin
   Result := Integer(CbBancoConta.ItemObject);
end;

function TFrmCadastroBancoContaCartao.GetLimite: Currency;
begin
   Result := EdtLimite.Value;
end;

function TFrmCadastroBancoContaCartao.GetLimiteUtilizado: Currency;
begin
   Result := EdtLimiteUtilizado.Value;
end;

function TFrmCadastroBancoContaCartao.GetNome: UnicodeString;
begin
   Result := SysComp.GetTextFrom(EdtNome);
end;

function TFrmCadastroBancoContaCartao.GetNumero: UnicodeString;
begin
   Result := SysComp.GetTextFrom(EdtNumero);
end;

function TFrmCadastroBancoContaCartao.GetParentClass: TClass;
begin
   Result := TEntyBancoContaCartao;
end;

function TFrmCadastroBancoContaCartao.GetTotalProximasFaturas: Currency;
begin
   Result := EdtTotalProximasFaturas.Value;
end;

function TFrmCadastroBancoContaCartao.GetValidade: TDate;
begin
   Result := EdtDataValidade.Date;
end;

procedure TFrmCadastroBancoContaCartao.LoadBandeirasIntoComboBox;
var
   LLoop: TBandeiraCartaoRecord;
begin
   CbBandeira.Properties.Items.BeginUpdate;
   try
      for LLoop in Bandeiras do
         CbBandeira.Properties.Items.AddObject(LLoop.fText, TObject(Ord(LLoop.fType)));
   finally
      CbBandeira.Properties.Items.EndUpdate;
   end;
end;

procedure TFrmCadastroBancoContaCartao.OpeningForm;
begin
   inherited;
   LoadBandeirasIntoComboBox;
   SysLoadList.LoadAndSetContasBancarias(CbBancoConta);
end;

procedure TFrmCadastroBancoContaCartao.SetCVV(const Value: Integer);
begin
   FCVV := Value;
end;

procedure TFrmCadastroBancoContaCartao.SetIdBandeira(const Value: Int64);
begin
   FIdBandeira := Value;
end;

procedure TFrmCadastroBancoContaCartao.SetIdContaBancaria(const Value: Int64);
begin
   FIdContaBancaria := Value;
end;

procedure TFrmCadastroBancoContaCartao.SetLimite(const Value: Currency);
begin
   FLimite := Value;
end;

procedure TFrmCadastroBancoContaCartao.SetLimiteUtilizado(const Value: Currency);
begin
   FLimiteUtilizado := Value;
end;

procedure TFrmCadastroBancoContaCartao.SetNome(const Value: UnicodeString);
begin
   FNome := Value;
end;

procedure TFrmCadastroBancoContaCartao.SetNumero(const Value: UnicodeString);
begin
   FNumero := Value;
end;

procedure TFrmCadastroBancoContaCartao.SetTotalProximasFaturas(const Value: Currency);
begin
   FTotalProximasFaturas := Value;
end;

procedure TFrmCadastroBancoContaCartao.SetValidade(const Value: TDate);
begin
   FValidade := Value;
end;

procedure TFrmCadastroBancoContaCartao.SetValuesOnObject;
var
   LInstance: TEntyBancoContaCartao;
begin
   inherited;
   LInstance := TEntyBancoContaCartao(Enty);
   LInstance.Bandeira := IdBandeira;
   LInstance.IdConta := IdContaBancaria;
   LInstance.Numero := Numero;
   LInstance.DataValidade := Validade;
   LInstance.Nome := Nome;
   LInstance.CVV := CVV;
   LInstance.Limite := Limite;
   LInstance.LimiteUtilizado := LimiteUtilizado;
   LInstance.TotalProximasFaturas := TotalProximasFaturas;
end;

function TFrmCadastroBancoContaCartao.Validate: Boolean;
begin
   if (IdBandeira < -1) then
   begin
      SysComp.ShowWarnFocus(GrbBandeira);
      Exit(False);
   end;

   if (IdContaBancaria <= 0) then
   begin
      SysComp.ShowWarnFocus(GrbBancoConta);
      Exit(False);
   end;

   if (Numero.IsEmpty) then
   begin
      SysComp.ShowWarnFocus(GrbNumero);
      Exit(False);
   end;

   if (Validade <= 0) then
   begin
      SysComp.ShowWarnFocus(GrbValidade);
      Exit(False);
   end;

   if (Nome.IsEmpty) then
   begin
      SysComp.ShowWarnFocus(GrbNome);
      Exit(False);
   end;

   if (CVV <= 0) then
   begin
      SysComp.ShowWarnFocus(GrbCVV);
      Exit(False);
   end;

   Result := True;
end;

end.

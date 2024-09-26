unit App.Objects.Enty.Banco.Conta.Cartao;

interface

uses
   App.Objects.Entys, App.System.RTTI.CustomAttributes, App.Consts.DataBase, App.System.Classes;

type

   [TDBRelation(cTableBancoContaCartao, cSequenceCommon + 'BANCO_CONTA_CARTAO', cCommentTableBancoContaCartao)]
   TEntyBancoContaCartao = class(TEnty)
   strict private
      FTotalProximasFaturas: Currency;
      FLimiteUtilizado: Currency;
      FNumero: UnicodeString;
      FBandeira: Integer;
      FLimite: Currency;
      FNome: UnicodeString;
      FDataValidade: TDate;
      FCVV: Integer;
      FIdConta: Int64;
      FValidade: TDate;
      procedure SetValidade(const Value: TDate);
      procedure SetIdConta(const Value: Int64);
      procedure SetBandeira(const Value: Integer);
      procedure SetCVV(const Value: Integer);
      procedure SetDataValidade(const Value: TDate);
      procedure SetLimite(const Value: Currency);
      procedure SetLimiteUtilizado(const Value: Currency);
      procedure SetNome(const Value: UnicodeString);
      procedure SetNumero(const Value: UnicodeString);
      procedure SetTotalProximasFaturas(const Value: Currency);
   public
      [TPropertyInt64]
      [TPropertyDBForeignKey(cFieldID, cTableBancoConta)]
      [TPropertyData(cFieldIdConta, True)]
      property IdConta: Int64 read FIdConta write SetIdConta;

      [TPropertyInteger]
      [TPropertyData(cFieldBandeira, True)]
      property Bandeira: Integer read FBandeira write SetBandeira;

      [TPropertyString(20)]
      [TPropertyData(cFieldNumero, True)]
      property Numero: UnicodeString read FNumero write SetNumero;

      [TPropertyDate]
      [TPropertyData(cFieldDataValidade, True)]
      property DataValidade: TDate read FDataValidade write SetDataValidade;

      [TPropertyString(20)]
      [TPropertyData(cFieldNome, True)]
      property Nome: UnicodeString read FNome write SetNome;

      [TPropertyInteger]
      [TPropertyData(cFieldCVV, True)]
      property CVV: Integer read FCVV write SetCVV;

      [TPropertyDate]
      [TPropertyData(cFieldValidade, True)]
      property Validade: TDate read FValidade write SetValidade;

      [TPropertyCurrency(cLengthNumeric, cLengthNumericScale)]
      [TPropertyData(cFieldLimite)]
      property Limite: Currency read FLimite write SetLimite;

      [TPropertyCurrency(cLengthNumeric, cLengthNumericScale)]
      [TPropertyData(cfieldLimiteUtilizado)]
      property LimiteUtilizado: Currency read FLimiteUtilizado write SetLimiteUtilizado;

      [TPropertyCurrency(cLengthNumeric, cLengthNumericScale)]
      [TPropertyData(cFieldTotalProximasFaturas)]
      property TotalProximasFaturas: Currency read FTotalProximasFaturas write SetTotalProximasFaturas;
   end;

implementation

uses App.System.Controller.Register;

{ TEntyBancoContaCartao }

procedure TEntyBancoContaCartao.SetBandeira(const Value: Integer);
begin
   SetFieldValue(FBandeira, Value);
end;

procedure TEntyBancoContaCartao.SetCVV(const Value: Integer);
begin
   SetFieldValue(FCVV, Value);
end;

procedure TEntyBancoContaCartao.SetDataValidade(const Value: TDate);
begin
   SetFieldValue(FDataValidade, Value);
end;

procedure TEntyBancoContaCartao.SetIdConta(const Value: Int64);
begin
   SetFieldValue(FIdConta, Value);
end;

procedure TEntyBancoContaCartao.SetLimite(const Value: Currency);
begin
   SetFieldValue(FLimite, Value);
end;

procedure TEntyBancoContaCartao.SetLimiteUtilizado(const Value: Currency);
begin
   SetFieldValue(FLimiteUtilizado, Value);
end;

procedure TEntyBancoContaCartao.SetNome(const Value: UnicodeString);
begin
   SetFieldValue(FNome, Value);
end;

procedure TEntyBancoContaCartao.SetNumero(const Value: UnicodeString);
begin
   SetFieldValue(FNumero, Value);
end;

procedure TEntyBancoContaCartao.SetTotalProximasFaturas(const Value: Currency);
begin
   SetFieldValue(FTotalProximasFaturas, Value);
end;

procedure TEntyBancoContaCartao.SetValidade(const Value: TDate);
begin
   SetFieldValue(FValidade, Value);
end;

initialization
   TSystemRegisterRelation.Register(TEntyBancoContaCartao);
end.

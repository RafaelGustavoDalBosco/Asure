unit App.Objects.Enty.Banco.Conta;

interface

uses
   App.Objects.Entys, App.System.RTTI.CustomAttributes, App.Consts.DataBase, App.System.Classes;

type

   [TDBRelation(cTableBancoConta, cSequenceCommon + 'BANCO_CONTA', cCommentTableBancoConta)]
   TEntyBancoConta = class(TEntyRecord)
   strict private
      FBanco: UnicodeString;
      FSaldo: Currency;
      FTipo: Integer;
      FNumero: UnicodeString;
      FValorAplicado: Currency;
      FAgencia: UnicodeString;
      FCpfCnpj: UnicodeString;
      procedure SetCpfCnpj(const Value: UnicodeString);
      procedure SetAgencia(const Value: UnicodeString);
      procedure SetNumero(const Value: UnicodeString);
      procedure SetValorAplicado(const Value: Currency);
      procedure SetBanco(const Value: UnicodeString);
      procedure SetSaldo(const Value: Currency);
      procedure SetTipo(const Value: Integer);
   public
      [TPropertyCurrency(cLengthNumeric, cLengthNumericScale)]
      [TPropertyData(cFieldSaldo)]
      property Saldo: Currency read FSaldo write SetSaldo;

      [TPropertyString(20)]
      [TPropertyData(cFieldBanco, True)]
      property Banco: UnicodeString read FBanco write SetBanco;

      [TPropertyString(cLengthCNPJ)]
      [TPropertyData(cFieldCpfCnpj, True)]
      property CpfCnpj: UnicodeString read FCpfCnpj write SetCpfCnpj;

      [TPropertyInteger]
      [TPropertyData(cFieldTipo, True)]
      property Tipo: Integer read FTipo write SetTipo;

      [TPropertyString(20)]
      [TPropertyData(cFieldNumero)]
      property Numero: UnicodeString read FNumero write SetNumero;

      [TPropertyString(4)]
      [TPropertyData(cFieldAgencia)]
      property Agencia: UnicodeString read FAgencia write SetAgencia;

      [TPropertyCurrency(cLengthNumeric, cLengthNumericScale)]
      [TPropertyData(cFieldValorAplicado)]
      property ValorAplicado: Currency read FValorAplicado write SetValorAplicado;
   end;

implementation

uses App.System.Controller.Register;

{ TEntyBancoConta }

procedure TEntyBancoConta.SetAgencia(const Value: UnicodeString);
begin
   SetFieldValue(FAgencia, Value);
end;

procedure TEntyBancoConta.SetBanco(const Value: UnicodeString);
begin
   SetFieldValue(FBanco, Value);
end;

procedure TEntyBancoConta.SetCpfCnpj(const Value: UnicodeString);
begin
   SetFieldValue(FCpfCnpj, Value);
end;

procedure TEntyBancoConta.SetNumero(const Value: UnicodeString);
begin
   SetFieldValue(FNumero, Value);
end;

procedure TEntyBancoConta.SetSaldo(const Value: Currency);
begin
   SetFieldValue(FSaldo, Value);
end;

procedure TEntyBancoConta.SetTipo(const Value: Integer);
begin
   SetFieldValue(FTipo, Value);
end;

procedure TEntyBancoConta.SetValorAplicado(const Value: Currency);
begin
   SetFieldValue(FValorAplicado, Value);
end;

initialization
   TSystemRegisterRelation.Register(TEntyBancoConta);
end.

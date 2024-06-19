unit App.Objects.Enty.Documento;

interface

uses
   App.Objects.Entys, App.System.RTTI.CustomAttributes, App.Consts.DataBase, App.Common.Utils, App.System.Classes, App.System.Vars;

type

   [TDBRelation(cTableDocumento, cSequenceCommon + 'DOCUMENTO', cCommentTableDocumento)]
   TEntyDocumento = class(TEntyRecord)
   strict private
      FObservacao: UnicodeString;
      FIdParticipante: Int64;
      FValor: Currency;
      FDataVencimento: TDate;
      FNumero: UnicodeString;
      procedure SetDataVencimento(const Value: TDate);
      procedure SetIdParticipante(const Value: Int64);
      procedure SetNumero(const Value: UnicodeString);
      procedure SetObservacao(const Value: UnicodeString);
      procedure SetValor(const Value: Currency);
   public
      [TPropertyInt64]
      [TPropertyData(cFieldIdParticipante, True)]
      property IdParticipante: Int64 read FIdParticipante write SetIdParticipante;

      [TPropertyString(20)]
      [TPropertyData(cFieldNumero)]
      property Numero: UnicodeString read FNumero write SetNumero;

      [TPropertyDate]
      [TPropertyData(cFieldDataVencimento)]
      property DataVencimento: TDate read FDataVencimento write SetDataVencimento;

      [TPropertyCurrency(cLengthNumeric, cLengthNumericScale)]
      [TPropertyData(cFieldValor)]
      property Valor: Currency read FValor write SetValor;

      [TPropertyString(cLengthObservacao)]
      [TPropertyData(cFieldObservacao)]
      property Observacao: UnicodeString read FObservacao write SetObservacao;
   end;

implementation

{ TEntyDocumento }

uses App.System.Controller.Register;

procedure TEntyDocumento.SetDataVencimento(const Value: TDate);
begin
   SetFieldValue(FDataVencimento, Value);
end;

procedure TEntyDocumento.SetIdParticipante(const Value: Int64);
begin
   SetFieldValue(FIdParticipante, Value);
end;

procedure TEntyDocumento.SetNumero(const Value: UnicodeString);
begin
   SetFieldValue(FNumero, Value);
end;

procedure TEntyDocumento.SetObservacao(const Value: UnicodeString);
begin
   SetFieldValue(FObservacao, Value);
end;

procedure TEntyDocumento.SetValor(const Value: Currency);
begin
   SetFieldValue(FValor, Value);
end;

initialization
   TSystemRegisterRelation.Register(TEntyDocumento);
end.

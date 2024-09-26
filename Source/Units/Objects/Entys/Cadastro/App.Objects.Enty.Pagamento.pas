unit App.Objects.Enty.Pagamento;

interface

uses
   App.Objects.Entys, App.System.RTTI.CustomAttributes, App.Consts.DataBase, App.System.Classes;

type

   [TDBRelation(cTablePagamento, cSequenceCommon + 'PAGAMENTO', cCommentTablePagamento)]
   TEntyPagamento = class(TEntyRecord)
   strict private
      FObservacao: UnicodeString;
      FIdCartao: Int64;
      FValor: Currency;
      FIdForma: Int64;
      FIdParcela: Int64;
      FIdDocumento: Int64;
      FIdConta: Int64;
      procedure SetIdConta(const Value: Int64);
      procedure SetIdCartao(const Value: Int64);
      procedure SetIdDocumento(const Value: Int64);
      procedure SetIdForma(const Value: Int64);
      procedure SetIdParcela(const Value: Int64);
      procedure SetObservacao(const Value: UnicodeString);
      procedure SetValor(const Value: Currency);
   public
      [TPropertyInt64]
      [TPropertyDBForeignKey(cFieldID, cTablePagamentoFormas)]
      [TPropertyData(cFieldIdForma, True)]
      property IdForma: Int64 read FIdForma write SetIdForma;

      [TPropertyInt64]
      [TPropertyDBForeignKey(cFieldID, cTableDocumento)]
      [TPropertyData(cFieldIdDocumento, True)]
      property IdDocumento: Int64 read FIdDocumento write SetIdDocumento;

      [TPropertyInt64]
      [TPropertyDBForeignKey(cFieldID, cTableDocumentoParcela)]
      property IdParcela: Int64 read FIdParcela write SetIdParcela;

      [TPropertyCurrency(cLengthNumeric, cLengthNumericScale)]
      [TPropertyData(cFieldValor)]
      property Valor: Currency read FValor write SetValor;

      [TPropertyInt64]
      [TPropertyDBForeignKey(cFieldID, cTableBancoContaCartao)]
      [TPropertyData(cFieldIdCartao)]
      property IdCartao: Int64 read FIdCartao write SetIdCartao;

      [TPropertyInt64]
      [TPropertyDBForeignKey(cFieldID, cTableBancoConta)]
      [TPropertyData(cFieldIdConta)]
      property IdConta: Int64 read FIdConta write SetIdConta;

      [TPropertyString(cLengthObservacao)]
      [TPropertyData(cFieldObservacao)]
      property Observacao: UnicodeString read FObservacao write SetObservacao;
   end;

implementation

uses App.System.Controller.Register;

{ TEntyPagamento }

procedure TEntyPagamento.SetIdCartao(const Value: Int64);
begin
   SetFieldValue(FIdCartao, Value);
end;

procedure TEntyPagamento.SetIdConta(const Value: Int64);
begin
   SetFieldValue(FIdConta, Value);
end;

procedure TEntyPagamento.SetIdDocumento(const Value: Int64);
begin
   SetFieldValue(FIdDocumento, Value);
end;

procedure TEntyPagamento.SetIdForma(const Value: Int64);
begin
   SetFieldValue(FIdForma, Value);
end;

procedure TEntyPagamento.SetIdParcela(const Value: Int64);
begin
   SetFieldValue(FIdParcela, Value);
end;

procedure TEntyPagamento.SetObservacao(const Value: UnicodeString);
begin
   SetFieldValue(FObservacao, Value);
end;

procedure TEntyPagamento.SetValor(const Value: Currency);
begin
   SetFieldValue(FValor, Valor);
end;

initialization
   TSystemRegisterRelation.Register(TEntyPagamento);
end.

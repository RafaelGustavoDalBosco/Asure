unit App.Objects.Enty.Root.Documento.Parcela;

interface

uses
   App.Objects.Entys, App.System.RTTI.CustomAttributes, App.Consts.DataBase, App.System.Classes;

type

   [TDBRelation(cTableDocumentoParcela, cSequenceCommon + 'DOCUMENTO_PARCELA', cCommentTableDocumentoParcela)]
   TEntyDocumentoParcela = class(TEntyRoot)
   strict private
      FSequencia: Integer;
      FValor: Currency;
      FDataVencimento: TDate;
      FDataPagamento: TDate;
      procedure SetDataPagamento(const Value: TDate);
      procedure SetDataVencimento(const Value: TDate);
      procedure SetSequencia(const Value: Integer);
      procedure SetValor(const Value: Currency);
   public
      [TPropertyCurrency(cLengthNumeric, cLengthNumericScale)]
      [TPropertyData(cFieldValor)]
      property Valor: Currency read FValor write SetValor;

      [TPropertyInteger]
      [TPropertyData(cFieldSequencia, True)]
      property Sequencia: Integer read FSequencia write SetSequencia;

      [TPropertyDate]
      [TPropertyData(cFieldDataVencimento)]
      property DataVencimento: TDate read FDataVencimento write SetDataVencimento;

      [TPropertyData(cFieldDataPagamento)]
      property DataPagamento: TDate read FDataPagamento write SetDataPagamento;
   end;


implementation

uses App.System.Controller.Register;

{ TEntyDocumentoParcela }

procedure TEntyDocumentoParcela.SetDataPagamento(const Value: TDate);
begin
   SetFieldValue(FDataPagamento, Value);
end;

procedure TEntyDocumentoParcela.SetDataVencimento(const Value: TDate);
begin
   SetFieldValue(FDataVencimento, Value);
end;

procedure TEntyDocumentoParcela.SetSequencia(const Value: Integer);
begin
   SetFieldValue(FSequencia, Value);
end;

procedure TEntyDocumentoParcela.SetValor(const Value: Currency);
begin
   SetFieldValue(FValor, Value);
end;

initialization
   TSystemRegisterRelation.Register(TEntyDocumentoParcela);
end.

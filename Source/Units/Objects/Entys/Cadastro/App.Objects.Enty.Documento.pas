unit App.Objects.Enty.Documento;

interface

uses
   App.Objects.Entys, App.System.RTTI.CustomAttributes, App.Consts.DataBase, App.System.Classes;

type

   [TDBRelation(cTableDocumento, cSequenceCommon + 'DOCUMENTO', cCommentTableDocumento)]
   TEntyDocumento = class(TEntyRecord)
   strict private
      FObservacao: UnicodeString;
      FIdParticipante: Int64;
      FValor: Currency;
      FDataVencimento: TDate;
      FNumero: UnicodeString;
      FDataPagamento: TDateTime;
      FIdTipo: Int64;
      FMesAnoRef: TDate;
      FIdCartao: Int64;
      FQuantidadeParcelas: Integer;
      FParcelado: Boolean;
      procedure SetIdCartao(const Value: Int64);
      procedure SetParcelado(const Value: Boolean);
      procedure SetQuantidadeParcelas(const Value: Integer);
      procedure SetMesAnoRef(const Value: TDate);
      procedure SetIdTipo(const Value: Int64);
      procedure SetDataPagamento(const Value: TDateTime);
      procedure SetDataVencimento(const Value: TDate);
      procedure SetIdParticipante(const Value: Int64);
      procedure SetNumero(const Value: UnicodeString);
      procedure SetObservacao(const Value: UnicodeString);
      procedure SetValor(const Value: Currency);
   public
      [TPropertyInt64]
      [TPropertyData(cFieldIdParticipante, True)]
      property IdParticipante: Int64 read FIdParticipante write SetIdParticipante;

      [TPropertyInt64]
      [TPropertyDBForeignKey(cFieldID, cTableDocumentoTipo)]
      [TPropertyData(cFieldIdTipo, True)]
      property IdTipo: Int64 read FIdTipo write SetIdTipo;

      [TPropertyString(20)]
      [TPropertyData(cFieldNumero)]
      property Numero: UnicodeString read FNumero write SetNumero;

      [TPropertyDate]
      [TPropertyData(cFieldDataVencimento)]
      property DataVencimento: TDate read FDataVencimento write SetDataVencimento;

      [TPropertyDatetime]
      [TPropertyData(cFieldDataPagamento)]
      property DataPagamento: TDateTime read FDataPagamento write SetDataPagamento;

      [TPropertyDate]
      [TPropertyData(cFieldMesAnoRef)]
      property MesAnoRef: TDate read FMesAnoRef write SetMesAnoRef;

      [TPropertyCurrency(cLengthNumeric, cLengthNumericScale)]
      [TPropertyData(cFieldValor)]
      property Valor: Currency read FValor write SetValor;

      [TPropertyBoolean]
      [TPropertyData(cFieldParcelado)]
      property Parcelado: Boolean read FParcelado write SetParcelado;

      [TPropertyInteger]
      [TPropertyData(cFieldQuantidadeParcelas)]
      property QuantidadeParcelas: Integer read FQuantidadeParcelas write SetQuantidadeParcelas;

      [TPropertyInt64]
      [TPropertyDBForeignKey(cFieldID, cTableBancoContaCartao)]
      [TPropertyData(cFieldIdCartao)]
      property IdCartao: Int64 read FIdCartao write SetIdCartao;

      [TPropertyString(cLengthObservacao)]
      [TPropertyData(cFieldObservacao)]
      property Observacao: UnicodeString read FObservacao write SetObservacao;
   end;

implementation

{ TEntyDocumento }

uses App.System.Controller.Register;

procedure TEntyDocumento.SetDataPagamento(const Value: TDateTime);
begin
   SetFieldValue(FDataPagamento, Value);
end;

procedure TEntyDocumento.SetDataVencimento(const Value: TDate);
begin
   SetFieldValue(FDataVencimento, Value);
end;

procedure TEntyDocumento.SetIdCartao(const Value: Int64);
begin
   SetFieldValue(FIdCartao, Value);
end;

procedure TEntyDocumento.SetIdParticipante(const Value: Int64);
begin
   SetFieldValue(FIdParticipante, Value);
end;

procedure TEntyDocumento.SetIdTipo(const Value: Int64);
begin
   SetFieldValue(FIdTipo, Value);
end;

procedure TEntyDocumento.SetMesAnoRef(const Value: TDate);
begin
   SetFieldValue(FMesAnoRef, Value);
end;

procedure TEntyDocumento.SetNumero(const Value: UnicodeString);
begin
   SetFieldValue(FNumero, Value);
end;

procedure TEntyDocumento.SetObservacao(const Value: UnicodeString);
begin
   SetFieldValue(FObservacao, Value);
end;

procedure TEntyDocumento.SetParcelado(const Value: Boolean);
begin
   SetFieldValue(FParcelado, Value);
end;

procedure TEntyDocumento.SetQuantidadeParcelas(const Value: Integer);
begin
   SetFieldValue(FQuantidadeParcelas, Value);
end;

procedure TEntyDocumento.SetValor(const Value: Currency);
begin
   SetFieldValue(FValor, Value);
end;

initialization
   TSystemRegisterRelation.Register(TEntyDocumento);
end.

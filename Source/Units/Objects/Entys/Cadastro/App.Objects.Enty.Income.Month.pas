unit App.Objects.Enty.Income.Month;

interface

uses
   App.Objects.Entys, App.System.RTTI.CustomAttributes, App.Consts.DataBase, App.System.Classes;

type

   [TDBRelation(cTableRecebimento, cSequenceCommon + 'RECEBIMENTO', cCommentTableRecebimento)]
   TEntyIncomeMonth = class(TEntyRecord)
   strict private
      FValor: Currency;
      FIdContaDeposito: Int64;
      FOrigem: Integer;
      FMesAnoRef: TDate;
      procedure SetMesAnoRef(const Value: TDate);
      procedure SetIdContaDeposito(const Value: Int64);
      procedure SetOrigem(const Value: Integer);
      procedure SetValor(const Value: Currency);
   public
      [TPropertyDate]
      [TPropertyData(cFieldMesAnoRef, True)]
      property MesAnoRef: TDate read FMesAnoRef write SetMesAnoRef;

      [TPropertyCurrency(cLengthNumeric, cLengthNumericScale)]
      [TPropertyData(cFieldValor)]
      property Valor: Currency read FValor write SetValor;

      [TPropertyInteger]
      [TPropertyData(cFieldOrigem, True)]
      property Origem: Integer read FOrigem write SetOrigem;

      [TPropertyInt64]
      [TPropertyDBForeignKey(cFieldID, cTableBancoConta)]
      [TPropertyData(cFieldIdConta)]
      property IdContaDeposito: Int64 read FIdContaDeposito write SetIdContaDeposito;
   end;

implementation

uses App.System.Controller.Register;

{ TEntyIncomeMonth }

procedure TEntyIncomeMonth.SetIdContaDeposito(const Value: Int64);
begin
   SetFieldValue(FIdContaDeposito, Value);
end;

procedure TEntyIncomeMonth.SetMesAnoRef(const Value: TDate);
begin
   SetFieldValue(FMesAnoRef, Value);
end;

procedure TEntyIncomeMonth.SetOrigem(const Value: Integer);
begin
   SetFieldValue(FOrigem, Value);
end;

procedure TEntyIncomeMonth.SetValor(const Value: Currency);
begin
   SetFieldValue(FValor, Value);
end;

initialization
   TSystemRegisterRelation.Register(TEntyIncomeMonth);
end.

unit App.Objects.Enty.Pagamento.Formas;

interface

uses
   App.Objects.Entys, App.System.RTTI.CustomAttributes, App.Consts.DataBase, App.System.Classes;

type

   [TDBRelation(cTablePagamentoFormas, cSequenceCommon + 'PAGTO_FORMAS', cCommentTablePagamentoFormas)]
   TEntyPagamentoFormas = class(TEntyRecord)
   strict private
      FDescricao: UnicodeString;
      FTipo: Integer;
      procedure SetDescricao(const Value: UnicodeString);
      procedure SetTipo(const Value: Integer);
   public
      [TPropertyString(60)]
      [TPropertyData(cFieldDescricao, True)]
      property Descricao: UnicodeString read FDescricao write SetDescricao;

      [TPropertyInteger]
      [TPropertyData(cFieldTipo, True)]
      property Tipo: Integer read FTipo write SetTipo;
   end;


implementation

uses App.System.Controller.Register;

{ TEntyPagamentoFormas }

procedure TEntyPagamentoFormas.SetDescricao(const Value: UnicodeString);
begin
   SetFieldValue(FDescricao, Value);
end;

procedure TEntyPagamentoFormas.SetTipo(const Value: Integer);
begin
   SetFieldValue(FTipo, Value);
end;

initialization
   TSystemRegisterRelation.Register(TEntyPagamentoFormas);
end.

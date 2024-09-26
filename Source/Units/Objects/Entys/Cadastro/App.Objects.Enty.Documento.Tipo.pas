unit App.Objects.Enty.Documento.Tipo;

interface

uses
   App.Objects.Entys, App.System.RTTI.CustomAttributes, App.Consts.DataBase, App.System.Classes;

type

   [TDBRelation(cTableDocumentoTipo, cSequenceCommon + 'DOCUMENTO_TIPO', cCommentTableDocumentoTipo)]
   TEntyDocumentoTipo = class(TEntyRecord)
   strict private
      FDescricao: UnicodeString;
      procedure SetDescricao(const Value: UnicodeString);
   public
      [TPropertyString(60)]
      [TPropertyData(cFieldDescricao, True)]
      property Descricao: UnicodeString read FDescricao write SetDescricao;
   end;

implementation

uses App.System.Controller.Register;

{ TEntyDocumentoTipo }

procedure TEntyDocumentoTipo.SetDescricao(const Value: UnicodeString);
begin
   SetFieldValue(FDescricao, Value);
end;

initialization
   TSystemRegisterRelation.Register(TEntyDocumentoTipo);
end.

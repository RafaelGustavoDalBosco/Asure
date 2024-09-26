unit App.Objects.Searchs;

interface

uses
   App.System.Search;

type

   TSearchCartao = class(TSystemSearch)
   protected
      /// <summary>
      ///    Obtém a SQL que irá trazer os registros
      /// </summary>
      function GetSQL: UnicodeString; override;

      /// <summary>
      ///    Define as colunas da Pesquisa
      /// </summary>
      procedure DefineColumns; override;

      constructor Create; overload;
   end;

implementation

{ TSearchTipoCartao }

uses
   App.Objects.Enty.Banco.Conta.Cartao, App.Common.Utils;

constructor TSearchCartao.Create;
begin
   inherited Create('Pesquisa tipos de cartões');
end;

procedure TSearchCartao.DefineColumns;
begin
   SetLength(FListOfColumns, 2);

   FListOfColumns[0].fCaption := 'ID';
   FListOfColumns[0].fWidth := 40;
   FListOfColumns[1].fCaption := 'Descrição';
   FListOfColumns[1].fWidth := 200;
   FListOfColumns[1].fAutoSize := True;
end;

function TSearchCartao.GetSQL: UnicodeString;
begin
   Result := SysEnty.GetSQLListFromClass(TEntyBancoContaCartao);
end;

end.

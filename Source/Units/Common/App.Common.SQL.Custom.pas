unit App.Common.SQL.Custom;

interface

uses
   System.SysUtils;

type

   TCommonSQLCustom = class
   public
      /// <summary>
      ///    Obtém uma SQL personalizada para o Banco Conta Cartão
      /// </summary>
      class function GetBancoContaCartaoCRUD: UnicodeString; static;
   end;

var
   SQLCustom: TCommonSQLCustom;

implementation

{ TCommonSQLCustom }

uses App.Common.Vars;

class function TCommonSQLCustom.GetBancoContaCartaoCRUD: UnicodeString;
begin
   Result := Format('SELECT CAR.NUMERO, CAR.LIMITE, CAR.LIMITE_UTILIZADO,' + sLineBreak +
             'CON.BANCO, WHEN CAR.ID_BANDEIRA = 1 THEN "VISA" ELSE "MASTERCARD" END AS BANDEIRA,' + sLineBreak +
             'FROM T_BANCO_CONTA_CARTAO CAR INNER JOIN T_BANCO_CONTA CON' + sLineBreak +
             'ON CAR.ID_CONTA = CON.ID WHERE CAR.ID_EMPRESA = %d', [gvEmpresa.ID]);
end;

end.

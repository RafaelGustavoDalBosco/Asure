{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.System.Connection;

interface

uses

{$REGION '| SYSTEM |'}
   System.SysUtils,
{$ENDREGION}

{$REGION '| FIREDAC |'}
   FireDAC.Comp.Client,
   FireDAC.Stan.Def,
   FireDAC.DApt,
   FireDAC.VCLUI.Wait,
   FireDAC.Phys.FB,
   FireDAC.Phys.Intf,
   FireDAC.Stan.Param,
   FireDAC.Stan.Async,
   FireDAC.UI.Intf,
   FireDAC.Comp.ScriptCommands,
   FireDAC.Stan.Util,
   FireDAC.Stan.Intf,
   FireDAC.Comp.Script,
{$ENDREGION}

{$REGION '| APP |'}
   App.System.Connection.Params, App.Consts.Messages, App.System.Types;
{$ENDREGION}

type

  TConnection = class sealed (TObject)
  private
    FParams: TConnectionParams;
    FFDConnection: TFDConnection;
    procedure SetFDConnection(const Value: TFDConnection);
    procedure SetParams(const Value: TConnectionParams);
  strict private
    property FDConnection: TFDConnection read FFDConnection write SetFDConnection;
    property Params: TConnectionParams read FParams write SetParams;
  public
    /// <summary>
    ///    Inclui os parâmetros da conexão no objeto
    /// </summary>
    procedure IncludeParamsOnConnection(const AWithDataBase: Boolean = False);

    /// <summary>
    ///    Inclui o caminho do banco de dados nos parâmetros de conexão
    /// </summary>
    procedure IncludeParamDataBasePathOnConnection(const ADataBasePath: UnicodeString);

    /// <summary>
    ///    Obtém a conexão atual
    /// </summary>
    function GetCurrentConnection: TFDConnection;

    /// <summary>
    ///    Executa um determinado SCRIPT no banco de dados
    /// </summary>
    function ExecuteScript(const AScript: UnicodeString): Boolean;

    /// <summary>
    ///    Executa uma determinada SQL no banco de dados
    /// </summary>
    function ExecuteSQL(const ASQL: UnicodeString): Boolean;

    /// <summary>
    ///    Tenta iniciar a conexão com o banco de dados
    /// </summary>
    function TryStablishConnection: Boolean;

    /// <summary>
    ///    Verifica se o banco de dados existe
    /// </summary>
    function DataBaseExists: Boolean;

    constructor Create(const AParams: TConnectionParams); overload;
    destructor Destroy; override;
  end;

implementation

uses
   App.System.Vars,  App.Common.Utils;

{ TConnection }

constructor TConnection.Create(const AParams: TConnectionParams);
begin
   if (AParams = nil) then
      raise Exception.Create(SEmptyObjectParamsConnection);

   SetParams(AParams);
   FFDConnection := TFDConnection.Create(nil);
   inherited Create;
end;

function TConnection.DataBaseExists: Boolean;
begin
   if (Params.TypeConnection = ttcPostGres) then
      Result := TryStablishConnection and SysDB.DataBaseOnSchemaPostGres
   else
      Result := SysFile.FileExists(Params.DataBasePath);
end;

destructor TConnection.Destroy;
begin
   FFDConnection.Close;
   FreeAndNil(FFDConnection);
   FreeAndNil(FParams);
   inherited Destroy;
end;

function TConnection.ExecuteScript(const AScript: UnicodeString): Boolean;
var
   LScript: TFDScript;
begin
   if (not AScript.IsEmpty) then
   begin
      LScript := TFDScript.Create(nil);
      try
         LScript.Connection := FDConnection;
         LScript.SQLScripts.Add.SQL.Text := AScript;
         LScript.ValidateAll;

         Result := LScript.ExecuteAll;
      finally
         FreeAndNil(LScript);
      end;
   end
   else
      Result := False;
end;

function TConnection.ExecuteSQL(const ASQL: UnicodeString): Boolean;
begin
   if (ASQL.IsEmpty) then
      Exit(False);
   try
      Result := (FDConnection.ExecSQL(ASQL) > 0);
   except
      on E: Exception do
         raise Exception.CreateFmt(SErrorExecSQL, [ASQL, E.Message]);
   end;
end;

function TConnection.GetCurrentConnection: TFDConnection;
begin
   if (FFDConnection.Connected) then
      Result := FFDConnection
   else
      Result := nil;
end;

procedure TConnection.IncludeParamDataBasePathOnConnection(const ADataBasePath: UnicodeString);
begin
   FDConnection.Params.Values['database'] := ADataBasePath;
end;

procedure TConnection.IncludeParamsOnConnection(const AWithDataBase: Boolean = False);
begin
   FDConnection.DriverName := Params.DriverName;
   FDConnection.LoginPrompt := Params.LoginPrompt;
   FDConnection.Params.Values['user_name'] := Params.UserName;
   FDConnection.Params.Values['password'] := Params.PassWord;
   FDConnection.Params.Values['server'] := Params.ServerPath;
   FDConnection.Params.Values['port'] := Params.Port;
   FDConnection.Params.Values['characterSet'] := Params.CharacterSet;

   if (AWithDataBase) then
      FDConnection.Params.Values['database'] := Params.DataBasePath;
end;

procedure TConnection.SetFDConnection(const Value: TFDConnection);
begin
   FFDConnection := Value;
end;

function TConnection.TryStablishConnection: Boolean;
begin
   try
      FDConnection.Params.Values['OpenMode'] := 'Open';
      FDConnection.Open;
      Result := True;
   except
      on E: Exception do
         raise Exception.CreateFmt(SErrorConnectionDB, [E.Message]);
   end;
end;

procedure TConnection.SetParams(const Value: TConnectionParams);
begin
   FParams := Value;
end;

end.

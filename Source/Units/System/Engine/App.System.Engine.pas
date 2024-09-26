unit App.System.Engine;

interface

uses
   App.System.Vars,
   System.SysUtils,
   App.System.Types,
   App.System.SQL.DataBase,
   App.Consts.DataBase,
   App.Common.Utils,
   App.Consts.Common,
   App.System.Connection.Params,
   App.System.Connection,
   App.Consts.Messages;

type

   TSystemEngine = class
   protected
      /// <summary>
      ///    Cria os diretórios da aplicação
      /// </summary>
      procedure CreateDirectorys;
   strict protected
      /// <summary>
      ///    Inicia a conexão da aplicação
      /// </summary>
      procedure StartConnection;

      /// <summary>
      ///    Inicia a Aplicação
      /// </summary>
      procedure StartApplication;
   strict private
      /// <summary>
      ///    Inicia a conexão com o FireBird
      /// </summary>
      procedure StartConnectionFireBird(const ADataBasePath, AServer: UnicodeString);

      /// <summary>
      ///    Inicia a conexão com o PostGres
      /// </summary>
      procedure StartConnectionPostGres(const ADataBasePath, AServer: UnicodeString);

      /// <summary>
      ///    Inicia a conexão com o Oracle
      /// </summary>
      procedure StartConnectionOracle(const ADataBasePath, AServer: UnicodeString);

      /// <summary>
      ///    Cria um banco de dados do FB
      /// </summary>
      procedure CreateDataBaseFireBird(const ADataBasePath, AServer: UnicodeString);

      /// <summary>
      ///    Cria um banco de dados do PG
      /// </summary>
      procedure CreateDataBasePostGres(const ADataBasePath, AServer: UnicodeString);

      /// <summary>
      ///    Cria um banco de dados do ORACLE
      /// </summary>
      procedure CreateDataBaseOracle(const ADataBasePath, AServer: UnicodeString);

      /// <summary>
      ///    Obtém os Parâmetros de Conexão para o FB
      /// </summary>
      function GetConnectionParamsFireBird(const ADataBasePath, AServer: UnicodeString): TConnectionParams;

      /// <summary>
      ///    Obtém os Parâmetros de Conexão para o PG
      /// </summary>
      function GetConnectionParamsPostGres(const ADataBaseName, AServer: UnicodeString): TConnectionParams;

      /// <summary>
      ///    Obtém os Parâmetros de Conexão para o ORACLE
      /// </summary>
      function GetConnectionParamsOracle(const ADataBaseName, AServer: UnicodeString): TConnectionParams;
   public
      /// <summary>
      ///    Executa o Engine
      /// </summary>
      function Execute: Boolean;

      constructor Create; overload;
      destructor Destroy; override;
   end;

implementation

{ TSystemEngine }

uses
   App.System.Log;

constructor TSystemEngine.Create;
begin
   inherited Create;
end;

procedure TSystemEngine.CreateDataBaseFireBird(const ADataBasePath, AServer: UnicodeString);
var
   LSQL: UnicodeString;
   LSystemSQL: TSystemSQLDataBaseFireBird;
begin
   LSystemSQL := TSystemSQLDataBaseFireBird.Create;
   try
      LSQL := LSystemSQL.CreateDataBase(ADataBasePath);

      gvApplicationConnection.IncludeParamsOnConnection(False);
      gvApplicationConnection.ExecuteScript(LSQL);
      gvApplicationConnection.IncludeParamDataBasePathOnConnection(ADataBasePath);
      Log.Write(UnitName, SActionDBOperation, SActionCreateDBFireBirdFile);
   finally
      FreeAndNil(LSystemSQL);
   end;
end;

procedure TSystemEngine.CreateDataBaseOracle(const ADataBasePath, AServer: UnicodeString);
var
   LSQL: UnicodeString;
   LSystemSQL: TSystemSQLDataBaseOracle;
begin
   LSystemSQL := TSystemSQLDataBaseOracle.Create;
   try
      LSQL := LSystemSQL.CreateDataBase(ADataBasePath);

      gvApplicationConnection.IncludeParamsOnConnection(False);
      gvApplicationConnection.ExecuteScript(LSQL);
      gvApplicationConnection.IncludeParamDataBasePathOnConnection(ADataBasePath);
      Log.Write(UnitName, SActionDBOperation, SActionCreateDBOracleFile);
   finally
      FreeAndNil(LSystemSQL);
   end;
end;

procedure TSystemEngine.CreateDataBasePostGres(const ADataBasePath, AServer: UnicodeString);
var
   LSQL: UnicodeString;
   LSystemSQL: TSystemSQLDataBasePostGres;
begin
   LSystemSQL := TSystemSQLDataBasePostGres.Create;
   try
      LSQL := LSystemSQL.CreateDataBase(ADataBasePath);

      gvApplicationConnection.IncludeParamsOnConnection(False);
      gvApplicationConnection.ExecuteScript(LSQL);
      gvApplicationConnection.IncludeParamDataBasePathOnConnection(ADataBasePath);
      Log.Write(UnitName, SActionDBOperation, SActionCreateDBPostGresFile);
   finally
      FreeAndNil(LSystemSQL);
   end;
end;

procedure TSystemEngine.CreateDirectorys;
begin
   SysFile.CreateFolder(DirectoryApplication);
   SysFile.CreateFolder(DirectorySystem);
   SysFile.CreateFolder(DirectoryDataBase);
   SysFile.CreateFolder(DirectoryLog);
   SysFile.CreateFolder(DirectoryPrint);
   SysFile.CreateFolder(DirectoryCommon);
   SysFile.CreateFolder(DirectoryCommonFiles);
   SysFile.CreateFolder(DirectoryCommonFilesReceived);
   SysFile.CreateFolder(DirectoryHTML);
   SysFile.CreateFolder(DirectoryImage);
end;

destructor TSystemEngine.Destroy;
begin
   if Assigned(gvApplicationConnection) then
      FreeAndNil(gvApplicationConnection);

   inherited Destroy;
end;

function TSystemEngine.Execute: Boolean;
begin
   StartApplication;

   Result := True;
end;

function TSystemEngine.GetConnectionParamsFireBird(const ADataBasePath, AServer: UnicodeString): TConnectionParams;
begin
   Result := TConnectionParams.Create;
   Result.DriverName := FBDriverName;
   Result.LoginPrompt := False;
   Result.CharacterSet := FBCharacterSet;
   Result.UserName := FBUserName;
   Result.PassWord := FBPassWord;
   Result.Port := FBPort;
   Result.ServerPath := AServer;
   Result.DataBasePath := ADataBasePath;
end;

function TSystemEngine.GetConnectionParamsOracle(const ADataBaseName, AServer: UnicodeString): TConnectionParams;
begin
   Result := TConnectionParams.Create;
   Result.DriverName := FBDriverName;
   Result.LoginPrompt := False;
   Result.CharacterSet := FBCharacterSet;
   Result.UserName := FBUserName;
   Result.PassWord := FBPassWord;
   Result.Port := FBPort;
   Result.ServerPath := AServer;
   Result.DataBasePath := ADataBaseName;
end;

function TSystemEngine.GetConnectionParamsPostGres(const ADataBaseName, AServer: UnicodeString): TConnectionParams;
begin
   Result := TConnectionParams.Create;
   Result.DriverName := PGDriverName;
   Result.LoginPrompt := False;
   Result.CharacterSet := PGEncoding;
   Result.UserName := PGUserName;
   Result.PassWord := PGPassWord;
   Result.Port := PGPort;
   Result.ServerPath := AServer;
   Result.DataBasePath := ADataBaseName;
end;

procedure TSystemEngine.StartApplication;
begin
   gvTraceLog := True; // for now
   CreateDirectorys;
   StartConnection;
end;

procedure TSystemEngine.StartConnection;
var
   LServer, LDataBasePath: UnicodeString;
begin
   LDataBasePath := SysIni.ReadDataBasePath;
   LServer := SysIni.ReadServer;

   gvTypeConnection := SysIni.ReadTypeConnection;

   if (LDataBasePath.IsEmpty) or (gvTypeConnection = ttcNone) then
   begin
      LDataBasePath := DirectoryDataBase + '\' + cNameDataBase + '.FDB';
      gvTypeConnection := ttcFireBird;
      StartConnectionFireBird(LDataBasePath, '127.0.0.1');
   end
   else
   begin
      case gvTypeConnection of
         ttcFireBird: StartConnectionFireBird(LDataBasePath, LServer);
         ttcPostGres: StartConnectionPostGres(LDataBasePath, LServer);
         ttcOracle: StartConnectionOracle(LDataBasePath, LServer);
      end;
   end;
end;

procedure TSystemEngine.StartConnectionFireBird(const ADataBasePath, AServer: UnicodeString);
var
   LParams: TConnectionParams;
begin
   LParams := GetConnectionParamsFireBird(ADataBasePath, AServer);

   gvApplicationConnection := TConnection.Create(LParams);

   if (gvApplicationConnection.DataBaseExists) then
      gvApplicationConnection.IncludeParamsOnConnection(True)
   else
      CreateDataBaseFireBird(ADataBasePath, AServer);

   if gvApplicationConnection.TryStablishConnection then
   begin
      SysIni.WriteServer(AServer);
      SysIni.WriteDataBasePath(ADataBasePath);
      SysIni.WriteTypeConnection(ttcFireBird);
   end;
end;

procedure TSystemEngine.StartConnectionOracle(const ADataBasePath, AServer: UnicodeString);
var
   LParams: TConnectionParams;
begin
   LParams := GetConnectionParamsOracle(ADataBasePath, AServer);

   gvApplicationConnection := TConnection.Create(LParams);

   if (gvApplicationConnection.DataBaseExists) then
      gvApplicationConnection.IncludeParamsOnConnection(True)
   else
      CreateDataBaseOracle(ADataBasePath, AServer);

   if gvApplicationConnection.TryStablishConnection then
   begin
      SysIni.WriteServer(AServer);
      SysIni.WriteDataBasePath(ADataBasePath);
      SysIni.WriteTypeConnection(ttcOracle);
   end;
end;

procedure TSystemEngine.StartConnectionPostGres(const ADataBasePath, AServer: UnicodeString);
var
   LParams: TConnectionParams;
begin
   LParams := GetConnectionParamsPostGres(ADataBasePath, AServer);

   gvApplicationConnection := TConnection.Create(LParams);

   if (gvApplicationConnection.DataBaseExists) then
      gvApplicationConnection.IncludeParamsOnConnection(True)
   else
      CreateDataBasePostGres(ADataBasePath, AServer);

   if gvApplicationConnection.TryStablishConnection then
   begin
      SysIni.WriteServer(AServer);
      SysIni.WriteDataBasePath(ADataBasePath);
      SysIni.WriteTypeConnection(ttcPostGres);
   end;
end;

end.

unit App.System.DataBase.Controller;

interface

uses
   System.SysUtils,
   App.System.SQL.DataBase,
   App.System.Types,
   App.Common.Utils,
   App.System.DataBase.Consistency,
   App.Consts.Common,
   App.System.Vars;

type

   TSystemDataBaseController = class
   private
      FSystemSQLDataBaseCommon: TSystemSQLDataBaseCommon;
      FTypeExecuteDataBase: TTypeExecuteDataBase;
      procedure SetSystemSQLDataBaseCommon(const Value: TSystemSQLDataBaseCommon);
      procedure SetTypeExecuteDataBase(const Value: TTypeExecuteDataBase);

      function GetSystemSQLDataBaseCommon: TSystemSQLDataBaseCommon;
      function GetTypeExecuteDataBase: TTypeExecuteDataBase;
   strict private
      /// <summary>
      ///    Executa a atualização do banco de dados
      /// </summary>
      procedure UpdateDataBase;

      /// <summary>
      ///    Executa a criação do banco de dados
      /// </summary>
      procedure CreateDataBase;

      /// <summary>
      ///    Executa a exclusão do banco de dados
      /// </summary>
      procedure DropDataBase;

      /// <summary>
      ///    Executa a manutenção do banco de dados
      /// </summary>
      procedure MaintenanceDataBase;
   public
      /// <summary>
      ///    Executa o Controlador do Banco de Dados
      /// </summary>
      procedure Execute;

      property SystemSQLDataBaseCommon: TSystemSQLDataBaseCommon read GetSystemSQLDataBaseCommon write SetSystemSQLDataBaseCommon;
      property TypeExecuteDataBase: TTypeExecuteDataBase read GetTypeExecuteDataBase write SetTypeExecuteDataBase;
   end;

implementation

{ TSystemDataBaseController }


procedure TSystemDataBaseController.CreateDataBase;
var
   LDataBase: TSystemDataBaseConsistency;
begin
   LDataBase := TSystemDataBaseConsistency.Create(SystemSQLDataBaseCommon);
   try
      LDataBase.CreateDataBase;
   finally
      FreeAndNil(LDataBase);
   end;
end;

procedure TSystemDataBaseController.DropDataBase;
begin
   raise Exception.Create('Not Implemented!');
end;

procedure TSystemDataBaseController.Execute;
begin
   case TypeExecuteDataBase of
      tedCreate: CreateDataBase;
      tedUpdate: UpdateDataBase;
      tedDrop: DropDataBase;
      tedMaintenance: MaintenanceDataBase;
   end;
end;

function TSystemDataBaseController.GetSystemSQLDataBaseCommon: TSystemSQLDataBaseCommon;
begin
   if (not Assigned(FSystemSQLDataBaseCommon)) then
   begin
      case gvTypeConnection of
         ttcFireBird: FSystemSQLDataBaseCommon := TSystemSQLDataBaseFireBird.Create;
         ttcPostGres: FSystemSQLDataBaseCommon := TSystemSQLDataBasePostGres.Create;
         ttcOracle: FSystemSQLDataBaseCommon := TSystemSQLDataBaseOracle.Create;
      end;
   end;

   Result := FSystemSQLDataBaseCommon;
end;

function TSystemDataBaseController.GetTypeExecuteDataBase: TTypeExecuteDataBase;
var
   LDataBaseVersion: Integer;
begin
   LDataBaseVersion := SysApp.GetDataBaseVersion;

   if SysCc.IsEqual(LDataBaseVersion, ApplicationVersion) then
      FTypeExecuteDataBase := tedNone
   else
   if SysCc.IsSmaller(LDataBaseVersion, ApplicationVersion) then
      FTypeExecuteDataBase := tedUpdate
   else
   if (LDataBaseVersion = 0) then
      FTypeExecuteDataBase := tedCreate;

   Result := FTypeExecuteDataBase;
end;

procedure TSystemDataBaseController.MaintenanceDataBase;
begin
   raise Exception.Create('Not Implemented!');
end;

procedure TSystemDataBaseController.SetSystemSQLDataBaseCommon(const Value: TSystemSQLDataBaseCommon);
begin
   FSystemSQLDataBaseCommon := Value;
end;

procedure TSystemDataBaseController.SetTypeExecuteDataBase(const Value: TTypeExecuteDataBase);
begin
   FTypeExecuteDataBase := Value;
end;

procedure TSystemDataBaseController.UpdateDataBase;
var
   LDataBase: TSystemDataBaseConsistency;
begin
   LDataBase := TSystemDataBaseConsistency.Create(SystemSQLDataBaseCommon);
   try
      LDataBase.UpdateDataBase;
   finally
      FreeAndNil(LDataBase);
   end;
end;

end.

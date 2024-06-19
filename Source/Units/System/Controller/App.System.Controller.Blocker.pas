unit App.System.Controller.Blocker;

interface

uses
   App.Objects.Entys.Common, System.SysUtils;

type

   TSystemControllerBlocker = class
   strict private
      FIdRecord: Int64;
      FClassParentName: UnicodeString;
      FEnty: TEntyRecordBlocker;
      procedure SetEnty(const Value: TEntyRecordBlocker);
      procedure SetClassParentName(const Value: UnicodeString);
      procedure SetIdRecord(const Value: Int64);

      function GetEnty: TEntyRecordBlocker;
   protected
      property IdRecord: Int64 read FIdRecord write SetIdRecord;
      property ClassParentName: UnicodeString read FClassParentName write SetClassParentName;
      property Enty: TEntyRecordBlocker read GetEnty write SetEnty;
   public
      /// <summary>
      ///    Inicia o bloqueio do registro
      /// </summary>
      function Initiate: Boolean;

      /// <summary>
      ///    Verifica se há algum bloqueio
      /// </summary>
      function Get: Boolean;

      /// <summary>
      ///    Finaliza e exclui o bloquei
      /// </summary>
      function Finalize: Boolean;

      constructor Create(const AIdRecord: Int64; const AClassName: UnicodeString); overload;
      destructor Destroy; override;
   end;

implementation

uses
   App.System.RTTI.DAO,
   App.System.Log,
   App.System.Vars,
   App.Common.Vars,
   App.Common.Utils,
   App.Consts.Messages;

{ TSystemControllerBlocker }

constructor TSystemControllerBlocker.Create(const AIdRecord: Int64; const AClassName: UnicodeString);
begin
   SetIdRecord(AIdRecord);
   SetClassParentName(AClassName);
   inherited Create;
end;

destructor TSystemControllerBlocker.Destroy;
begin
   if (FEnty <> nil) then
      FreeAndNil(FEnty);

   inherited Destroy;
end;

function TSystemControllerBlocker.Finalize: Boolean;
var
   LDAO: TRTTIDataAcessObject;
begin
   LDAO := TRTTIDataAcessObject.Create(Enty);
   try
      Result := LDAO.Delete;
   finally
      FreeAndNil(LDAO);
   end;
end;

function TSystemControllerBlocker.Get: Boolean;
var
   LDAO: TRTTIDataAcessObject;
begin
   LDAO := TRTTIDataAcessObject.Create(Enty);
   try
      if LDAO.Select then
      begin
         if (Enty.IdUsuario <> gvUsuario.ID) then
         begin
            SysMsg.ShowWarn(Format(SWarnRecordChanging, [Enty.UserName]));
            Log.Write(UnitName, 'Bloqueio de Registro', Format('Usuario: %s | Class Parent: %s | ID Record: %d', [Enty.UserName, Enty.ClassParentName, Enty.IdRecord]));
            Result := False;
         end
         else
            Result := True;
      end
      else
         Result := True;
   finally
      FreeAndNil(LDAO);
   end;
end;

function TSystemControllerBlocker.GetEnty: TEntyRecordBlocker;
begin
   if (FEnty = nil) then
   begin
      FEnty := TEntyRecordBlocker.Create;
      FEnty.IdEmpresa := gvEmpresa.ID;
      FEnty.IdUsuario := gvUsuario.ID;
      FEnty.IdRecord := FIdRecord;
      FEnty.ClassParentName := ClassParentName;
   end;

   Result := FEnty;
end;

function TSystemControllerBlocker.Initiate: Boolean;
var
   LDAO: TRTTIDataAcessObject;
begin
   LDAO := TRTTIDataAcessObject.Create(Enty);
   try
      Result := LDAO.Insert;
   finally
      FreeAndNil(LDAO);
   end;
end;

procedure TSystemControllerBlocker.SetClassParentName(const Value: UnicodeString);
begin
   FClassParentName := Value;
end;

procedure TSystemControllerBlocker.SetEnty(const Value: TEntyRecordBlocker);
begin
   FEnty := Value;
end;

procedure TSystemControllerBlocker.SetIdRecord(const Value: Int64);
begin
   FIdRecord := Value;
end;

end.

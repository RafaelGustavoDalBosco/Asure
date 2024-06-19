{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.Objects.Entys.Common;

interface

uses
   App.System.RTTI.CustomAttributes, App.Consts.DataBase, App.Objects.Entys;

type

   [TDBRelation(cTableApplicationControl, '', '')]
   TEntyApplication = class(TEnty)
   strict private
      FMinor: Integer;
      FRelease: Integer;
      FMajor: Integer;
      FApplicationVersion: Integer;
      FLastUpdatedDate: TDate;
      procedure SetLastUpdatedDate(const Value: TDate);
      procedure SetApplicationVersion(const Value: Integer);
      procedure SetMajor(const Value: Integer);
      procedure SetMinor(const Value: Integer);
      procedure SetRelease(const Value: Integer);
   public
      [TPropertyData(cFieldApplicationVersion, True)]
      [TPropertyInteger]
      property ApplicationVersion: Integer read FApplicationVersion write SetApplicationVersion;

      [TPropertyData(cFieldMajor, True)]
      [TPropertyInteger]
      property Major: Integer read FMajor write SetMajor;

      [TPropertyData(cFieldMinor, True)]
      [TPropertyInteger]
      property Minor: Integer read FMinor write SetMinor;

      [TPropertyData(cFieldRelease, True)]
      [TPropertyInteger]
      property Release: Integer read FRelease write SetRelease;

      [TPropertyData(cFieldLastUpdatedData)]
      [TPropertyDate]
      property LastUpdatedDate: TDate read FLastUpdatedDate write SetLastUpdatedDate;
   end;

   [TDBRelation(cTableBlocker, cSequenceCommon + 'BLOCKER', cCommentTableBlocker)]
   TEntyRecordBlocker = class(TEnty)
   strict private
      FIdEmpresa: Int64;
      FDataHora: TDateTime;
      FIdRecord: Int64;
      FIdUsuario: Int64;
      FClassParentName: UnicodeString;
      FUserName: UnicodeString;
      procedure SetClassParentName(const Value: UnicodeString);
      procedure SetDataHora(const Value: TDateTime);
      procedure SetIdEmpresa(const Value: Int64);
      procedure SetIdRecord(const Value: Int64);
      procedure SetIdUsuario(const Value: Int64);
      procedure SetUserName(const Value: UnicodeString);
   public
      [TPropertyData(cFieldIdEmpresa, True)]
      [TPropertyInt64]
      [TPropertyDBForeignKey(cFieldID, cTableEmpresa)]
      [TPropertyCustom(True)]
      property IdEmpresa: Int64 read FIdEmpresa write SetIdEmpresa;

      [TPropertyData(cFieldIdRecord, True)]
      [TPropertyInt64]
      [TPropertyCustom(True)]
      property IdRecord: Int64 read FIdRecord write SetIdRecord;

      [TPropertyData(cFieldIdUsuario, True)]
      [TPropertyInt64]
      [TPropertyDBForeignKey(cFieldID, cTableUsuario)]
      property IdUsuario: Int64 read FIdUsuario write SetIdUsuario;

      [TPropertyData(cFieldClassParentName, True)]
      [TPropertyString(100)]
      property ClassParentName: UnicodeString read FClassParentName write SetClassParentName;

      [TPropertyData(cFieldUserName)]
      [TPropertyString(cLengthCommonUser)]
      property UserName: UnicodeString read FUserName write SetUserName;

      [TPropertyData(cFieldDataHora, True)]
      [TPropertyDateTime]
      property DataHora: TDateTime read FDataHora write SetDataHora;
   end;

implementation

uses
    App.System.Vars, App.System.Controller.Register;

{ TEntyApplication }

procedure TEntyApplication.SetApplicationVersion(const Value: Integer);
begin
   SetFieldValue(FApplicationVersion, Value);
end;

procedure TEntyApplication.SetLastUpdatedDate(const Value: TDate);
begin
   SetFieldValue(FLastUpdatedDate, Value);
end;

procedure TEntyApplication.SetMajor(const Value: Integer);
begin
   SetFieldValue(FMajor, Value);
end;

procedure TEntyApplication.SetMinor(const Value: Integer);
begin
   SetFieldValue(FMinor, Value);
end;

procedure TEntyApplication.SetRelease(const Value: Integer);
begin
   SetFieldValue(FRelease, Value);
end;

{ TEntyRecordBlocker }

procedure TEntyRecordBlocker.SetClassParentName(const Value: UnicodeString);
begin
   SetFieldValue(FClassParentName, Value);
end;

procedure TEntyRecordBlocker.SetDataHora(const Value: TDateTime);
begin
   SetFieldValue(FDataHora, Value);
end;

procedure TEntyRecordBlocker.SetIdEmpresa(const Value: Int64);
begin
   SetFieldValue(FIdEmpresa, Value);
end;

procedure TEntyRecordBlocker.SetIdRecord(const Value: Int64);
begin
   SetFieldValue(FIdRecord, Value);
end;

procedure TEntyRecordBlocker.SetIdUsuario(const Value: Int64);
begin
   SetFieldValue(FIdUsuario, Value);
end;

procedure TEntyRecordBlocker.SetUserName(const Value: UnicodeString);
begin
   SetFieldValue(FUserName, Value);
end;

initialization
   TSystemRegisterRelation.Register(TEntyApplication);
end.

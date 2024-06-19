{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.Objects.Entys;

interface

uses
   App.System.RTTI.CustomAttributes, App.Consts.DataBase, App.Common.Utils, App.System.Classes;

type

   TEnty = class(TSystemClass)
   strict private
      FID: Int64;
      procedure SetID(const Value: Int64);
   public
      [TPropertyInt64]
      [TPropertyData(cFieldID, True, True)]
      property ID: Int64 read FID write SetID;
   end;

   TEntyRecord = class(TEnty)
   strict private
      FIdEmpresa: Int64;
      FDataCadastro: TDate;
      FStatus: Boolean;
      procedure SetStatus(const Value: Boolean);
      procedure SetIdEmpresa(const Value: Int64);
      procedure SetDataCadastro(const Value: TDate);
   public
      [TPropertyInt64]
      [TPropertyData(cFieldIdEmpresa, True)]
      [TPropertyCustom(True)]
      [TPropertyDBForeignKey(cFieldID, cTableEmpresa)]
      [TPropertyDBIndex(cFieldIdEmpresa)]
      property IdEmpresa: Int64 read FIdEmpresa write SetIdEmpresa;

      [TPropertyDate]
      [TPropertyData(cFieldDataCadastro)]
      property DataCadastro: TDate read FDataCadastro write SetDataCadastro;

      [TPropertyBoolean]
      [TPropertyData(cFieldStatus, True)]
      property Status: Boolean read FStatus write SetStatus;
   end;

   TEntyRoot = class(TEntyRecord)
   strict private
      FIdOwner: Int64;
      procedure SetIdOwner(const Value: Int64);
   public
      [TPropertyInt64]
      [TPropertyData(cFieldIdOwner, True)]
      property IdOwner: Int64 read FIdOwner write SetIdOwner;
   end;

implementation

{ TEnty }

procedure TEnty.SetID(const Value: Int64);
begin
   SetFieldValue(FID, Value);
end;

{ TEntyRecord }

procedure TEntyRecord.SetDataCadastro(const Value: TDate);
begin
   SetFieldValue(FDataCadastro, Value)
end;

procedure TEntyRecord.SetIdEmpresa(const Value: Int64);
begin
   SetFieldValue(FIdEmpresa, Value);
end;

procedure TEntyRecord.SetStatus(const Value: Boolean);
begin
   SetFieldValue(FStatus, Value);
end;

{ TEntyRoot }

procedure TEntyRoot.SetIdOwner(const Value: Int64);
begin
   SetFieldValue(FIdOwner, Value);
end;


end.

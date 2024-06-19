{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2022 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.System.Connection.Transaction;

interface

uses
   FireDAC.Comp.Client, App.System.Connection, System.SysUtils, App.System.Vars;

type

  TConnectionTransaction = class sealed (TObject)
  private
    FTransaction: TFDTransaction;
    FConnection: TConnection;
    procedure SetTransaction(const Value: TFDTransaction);
    procedure SetConnection(const Value: TConnection);
  protected
    property Transaction: TFDTransaction read FTransaction write SetTransaction;
    property Connection: TConnection read FConnection write SetConnection;
  public
    /// <summary>
    ///   Start Transaction <TFDConnection>
    /// </summary>
    function GetTransaction: TFDTransaction;

    /// <summary>
    ///   Commit <TFDTransaction>
    /// </summary>
    procedure Commit;

    /// <summary>
    ///   RollBack <TFDTransaction>
    /// </summary>
    procedure RollBack;

    /// <summary>
    ///   Cria com a instância padrão da aplicação <TConnection>
    /// </summary>
    constructor Create; overload;

    /// <summary>
    ///   Cria com uma instância passsada via parâmetro <TConnection>
    /// </summary>
    constructor Create(const AConnection: TConnection); overload;

    destructor Destroy; override;
  end;

implementation

{ TConnectionTransaction }

constructor TConnectionTransaction.Create;
begin
  SetConnection(gvApplicationConnection);
  inherited Create;
end;

procedure TConnectionTransaction.Commit;
begin
  Transaction.Commit;
end;

constructor TConnectionTransaction.Create(const AConnection: TConnection);
begin
  SetConnection(AConnection);
  inherited Create;
end;

destructor TConnectionTransaction.Destroy;
begin
  FreeAndNil(FTransaction);
  inherited Destroy;
end;

function TConnectionTransaction.GetTransaction: TFDTransaction;
begin
  if (not FTransaction.Active) then
  begin
    FTransaction.Connection := FConnection.GetCurrentConnection;
    FTransaction.StartTransaction;
  end;

  Result := FTransaction;
end;

procedure TConnectionTransaction.RollBack;
begin
  Transaction.Rollback;
end;

procedure TConnectionTransaction.SetConnection(const Value: TConnection);
begin
  FConnection := Value;
end;

procedure TConnectionTransaction.SetTransaction(const Value: TFDTransaction);
begin
  FTransaction := Value;
end;

end.

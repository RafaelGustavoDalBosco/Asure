{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.System.Connection.Params;

interface

uses
   App.System.Types;

type

  TConnectionParams = class sealed (TObject)
  strict private
    FCharacterSet: UnicodeString;
    FDriverName: UnicodeString;
    FLoginPrompt: Boolean;
    FPort: UnicodeString;
    FDataBasePath: UnicodeString;
    FPassWord: UnicodeString;
    FUserName: UnicodeString;
    FServerPath: UnicodeString;
    FTypeConnection: TTypeConnection;
    procedure SetTypeConnection(const Value: TTypeConnection);
    procedure SetCharacterSet(const Value: UnicodeString);
    procedure SetDataBasePath(const Value: UnicodeString);
    procedure SetDriverName(const Value: UnicodeString);
    procedure SetLoginPrompt(const Value: Boolean);
    procedure SetPassWord(const Value: UnicodeString);
    procedure SetPort(const Value: UnicodeString);
    procedure SetServerPath(const Value: UnicodeString);
    procedure SetUserName(const Value: UnicodeString);
  public
    property DriverName: UnicodeString read FDriverName write SetDriverName;
    property LoginPrompt: Boolean read FLoginPrompt write SetLoginPrompt;
    property CharacterSet: UnicodeString read FCharacterSet write SetCharacterSet;
    property DataBasePath: UnicodeString read FDataBasePath write SetDataBasePath;
    property ServerPath: UnicodeString read FServerPath write SetServerPath;
    property UserName: UnicodeString read FUserName write SetUserName;
    property PassWord: UnicodeString read FPassWord write SetPassWord;
    property Port: UnicodeString read FPort write SetPort;
    property TypeConnection: TTypeConnection read FTypeConnection write SetTypeConnection;
  end;

implementation

{ TConnectionParams }

procedure TConnectionParams.SetCharacterSet(const Value: UnicodeString);
begin
   FCharacterSet := Value;
end;

procedure TConnectionParams.SetDataBasePath(const Value: UnicodeString);
begin
   FDataBasePath := Value;
end;

procedure TConnectionParams.SetDriverName(const Value: UnicodeString);
begin
   FDriverName := Value;
end;

procedure TConnectionParams.SetLoginPrompt(const Value: Boolean);
begin
   FLoginPrompt := Value;
end;

procedure TConnectionParams.SetPassWord(const Value: UnicodeString);
begin
   FPassWord := Value;
end;

procedure TConnectionParams.SetPort(const Value: UnicodeString);
begin
   FPort := Value;
end;

procedure TConnectionParams.SetServerPath(const Value: UnicodeString);
begin
   FServerPath := Value;
end;

procedure TConnectionParams.SetTypeConnection(const Value: TTypeConnection);
begin
   FTypeConnection := Value;
end;

procedure TConnectionParams.SetUserName(const Value: UnicodeString);
begin
   FUserName := Value;
end;

end.

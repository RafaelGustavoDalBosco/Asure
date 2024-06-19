{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.System.DataBase.Objects;

interface

uses
  System.SysUtils, App.System.Classes.Collection;

type

  TDataBaseField = class
  strict private
    FName: UnicodeString;
    FIsPrimaryKey: Boolean;
    FIsNotNull: Boolean;
    FLength: Integer;
    FTypeText: UnicodeString;
    FDecimals: SmallInt;
    procedure SetIsNotNull(const Value: Boolean);
    procedure SetIsPrimaryKey(const Value: Boolean);
    procedure SetName(const Value: UnicodeString);
    procedure SetDecimals(const Value: SmallInt);
    procedure SetLength(const Value: Integer);
    procedure SetTypeText(const Value: UnicodeString);
  public
    property Name: UnicodeString read FName write SetName;
    property TypeText: UnicodeString read FTypeText write SetTypeText;
    property Length: Integer read FLength write SetLength;
    property Decimals: SmallInt read FDecimals write SetDecimals;
    property IsPrimaryKey: Boolean read FIsPrimaryKey write SetIsPrimaryKey;
    property IsNotNull: Boolean read FIsNotNull write SetIsNotNull;
  end;

  TDataBaseForeignKey = class
  strict private
    FFieldReference: UnicodeString;
    FTableReference: UnicodeString;
    FTableName: UnicodeString;
    FFieldName: UnicodeString;
    procedure SetFieldReference(const Value: UnicodeString);
    procedure SetTableReference(const Value: UnicodeString);
    procedure SetFieldName(const Value: UnicodeString);
    procedure SetTableName(const Value: UnicodeString);
  public
    property FieldName: UnicodeString read FFieldName write SetFieldName;
    property TableName: UnicodeString read FTableName write SetTableName;
    property FieldReference: UnicodeString read FFieldReference write SetFieldReference;
    property TableReference: UnicodeString read FTableReference write SetTableReference;
  end;

  TDataBaseIndex = class
  strict private
    FTableName: UnicodeString;
    FFieldName: UnicodeString;
    procedure SetFieldName(const Value: UnicodeString);
    procedure SetTableName(const Value: UnicodeString);
  public
    property FieldName: UnicodeString read FFieldName write SetFieldName;
    property TableName: UnicodeString read FTableName write SetTableName;
  end;

  TDataBaseTable = class
  strict private
    FName: UnicodeString;
    FFields: TCommonCollection;
    FComment: UnicodeString;
    FIndexs: TCommonCollection;
    FForeignKeys: TCommonCollection;
    procedure SetComment(const Value: UnicodeString);
    procedure SetFields(const Value: TCommonCollection);
    procedure SetName(const Value: UnicodeString);
    procedure SetForeignKeys(const Value: TCommonCollection);
    procedure SetIndexs(const Value: TCommonCollection);
  public
    property Name: UnicodeString read FName write SetName;
    property Comment: UnicodeString read FComment write SetComment;
    property Fields: TCommonCollection read FFields write SetFields;
    property Indexs: TCommonCollection read FIndexs write SetIndexs;
    property ForeignKeys: TCommonCollection read FForeignKeys write SetForeignKeys;
  end;

implementation

{ TDataBaseIndex }

procedure TDataBaseIndex.SetFieldName(const Value: UnicodeString);
begin
   FFieldName := Value;
end;

procedure TDataBaseIndex.SetTableName(const Value: UnicodeString);
begin
   FTableName := Value;
end;

{ TDataBaseField }

procedure TDataBaseField.SetDecimals(const Value: SmallInt);
begin
   FDecimals := Value;
end;

procedure TDataBaseField.SetIsNotNull(const Value: Boolean);
begin
   FIsNotNull := Value;
end;

procedure TDataBaseField.SetIsPrimaryKey(const Value: Boolean);
begin
   FIsPrimaryKey := Value;
end;

procedure TDataBaseField.SetLength(const Value: Integer);
begin
   FLength := Value;
end;

procedure TDataBaseField.SetName(const Value: UnicodeString);
begin
   FName := Value;
end;

procedure TDataBaseField.SetTypeText(const Value: UnicodeString);
begin
   FTypeText := Value;
end;

{ TDataBaseTable }

procedure TDataBaseTable.SetComment(const Value: UnicodeString);
begin
   FComment := Value;
end;

procedure TDataBaseTable.SetFields(const Value: TCommonCollection);
begin
   FFields := Value;
end;

procedure TDataBaseTable.SetForeignKeys(const Value: TCommonCollection);
begin
   FForeignKeys := Value;
end;

procedure TDataBaseTable.SetIndexs(const Value: TCommonCollection);
begin
   FIndexs := Value;
end;

procedure TDataBaseTable.SetName(const Value: UnicodeString);
begin
   FName := Value;
end;

{ TDataBaseForeignKey }

procedure TDataBaseForeignKey.SetFieldName(const Value: UnicodeString);
begin
   FFieldName := Value;
end;

procedure TDataBaseForeignKey.SetFieldReference(const Value: UnicodeString);
begin
   FFieldReference := Value;
end;

procedure TDataBaseForeignKey.SetTableName(const Value: UnicodeString);
begin
   FTableName := Value;
end;

procedure TDataBaseForeignKey.SetTableReference(const Value: UnicodeString);
begin
   FTableReference := Value;
end;

end.

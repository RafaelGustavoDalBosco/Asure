{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.System.RTTI.CustomAttributes;

interface

uses
   System.Math;

type

   TPropertyData = class(TCustomAttribute)
   strict private
      FIsPrimaryKey: Boolean;
      FIsNotNull: Boolean;
      FFieldName: UnicodeString;
      procedure SetFieldName(const Value: UnicodeString);
      procedure SetIsNotNull(const Value: Boolean);
      procedure SetIsPrimaryKey(const Value: Boolean);
   public
      property FieldName: UnicodeString read FFieldName write SetFieldName;
      property IsNotNull: Boolean read FIsNotNull write SetIsNotNull;
      property IsPrimaryKey: Boolean read FIsPrimaryKey write SetIsPrimaryKey;

      constructor Create(const AFieldName: UnicodeString; const AIsNotNull: Boolean = False; const AIsPrimaryKey: Boolean = False);
   end;

   TPropertyCustom = class(TCustomAttribute)
   strict private
      FInWhereSelect: Boolean;
      procedure SetInWhereSelect(const Value: Boolean);
   public
      property InWhereSelect: Boolean read FInWhereSelect write SetInWhereSelect;

      constructor Create(const AInWhereSelect: Boolean);
   end;

   TPropertyString = class(TCustomAttribute)
   strict private
      FLength: Integer;
      procedure SetLength(const Value: Integer);
   public
      property Length: Integer read FLength write SetLength;

      constructor Create(const ALength: Integer);
   end;

   TPropertyCurrency = class(TCustomAttribute)
   strict private
      FLength: Integer;
      FMinValue: Currency;
      FDecimals: ShortInt;
      FMaxValue: Currency;
      procedure SetDecimals(const Value: ShortInt);
      procedure SetLength(const Value: Integer);
      procedure SetMaxValue(const Value: Currency);
      procedure SetMinValue(const Value: Currency);
   public
      property Length: Integer read FLength write SetLength;
      property Decimals: ShortInt read FDecimals write SetDecimals;
      property MinValue: Currency read FMinValue write SetMinValue;
      property MaxValue: Currency read FMaxValue write SetMaxValue;

      constructor Create(const ALength: Integer; const ADecimals: ShortInt; const AMinValue: Currency = 0; const AMaxValue: Currency = MaxComp);
   end;

   TPropertyInteger = class(TCustomAttribute)
   strict private
      FMinValue: Integer;
      FDefaultValue: Integer;
      FMaxValue: Integer;
      procedure SetDefaultValue(const Value: Integer);
      procedure SetMaxValue(const Value: Integer);
      procedure SetMinValue(const Value: Integer);
   public
      property DefaultValue: Integer read FDefaultValue write SetDefaultValue;
      property MinValue: Integer read FMinValue write SetMinValue;
      property MaxValue: Integer read FMaxValue write SetMaxValue;

      constructor Create(const ADefaultValue: Integer = 0; const AMinValue: Integer = Low(Integer); const AMaxValue: Integer = High(Integer));
   end;

   TPropertyInt64 = class(TCustomAttribute)
   strict private
      FMinValue: Int64;
      FDefaultValue: Int64;
      FMaxValue: Int64;
      procedure SetDefaultValue(const Value: Int64);
      procedure SetMaxValue(const Value: Int64);
      procedure SetMinValue(const Value: Int64);
   public
      property DefaultValue: Int64 read FDefaultValue write SetDefaultValue;
      property MinValue: Int64 read FMinValue write SetMinValue;
      property MaxValue: Int64 read FMaxValue write SetMaxValue;

      constructor Create(const ADefaultValue: Int64 = 0; const AMinValue: Int64 = Low(Int64); const AMaxValue: Int64 = High(Int64));
   end;

   TPropertyShortInt = class(TCustomAttribute)
   strict private
      FMinValue: ShortInt;
      FDefaultValue: ShortInt;
      FMaxValue: ShortInt;
      procedure SetDefaultValue(const Value: ShortInt);
      procedure SetMaxValue(const Value: ShortInt);
      procedure SetMinValue(const Value: ShortInt);
   public
      property DefaultValue: ShortInt read FDefaultValue write SetDefaultValue;
      property MinValue: ShortInt read FMinValue write SetMinValue;
      property MaxValue: ShortInt read FMaxValue write SetMaxValue;

      constructor Create(const ADefaultValue: ShortInt = 0; const AMinValue: ShortInt = Low(ShortInt); const AMaxValue: ShortInt = High(ShortInt));
   end;

   TPropertySmallInt = class(TCustomAttribute)
   strict private
      FMinValue: SmallInt;
      FDefaultValue: SmallInt;
      FMaxValue: SmallInt;
      procedure SetDefaultValue(const Value: SmallInt);
      procedure SetMaxValue(const Value: SmallInt);
      procedure SetMinValue(const Value: SmallInt);
   public
      property DefaultValue: SmallInt read FDefaultValue write SetDefaultValue;
      property MinValue: SmallInt read FMinValue write SetMinValue;
      property MaxValue: SmallInt read FMaxValue write SetMaxValue;

      constructor Create(const ADefaultValue: SmallInt = 0; const AMinValue: SmallInt = Low(SmallInt); const AMaxValue: SmallInt = High(SmallInt));
   end;

   TPropertyWord = class(TCustomAttribute)
   strict private
      FMinValue: Word;
      FDefaultValue: Word;
      FMaxValue: Word;
      procedure SetDefaultValue(const Value: Word);
      procedure SetMaxValue(const Value: Word);
      procedure SetMinValue(const Value: Word);
   public
      property DefaultValue: Word read FDefaultValue write SetDefaultValue;
      property MinValue: Word read FMinValue write SetMinValue;
      property MaxValue: Word read FMaxValue write SetMaxValue;

      constructor Create(const ADefaultValue: Word = 0; const AMinValue: Word = 0; const AMaxValue: Word = High(Word));
   end;

   TPropertyDate = class(TCustomAttribute)
   strict private
      FClearIfNull: Boolean;
      procedure SetClearIfNull(const Value: Boolean);
   public
      property ClearIfNull: Boolean read FClearIfNull write SetClearIfNull;

      constructor Create(const AClearIfNull: Boolean = True);
   end;

   TPropertyDateTime = class(TCustomAttribute)
   strict private
      FClearIfNull: Boolean;
      procedure SetClearIfNull(const Value: Boolean);
   public
      property ClearIfNull: Boolean read FClearIfNull write SetClearIfNull;

      constructor Create(const AClearIfNull: Boolean = True);
   end;

   TPropertyTime = class(TCustomAttribute)
   strict private
      FMinValue: TTime;
      FMaxValue: TTime;
      FClearIfNull: Boolean;
      procedure SetMaxValue(const Value: TTime);
      procedure SetMinValue(const Value: TTime);
      procedure SetClearIfNull(const Value: Boolean);
   public
      property MinValue: TTime read FMinValue write SetMinValue;
      property MaxValue: TTime read FMaxValue write SetMaxValue;
      property ClearIfNull: Boolean read FClearIfNull write SetClearIfNull;

      constructor Create(const AMinValue: TTime = 0; const AMaxValue: TTime = MaxComp; const AClearIfNull: Boolean = True);
   end;

   TPropertyCollection = class(TCustomAttribute)
   end;

   TPropertyBoolean = class(TCustomAttribute)
   end;

   TPropertyBytea = class(TCustomAttribute)
   end;

   TPropertyDBForeignKey = class(TCustomAttribute)
   strict private
      FFieldReference: UnicodeString;
      FRelationReference: UnicodeString;
      procedure SetFieldReference(const Value: UnicodeString);
      procedure SetRelationReference(const Value: UnicodeString);
   public
      property FieldReference: UnicodeString read FFieldReference write SetFieldReference;
      property RelationReference: UnicodeString read FRelationReference write SetRelationReference;

      constructor Create(const AFieldReference, ARelationReference: UnicodeString);
   end;

   TPropertyDBIndex = class(TCustomAttribute)
   strict private
      FFieldReference: UnicodeString;
      procedure SetFieldReference(const Value: UnicodeString);
   public
      property FieldReference: UnicodeString read FFieldReference write SetFieldReference;

      constructor Create(const AFieldReference: UnicodeString);
   end;

   TDBRelation = class(TCustomAttribute)
   strict private
      FName: UnicodeString;
      FComment: UnicodeString;
      FSequence: UnicodeString;
      procedure SetName(const Value: UnicodeString);
      procedure SetComment(const Value: UnicodeString);
      procedure SetSequence(const Value: UnicodeString);
   public
      property Name: UnicodeString read FName write SetName;
      property Sequence: UnicodeString read FSequence write SetSequence;
      property Comment: UnicodeString read FComment write SetComment;

      constructor Create(const AName: UnicodeString; const ASequence: UnicodeString = ''; const AComment: UnicodeString = '');
   end;


implementation

{ TPropertyData }

constructor TPropertyData.Create(const AFieldName: UnicodeString; const AIsNotNull, AIsPrimaryKey: Boolean);
begin
   SetFieldName(AFieldName);
   SetIsNotNull(AIsNotNull);
   SetIsPrimaryKey(AIsPrimaryKey);
end;

procedure TPropertyData.SetFieldName(const Value: UnicodeString);
begin
   FFieldName := Value;
end;

procedure TPropertyData.SetIsNotNull(const Value: Boolean);
begin
   FIsNotNull := Value;
end;

procedure TPropertyData.SetIsPrimaryKey(const Value: Boolean);
begin
   FIsPrimaryKey := Value;
end;

{ TPropertyString }

constructor TPropertyString.Create(const ALength: Integer);
begin
   SetLength(ALength);

   inherited Create;
end;

procedure TPropertyString.SetLength(const Value: Integer);
begin
   FLength := Value;
end;

{ TPropertyCurrency }

constructor TPropertyCurrency.Create(const ALength: Integer; const ADecimals: ShortInt; const AMinValue: Currency; const AMaxValue: Currency);
begin
   SetLength(ALength);
   SetDecimals(ADecimals);
   SetMinValue(AMinValue);
   SetMaxValue(AMaxValue);

   inherited Create;
end;

procedure TPropertyCurrency.SetDecimals(const Value: ShortInt);
begin
   FDecimals := Value;
end;

procedure TPropertyCurrency.SetLength(const Value: Integer);
begin
   FLength := Value;
end;

procedure TPropertyCurrency.SetMaxValue(const Value: Currency);
begin
   FMaxValue := Value;
end;

procedure TPropertyCurrency.SetMinValue(const Value: Currency);
begin
   FMinValue := Value;
end;

{ TPropertyInteger }

constructor TPropertyInteger.Create(const ADefaultValue, AMinValue, AMaxValue: Integer);
begin
   SetDefaultValue(ADefaultValue);
   SetMinValue(AMinValue);
   SetMaxValue(AMaxValue);

   inherited Create;
end;

procedure TPropertyInteger.SetDefaultValue(const Value: Integer);
begin
   FDefaultValue := Value;
end;

procedure TPropertyInteger.SetMaxValue(const Value: Integer);
begin
   FMaxValue := Value;
end;

procedure TPropertyInteger.SetMinValue(const Value: Integer);
begin
   FMinValue := Value;
end;

{ TPropertyInt64 }

constructor TPropertyInt64.Create(const ADefaultValue, AMinValue, AMaxValue: Int64);
begin
   SetDefaultValue(ADefaultValue);
   SetMinValue(AMinValue);
   SetMaxValue(AMaxValue);

   inherited Create;
end;

procedure TPropertyInt64.SetDefaultValue(const Value: Int64);
begin
   FDefaultValue := Value;
end;

procedure TPropertyInt64.SetMaxValue(const Value: Int64);
begin
   FMaxValue := Value;
end;

procedure TPropertyInt64.SetMinValue(const Value: Int64);
begin
   FMinValue := Value;
end;

{ TPropertyShortInt }

constructor TPropertyShortInt.Create(const ADefaultValue, AMinValue, AMaxValue: ShortInt);
begin
   SetDefaultValue(ADefaultValue);
   SetMinValue(AMinValue);
   SetMaxValue(AMaxValue);

   inherited Create;
end;

procedure TPropertyShortInt.SetDefaultValue(const Value: ShortInt);
begin
   FDefaultValue := Value;
end;

procedure TPropertyShortInt.SetMaxValue(const Value: ShortInt);
begin
   FMaxValue := Value;
end;

procedure TPropertyShortInt.SetMinValue(const Value: ShortInt);
begin
   FMinValue := Value;
end;

{ TPropertyWord }

constructor TPropertyWord.Create(const ADefaultValue, AMinValue, AMaxValue: Word);
begin
   SetDefaultValue(ADefaultValue);
   SetMinValue(AMinValue);
   SetMaxValue(AMaxValue);

   inherited Create;
end;

procedure TPropertyWord.SetDefaultValue(const Value: Word);
begin
   FDefaultValue := Value;
end;

procedure TPropertyWord.SetMaxValue(const Value: Word);
begin
   FMaxValue := Value;
end;

procedure TPropertyWord.SetMinValue(const Value: Word);
begin
   FMinValue := Value;
end;

{ TDBRelation }

constructor TDBRelation.Create(const AName, ASequence, AComment: UnicodeString);
begin
   SetName(AName);
   SetSequence(ASequence);
   SetComment(AComment);

   inherited Create;
end;

procedure TDBRelation.SetComment(const Value: UnicodeString);
begin
   FComment := Value;
end;

procedure TDBRelation.SetName(const Value: UnicodeString);
begin
   FName := Value;
end;

procedure TDBRelation.SetSequence(const Value: UnicodeString);
begin
   FSequence := Value;
end;

{ TPropertyDBForeignKey }

constructor TPropertyDBForeignKey.Create(const AFieldReference, ARelationReference: UnicodeString);
begin
   SetFieldReference(AFieldReference);
   SetRelationReference(ARelationReference);

   inherited Create;
end;

procedure TPropertyDBForeignKey.SetFieldReference(const Value: UnicodeString);
begin
   FFieldReference := Value;
end;

procedure TPropertyDBForeignKey.SetRelationReference(const Value: UnicodeString);
begin
   FRelationReference := Value;
end;

{ TPropertySmallInt }

constructor TPropertySmallInt.Create(const ADefaultValue, AMinValue, AMaxValue: SmallInt);
begin
   SetDefaultValue(ADefaultValue);
   SetMinValue(AMinValue);
   SetMaxValue(AMaxValue);

   inherited Create;
end;

procedure TPropertySmallInt.SetDefaultValue(const Value: SmallInt);
begin
   FDefaultValue := Value;
end;

procedure TPropertySmallInt.SetMaxValue(const Value: SmallInt);
begin
   FMaxValue := Value;
end;

procedure TPropertySmallInt.SetMinValue(const Value: SmallInt);
begin
   FMinValue := Value;
end;

{ TPropertyDate }

constructor TPropertyDate.Create(const AClearIfNull: Boolean);
begin
   SetClearIfNull(AClearIfNull);
   inherited Create;
end;

procedure TPropertyDate.SetClearIfNull(const Value: Boolean);
begin
   FClearIfNull := Value;
end;

{ TPropertyTime }

constructor TPropertyTime.Create(const AMinValue, AMaxValue: TTime; const AClearIfNull: Boolean);
begin
   SetMaxValue(AMaxValue);
   SetMinValue(AMinValue);
   SetClearIfNull(AClearIfNull);

   inherited Create;
end;

procedure TPropertyTime.SetClearIfNull(const Value: Boolean);
begin
   FClearIfNull := Value;
end;

procedure TPropertyTime.SetMaxValue(const Value: TTime);
begin
   FMaxValue := Value;
end;

procedure TPropertyTime.SetMinValue(const Value: TTime);
begin
   FMinValue := Value;
end;

{ TPropertyDateTime }

constructor TPropertyDateTime.Create(const AClearIfNull: Boolean);
begin
   SetClearIfNull(AClearIfNull);
   inherited Create;
end;

procedure TPropertyDateTime.SetClearIfNull(const Value: Boolean);
begin
   FClearIfNull := Value;
end;

{ TPropertyDBIndex }

constructor TPropertyDBIndex.Create(const AFieldReference: UnicodeString);
begin
   SetFieldReference(AFieldReference);
   inherited Create;
end;

procedure TPropertyDBIndex.SetFieldReference(const Value: UnicodeString);
begin
   FFieldReference := Value;
end;

{ TPropertyCustom }

constructor TPropertyCustom.Create(const AInWhereSelect: Boolean);
begin
   SetInWhereSelect(AInWhereSelect);
   inherited Create;
end;

procedure TPropertyCustom.SetInWhereSelect(const Value: Boolean);
begin
   FInWhereSelect := Value;
end;

end.


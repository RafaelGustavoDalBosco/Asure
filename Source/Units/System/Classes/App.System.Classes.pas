unit App.System.Classes;

interface

uses App.System.Types;

type

   TPropertiesObjectFlags = set of TTypePropertyObjectFlag;

   TSystemClass = class
   private
      FFlags: TPropertiesObjectFlags;
      procedure SetFlags(const Value: TPropertiesObjectFlags);
   public
      /// <summary>
      ///    SET FIELD VALUE [CURRENCY]
      /// </summary>
      procedure SetFieldValue(var ACurrent: Currency; const ANew: Currency); overload;

      /// <summary>
      ///    SET FIELD VALUE [UNICODESTRING]
      /// </summary>
      procedure SetFieldValue(var ACurrent: UnicodeString; const ANew: UnicodeString); overload;

      /// <summary>
      ///    SET FIELD VALUE [INTEGER]
      /// </summary>
      procedure SetFieldValue(var ACurrent: Integer; const ANew: Integer); overload;

      /// <summary>
      ///    SET FIELD VALUE [DATE]
      /// </summary>
      procedure SetFieldValue(var ACurrent: TDate; const ANew: TDate); overload;

      /// <summary>
      ///    SET FIELD VALUE [DATETIME]
      /// </summary>
      procedure SetFieldValue(var ACurrent: TDateTime; const ANew: TDateTime); overload;

      /// <summary>
      ///    SET FIELD VALUE [TIME]
      /// </summary>
      procedure SetFieldValue(var ACurrent: TTime; const ANew: TTime); overload;

      /// <summary>
      ///    SET FIELD VALUE [INT64]
      /// </summary>
      procedure SetFieldValue(var ACurrent: Int64; const ANew: Int64); overload;

      /// <summary>
      ///    SET FIELD VALUE [BOOLEAN]
      /// </summary>
      procedure SetFieldValue(var ACurrent: Boolean; const ANew: Boolean); overload;

      /// <summary>
      ///    SET FIELD VALUE [WORD]
      /// </summary>
      procedure SetFieldValue(var ACurrent: Word; const ANew: Word); overload;

      property Flags: TPropertiesObjectFlags read FFlags write SetFlags;
   end;


implementation

{ TSystemClass }

procedure TSystemClass.SetFieldValue(var ACurrent: TDate; const ANew: TDate);
begin
   if (ACurrent <> ANew) then
   begin
      Include(FFlags, pofChanged);
      ACurrent := ANew;
   end;
end;

procedure TSystemClass.SetFieldValue(var ACurrent: Integer; const ANew: Integer);
begin
   if (ACurrent <> ANew) then
   begin
      Include(FFlags, pofChanged);
      ACurrent := ANew;
   end;
end;

procedure TSystemClass.SetFieldValue(var ACurrent: UnicodeString; const ANew: UnicodeString);
begin
   if (ACurrent <> ANew) then
   begin
      Include(FFlags, pofChanged);
      ACurrent := ANew;
   end;
end;

procedure TSystemClass.SetFieldValue(var ACurrent: Currency; const ANew: Currency);
begin
   if (ACurrent <> ANew) then
   begin
      Include(FFlags, pofChanged);
      ACurrent := ANew;
   end;
end;

procedure TSystemClass.SetFieldValue(var ACurrent: Boolean; const ANew: Boolean);
begin
   if (ACurrent <> ANew) then
   begin
      Include(FFlags, pofChanged);
      ACurrent := ANew;
   end;
end;

procedure TSystemClass.SetFlags(const Value: TPropertiesObjectFlags);
begin
   FFlags := Value;
end;

procedure TSystemClass.SetFieldValue(var ACurrent: Int64; const ANew: Int64);
begin
   if (ACurrent <> ANew) then
   begin
      Include(FFlags, pofChanged);
      ACurrent := ANew;
   end;
end;

procedure TSystemClass.SetFieldValue(var ACurrent: TTime; const ANew: TTime);
begin
   if (ACurrent <> ANew) then
   begin
      Include(FFlags, pofChanged);
      ACurrent := ANew;
   end;
end;

procedure TSystemClass.SetFieldValue(var ACurrent: TDateTime; const ANew: TDateTime);
begin
   if (ACurrent <> ANew) then
   begin
      Include(FFlags, pofChanged);
      ACurrent := ANew;
   end;
end;

procedure TSystemClass.SetFieldValue(var ACurrent: Word; const ANew: Word);
begin
   if (ACurrent <> ANew) then
   begin
      Include(FFlags, pofChanged);
      ACurrent := ANew;
   end;
end;

end.

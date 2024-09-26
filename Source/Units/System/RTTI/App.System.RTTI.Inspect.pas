{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.System.RTTI.Inspect;

interface

uses
  RTTI, App.System.RTTI.CustomAttributes, System.Generics.Collections,
  App.System.Classes.Collection, App.System.DataBase.Objects, App.System.Vars,
  App.System.Types, System.SysUtils;

type

   TRTTIInspectProperty = class
   protected
      RttiProperty: TRttiProperty;
   public
      /// <summary>
      ///   Obtém o atributo da property baseado na sua classe
      /// </summary>
      function GetPropertyAttribute(const AClassAttribute: TClass): TCustomAttribute;

      /// <summary>
      ///   Get <TPropertyData>
      /// </summary>
      function GetPropertyData: TPropertyData;

      /// <summary>
      ///    Get <TPropertyCustom>
      /// </summary>
      function GetPropertyCustom: TPropertyCustom;

      /// <summary>
      ///   Get <TPropertyString>
      /// </summary>
      function GetPropertyString: TPropertyString;

      /// <summary>
      ///   Get <TPropertyCurrency>
      /// </summary>
      function GetPropertyCurrency: TPropertyCurrency;

      /// <summary>
      ///   Get <TPropertyInteger>
      /// </summary>
      function GetPropertyInteger: TPropertyInteger;

      /// <summary>
      ///   Get <TPropertyInt64>
      /// </summary>
      function GetPropertyInt64: TPropertyInt64;

      /// <summary>
      ///   Get <TPropertyShortInt>
      /// </summary>
      function GetPropertyShortInt: TPropertyShortInt;

      /// <summary>
      ///   Get <TPropertySmallInt>
      /// </summary>
      function GetPropertySmallInt: TPropertySmallInt;

      /// <summary>
      ///   Get <TPropertyWord>
      /// </summary>
      function GetPropertyWord: TPropertyWord;

      /// <summary>
      ///   Get <TPropertyDate>
      /// </summary>
      function GetPropertyDate: TPropertyDate;

      /// <summary>
      ///   Get <TPropertyDateTime>
      /// </summary>
      function GetPropertyDateTime: TPropertyDateTime;

      /// <summary>
      ///   Get <TPropertyTime>
      /// </summary>
      function GetPropertyTime: TPropertyTime;

      /// <summary>
      ///   Get <TPropertyCollection>
      /// </summary>
      function GetPropertyCollection: TPropertyCollection;

      /// <summary>
      ///   Get <TPropertyBytea>
      /// </summary>
      function GetPropertyBytea: TPropertyBytea;

      /// <summary>
      ///   Get <TPropertyBoolean>
      /// </summary>
      function GetPropertyBoolean: TPropertyBoolean;

      /// <summary>
      ///   Get <TPropertyDBForeignKey>
      /// </summary>
      function GetPropertyDBForeignKey: TPropertyDBForeignKey;

      /// <summary>
      ///   Get <TPropertyDBIndex>
      /// </summary>
      function GetPropertyDBIndex: TPropertyDBIndex;

      constructor Create(const ARttiProperty: TRttiProperty); overload;
   end;

   TRTTIInspectObject = class
   protected
      RttiContext: TRttiContext;
      RttiType: TRttiType;
      Instance: TObject;
   strict protected
      /// <summary>
      ///    SET - > TSystemKernelDataBaseField Properties
      /// </summary>
      procedure SetDataBaseFieldProperties(const ADataBaseField: TDataBaseField; const AInspect: TRTTIInspectProperty);
   public
      /// <summary>
      ///   Obtém o atributo da property baseado na sua classe
      /// </summary>
      function GetObjectAttribute(const AClassAttribute: TClass): TCustomAttribute;

      /// <summary>
      ///    Obtém o TPropertyData da primary key do objeto
      /// </summary>
      function GetPrimaryKeyProperty: TPropertyData;

      /// <summary>
      ///    Verifica se existe alguma Property com o tipo TCollectionProperty no Objeto
      /// </summary>
      function HasCollectionProperty: Boolean;

      /// <summary>
      ///   Get <TObjectDBRelation>
      /// </summary>
      function GetObjectDBRelation: TDBRelation;

      /// <summary>
      ///   Obtém a lista de propertys de um objeto
      /// </summary>
      function GetObjectProperties: TArray<TRttiProperty>;

      /// <summary>
      ///   Constroi a lista de fields de um objeto
      /// </summary>
      function GetDataBaseFieldsFromObject: TCommonCollection;

      /// <summary>
      ///   Constroi a lista de index de um objeto
      /// </summary>
      function GetDataBaseIndexsFromObject: TCommonCollection;

      /// <summary>
      ///   Constroi a lista de FK de um objeto
      /// </summary>
      function GetDataBaseForeignKeysFromObject: TCommonCollection;

      constructor Create(const AObject: TObject); overload;
      destructor Destroy; override;
   end;

implementation

{ TRTTIInspectProperty }

constructor TRTTIInspectProperty.Create(const ARttiProperty: TRttiProperty);
begin
   RttiProperty := ARttiProperty;
   inherited Create;
end;

function TRTTIInspectProperty.GetPropertyAttribute(const AClassAttribute: TClass): TCustomAttribute;
var
   LAttribute: TCustomAttribute;
begin
   Result := nil;

   for LAttribute in RttiProperty.GetAttributes do
   begin
      if (LAttribute.ClassType = AClassAttribute) then
         Exit(LAttribute);
   end;
end;

function TRTTIInspectProperty.GetPropertyBoolean: TPropertyBoolean;
begin
   Result := GetPropertyAttribute(TPropertyBoolean) as TPropertyBoolean;
end;

function TRTTIInspectProperty.GetPropertyBytea: TPropertyBytea;
begin
   Result := GetPropertyAttribute(TPropertyBytea) as TPropertyBytea;
end;

function TRTTIInspectProperty.GetPropertyCollection: TPropertyCollection;
begin
   Result := GetPropertyAttribute(TPropertyCollection) as TPropertyCollection;
end;

function TRTTIInspectProperty.GetPropertyCurrency: TPropertyCurrency;
begin
   Result := GetPropertyAttribute(TPropertyCurrency) as TPropertyCurrency;
end;

function TRTTIInspectProperty.GetPropertyCustom: TPropertyCustom;
begin
   Result := GetPropertyAttribute(TPropertyCustom) as TPropertyCustom;
end;

function TRTTIInspectProperty.GetPropertyData: TPropertyData;
begin
   Result := GetPropertyAttribute(TPropertyData) as TPropertyData;
end;

function TRTTIInspectProperty.GetPropertyDate: TPropertyDate;
begin
   Result := GetPropertyAttribute(TPropertyDate) as TPropertyDate;
end;

function TRTTIInspectProperty.GetPropertyDateTime: TPropertyDateTime;
begin
   Result := GetPropertyAttribute(TPropertyDateTime) as TPropertyDateTime;
end;

function TRTTIInspectProperty.GetPropertyDBForeignKey: TPropertyDBForeignKey;
begin
  Result := GetPropertyAttribute(TPropertyDBForeignKey) as TPropertyDBForeignKey;
end;

function TRTTIInspectProperty.GetPropertyDBIndex: TPropertyDBIndex;
begin
  Result := GetPropertyAttribute(TPropertyDBIndex) as TPropertyDBIndex;
end;

function TRTTIInspectProperty.GetPropertyInt64: TPropertyInt64;
begin
   Result := GetPropertyAttribute(TPropertyInt64) as TPropertyInt64;
end;

function TRTTIInspectProperty.GetPropertyInteger: TPropertyInteger;
begin
   Result := GetPropertyAttribute(TPropertyInteger) as TPropertyInteger
end;

function TRTTIInspectProperty.GetPropertyShortInt: TPropertyShortInt;
begin
   Result := GetPropertyAttribute(TPropertyShortInt) as TPropertyShortInt;
end;

function TRTTIInspectProperty.GetPropertySmallInt: TPropertySmallInt;
begin
   Result := GetPropertyAttribute(TPropertySmallInt) as TPropertySmallInt;
end;

function TRTTIInspectProperty.GetPropertyString: TPropertyString;
begin
   Result := GetPropertyAttribute(TPropertyString) as TPropertyString;
end;

function TRTTIInspectProperty.GetPropertyTime: TPropertyTime;
begin
   Result := GetPropertyAttribute(TPropertyTime) as TPropertyTime;
end;

function TRTTIInspectProperty.GetPropertyWord: TPropertyWord;
begin
   Result := GetPropertyAttribute(TPropertyWord) as TPropertyWord;
end;

{ TRTTIInspectObject }

constructor TRTTIInspectObject.Create(const AObject: TObject);
begin
   Instance := AObject;
   RttiType := RttiContext.GetType(TObject(AObject).ClassInfo);
   inherited Create;
end;

destructor TRTTIInspectObject.Destroy;
begin
   FreeAndNil(RttiType);
   inherited Destroy;
end;

function TRTTIInspectObject.GetObjectDBRelation: TDBRelation;
begin
   Result := GetObjectAttribute(TDBRelation) as TDBRelation;
end;

function TRTTIInspectObject.GetObjectProperties: TArray<TRttiProperty>;
begin
   Result := RttiType.GetProperties;
end;

function TRTTIInspectObject.GetPrimaryKeyProperty: TPropertyData;
var
   LRttiInspectObject: TRTTIInspectObject;
   LRttiInspectProperty: TRTTIInspectProperty;
   LRttiProperty: TRttiProperty;
   LRttiProperties: TArray<TRttiProperty>;
   LPropertyData: TPropertyData;
begin
   LRttiInspectObject := TRTTIInspectObject.Create(Instance);
   try
      LRttiProperties := LRttiInspectObject.GetObjectProperties;

      for LRttiProperty in LRttiProperties do
      begin
         LRttiInspectProperty := TRTTIInspectProperty.Create(LRttiProperty);
         try
            LPropertyData := LRttiInspectProperty.GetPropertyData;

            if (LPropertyData <> nil) and (LPropertyData.IsPrimaryKey) then
               Exit(LPropertyData);
         finally
            FreeAndNil(LRttiInspectProperty);
         end;
      end;
   finally
      FreeAndNil(LRttiInspectObject);
   end;

   Result := nil;
end;

function TRTTIInspectObject.HasCollectionProperty: Boolean;
var
   LRttiInspectObject: TRTTIInspectObject;
   LRttiInspectProperty: TRTTIInspectProperty;
   LRttiProperty: TRttiProperty;
   LRttiProperties: TArray<TRttiProperty>;
   LPropertyCollection: TPropertyCollection;
begin
   LRttiInspectObject := TRTTIInspectObject.Create(Instance);
   try
      LRttiProperties := LRttiInspectObject.GetObjectProperties;

      for LRttiProperty in LRttiProperties do
      begin
         LRttiInspectProperty := TRTTIInspectProperty.Create(LRttiProperty);
         try
            LPropertyCollection := LRttiInspectProperty.GetPropertyCollection;

            if (LPropertyCollection <> nil) then
               Exit(True);
         finally
            FreeAndNil(LRttiInspectProperty);
         end;
      end;
   finally
      FreeAndNil(LRttiInspectObject);
   end;

   Result := False;
end;

procedure TRTTIInspectObject.SetDataBaseFieldProperties(const ADataBaseField: TDataBaseField; const AInspect: TRTTIInspectProperty);
var
   LPropertyCurrency: TPropertyCurrency;
   LPropertyString: TPropertyString;
   LPropertyInteger: TPropertyInteger;
   LPropertySmallInt: TPropertySmallInt;
   LPropertyShortInt: TPropertyShortInt;
   LPropertyInt64: TPropertyInt64;
   LPropertyDate: TPropertyDate;
   LPropertyDateTime: TPropertyDateTime;
   LPropertyTime: TPropertyTime;
   LPropertyBoolean: TPropertyBoolean;
   LPropertyBytea: TPropertyBytea;
   LPropertyWord: TPropertyWord;
begin
   LPropertyCurrency := AInspect.GetPropertyCurrency;

   if (LPropertyCurrency <> nil) then
   begin
      ADataBaseField.Length := LPropertyCurrency.Length;
      ADataBaseField.Decimals := LPropertyCurrency.Decimals;
      ADataBaseField.TypeText := 'NUMERIC';
      Exit;
   end;

   LPropertyInteger := AInspect.GetPropertyInteger;

   if (LPropertyInteger <> nil) then
   begin
      ADataBaseField.TypeText := 'INTEGER';
      Exit;
   end;

   LPropertySmallInt := AInspect.GetPropertySmallInt;
   LPropertyShortInt := AInspect.GetPropertyShortInt;

   if (LPropertySmallInt <> nil) or (LPropertyShortInt <> nil) then
   begin
      ADataBaseField.TypeText := 'SMALLINT';
      Exit;
   end;

   LPropertyInt64 := AInspect.GetPropertyInt64;

   if (LPropertyInt64 <> nil) then
   begin
      ADataBaseField.TypeText := 'BIGINT';
      Exit;
   end;

   LPropertyDate := AInspect.GetPropertyDate;
   LPropertyDateTime := AInspect.GetPropertyDateTime;

   if (LPropertyDate <> nil) or (LPropertyDateTime <> nil) then
   begin
      ADataBaseField.TypeText := 'DATE';
      Exit;
   end;

   LPropertyTime := AInspect.GetPropertyTime;

   if (LPropertyTime <> nil) then
   begin
      ADataBaseField.TypeText := 'TIME';
      Exit;
   end;

   LPropertyBoolean := AInspect.GetPropertyBoolean;

   if (LPropertyBoolean <> nil) then
   begin
      // -> Boolean neste caso é inteiro
      if (gvTypeConnection <> ttcPostGres) then
         ADataBaseField.TypeText := 'INTEGER'
      else
         ADataBaseField.TypeText := 'BOOLEAN';

      Exit;
   end;

   LPropertyBytea := AInspect.GetPropertyBytea;

   if (LPropertyBytea <> nil) then
   begin
      ADataBaseField.TypeText := 'BYTEA';
      Exit;
   end;

   LPropertyString := AInspect.GetPropertyString;

   if (LPropertyString <> nil) then
   begin
      ADataBaseField.Length := LPropertyString.Length;
      ADataBaseField.TypeText := 'VARCHAR';
      Exit;
   end;

   LPropertyWord := AInspect.GetPropertyWord;

   if (LPropertyWord <> nil) then
   begin
      ADataBaseField.TypeText := 'INTEGER';
      Exit;
   end;
end;

function TRTTIInspectObject.GetDataBaseFieldsFromObject: TCommonCollection;
var
   LRttiInspectObject: TRTTIInspectObject;
   LRttiInspectProperty: TRTTIInspectProperty;
   LRttiProperty: TRttiProperty;
   LRttiProperties: TArray<TRttiProperty>;
   LPropertyData: TPropertyData;
   LDataBaseField: TDataBaseField;
   LAttribute: TCustomAttribute;
begin
   Result := TCommonCollection.Create;

   LRttiInspectObject := TRTTIInspectObject.Create(Instance);
   try
      LRttiProperties := LRttiInspectObject.GetObjectProperties;

      for LRttiProperty in LRttiProperties do
      begin
         LRttiInspectProperty := TRTTIInspectProperty.Create(LRttiProperty);
         try
            LPropertyData := LRttiInspectProperty.GetPropertyData;

            if (LPropertyData <> nil) then
            begin
               LDataBaseField := TDataBaseField.Create;
               LDataBaseField.Name := LPropertyData.FieldName;
               LDataBaseField.IsPrimaryKey := LPropertyData.IsPrimaryKey;
               LDataBaseField.IsNotNull := LPropertyData.IsNotNull;

               for LAttribute in LRttiProperty.GetAttributes do
                  SetDataBaseFieldProperties(LDataBaseField, LRttiInspectProperty);

               Result.Add(LDataBaseField);
            end;
         finally
            FreeAndNil(LRttiInspectProperty);
         end;
      end;
   finally
      FreeAndNil(LRttiInspectObject);
   end;
end;

function TRTTIInspectObject.GetDataBaseForeignKeysFromObject: TCommonCollection;
var
   LRttiInspectObject: TRTTIInspectObject;
   LRttiInspectProperty: TRTTIInspectProperty;
   LRttiProperty: TRttiProperty;
   LRttiProperties: TArray<TRttiProperty>;
   LPropertyForeignKey: TPropertyDBForeignKey;
   LPropertyData: TPropertyData;
   LDataBaseForeignKey: TDataBaseForeignKey;
   LObjectDBRelation: TDBRelation;
begin
   Result := TCommonCollection.Create;

   LRttiInspectObject := TRTTIInspectObject.Create(Instance);
   try
      LRttiProperties := LRttiInspectObject.GetObjectProperties;

      for LRttiProperty in LRttiProperties do
      begin
         LRttiInspectProperty := TRTTIInspectProperty.Create(LRttiProperty);
         try
            LPropertyData := LRttiInspectProperty.GetPropertyData;
            LObjectDBRelation := LRttiInspectObject.GetObjectDBRelation;
            LPropertyForeignKey := LRttiInspectProperty.GetPropertyDBForeignKey;

            if (LPropertyData <> nil) and (LObjectDBRelation <> nil) then
            begin
               LDataBaseForeignKey := TDataBaseForeignKey.Create;
               LDataBaseForeignKey.FieldName := LPropertyData.FieldName;
               LDataBaseForeignKey.TableName := LObjectDBRelation.Name;
               LDataBaseForeignKey.TableReference := LPropertyForeignKey.RelationReference;
               LDataBaseForeignKey.FieldReference := LPropertyForeignKey.FieldReference;

               Result.Add(LDataBaseForeignKey);
            end;
         finally
            FreeAndNil(LRttiInspectProperty);
         end;
      end;
   finally
      FreeAndNil(LRttiInspectObject);
   end;
end;

function TRTTIInspectObject.GetDataBaseIndexsFromObject: TCommonCollection;
var
   LRttiInspectObject: TRTTIInspectObject;
   LRttiInspectProperty: TRTTIInspectProperty;
   LRttiProperty: TRttiProperty;
   LRttiProperties: TArray<TRttiProperty>;
   LPropertyIndex: TPropertyDBIndex;
   LDataBaseIndex: TDataBaseIndex;
   LObjectDBRelation: TDBRelation;
begin
   Result := TCommonCollection.Create;

   LRttiInspectObject := TRTTIInspectObject.Create(Instance);
   try
      LRttiProperties := LRttiInspectObject.GetObjectProperties;

      for LRttiProperty in LRttiProperties do
      begin
         LRttiInspectProperty := TRTTIInspectProperty.Create(LRttiProperty);
         try
            LPropertyIndex := LRttiInspectProperty.GetPropertyDBIndex;
            LObjectDBRelation := LRttiInspectObject.GetObjectDBRelation;

            if (LPropertyIndex <> nil) and (LObjectDBRelation <> nil) then
            begin
               LDataBaseIndex := TDataBaseIndex.Create;
               LDataBaseIndex.FieldName := LPropertyIndex.FieldReference;
               LDataBaseIndex.TableName := LObjectDBRelation.Name;

               Result.Add(LDataBaseIndex);
            end;
         finally
            FreeAndNil(LRttiInspectProperty);
         end;
      end;
   finally
      FreeAndNil(LRttiInspectObject);
   end;
end;

function TRTTIInspectObject.GetObjectAttribute(const AClassAttribute: TClass): TCustomAttribute;
var
  LAttribute: TCustomAttribute;
begin
  Result := nil;

  for LAttribute in RttiType.GetAttributes do
  begin
    if (LAttribute.ClassType = AClassAttribute) then
      Exit(LAttribute);
  end;
end;

end.

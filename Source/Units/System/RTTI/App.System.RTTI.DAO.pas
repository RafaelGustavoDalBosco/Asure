{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.System.RTTI.DAO;

interface

uses
   System.SysUtils,
   System.RTTI,
   App.System.RTTI.Inspect,
   App.System.RTTI.CustomAttributes,
   App.System.RTTI.Builder.SQL.Generate,
   App.System.Classes.Collection,
   App.System.Wrapper,
   App.System.Types,
   App.System.Connection.Transaction;

type

   TRTTIDataAcessObject = class
   private
      RttiInspectObject: TRTTIInspectObject;
      FCurrentObject: TObject;
      FTransaction: TConnectionTransaction;
      procedure SetCurrentObject(const Value: TObject);
      procedure SetTransaction(const Value: TConnectionTransaction);

      /// <summary>
      ///    Cria uma nova instância da classe TRRTIBuilderSQL
      /// </summary>
      function CreateNewInstanceOfBuilderSQL(const AType: TTypeBuilderSQL): TRTTIBuilderSQL;
   strict private
      property CurrentObject: TObject read FCurrentObject write SetCurrentObject;
      property Transaction: TConnectionTransaction read FTransaction write SetTransaction;
   protected
      /// <summary>
      ///    Processa os itens de Collection, caso tenha
      /// </summary>
      procedure ProcessCollectionPropertys;

      /// <summary>
      ///    Seta o valor COLLECTION da property para a execução dos OBJETOS
      /// </summary>
      procedure ProcessPropertyCollection(const AValue: TValue; const AProperty: TRttiProperty);

      /// <summary>
      ///    Processa os itens do Collection
      /// </summary>
      procedure ProcessObjectInCollection(const ACollection: TCommonCollection);
   strict protected
      /// <summary>
      ///    Seta os parâmetros da SQL para SELECT
      /// </summary>
      procedure SetParamsSQLOnQuerySelect(const AQuery: TQuery);

      /// <summary>
      ///    Seta os parâmetros da SQL para INSERT
      /// </summary>
      procedure SetParamsSQLOnQueryInsert(const AQuery: TQuery);

      /// <summary>
      ///    Seta os parâmetros da SQL para UPDATE
      /// </summary>
      procedure SetParamsSQLOnQueryUpdate(const AQuery: TQuery);

      /// <summary>
      ///    Seta o Parâmetro pelo tipo dentro da Query
      /// </summary>
      procedure SetParamValueFromType(const AQuery: TQuery; const ARttiProperty: TRttiInspectProperty; const AValue: TValue);

      /// <summary>
      ///    Seta o Field Value pelo tipo do campo da Query
      /// </summary>
      procedure SetFieldValueFromType(const AObject: TObject; const AQuery: TQuery; const ARttiInspectProperty: TRttiInspectProperty; const ARttiProperty: TRttiProperty; const AFieldName: UnicodeString);

      /// <summary>
      ///    Seta os Fields da Query para o Objeto
      /// </summary>
      procedure SetFieldsSQLOnObject(const AQuery: TQuery);

      /// <summary>
      ///    Seta os Fields da Query par ao Objeto detro de uma lista
      /// </summary>
      procedure SetFieldsSQLOnObjectList(const AQuery: TQuery; const AList: TCommonCollection);
   public
      /// <summary>
      ///    Obtém uma Lista de Objetos
      /// </summary>
      function ListOf: TCommonCollection; overload;

      /// <summary>
      ///    Obtém uma Lista de Objetos a partir de uma SQL
      /// </summary>
      function ListOf(const ASQL: UnicodeString): TCommonCollection; overload;

      /// <summary>
      ///    Obtém uma Lista de Registros a partir da classe, retornando como TQuery
      /// </summary>
      function ListOfCustom: TQuery;

      /// <summary>
      ///   UPDATE OR INSERT INTO
      /// </summary>
      function Save: Boolean;

      /// <summary>
      ///    INSERT
      /// </summary>
      function Insert: Boolean;

      /// <summary>
      ///    UPDATE
      /// </summary>
      function Update: Boolean;

      /// <summary>
      ///    SELECT
      /// </summary>
      function Select: Boolean;

      /// <summary>
      ///    DELETE
      /// </summary>
      function Delete: Boolean;

      constructor Create(const AObject: TObject; const ATransaction: TConnectionTransaction = nil); overload;
      constructor Create(const ATransaction: TConnectionTransaction = nil); overload;
      destructor Destroy; override;
   end;

implementation

{ TRTTIDataAcessObject }

uses
   App.Consts.Messages, App.System.Vars, App.Common.Utils, App.System.Log, App.Objects.Entys,
  App.System.Classes;

constructor TRTTIDataAcessObject.Create(const AObject: TObject; const ATransaction: TConnectionTransaction);
begin
   if (AObject = nil) then
      raise Exception.Create(SErrorObjectNil);

   SetCurrentObject(AObject);
   SetTransaction(ATransaction);
   RttiInspectObject := TRTTIInspectObject.Create(AObject);

   inherited Create;
end;

 constructor TRTTIDataAcessObject.Create(const ATransaction: TConnectionTransaction);
begin
   SetTransaction(ATransaction);
   inherited Create;
end;

function TRTTIDataAcessObject.CreateNewInstanceOfBuilderSQL(const AType: TTypeBuilderSQL): TRTTIBuilderSQL;
begin
   Result := TRTTIBuilderSQL.Create(CurrentObject, AType, RttiInspectObject.HasCollectionProperty);
end;

function TRTTIDataAcessObject.Delete: Boolean;
var
   LQuery: TQuery;
   LRttiBuilderSQL: TRTTIBuilderSQL;
begin
   LQuery := TQuery.Create;
   LRttiBuilderSQL := CreateNewInstanceOfBuilderSQL(tbsDelete);

   if (Transaction = nil) then
      LQuery.StartTransaction;

   try
      LQuery.AddSQL(LRttiBuilderSQL.GetSQL);
      SetParamsSQLOnQuerySelect(LQuery);

      try
         Result := LQuery.Execute;

         if (Transaction = nil) then
            LQuery.CommitTransaction;
      except
         on E: Exception do
         begin
            if (Transaction = nil) then
               LQuery.RollBackTransaction;

            raise Exception.CreateFmt(SErrorPersistentObject, ['Delete', CurrentObject.ClassName, E.Message]);
         end;
      end;
   finally
      FreeAndNil(LQuery);
      FreeAndNil(LRttiBuilderSQL);
   end;
end;

destructor TRTTIDataAcessObject.Destroy;
begin
   FreeAndNil(RttiInspectObject);
   inherited;
end;

function TRTTIDataAcessObject.Insert: Boolean;
var
   LQuery: TQuery;
   LRttiBuilderSQL: TRTTIBuilderSQL;
   LID: Int64;
begin
   LQuery := TQuery.Create;
   LRttiBuilderSQL := CreateNewInstanceOfBuilderSQL(tbsInsert);

   if (Transaction = nil) then
      LQuery.StartTransaction;

   try
      LQuery.AddSQL(LRttiBuilderSQL.GetSQL);
      SetParamsSQLOnQueryInsert(LQuery);

      try
         Result := LQuery.GetData;

         if (Result) then
            ProcessCollectionPropertys;

         if (Transaction = nil) then
            LQuery.CommitTransaction;
      except
         on E: Exception do
         begin
            if (Transaction = nil) then
               LQuery.RollBackTransaction;

            raise Exception.CreateFmt(SErrorPersistentObject, ['Insert', CurrentObject.ClassName, E.Message]);
         end;
      end;
   finally
      FreeAndNil(LQuery);
      FreeAndNil(LRttiBuilderSQL);
   end;
end;

function TRTTIDataAcessObject.ListOf(const ASQL: UnicodeString): TCommonCollection;
var
   LQuery: TQuery;
begin
   Result := TCommonCollection.Create;

   LQuery := TQuery.Create;
   try
      LQuery.AddSQL(ASQL);

      if LQuery.GetData then
         SetFieldsSQLOnObjectList(LQuery, Result);
   finally
      FreeAndNil(LQuery);
   end;
end;

function TRTTIDataAcessObject.ListOfCustom: TQuery;
var
   LQuery: TQuery;
   LRttiBuilderSQL: TRTTIBuilderSQL;
begin
   LRttiBuilderSQL := CreateNewInstanceOfBuilderSQL(tbsList);
   LQuery := TQuery.Create;
   try
      LQuery.AddSQL(LRttiBuilderSQL.GetSQL);
      SetParamsSQLOnQuerySelect(LQuery);

      if LQuery.GetData then
         SetFieldsSQLOnObject(LQuery);
   finally
      Result := LQuery;
      FreeAndNil(LRttiBuilderSQL);
   end;
end;

procedure TRTTIDataAcessObject.ProcessCollectionPropertys;
var
   LRttiProperty: TRttiProperty;
   LPropertyCollection: TPropertyCollection;
   LValue: TValue;
   LRttiInspectProperty: TRTTIInspectProperty;
   LRttiProperties: TArray<TRttiProperty>;
begin
   LRttiProperties := RttiInspectObject.GetObjectProperties;

   for LRttiProperty in LRttiProperties do
   begin
      LRttiInspectProperty := TRTTIInspectProperty.Create(LRttiProperty);
      try
         LPropertyCollection := LRttiInspectProperty.GetPropertyCollection;

         if (LPropertyCollection <> nil) then
         begin
            LValue := LRttiProperty.GetValue(CurrentObject);
            ProcessPropertyCollection(LValue, LRttiProperty);
         end;
      finally
         FreeAndNil(LRttiInspectProperty);
      end;
   end;
end;

procedure TRTTIDataAcessObject.ProcessObjectInCollection(const ACollection: TCommonCollection);
var
   LLoop: TObject;
   LDAO: TRTTIDataAcessObject;
begin
   for LLoop in ACollection do
   begin
      LDAO := TRTTIDataAcessObject.Create(LLoop, Transaction);
      try
         LDAO.Save;
      finally
         FreeAndNil(LDAO);
      end;
   end;
end;

procedure TRTTIDataAcessObject.ProcessPropertyCollection(const AValue: TValue; const AProperty: TRttiProperty);
var
   Value: TCommonCollection;
begin
   if (not AValue.IsObject) then
      Exit;

   if (AValue.AsObject is TCommonCollection) then
   begin
      Value := AValue.AsObject as TCommonCollection;

      if (Value <> nil) then
         ProcessObjectInCollection(Value)
      else
         Log.Write(UnitName, Format(SWarnObjectTypeDiff, [Value.ClassName, TCommonCollection.ClassName]));
   end
   else
      Log.Write(UnitName, Format(SEmptyObject, [AProperty.Name]));
end;

function TRTTIDataAcessObject.ListOf: TCommonCollection;
var
   LQuery: TQuery;
   LRttiBuilderSQL: TRTTIBuilderSQL;
begin
   Result := TCommonCollection.Create;

   LRttiBuilderSQL :=  CreateNewInstanceOfBuilderSQL(tbsList);
   LQuery := TQuery.Create;
   try
      LQuery.AddSQL(LRttiBuilderSQL.GetSQL);
      SetParamsSQLOnQuerySelect(LQuery);

      if LQuery.GetData then
         SetFieldsSQLOnObjectList(LQuery, Result);
   finally
      FreeAndNil(LQuery);
      FreeAndNil(LRttiBuilderSQL);
   end;
end;

function TRTTIDataAcessObject.Save: Boolean;
var
   LQuery: TQuery;
   LRttiBuilderSQL: TRTTIBuilderSQL;
begin
   LQuery := TQuery.Create;
   LRttiBuilderSQL := CreateNewInstanceOfBuilderSQL(tbsInsertOrUpdate);

   if (Transaction = nil) then
      LQuery.StartTransaction;

   try
      LQuery.AddSQL(LRttiBuilderSQL.GetSQL);
      SetParamsSQLOnQueryInsert(LQuery);

      try
         Result := LQuery.Execute;

         if (Result) then
            ProcessCollectionPropertys;

         if (Transaction = nil) then
            LQuery.CommitTransaction;
      except
         on E: Exception do
         begin
            if (Transaction = nil) then
               LQuery.RollBackTransaction;

            raise Exception.CreateFmt(SErrorPersistentObject, ['Save', CurrentObject.ClassName, E.Message]);
         end;
      end;
   finally
      FreeAndNil(LQuery);
      FreeAndNil(LRttiBuilderSQL);
   end;
end;

function TRTTIDataAcessObject.Select: Boolean;
var
   LQuery: TQuery;
   LRttiBuilderSQL: TRTTIBuilderSQL;
begin
   LQuery := TQuery.Create;
   LRttiBuilderSQL := CreateNewInstanceOfBuilderSQL(tbsDelete);
   try
      LQuery.AddSQL(LRttiBuilderSQL.GetSQL);
      SetParamsSQLOnQuerySelect(LQuery);

      Result := LQuery.GetData;

      if (Result) then
         SetFieldsSQLOnObject(LQuery);
   finally
      FreeAndNil(LQuery);
      FreeAndNil(LRttiBuilderSQL);
   end;
end;

procedure TRTTIDataAcessObject.SetCurrentObject(const Value: TObject);
begin
   FCurrentObject := Value;
end;

procedure TRTTIDataAcessObject.SetFieldsSQLOnObject(const AQuery: TQuery);
var
   LPropertyData: TPropertyData;
   LRttiProperty: TRttiProperty;
   LRttiInspectProperty: TRTTIInspectProperty;
   LRttiProperties: TArray<TRttiProperty>;
   LLoop: Integer;
   LQueryFieldName, LPropertyFieldName: UnicodeString;
begin
   LRttiProperties := RttiInspectObject.GetObjectProperties;
   try
      repeat
         for LLoop := 0 to AQuery.GetFields.Count - 1 do
         begin
            for LRttiProperty in LRttiProperties do
            begin
               LRttiInspectProperty := TRTTIInspectProperty.Create(LRttiProperty);
               try
                  LPropertyData := LRttiInspectProperty.GetPropertyData;

                  if (LPropertyData <> nil) then
                  begin
                     LPropertyFieldName := LPropertyData.FieldName;
                     LQueryFieldName := AQuery.GetFields[LLoop].FieldName;

                     if (LPropertyFieldName.IsEmpty) then
                        Continue;

                     if SysCc.IsEqual(LPropertyFieldName, LQueryFieldName) then
                     begin
                        SetFieldValueFromType(CurrentObject, AQuery, LRttiInspectProperty, LRttiProperty, LQueryFieldName);
                        Break;
                     end;
                  end;
               finally
                  FreeAndNil(LRttiInspectProperty);
               end;
            end;
         end;

         AQuery.Next;
      until AQuery.EndOfData;
   finally
      AQuery.Close;
   end;
end;

procedure TRTTIDataAcessObject.SetFieldsSQLOnObjectList(const AQuery: TQuery; const AList: TCommonCollection);
var
   LPropertyData: TPropertyData;
   LRttiProperty: TRttiProperty;
   LRttiInspectProperty: TRTTIInspectProperty;
   LRttiProperties: TArray<TRttiProperty>;
   LLoop: Integer;
   LQueryFieldName, LPropertyFieldName: UnicodeString;
   LInstance: TObject;
begin
   LRttiProperties := RttiInspectObject.GetObjectProperties;
   try
      repeat
         LInstance := CurrentObject.NewInstance;

         for LLoop := 0 to AQuery.GetFields.Count - 1 do
         begin
            for LRttiProperty in LRttiProperties do
            begin
               LRttiInspectProperty := TRTTIInspectProperty.Create(LRttiProperty);
               try
                  LPropertyData := LRttiInspectProperty.GetPropertyData;

                  if (LPropertyData <> nil) then
                  begin
                     LPropertyFieldName := LPropertyData.FieldName;
                     LQueryFieldName := AQuery.GetFields[LLoop].FieldName;

                     if (LPropertyFieldName.IsEmpty) then
                        Continue;

                     if SysCc.IsEqual(LPropertyFieldName, LQueryFieldName) then
                     begin
                        SetFieldValueFromType(LInstance, AQuery, LRttiInspectProperty, LRttiProperty, LQueryFieldName);
                        Break;
                     end;
                  end;
               finally
                  FreeAndNil(LRttiInspectProperty);
               end;
            end;
         end;

         AList.Add(LInstance);
         AQuery.Next;
      until AQuery.EndOfData;
   finally
      AQuery.Close;
   end;
end;

procedure TRTTIDataAcessObject.SetFieldValueFromType(const AObject: TObject; const AQuery: TQuery; const ARttiInspectProperty: TRttiInspectProperty; const ARttiProperty: TRttiProperty; const AFieldName: UnicodeString);
var
   LPropertyString: TPropertyString;
   LPropertyInteger: TPropertyInteger;
   LPropertyWord: TPropertyWord;
   LPropertySmallInt: TPropertySmallInt;
   LPropertyShortInt: TPropertyShortInt;
   LPropertyInt64: TPropertyInt64;
   LPropertyDate: TPropertyDate;
   LPropertyDateTime: TPropertyDateTime;
   LPropertyCurrency: TPropertyCurrency;
   LPropertyTime: TPropertyTime;
   LPropertyBoolean: TPropertyBoolean;
begin
   LPropertyString := ARttiInspectProperty.GetPropertyString;

   if (LPropertyString <> nil) then
   begin
      ARttiProperty.SetValue(AObject, AQuery.FieldToString(AFieldName));
      Exit;
   end;

   LPropertyInteger := ARttiInspectProperty.GetPropertyInteger;

   if (LPropertyInteger <> nil) then
   begin
      ARttiProperty.SetValue(AObject, AQuery.FieldToInteger(AFieldName));
      Exit;
   end;

   LPropertyInt64 := ARttiInspectProperty.GetPropertyInt64;

   if (LPropertyInt64 <> nil) then
   begin
      ARttiProperty.SetValue(AObject, AQuery.FieldToInt64(AFieldName));
      Exit;
   end;

   LPropertyWord := ARttiInspectProperty.GetPropertyWord;

   if (LPropertyWord <> nil) then
   begin
      ARttiProperty.SetValue(AObject, AQuery.FieldToInteger(AFieldName));
      Exit;
   end;

   LPropertyCurrency := ARttiInspectProperty.GetPropertyCurrency;

   if (LPropertyCurrency <> nil) then
   begin
      ARttiProperty.SetValue(AObject, AQuery.FieldToCurr(AFieldName));
      Exit;
   end;

   LPropertyDateTime := ARttiInspectProperty.GetPropertyDateTime;

   if (LPropertyDateTime <> nil) then
   begin
      ARttiProperty.SetValue(AObject, AQuery.FieldToDateTime(AFieldName));
      Exit;
   end;

   LPropertyDate := ARttiInspectProperty.GetPropertyDate;

   if (LPropertyDate <> nil) then
   begin
      ARttiProperty.SetValue(AObject, AQuery.FieldToDate(AFieldName));
      Exit;
   end;

   LPropertyTime := ARttiInspectProperty.GetPropertyTime;

   if (LPropertyTime <> nil) then
   begin
      ARttiProperty.SetValue(AObject, AQuery.FieldToTime(AFieldName));
      Exit;
   end;

   LPropertyBoolean := ARttiInspectProperty.GetPropertyBoolean;

   if (LPropertyBoolean <> nil) then
   begin
      if (gvTypeConnection = ttcFireBird) then
         ARttiProperty.SetValue(AObject, Boolean(AQuery.FieldToInteger(AFieldName)))
      else
         ARttiProperty.SetValue(AObject, AQuery.FieldToBool(AFieldName));
   end;

   LPropertyShortInt := ARttiInspectProperty.GetPropertyShortInt;

   if (LPropertyShortInt <> nil) then
   begin
      ARttiProperty.SetValue(AObject, AQuery.FieldToInteger(AFieldName));
      Exit;
   end;

   LPropertySmallInt := ARttiInspectProperty.GetPropertySmallInt;

   if (LPropertySmallInt <> nil) then
   begin
      ARttiProperty.SetValue(AObject, AQuery.FieldToInteger(AFieldName));
      Exit;
   end;
end;

procedure TRTTIDataAcessObject.SetParamsSQLOnQuerySelect(const AQuery: TQuery);
var
   LRttiProperty: TRttiProperty;
   LPropertyData: TPropertyData;
   LPropertyCustom: TPropertyCustom;
   LValue: TValue;
   LRttiInspectProperty: TRTTIInspectProperty;
   LRttiProperties: TArray<TRttiProperty>;
begin
   LRttiProperties := RttiInspectObject.GetObjectProperties;

   for LRttiProperty in LRttiProperties do
   begin
      LRttiInspectProperty := TRTTIInspectProperty.Create(LRttiProperty);
      try
         LPropertyData := LRttiInspectProperty.GetPropertyData;

         if (LPropertyData <> nil) then
         begin
            LValue := LRttiProperty.GetValue(CurrentObject);

            LPropertyCustom := LRttiInspectProperty.GetPropertyCustom;

            if ((LPropertyCustom <> nil) and (LPropertyCustom.InWhereSelect)) or
               ((LPropertyData.IsPrimaryKey) and (LValue.AsInt64 > 0)) then
               SetParamValueFromType(AQuery, LRttiInspectProperty, LValue);
         end;
      finally
         FreeAndNil(LRttiInspectProperty);
      end;
   end;
end;

procedure TRTTIDataAcessObject.SetParamsSQLOnQueryUpdate(const AQuery: TQuery);
var
   LRttiProperty: TRttiProperty;
   LPropertyData: TPropertyData;
   LValue: TValue;
   LRttiInspectProperty: TRTTIInspectProperty;
   LRttiProperties: TArray<TRttiProperty>;
begin
   LRttiProperties := RttiInspectObject.GetObjectProperties;

   for LRttiProperty in LRttiProperties do
   begin
      LRttiInspectProperty := TRTTIInspectProperty.Create(LRttiProperty);
      try
         LPropertyData := LRttiInspectProperty.GetPropertyData;

         if (LPropertyData <> nil) then
         begin
            LValue := LRttiProperty.GetValue(CurrentObject);

            SetParamValueFromType(AQuery, LRttiInspectProperty, LValue);
         end;
      finally
         FreeAndNil(LRttiInspectProperty);
      end;
   end;
end;

procedure TRTTIDataAcessObject.SetParamsSQLOnQueryInsert(const AQuery: TQuery);
var
   LRttiProperty: TRttiProperty;
   LPropertyData: TPropertyData;
   LValue: TValue;
   LRttiInspectProperty: TRTTIInspectProperty;
   LRttiProperties: TArray<TRttiProperty>;
begin
   LRttiProperties := RttiInspectObject.GetObjectProperties;

   for LRttiProperty in LRttiProperties do
   begin
      LRttiInspectProperty := TRTTIInspectProperty.Create(LRttiProperty);
      try
         LPropertyData := LRttiInspectProperty.GetPropertyData;

         if (LPropertyData <> nil) then
         begin
            LValue := LRttiProperty.GetValue(CurrentObject);

            if (not LPropertyData.IsPrimaryKey) or ((LPropertyData.IsPrimaryKey) and (LValue.AsInt64 > 0)) then
               SetParamValueFromType(AQuery, LRttiInspectProperty, LValue);
         end;
      finally
         FreeAndNil(LRttiInspectProperty);
      end;
   end;
end;

procedure TRTTIDataAcessObject.SetParamValueFromType(const AQuery: TQuery; const ARttiProperty: TRttiInspectProperty; const AValue: TValue);
var
   LPropertyData: TPropertyData;
   LPropertyString: TPropertyString;
   LPropertyCurrency: TPropertyCurrency;
   LPropertyInteger: TPropertyInteger;
   LPropertyInt64: TPropertyInt64;
   LPropertyWord: TPropertyWord;
   LPropertySmallInt: TPropertySmallInt;
   LPropertyShortInt: TPropertyShortInt;
   LPropertyBoolean: TPropertyBoolean;
   LPropertyDateTime: TPropertyDateTime;
   LPropertyDate: TPropertyDate;
   LPropertyTime: TPropertyTime;
   LDateValue: TDate;
   LDateTimeValue: TDateTime;
   LTimeValue: TTime;
begin
   LPropertyData := ARttiProperty.GetPropertyData;

   if (LPropertyData <> nil) then
   begin
      LPropertyString := ARttiProperty.GetPropertyString;

      if (LPropertyString <> nil) then
      begin
         AQuery.ParamValue(LPropertyData.FieldName, AValue.AsString);
         Exit;
      end;

      LPropertyCurrency := ARttiProperty.GetPropertyCurrency;

      if (LPropertyCurrency <> nil) then
      begin
         AQuery.ParamValue(LPropertyData.FieldName, AValue.AsCurrency);
         Exit;
      end;

      LPropertyInteger := ARttiProperty.GetPropertyInteger;

      if (LPropertyInteger <> nil) then
      begin
         AQuery.ParamValueNull(LPropertyData.FieldName, AValue.AsInteger, LPropertyInteger.DefaultValue);
         Exit;
      end;

      LPropertyInt64 := ARttiProperty.GetPropertyInt64;

      if (LPropertyInt64 <> nil) then
      begin
         AQuery.ParamValueNull(LPropertyData.FieldName, AValue.AsInt64, LPropertyInt64.DefaultValue);
         Exit;
      end;

      LPropertySmallInt := ARttiProperty.GetPropertySmallInt;

      if (LPropertySmallInt <> nil) then
      begin
         AQuery.ParamValueNull(LPropertyData.FieldName, AValue.AsInteger, LPropertySmallInt.DefaultValue);
         Exit;
      end;

      LPropertyShortInt := ARttiProperty.GetPropertyShortInt;

      if (LPropertyShortInt <> nil) then
      begin
         AQuery.ParamValueNull(LPropertyData.FieldName, AValue.AsInteger, LPropertyShortInt.DefaultValue);
         Exit;
      end;

      LPropertyWord := ARttiProperty.GetPropertyWord;

      if (LPropertyWord <> nil) then
      begin
         AQuery.ParamValueNull(LPropertyData.FieldName, AValue.AsInteger, LPropertyWord.DefaultValue);
         Exit;
      end;

      LPropertyDate := ARttiProperty.GetPropertyDate;

      if (LPropertyDate <> nil) then
      begin
         LDateValue := AValue.AsExtended;
         AQuery.ParamValue(LPropertyData.FieldName, LDateValue);
         Exit;
      end;

      LPropertyDateTime := ARttiProperty.GetPropertyDateTime;

      if (LPropertyDateTime <> nil) then
      begin
         LDateTimeValue := AValue.AsExtended;
         AQuery.ParamValue(LPropertyData.FieldName, LDateTimeValue);
         Exit;
      end;

      LPropertyTime := ARttiProperty.GetPropertyTime;

      if (LPropertyTime <> nil) then
      begin
         LTimeValue := AValue.AsExtended;
         AQuery.ParamValue(LPropertyData.FieldName, LTimeValue);
         Exit;
      end;

      LPropertyBoolean := ARttiProperty.GetPropertyBoolean;

      if (LPropertyBoolean <> nil) then
      begin
         if (gvTypeConnection = ttcFireBird) then
            AQuery.ParamValue(LPropertyData.FieldName, Integer(AValue.AsBoolean))
         else
            AQuery.ParamValue(LPropertyData.FieldName, AValue.AsBoolean);

         Exit;
      end;
   end;
end;

procedure TRTTIDataAcessObject.SetTransaction(const Value: TConnectionTransaction);
begin
   FTransaction := Value;
end;

function TRTTIDataAcessObject.Update: Boolean;
var
   LQuery: TQuery;
   LRttiBuilderSQL: TRTTIBuilderSQL;
   LID: Int64;
begin
   LQuery := TQuery.Create;
   LRttiBuilderSQL := CreateNewInstanceOfBuilderSQL(tbsUpdate);

   if (Transaction = nil) then
      LQuery.StartTransaction;

   try
      LQuery.AddSQL(LRttiBuilderSQL.GetSQL);
      SetParamsSQLOnQueryUpdate(LQuery);

      try
         Result := LQuery.Execute;

         if (Result) then
            ProcessCollectionPropertys;

         if (Transaction = nil) then
            LQuery.CommitTransaction;
      except
         on E: Exception do
         begin
            if (Transaction = nil) then
               LQuery.RollBackTransaction;

            raise Exception.CreateFmt(SErrorPersistentObject, ['Update', CurrentObject.ClassName, E.Message]);
         end;
      end;
   finally
      FreeAndNil(LQuery);
      FreeAndNil(LRttiBuilderSQL);
   end;
end;


end.

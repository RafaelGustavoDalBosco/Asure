{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.System.DataBase.Consistency;

interface

uses
   System.SysUtils,
   App.System.Classes.Collection,
   App.System.Wrapper,
   App.System.DataBase.Objects,
   App.System.SQL.DataBase,
   App.System.Connection.Transaction,
   App.System.Vars,
   App.System.RTTI.Inspect,
   App.System.RTTI.CustomAttributes,
   App.System.RTTI.Builder.SQL.Generate,
   App.System.Log,
   App.System.Types,
   App.Common.Utils,
   App.Consts.Messages,
   App.Consts.DataBase;

type

   TSystemDataBaseConsistency = class
   protected
      /// <summary>
      ///    Obtém o texto do field para criação
      /// </summary>
      function GetCustomTextField(const ADataBaseField: TDataBaseField): UnicodeString;

      /// <summary>
      ///    Tenta obter uma FK que exista pela tabela e FieldName
      /// </summary>
      function TryGetForeignKeyFromField(const ATableName, AFieldName: UnicodeString): TDataBaseForeignKey;

      /// <summary>
      ///    Executa uma SQL na transação do objeto
      /// </summary>
      procedure ExecuteSQLTransaction(const ASQL: UnicodeString);
   strict protected
      /// <summary>
      ///    Checa as origens e cria/deleta conforme a regra INDEX
      /// </summary>
      procedure ReverseLoopIndex(const AListSource, AListDestiny: TCommonCollection; const ADataBaseCheck: Boolean);

      /// <summary>
      ///    Checa as origens e cria/deleta conforme a regra FK
      /// </summary>
      procedure ReverseLoopForeignKey(const AListSource, AListDestiny: TCommonCollection; const ADataBaseCheck: Boolean);

      /// <summary>
      ///    Checa as origens e cria/deleta conforme a regra FIELDS
      /// </summary>
      procedure ReverseLoopFields(const AListSource, AListDestiny: TCommonCollection; const ATableName: UnicodeString; const ADataBaseCheck: Boolean);

      /// <summary>
      ///    Atualiza os campos de uma tabela
      /// </summary>
      procedure UpdateFields(const ATableName: UnicodeString; const AObject: TObject);

      /// <summary>
      ///    Atualiza as FK de uma tabela
      /// </summary>
      procedure UpdateForeignKeys(const ATableName: UnicodeString; const AObject: TObject);

      /// <summary>
      ///    Atualiza os Indexs de uma tabela
      /// </summary>
      procedure UpdateIndexs(const ATableName: UnicodeString; const AObject: TObject);

      /// <summary>
      ///    Cria os campos de uma tabela
      /// </summary>
      procedure CreateFields(const ATableName: UnicodeString; const AObject: TObject);

      /// <summary>
      ///    Cria um novo campo
      /// </summary>
      procedure CreateField(const AFieldDataBase: TDataBaseField; const ATableName: UnicodeString);

            /// <summary>
      ///    Dropa um campo
      /// </summary>
      procedure DropField(const AFieldDataBase: TDataBaseField; const ATableName: UnicodeString);

      /// <summary>
      ///    Cria uma PK
      /// </summary>
      procedure CreatePrimaryKey(const ADataBaseField: TDataBaseField; const ATableName: UnicodeString);

      /// <summary>
      ///    Cria uma FK
      /// </summary>
      procedure CreateForeignKey(const AForeignKey: TDataBaseForeignKey);

      /// <summary>
      ///    Dropa uma FK
      /// </summary>
      procedure DropForeignKey(const AForeignKey: TDataBaseForeignKey);

       /// <summary>
      ///    Cria um INDEX
      /// </summary>
      procedure CreateIndex(const AIndex: TDataBaseIndex);

      /// <summary>
      ///    Dropa um INDEX
      /// </summary>
      procedure DropIndex(const AIndex: TDataBaseIndex);
   private
      /// <summary>
      ///    Compara o campo entre o objeto e o banco de dados
      /// </summary>
      procedure CompareFields(const AFieldObject, AFieldDataBase: TDataBaseField; const ATableName: UnicodeString);

      /// <summary>
      ///    Atualiza o campo NOT NULl
      /// </summary>
      procedure UpdateNullFlagField(const AFieldDataBase: TDataBaseField; const ATableName: UnicodeString);

      /// <summary>
      ///    Altera o tamanho do campo
      /// </summary>
      procedure UpdateLengthField(const AFieldDataBase: TDataBaseField; const ATableName: UnicodeString);

      /// <summary>
      ///    Altera os decimais do campo
      /// </summary>
      procedure UpdateDecimalsField(const AFieldDataBase: TDataBaseField; const ATableName: UnicodeString);
   private
      FSystemSQLDataBase: TSystemSQLDataBaseCommon;
      FQuery: TQuery;
      procedure SetSystemSQLDataBase(const Value: TSystemSQLDataBaseCommon);
      procedure SetQuery(const Value: TQuery);
   strict private
      property SystemSQLDataBase: TSystemSQLDataBaseCommon read FSystemSQLDataBase write SetSystemSQLDataBase;
      property Query: TQuery read FQuery write SetQuery;

      /// <summary>
      ///    Método interno de execução
      /// </summary>
      procedure InternalExecuteUpdate;

      /// <summary>
      ///    Método interno de criação
      /// </summary>
      procedure InternalExecuteCreate;

      /// <summary>
      ///    Cria os campos da tabela
      /// </summary>
      procedure CreateInternalFields(const AObject: TObject; const ATableName: UnicodeString);

      /// <summary>
      ///    Cria os indices da tabela
      /// </summary>
      procedure CreateInternalIndexs(const ARttiInspect: TRTTIInspectObject; const ATableName: UnicodeString);

      /// <summary>
      ///    Cria as FK da tabela
      /// </summary>
      procedure CreateInternalForeignKeys(const ARttiInspect: TRTTIInspectObject; const ATableName: UnicodeString);

      /// <summary>
      ///    Cria as PK das tabelas
      /// </summary>
      procedure CreateInternalPrimaryKey(const ARttiInspect: TRTTIInspectObject; const ATableName: UnicodeString);
   public
      /// <summary>
      ///    Update DATABASE
      /// </summary>
      procedure UpdateDataBase;

      /// <summary>
      ///    Create DATABASE
      /// </summary>
      procedure CreateDataBase;

      constructor Create(const ASQLDataBaseCommon: TSystemSQLDataBaseCommon); overload;
      destructor Destroy; override;
   end;

implementation

{ TSystemDataBaseConsistency }

procedure TSystemDataBaseConsistency.CompareFields(const AFieldObject, AFieldDataBase: TDataBaseField; const ATableName: UnicodeString);
var
   LDataBaseForeignKey: TDataBaseForeignKey;
   LForeignKeyInput: Boolean;
begin
   // -> Verifica se existe alguma FK vinculada a este campo
   LDataBaseForeignKey := TryGetForeignKeyFromField(ATableName, AFieldObject.Name);

   LForeignKeyInput := (LDataBaseForeignKey <> nil);

   if SysCc.IsDistinct(AFieldObject.TypeText, AFieldDataBase.TypeText) or (AFieldObject.IsPrimaryKey <> AFieldDataBase.IsPrimaryKey) then
   begin
      if (LForeignKeyInput) then
         DropForeignKey(LDataBaseForeignKey);

      DropField(AFieldDataBase, ATableName);
      CreateField(AFieldObject, ATableName);
   end
   else
   begin
      if (AFieldObject.IsNotNull) <> (AFieldDataBase.IsNotNull) then
         UpdateNullFlagField(AFieldObject, ATableName);

      if (AFieldObject.Length) <> (AFieldDataBase.Length) then
      begin
         if (LForeignKeyInput) then
            DropForeignKey(LDataBaseForeignKey);

         UpdateLengthField(AFieldObject, ATableName);
      end;

      if (AFieldObject.Decimals) <> (AFieldDataBase.Decimals) then
         UpdateDecimalsField(AFieldObject, ATableName);
   end;

   if Assigned(LDataBaseForeignKey) then
      FreeAndNil(LDataBaseForeignKey);
end;

constructor TSystemDataBaseConsistency.Create(const ASQLDataBaseCommon: TSystemSQLDataBaseCommon);
begin
   SetSystemSQLDataBase(ASQLDataBaseCommon);
   inherited Create;
end;

procedure TSystemDataBaseConsistency.CreateDataBase;
var
   LTransaction: TConnectionTransaction;
begin
   LTransaction := TConnectionTransaction.Create;
   try
      Query := TQuery.Create(LTransaction);
      try
         InternalExecuteCreate;
      finally
         LTransaction.Commit;
         FreeAndNil(Query);
      end;
   finally
      FreeAndNil(LTransaction);
   end;
end;

procedure TSystemDataBaseConsistency.CreateField(const AFieldDataBase: TDataBaseField; const ATableName: UnicodeString);
var
   LCustomText, LSQL: UnicodeString;
begin
   LCustomText := GetCustomTextField(AFieldDataBase);
   LSQL := SystemSQLDataBase.CreateField(ATableName, AFieldDataBase.Name, LCustomText);

   ExecuteSQLTransaction(LSQL);
end;

procedure TSystemDataBaseConsistency.CreateFields(const ATableName: UnicodeString; const AObject: TObject);
var
   LListOnObject: TCommonCollection;
   LRttiInspect: TRTTIInspectObject;
   LLoopObject: TObject;
   LFieldObject: TDataBaseField;
begin
   LRttiInspect := TRTTIInspectObject.Create(AObject);
   try
      LListOnObject := LRttiInspect.GetDataBaseFieldsFromObject;
      try
         for LLoopObject in LListOnObject do
         begin
            LFieldObject := LLoopObject as TDataBaseField;

            CreateField(LFieldObject, ATableName);
         end;
      finally
         FreeAndNil(LListOnObject);
      end;
   finally
      FreeAndNil(LRttiInspect);
   end;
end;

procedure TSystemDataBaseConsistency.CreateForeignKey(const AForeignKey: TDataBaseForeignKey);
var
   LSQL: UnicodeString;
begin
   LSQL := SystemSQLDataBase.CreateForeignKey(AForeignKey.TableName, AForeignKey.FieldName, AForeignKey.TableReference, AForeignKey.FieldReference);

   ExecuteSQLTransaction(LSQL);
end;

procedure TSystemDataBaseConsistency.CreateIndex(const AIndex: TDataBaseIndex);
var
   LSQL: UnicodeString;
begin
   LSQL := SystemSQLDataBase.CreateIndex(AIndex.TableName, AIndex.FieldName);

   ExecuteSQLTransaction(LSQL);
end;

procedure TSystemDataBaseConsistency.CreateInternalFields(const AObject: TObject; const ATableName: UnicodeString);
var
   LSQLBuilder: TRTTIBuilderSQL;
   LSQL: UnicodeString;
begin
   LSQLBuilder := TRTTIBuilderSQL.Create(AObject, tbsCreate);
   try
      LSQL := LSQLBuilder.GetSQL;

      SysWatcher.UpdateActionText(Format(SActionCreateTableFields, [ATableName]));

      ExecuteSQLTransaction(LSQL);
   finally
      FreeAndNil(LSQLBuilder);
   end;
end;

procedure TSystemDataBaseConsistency.CreateInternalForeignKeys(const ARttiInspect: TRTTIInspectObject; const ATableName: UnicodeString);
var
   LList: TCommonCollection;
   LInstance: TObject;
   LDataBaseFK: TDataBaseForeignKey;
begin
   LList := ARttiInspect.GetDataBaseForeignKeysFromObject;
   try
      SysWatcher.UpdateActionText(Format(SActionCreateTableFK, [ATableName]));

      for LInstance in LList do
      begin
         LDataBaseFK := LInstance as TDataBaseForeignKey;

         CreateForeignKey(LDataBaseFK);
      end;
   finally
      FreeAndNil(LList);
   end;
end;

procedure TSystemDataBaseConsistency.CreateInternalIndexs(const ARttiInspect: TRTTIInspectObject; const ATableName: UnicodeString);
var
   LList: TCommonCollection;
   LInstance: TObject;
   LDataBaseIndex: TDataBaseIndex;
begin
   LList := ARttiInspect.GetDataBaseIndexsFromObject;
   try
      SysWatcher.UpdateActionText(Format(SActionCreateTableIndex, [ATableName]));

      for LInstance in LList do
      begin
         LDataBaseIndex := LInstance as TDataBaseIndex;

         CreateIndex(LDataBaseIndex);
      end;
   finally
      FreeAndNil(LList);
   end;
end;

procedure TSystemDataBaseConsistency.CreateInternalPrimaryKey(const ARttiInspect: TRTTIInspectObject; const ATableName: UnicodeString);
var
   LList: TCommonCollection;
   LInstance: TObject;
   LDataBaseField: TDataBaseField;
begin
   LList := ARttiInspect.GetDataBaseFieldsFromObject;
   try
      for LInstance in LList do
      begin
         LDataBaseField := LInstance as TDataBaseField;

         if (LDataBaseField.IsPrimaryKey) then
         begin
            CreatePrimaryKey(LDataBaseField, ATableName);
            Break;
         end;
      end;
   finally
      FreeAndNil(LList);
   end;
end;

procedure TSystemDataBaseConsistency.CreatePrimaryKey(const ADataBaseField: TDataBaseField; const ATableName: UnicodeString);
var
   LSQL: UnicodeString;
begin
   LSQL := SystemSQLDataBase.CreatePrimaryKey(ATableName, ADataBaseField.Name);

   ExecuteSQLTransaction(LSQL);
end;

destructor TSystemDataBaseConsistency.Destroy;
begin
   inherited Destroy;
end;

procedure TSystemDataBaseConsistency.DropField(const AFieldDataBase: TDataBaseField; const ATableName: UnicodeString);
var
   LSQL: UnicodeString;
begin
   LSQL := SystemSQLDataBase.DropField(ATableName, AFieldDataBase.Name);

   ExecuteSQLTransaction(LSQL);
end;

procedure TSystemDataBaseConsistency.DropForeignKey(const AForeignKey: TDataBaseForeignKey);
var
   LForeignKeyName, LSQL: UnicodeString;
begin
   LForeignKeyName := 'FK_' + AForeignKey.TableName + '_' + AForeignKey.FieldName;
   LSQL := SystemSQLDataBase.DropForeignKey(AForeignKey.TableName, LForeignKeyName);

   ExecuteSQLTransaction(LSQL);
end;

procedure TSystemDataBaseConsistency.DropIndex(const AIndex: TDataBaseIndex);
var
   LIndexName, LSQL: UnicodeString;
begin
   LIndexName := 'IDX_' + AIndex.FieldName + '_' + AIndex.TableName;
   LSQL := SystemSQLDataBase.DropIndex(LIndexName);

   ExecuteSQLTransaction(LSQL);
end;

procedure TSystemDataBaseConsistency.UpdateDataBase;
var
   LTransaction: TConnectionTransaction;
begin
   // -> Inicia a transação
   LTransaction := TConnectionTransaction.Create;
   try
      Query := TQuery.Create(LTransaction);
      try
         InternalExecuteUpdate;
      finally
         LTransaction.Commit;
         FreeAndNil(Query);
      end;
   finally
      FreeAndNil(LTransaction);
   end;
end;

procedure TSystemDataBaseConsistency.ExecuteSQLTransaction(const ASQL: UnicodeString);
begin
   if (not ASQL.IsEmpty) then
   begin
      Query.Clear;
      Query.AddSQL(ASQL);
      Query.ExecuteWithTransaction;
      Log.Write(UnitName, SActionSQLExecuted, ASQL);
   end;
end;

function TSystemDataBaseConsistency.GetCustomTextField(const ADataBaseField: TDataBaseField): UnicodeString;
begin
   if ADataBaseField.TypeText.Equals('NUMERIC') then
      Result := Format('NUMERIC (%d, %d)', [ADataBaseField.Length, ADataBaseField.Decimals])
   else
   if ADataBaseField.TypeText.Equals('VARCHAR') then
      Result := Format(' VARCHAR (%d)', [ADataBaseField.Length])
   else
      Result := ADataBaseField.TypeText;

   if ADataBaseField.IsNotNull then
      Result := Result + ' NOT NULL';

   if ADataBaseField.IsPrimaryKey then
      Result := Result + ' PRIMARY KEY ';
end;

procedure TSystemDataBaseConsistency.InternalExecuteCreate;
var
   LLoop: TObject;
   LRttiInspect: TRTTIInspectObject;
   LDataBaseRelation: TDBRelation;
   LTableName: UnicodeString;
begin
   SysWatcher.Show(Format(SActionCreateDataBase, [gvListOfEntys.Count]), '', gvListOfEntys.Count);
   try
      for LLoop in gvListOfEntys do
      begin
         LRttiInspect := TRTTIInspectObject.Create(LLoop);
         try
            LDataBaseRelation := LRttiInspect.GetObjectDBRelation;

            LTableName := LDataBaseRelation.Name;

            // -> Fields
            CreateInternalFields(LLoop, LTableName);

            // -> PK
            CreateInternalPrimaryKey(LRttiInspect, LTableName);

            // -> FK
            CreateInternalForeignKeys(LRttiInspect, LTableName);

            // -> Index
            CreateInternalIndexs(LRttiInspect, LTableName);
         finally
            FreeAndNil(LRttiInspect);
            SysWatcher.UpdateActionText(EmptyStr);
         end;

         SysWatcher.IncProgressBar;
      end;
   finally
      SysWatcher.Close;
   end;
end;

procedure TSystemDataBaseConsistency.InternalExecuteUpdate;
var
   LLoop: TObject;
   LRttiInspect: TRTTIInspectObject;
   LDataBaseRelation: TDBRelation;
   LTableName: UnicodeString;
begin
   SysWatcher.Show(Format(SActionUpdateDataBase, [gvListOfEntys.Count]), '', gvListOfEntys.Count);
   try
      for LLoop in gvListOfEntys do
      begin
         LRttiInspect := TRTTIInspectObject.Create(LLoop);
         try
            LDataBaseRelation := LRttiInspect.GetObjectDBRelation;

            if (LDataBaseRelation <> nil) then
            begin
               LTableName := LDataBaseRelation.Name;

               SysWatcher.UpdateActionText(Format(SActionUpdateTableFields, [LTableName]));
               UpdateFields(LTableName, LLoop);

               SysWatcher.UpdateActionText(Format(SActionUpdateTableFK, [LTableName]));
               UpdateForeignKeys(LTableName, LLoop);

               SysWatcher.UpdateActionText(Format(SActionUpdateTableIndex, [LTableName]));
               UpdateIndexs(LTableName, LLoop);
            end
            else
            begin
               Query.RollBackTransaction;
               raise Exception.CreateFmt(SErrorObjectWithOutDBRelation, [LLoop.ClassName]);
            end;
         finally
            FreeAndNil(LRttiInspect);
            SysWatcher.UpdateActionText(EmptyStr);
         end;

         SysWatcher.IncProgressBar;
      end;
   finally
      SysWatcher.Close;
   end;
end;

procedure TSystemDataBaseConsistency.ReverseLoopFields(const AListSource, AListDestiny: TCommonCollection; const ATableName: UnicodeString; const ADataBaseCheck: Boolean);
var
   LObjectIn, LObjectOut: TObject;
   LFieldIn, LFieldOut: TDataBaseField;
   LFound: Boolean;
begin
   for LObjectIn in AListSource do
   begin
      LFieldIn := LObjectIn as TDataBaseField;

      LFound := False;

      for LObjectOut in AListDestiny do
      begin
         LFieldOut := LObjectOut as TDataBaseField;

         LFound := SysCc.IsEqual(LFieldIn.Name, LFieldOut.Name);

         if (LFound) then
         begin
            CompareFields(LFieldIn, LFieldOut, ATableName);
            Break;
         end;
      end;

      if (not LFound) then
      begin
         if (ADataBaseCheck) then
            DropField(LFieldIn, ATableName)
         else
            CreateField(LFieldIn, ATableName);
      end;
   end;
end;

procedure TSystemDataBaseConsistency.ReverseLoopForeignKey(const AListSource, AListDestiny: TCommonCollection; const ADataBaseCheck: Boolean);
var
   LObjectIn, LObjectOut: TObject;
   LForeignKeyIn, LForeignKeyOut: TDataBaseForeignKey;
   LFound: Boolean;
begin
   for LObjectIn in AListSource do
   begin
      LFound := False;

      LForeignKeyIn := LObjectIn as TDataBaseForeignKey;

      for LObjectOut in AListDestiny do
      begin
         LForeignKeyOut := LObjectOut as TDataBaseForeignKey;

         if SysCc.IsEqual(LForeignKeyIn.FieldName, LForeignKeyOut.FieldName) then
         begin
            LFound := True;

            if SysCc.IsDistinct(LForeignKeyIn.TableName, LForeignKeyOut.TableName) or SysCc.IsDistinct(LForeignKeyIn.FieldReference, LForeignKeyOut.FieldReference)
            or SysCc.IsDistinct(LForeignKeyIn.TableReference, LForeignKeyOut.TableReference) then
            begin
               DropForeignKey(LForeignKeyOut);
               CreateForeignKey(LForeignKeyIn);
            end;

            Break;
         end;
      end;

      if (not LFound) then
      begin
         if (ADataBaseCheck) then
            DropForeignKey(LForeignKeyIn)
         else
            CreateForeignKey(LForeignKeyIn);
      end;
   end;
end;

procedure TSystemDataBaseConsistency.ReverseLoopIndex(const AListSource, AListDestiny: TCommonCollection; const ADataBaseCheck: Boolean);
var
   LObjectIn, LObjectOut: TObject;
   LIndexIn, LIndexOut: TDataBaseIndex;
   LFound: Boolean;
begin
   for LObjectIn in AListSource do
   begin
       LFound := False;

       LIndexIn := LObjectIn as TDataBaseIndex;

       for LObjectOut in AListDestiny do
       begin
          LIndexOut := LObjectOut as TDataBaseIndex;

          if SysCc.IsEqual(LIndexIn.FieldName, LIndexOut.FieldName) then
          begin
            LFound := True;
            Break;
          end;
       end;

       if (not LFound) then
       begin
         if (ADataBaseCheck) then
            DropIndex(LIndexIn)
         else
            CreateIndex(LIndexIn);
       end;
   end;
end;

procedure TSystemDataBaseConsistency.SetQuery(const Value: TQuery);
begin
   FQuery := Value;
end;

procedure TSystemDataBaseConsistency.SetSystemSQLDataBase(const Value: TSystemSQLDataBaseCommon);
begin
   FSystemSQLDataBase := Value;
end;

function TSystemDataBaseConsistency.TryGetForeignKeyFromField(const ATableName, AFieldName: UnicodeString): TDataBaseForeignKey;
var
   LList: TCommonCollection;
   LLoop: TObject;
   LDataBaseForeignKey: TDataBaseForeignKey;
   LSQL: UnicodeString;
begin
   LSQL := SystemSQLDataBase.GetForeignKeysFromTable(ATableName);

   LList := SysDB.GetTableForeignKeysFromDataBase(ATableName, LSQL);
   try
      Result := nil;

      for LLoop in LList do
      begin
         LDataBaseForeignKey := LLoop as TDataBaseForeignKey;

         if LDataBaseForeignKey.FieldName.Equals(AFieldName) then
            Exit(LDataBaseForeignKey);
      end;
   finally
      FreeAndNil(LList);
   end;
end;

procedure TSystemDataBaseConsistency.UpdateDecimalsField(const AFieldDataBase: TDataBaseField; const ATableName: UnicodeString);
begin
   Query.Clear;
   Query.AddSQL(SystemSQLDataBase.UpdateDecimalsField(AFieldDataBase.Name, ATableName, AFieldDataBase.Decimals));
   Query.ExecuteWithTransaction;
end;

procedure TSystemDataBaseConsistency.UpdateFields(const ATableName: UnicodeString; const AObject: TObject);
var
   LListOnDataBase, LListOnObject: TCommonCollection;
   LRttiInspect: TRTTIInspectObject;
   LSQL: UnicodeString;
begin
   LRttiInspect := TRTTIInspectObject.Create(AObject);
   try
      LSQL := SystemSQLDataBase.GetFieldsFromTable(ATableName);

      LListOnObject := LRttiInspect.GetDataBaseFieldsFromObject;
      LListOnDataBase := SysDB.GetTableFieldsFromDataBase(ATableName, LSQL);
   finally
      FreeAndNil(LRttiInspect);
   end;

   try
      ReverseLoopFields(LListOnObject, LListOnDataBase, ATableName, False);
      ReverseLoopFields(LListOnDataBase, LListOnObject, ATableName, True);
   finally
      FreeAndNil(LListOnObject);
      FreeAndNil(LListOnDataBase);
   end;
end;

procedure TSystemDataBaseConsistency.UpdateForeignKeys(const ATableName: UnicodeString; const AObject: TObject);
var
   LListOnObject, LListOnDB: TCommonCollection;
   LSQL: UnicodeString;
   LRttiInspect: TRTTIInspectObject;
begin
   LRttiInspect := TRTTIInspectObject.Create(AObject);
   try
      LSQL := SystemSQLDataBase.GetForeignKeysFromTable(ATableName);

      LListOnObject := LRttiInspect.GetDataBaseForeignKeysFromObject;
      LListOnDB := SysDB.GetTableForeignKeysFromDataBase(ATableName, LSQL);
   finally
      FreeAndNil(LRttiInspect);
   end;

   try
      ReverseLoopForeignKey(LListOnObject, LListOnDB, False);
      ReverseLoopForeignKey(LListOnDB, LListOnObject, True);
   finally
      FreeAndNil(LListOnDB);
      FreeAndNil(LListOnObject);
   end;
end;

procedure TSystemDataBaseConsistency.UpdateIndexs(const ATableName: UnicodeString; const AObject: TObject);
var
   LListOnObject, LListOnDB: TCommonCollection;
   LSQL: UnicodeString;
   LRttiInspect: TRTTIInspectObject;
begin
   LRttiInspect := TRTTIInspectObject.Create(AObject);
   try
      LSQL := SystemSQLDataBase.GetIndexsFromTable(ATableName);

      LListOnObject := LRttiInspect.GetDataBaseIndexsFromObject;
      LListOnDB := SysDB.GetTableIndexsFromDataBase(ATableName, LSQL);
   finally
      FreeAndNil(LRttiInspect);
   end;

   try
      ReverseLoopIndex(LListOnObject, LListOnDB, False);
      ReverseLoopIndex(LListOnDB, LListOnObject, True);
   finally
      FreeAndNil(LListOnDB);
      FreeAndNil(LListOnObject);
   end;
end;

procedure TSystemDataBaseConsistency.UpdateLengthField(const AFieldDataBase: TDataBaseField; const ATableName: UnicodeString);
var
   LSQL: UnicodeString;
begin
   LSQL := SystemSQLDataBase.UpdateLengthField(AFieldDataBase.Name, ATableName, AFieldDataBase.Length);

   ExecuteSQLTransaction(LSQL);
end;

procedure TSystemDataBaseConsistency.UpdateNullFlagField(const AFieldDataBase: TDataBaseField; const ATableName: UnicodeString);
var
   LSQL: UnicodeString;
begin
   LSQL := SystemSQLDataBase.UpdateNullFlagField(AFieldDataBase.Name, ATableName, AFieldDataBase.IsNotNull);

   ExecuteSQLTransaction(LSQL);
end;

end.

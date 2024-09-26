{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.System.RTTI.Builder.SQL.Generate;

interface

uses

   System.RTTI,
   System.SysUtils,
   App.System.RTTI.CustomAttributes,
   App.System.RTTI.Inspect,
   App.System.Classes.Collection,
   App.System.DataBase.Objects,
   App.Consts.DataBase,
   App.System.Types,
   System.Generics.Collections,
   App.System.SQL.DataBase, App.Objects.Entys;

type

  TRTTIBuilderSQL = class
  private
    FTypeBuilder: TTypeBuilderSQL;
    FCurrentObject: TObject;
    FListWheres: TList<UnicodeString>;
    FDBRelation: TDBRelation;
    FStringBuilder: TStringBuilder;
    FRttiInspect: TRTTIInspectObject;
    FListParams: TList<UnicodeString>;
    FListFields: TList<UnicodeString>;
    FSystemSQLDataBase: TSystemSQLDataBaseCommon;
    FWithReturning: Boolean;
    FAliasPrimaryKey: UnicodeString;
    procedure SetAliasPrimaryKey(const Value: UnicodeString);
    procedure SetWithReturning(const Value: Boolean);
    procedure SetCurrentObject(const Value: TObject);
    procedure SetTypeBuilder(const Value: TTypeBuilderSQL);
    procedure SetDBRelation(const Value: TDBRelation);
    procedure SetListParams(const Value: TList<UnicodeString>);
    procedure SetListWheres(const Value: TList<UnicodeString>);
    procedure SetRttiInspect(const Value: TRTTIInspectObject);
    procedure SetStringBuilder(const Value: TStringBuilder);
    procedure SetListFields(const Value: TList<UnicodeString>);
    procedure SetSystemSQLDataBase(const Value: TSystemSQLDataBaseCommon);
  protected
    property CurrentObject: TObject read FCurrentObject write SetCurrentObject;
    property TypeBuilder: TTypeBuilderSQL read FTypeBuilder write SetTypeBuilder;
  strict private
    property StringBuilder: TStringBuilder read FStringBuilder write SetStringBuilder;
    property ListParams: TList<UnicodeString> read FListParams write SetListParams;
    property ListFields: TList<UnicodeString> read FListFields write SetListFields;
    property ListWheres: TList<UnicodeString> read FListWheres write SetListWheres;
    property RttiInspect: TRTTIInspectObject read FRttiInspect write SetRttiInspect;
    property DBRelation: TDBRelation read FDBRelation write SetDBRelation;
    property SystemSQLDataBase: TSystemSQLDataBaseCommon read FSystemSQLDataBase write SetSystemSQLDataBase;
    property WithReturning: Boolean read FWithReturning write SetWithReturning;
    property AliasPrimaryKey: UnicodeString read FAliasPrimaryKey write SetAliasPrimaryKey;
  protected
    /// <summary>
    ///    Finaliza a lista de params e wheres
    /// </summary>
    procedure FinalizeParamsAndWheres;

    /// <summary>
    ///    Finaliza a lista de params e fields
    /// </summary>
    procedure FinalizeParamsAndFields;

    /// <summary>
    ///    Finaliza a lista de wheres apenas para SELECT
    /// </summary>
    procedure FinalizeWhere;
  private
    /// <summary>
    ///    Processa as propertys para construção da SQL
    /// </summary>
    procedure ProcessProperty(const ARttiProperty: TRttiProperty);

    /// <summary>
    ///    Monta a SQL de criação de tabelas
    /// </summary>
    procedure InternalTableCreate;

    /// <summary>
    ///    Obtém o texto da sequência da tabela
    /// </summary>
    function GetSequencePlainTextPrimaryKey(const ADBRelation: TDBRelation): UnicodeString;
  strict protected
    /// <summary>
    ///    Antes de executar a construção da SQL
    /// </summary>
    procedure BeforeBegin;

    /// <summary>
    ///    Controi o Header da SQL
    /// </summary>
    procedure BuildHeader;

    /// <summary>
    ///    Constroi o Footer da SQL
    /// </summary>
    procedure BuildFooter;

    /// <summary>
    ///    Controi o Core da SQL
    /// </summary>
    procedure BuildCore;
  public
    /// <summary>
    ///    Obtém a SQL baseada no tipo e objeto
    /// </summary>
    function GetSQL: UnicodeString;

    constructor Create(const AObject: TObject; const AType: TTypeBuilderSQL; const AWithReturning: Boolean = False; const AAliasPK: UnicodeString = ''); overload;
    destructor Destroy; override;
  end;

implementation

{ TRTTIBuilderData }

uses
   App.System.Vars, App.Consts.Messages;

{ TRTTIBuilderSQL }

procedure TRTTIBuilderSQL.BeforeBegin;
begin
   RttiInspect := TRTTIInspectObject.Create(FCurrentObject);
   DBRelation := RttiInspect.GetObjectDBRelation;

   if (DBRelation = nil) then
      raise Exception.CreateFmt(SErrorNotEnoughResource, ['[Builder: SQL]']);

   case gvTypeConnection of
      ttcFireBird: SystemSQLDataBase := TSystemSQLDataBaseFireBird.Create;
      ttcPostGres: SystemSQLDataBase := TSystemSQLDataBasePostGres.Create;
      ttcOracle: SystemSQLDataBase := TSystemSQLDataBaseOracle.Create;
   end;

   BuildHeader;
end;

procedure TRTTIBuilderSQL.BuildCore;
var
   LRProperty: TRttiProperty;
   LListPropertys: TArray<TRttiProperty>;
begin
   if (TypeBuilder = tbsCreate) then
      InternalTableCreate
   else
   begin
      LListPropertys := RttiInspect.GetObjectProperties;

      for LRProperty in LListPropertys do
         ProcessProperty(LRProperty);
   end;
end;

procedure TRTTIBuilderSQL.BuildFooter;
begin
   case FTypeBuilder of
      tbsInsert, tbsInsertOrUpdate: FinalizeParamsAndFields;
      tbsUpdate: FinalizeParamsAndWheres;
      tbsDelete, tbsSelect: FinalizeWhere;
   end;
end;

procedure TRTTIBuilderSQL.BuildHeader;
var
   LHeader: UnicodeString;
begin
   case FTypeBuilder of
      tbsInsert: LHeader := Format('INSERT INTO %s (', [DBRelation.Name]);
      tbsUpdate: LHeader := Format('UPDATE %s SET ', [DBRelation.Name]);
      tbsSelect, tbsList: LHeader := Format('SELECT * FROM %s', [DBRelation.Name]);
      tbsDelete: LHeader := Format('DELETE FROM %s WHERE ', [DBRelation.Name]);
      tbsCreate: LHeader := Format('CREATE TABLE %s (', [DBRelation.Name]);
      tbsInsertOrUpdate: LHeader := Format('UPDATE OR INSERT INTO %s', [DBRelation.Name]);
   end;

   if (not LHeader.IsEmpty) then
      StringBuilder.Append(LHeader)
   else
      raise Exception.CreateFmt(SErrorNotEnoughResource, ['[Build: SQL Header]']);
end;

constructor TRTTIBuilderSQL.Create(const AObject: TObject; const AType: TTypeBuilderSQL; const AWithReturning: Boolean; const AAliasPK: UnicodeString);
begin
   SetCurrentObject(AObject);
   SetTypeBuilder(AType);
   SetWithReturning(AWithReturning);
   SetAliasPrimaryKey(AAliasPK);
   StringBuilder := TStringBuilder.Create;
   ListWheres := TList<UnicodeString>.Create;
   ListWheres.Add(' WHERE ');
   ListParams := TList<UnicodeString>.Create;
   ListFields := TList<UnicodeString>.Create;

   inherited Create;
end;

destructor TRTTIBuilderSQL.Destroy;
begin
   FreeAndNil(FStringBuilder);
   FreeAndNil(FListWheres);
   FreeAndNil(FListParams);
   FreeAndNil(FListFields);
   FreeAndNil(FRttiInspect);
   FreeAndNil(FSystemSQLDataBase);

   inherited Destroy;
end;

procedure TRTTIBuilderSQL.FinalizeParamsAndFields;
var
   LLoop: Integer;
begin
   if (ListFields.Count > 0) and (ListParams.Count > 0) then
   begin
      if ListFields.Last.Contains(',') then
         ListFields.Items[ListFields.Count -1] := ListFields.Last.Replace(',', ')');

      if ListParams.Last.Contains(',') and (not ListParams.Last.Contains('),')) then
         ListParams.Items[ListParams.Count -1] := ListParams.Last.Replace(',', ')')
      else
      if ListParams.Last.Contains('),') then
         ListParams.Items[ListParams.Count - 1] := ListParams.Last.Replace('),', '))');

      for LLoop := 0 to ListFields.Count -1 do
         StringBuilder.Append(ListFields.Items[LLoop]);

      StringBuilder.Append('VALUES(');

      for LLoop := 0 to ListParams.Count - 1 do
         StringBuilder.Append(ListParams.Items[LLoop]);

      if (WithReturning) and (not FAliasPrimaryKey.IsEmpty) then
         StringBuilder.Append(' RETURNING (' + AliasPrimaryKey + ')');

      StringBuilder.Append(';');
   end;
end;

procedure TRTTIBuilderSQL.FinalizeParamsAndWheres;
var
   LLoop: Integer;
begin
   if (ListParams.Count > 0) and (ListWheres.Count > 0) then
   begin
      if ListParams.Last.Contains(',') then
         ListParams.Items[ListParams.Count -1] := ListParams.Last.Replace(',', '');

      if ListWheres.Last.Contains('AND') then
         ListWheres.Items[ListWheres.Count - 1] := StringReplace(ListWheres.Last, 'AND', '', [rfReplaceAll]);

      for LLoop := 0 to ListParams.Count - 1 do
         StringBuilder.Append(ListParams.Items[LLoop]);

      for LLoop := 0 to ListWheres.Count - 1 do
         StringBuilder.Append(ListWheres.Items[LLoop]);

      StringBuilder.Append(';');
   end;
end;

procedure TRTTIBuilderSQL.FinalizeWhere;
var
   LLoop: Integer;
begin
   if (ListWheres.Count > 0) then
   begin
      if ListWheres.Last.Contains('AND') then
         ListWheres.Items[ListWheres.Count - 1] := StringReplace(ListWheres.Last, 'AND', '', [rfReplaceAll]);

      for LLoop := 0 to ListWheres.Count - 1 do
         StringBuilder.Append(ListWheres.Items[LLoop]);
   end;
end;

function TRTTIBuilderSQL.GetSequencePlainTextPrimaryKey(const ADBRelation: TDBRelation): UnicodeString;
begin
   case gvTypeConnection of
      ttcFireBird: Result := Format('GEN_ID(%s, 1),', [ADBRelation.Sequence]);
      ttcPostGres: Result := cPKCommonTextPG;
      ttcOracle: Result := 'NEW_ROW_ID';
   end;
end;

function TRTTIBuilderSQL.GetSQL: UnicodeString;
begin
   BeforeBegin;
   BuildCore;
   BuildFooter;
   Result := StringBuilder.ToString;
end;

procedure TRTTIBuilderSQL.InternalTableCreate;
var
   LList: TCommonCollection;
   LLoop: TObject;
   LDataBaseField: TDataBaseField;
begin
   LList := RttiInspect.GetDataBaseFieldsFromObject;
   try
      for LLoop in LList do
      begin
         LDataBaseField := LLoop as TDataBaseField;

         if (LDataBaseField.IsPrimaryKey) and (gvTypeConnection = ttcPostGres) then
            StringBuilder.Append(LDataBaseField.Name + cPKCommonTextPG)
         else
            StringBuilder.Append(LDataBaseField.Name + ' ' + LDataBaseField.TypeText);

         if (LDataBaseField.Length > 0) then
         begin
            if (LDataBaseField.Decimals > 0) then
               StringBuilder.Append(' (' + LDataBaseField.Length.ToString + ', ' + LDataBaseField.Decimals.ToString + ')')
            else
               StringBuilder.Append(' (' + LDataBaseField.Length.ToString + ')');
         end;

         if LDataBaseField.IsNotNull then
            StringBuilder.Append(' NOT NULL ');

         if (LLoop <> LList.Last) then
            StringBuilder.Append(', ').AppendLine
         else
            StringBuilder.Append(');');
      end;

      if (not DBRelation.Sequence.IsEmpty) then
      begin
         StringBuilder.AppendLine;
         StringBuilder.Append(SystemSQLDataBase.CreateSequence(DBRelation.Sequence));
      end;
   finally
      FreeAndNil(LList);
   end;
end;

procedure TRTTIBuilderSQL.ProcessProperty(const ARttiProperty: TRttiProperty);
var
   LPropertyData: TPropertyData;
   LRttiInspectProperty: TRTTIInspectProperty;
   LValue: TValue;
   LCommonParam: UnicodeString;
   LPropertyCustom: TPropertyCustom;
begin
   LRttiInspectProperty := TRttiInspectProperty.Create(ARttiProperty);
   try
      LPropertyData := LRttiInspectProperty.GetPropertyData;

      if (LPropertyData <> nil) then
      begin
         ListFields.Add(LPropertyData.FieldName + ',');

         // -> Obtém o valor da property para checagem posterior
         LValue := ARttiProperty.GetValue(FCurrentObject);

         LCommonParam := LPropertyData.FieldName + ' = :' + LPropertyData.FieldName + ' AND ';

         case FTypeBuilder of
            tbsInsert,
            tbsInsertOrUpdate:
                       begin
                           if (LPropertyData.IsPrimaryKey) and (LValue.AsInt64 <= 0) then
                           begin
                              ListParams.Add(GetSequencePlainTextPrimaryKey(DBRelation));
                              FAliasPrimaryKey := LPropertyData.FieldName;
                           end
                           else
                              ListParams.Add(':' + LPropertyData.FieldName + ', ');
                       end;

            tbsUpdate: begin
                            if (LPropertyData.IsPrimaryKey) then
                              ListWheres.Add(LCommonParam)
                            else
                              ListParams.Add(LPropertyData.FieldName + ' = :' + LPropertyData.FieldName + ', ');
                       end;

            tbsDelete,
            tbsSelect:
                       begin
                          if (LPropertyData.IsPrimaryKey) then
                            ListWheres.Add(LCommonParam);
                       end;
            tbsList:   begin

                         if (LPropertyData.IsPrimaryKey) then
                            ListWheres.Add(LCommonParam)
                         else
                         begin
                           LPropertyCustom := LRttiInspectProperty.GetPropertyCustom;

                           if (LPropertyCustom <> nil) and (LPropertyCustom.InWhereSelect) then
                              ListWheres.Add(LCommonParam);
                         end;
                       end;
         end;
      end;
   finally
      FreeAndNil(LRttiInspectProperty);
   end;
end;

procedure TRTTIBuilderSQL.SetAliasPrimaryKey(const Value: UnicodeString);
begin
   FAliasPrimaryKey := Value;
end;

procedure TRTTIBuilderSQL.SetCurrentObject(const Value: TObject);
begin
   FCurrentObject := Value;
end;

procedure TRTTIBuilderSQL.SetDBRelation(const Value: TDBRelation);
begin
   FDBRelation := Value;
end;

procedure TRTTIBuilderSQL.SetListFields(const Value: TList<UnicodeString>);
begin
  FListFields := Value;
end;

procedure TRTTIBuilderSQL.SetListParams(const Value: TList<UnicodeString>);
begin
   FListParams := Value;
end;

procedure TRTTIBuilderSQL.SetListWheres(const Value: TList<UnicodeString>);
begin
   FListWheres := Value;
end;

procedure TRTTIBuilderSQL.SetRttiInspect(const Value: TRTTIInspectObject);
begin
   FRttiInspect := Value;
end;

procedure TRTTIBuilderSQL.SetStringBuilder(const Value: TStringBuilder);
begin
   FStringBuilder := Value;
end;

procedure TRTTIBuilderSQL.SetSystemSQLDataBase(const Value: TSystemSQLDataBaseCommon);
begin
   FSystemSQLDataBase := Value;
end;

procedure TRTTIBuilderSQL.SetTypeBuilder(const Value: TTypeBuilderSQL);
begin
   FTypeBuilder := Value;
end;

procedure TRTTIBuilderSQL.SetWithReturning(const Value: Boolean);
begin
   FWithReturning := Value;
end;

end.

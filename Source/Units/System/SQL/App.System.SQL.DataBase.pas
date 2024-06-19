unit App.System.SQL.DataBase;

interface

uses
   System.SysUtils, App.Consts.Messages;

type

   TSystemSQLDataBaseCommon = class
   public
      /// <summary>
      ///    SQL que cria um determinado Field em uma tabela
      /// </summary>
      function CreateField(const ATableName, AFieldName, ATypeText: UnicodeString): UnicodeString; virtual; abstract;

      /// <summary>
      ///    SQL que cria um determinado Index em uma tabela
      /// </summary>
      function CreateIndex(const ATableName, AFieldName: UnicodeString): UnicodeString; virtual;

      /// <summary>
      ///    SQL que cria uma determinada sequência/generator em uma tabela
      /// </summary>
      function CreateSequence(const ASequenceName: UnicodeString): UnicodeString; virtual;

      /// <summary>
      ///    SQL que cria uma FK em uma tabela
      /// </summary>
      function CreateForeignKey(const ATableName, AFieldName, ARefTable, ARefField: UnicodeString): UnicodeString; virtual;

      /// <summary>
      ///    SQL que cria uma PK em uma tabela
      /// </summary>
      function CreatePrimaryKey(const ATableName, AFieldName: UnicodeString): UnicodeString; virtual;

      /// <summary>
      ///    SQL que cria um banco de dados
      /// </summary>
      function CreateDataBase(const ADataBaseName: UnicodeString): UnicodeString; virtual; abstract;

      /// <summary>
      ///    SQL que dropa um banco de dados
      /// </summary>
      function DropDataBase(const ADataBaseAlias: UnicodeString): UnicodeString; virtual;

      /// <summary>
      ///    SQL que dropa um campo no banco de dados
      /// </summary>
      function DropField(const ATableName, AFieldName: UnicodeString): UnicodeString; virtual; abstract;

      /// <summary>
      ///    SQL que dropa uma FK de uma tabela
      /// </summary>
      function DropForeignKey(const ATableName, AForeignKeyName: UnicodeString): UnicodeString; virtual; abstract;

      /// <summary>
      ///    SQL que dropa um Index de uma tabela
      /// </summary>
      function DropIndex(const AIndexName: UnicodeString): UnicodeString; virtual; abstract;

      /// <summary>
      ///    SQL que dropa uma Sequence
      /// </summary>
      function DropSequence(const ASequenceName: UnicodeString): UnicodeString; virtual; abstract;

      /// <summary>
      ///    SQL que seta a flag NULL
      /// </summary>
      function UpdateNullFlagField(const AFieldName, ATableName: UnicodeString; const AValue: Boolean): UnicodeString; virtual; abstract;

      /// <summary>
      ///    SQL que altera o tamanho de um campo
      /// </summary>
      function UpdateLengthField(const AFieldName, ATableName: UnicodeString; const ALength: Integer): UnicodeString; virtual; abstract;

      /// <summary>
      ///    SQL que altera os decimais de um campo
      /// </summary>
      function UpdateDecimalsField(const AFieldName, ATableName: UnicodeString; const ADecimals: Integer): UnicodeString; virtual; abstract;

      /// <summary>
      ///    SQL que obtém todos os FIELDS de uma tabela
      /// </summary>
      function GetFieldsFromTable(const ATableName: UnicodeString): UnicodeString; virtual; abstract;

      /// <summary>
      ///    SQL que obtém a contagem de FIELDS em uma tabela
      /// </summary>
      function GetFieldsCountFromTable(const ATableName: UnicodeString): UnicodeString; virtual; abstract;

      /// <summary>
      ///    SQL que obtém todos os INDEXS de uma tabela
      /// </summary>
      function GetIndexsFromTable(const ATableName: UnicodeString): UnicodeString; virtual; abstract;

      /// <summary>
      ///    SQL que obtém todas as FKs de uma tabela
      /// </summary>
      function GetForeignKeysFromTable(const ATableName: UnicodeString): UnicodeString; virtual; abstract;

      /// <summary>
      ///    SQL que obtém o valor atual de uma SEQUENCE
      /// </summary>
      function GetCurrentValueSequence(const ASequenceName: UnicodeString): UnicodeString; virtual; abstract;

      /// <summary>
      ///    SQL que obtém o próximo valor de uma SEQUENCE
      /// </summary>
      function GetNextValueSequence(const ASequenceName: UnicodeString): UnicodeString; virtual; abstract;

      /// <summary>
      ///    SQL que verifica se determinada tabela existe no banco de dados
      /// </summary>
      function TableOnDataBase(const ATableName: UnicodeString): UnicodeString; virtual; abstract;

      /// <summary>
      ///    SQL que verifica se um banco de dados existe no PostGres
      /// </summary>
      function DataBaseOnSchemaPostGres: UnicodeString;
   end;


   TSystemSQLDataBaseFireBird = class(TSystemSQLDataBaseCommon)
   public
      /// <summary>
      ///    SQL que cria um determinado Field em uma tabela
      /// </summary>
      function CreateField(const ATableName, AFieldName, ATypeText: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que cria um banco de dados
      /// </summary>
      function CreateDataBase(const ADataBaseName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que dropa um banco de dados
      /// </summary>
      function DropDataBase(const ADataBaseAlias: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que dropa um campo no banco de dados
      /// </summary>
      function DropField(const ATableName, AFieldName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que dropa uma FK de uma tabela
      /// </summary>
      function DropForeignKey(const ATableName, AForeignKeyName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que dropa um Index de uma tabela
      /// </summary>
      function DropIndex(const AIndexName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que dropa uma Sequence
      /// </summary>
      function DropSequence(const ASequenceName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQl que seta a flag NULL
      /// </summary>
      function UpdateNullFlagField(const AFieldName, ATableName: UnicodeString; const AValue: Boolean): UnicodeString; override;

      /// <summary>
      ///    SQL que altera o tamanho de um campo
      /// </summary>
      function UpdateLengthField(const AFieldName, ATableName: UnicodeString; const ALength: Integer): UnicodeString; override;

      /// <summary>
      ///    SQL que altera os decimais de um campo
      /// </summary>
      function UpdateDecimalsField(const AFieldName, ATableName: UnicodeString; const ADecimals: Integer): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém todos os FIELDS de uma tabela
      /// </summary>
      function GetFieldsFromTable(const ATableName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém a contagem de FIELDS em uma tabela
      /// </summary>
      function GetFieldsCountFromTable(const ATableName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém todos os INDEXS de uma tabela
      /// </summary>
      function GetIndexsFromTable(const ATableName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém todas as FKs de uma tabela
      /// </summary>
      function GetForeignKeysFromTable(const ATableName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém o valor atual de uma SEQUENCE
      /// </summary>
      function GetCurrentValueSequence(const ASequenceName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém o próximo valor de uma SEQUENCE
      /// </summary>
      function GetNextValueSequence(const ASequenceName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que verifica se determinada tabela existe no banco de dados
      /// </summary>
      function TableOnDataBase(const ATableName: UnicodeString): UnicodeString; override;
   end;

   TSystemSQLDataBasePostGres = class(TSystemSQLDataBaseCommon)
   public
         /// <summary>
      ///    SQL que cria um determinado Field em uma tabela
      /// </summary>
      function CreateField(const ATableName, AFieldName, ATypeText: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que cria um banco de dados
      /// </summary>
      function CreateDataBase(const ADataBaseName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que dropa um campo no banco de dados
      /// </summary>
      function DropField(const ATableName, AFieldName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que dropa uma FK de uma tabela
      /// </summary>
      function DropForeignKey(const ATableName, AForeignKeyName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que dropa um Index de uma tabela
      /// </summary>
      function DropIndex(const AIndexName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que dropa uma Sequence
      /// </summary>
      function DropSequence(const ASequenceName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que seta a flag NULL
      /// </summary>
      function UpdateNullFlagField(const AFieldName, ATableName: UnicodeString; const AValue: Boolean): UnicodeString; override;

      /// <summary>
      ///    SQL que altera o tamanho de um campo
      /// </summary>
      function UpdateLengthField(const AFieldName, ATableName: UnicodeString; const ALength: Integer): UnicodeString; override;

      /// <summary>
      ///    SQL que altera os decimais de um campo
      /// </summary>
      function UpdateDecimalsField(const AFieldName, ATableName: UnicodeString; const ADecimals: Integer): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém todos os FIELDS de uma tabela
      /// </summary>
      function GetFieldsFromTable(const ATableName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém a contagem de FIELDS em uma tabela
      /// </summary>
      function GetFieldsCountFromTable(const ATableName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém todos os INDEXS de uma tabela
      /// </summary>
      function GetIndexsFromTable(const ATableName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém todas as FKs de uma tabela
      /// </summary>
      function GetForeignKeysFromTable(const ATableName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém o valor atual de uma SEQUENCE
      /// </summary>
      function GetCurrentValueSequence(const ASequenceName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém o próximo valor de uma SEQUENCE
      /// </summary>
      function GetNextValueSequence(const ASequenceName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que verifica se determinada tabela existe no banco de dados
      /// </summary>
      function TableOnDataBase(const ATableName: UnicodeString): UnicodeString; override;
   end;

   TSystemSQLDataBaseOracle = class(TSystemSQLDataBaseCommon)
   public
         /// <summary>
      ///    SQL que cria um determinado Field em uma tabela
      /// </summary>
      function CreateField(const ATableName, AFieldName, ATypeText: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que cria um banco de dados
      /// </summary>
      function CreateDataBase(const ADataBaseName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que dropa um campo no banco de dados
      /// </summary>
      function DropField(const ATableName, AFieldName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que dropa uma FK de uma tabela
      /// </summary>
      function DropForeignKey(const ATableName, AForeignKeyName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que dropa um Index de uma tabela
      /// </summary>
      function DropIndex(const AIndexName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que dropa uma Sequence
      /// </summary>
      function DropSequence(const ASequenceName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que seta a flag NULL
      /// </summary>
      function UpdateNullFlagField(const AFieldName, ATableName: UnicodeString; const AValue: Boolean): UnicodeString; override;

      /// <summary>
      ///    SQL que altera o tamanho de um campo
      /// </summary>
      function UpdateLengthField(const AFieldName, ATableName: UnicodeString; const ALength: Integer): UnicodeString; override;

      /// <summary>
      ///    SQL que altera os decimais de um campo
      /// </summary>
      function UpdateDecimalsField(const AFieldName, ATableName: UnicodeString; const ADecimals: Integer): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém todos os FIELDS de uma tabela
      /// </summary>
      function GetFieldsFromTable(const ATableName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém a contagem de FIELDS em uma tabela
      /// </summary>
      function GetFieldsCountFromTable(const ATableName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém todos os INDEXS de uma tabela
      /// </summary>
      function GetIndexsFromTable(const ATableName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém todas as FKs de uma tabela
      /// </summary>
      function GetForeignKeysFromTable(const ATableName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém o valor atual de uma SEQUENCE
      /// </summary>
      function GetCurrentValueSequence(const ASequenceName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que obtém o próximo valor de uma SEQUENCE
      /// </summary>
      function GetNextValueSequence(const ASequenceName: UnicodeString): UnicodeString; override;

      /// <summary>
      ///    SQL que verifica se determinada tabela existe no banco de dados
      /// </summary>
      function TableOnDataBase(const ATableName: UnicodeString): UnicodeString; override;
   end;

implementation

{ TSystemSQLDataBaseCommon }

uses App.Consts.DataBase;

function TSystemSQLDataBaseCommon.CreateForeignKey(const ATableName, AFieldName, ARefTable, ARefField: UnicodeString): UnicodeString;
begin
   Result := 'ALTER TABLE ' + ATableName + ' ADD CONSTRAINT FK_' + ATableName + '_' + AFieldName + ' FOREIGN KEY (' + AFieldName + ') REFERENCES ' + ARefTable + '(' + ARefField + ')';
end;

function TSystemSQLDataBaseCommon.CreateIndex(const ATableName, AFieldName: UnicodeString): UnicodeString;
begin
   Result := 'CREATE INDEX IDX_' + AFieldName + '_' + ATableName + ' ON ' + ATableName + '(' + AFieldName + ')';
end;

function TSystemSQLDataBaseCommon.CreatePrimaryKey(const ATableName, AFieldName: UnicodeString): UnicodeString;
begin
   Result := Format('ALTER TABLE %s ADD CONSTRAINT PK_%s PRIMARY KEY (%s)', [ATableName, ATableName, AFieldName]);
end;

function TSystemSQLDataBaseCommon.CreateSequence(const ASequenceName: UnicodeString): UnicodeString;
begin
   Result := Format('CREATE SEQUENCE %s', [ASequenceName]);
end;

function TSystemSQLDataBaseCommon.DataBaseOnSchemaPostGres: UnicodeString;
begin
   Result := 'SELECT PD.DATNAME, PU.USENAME' + sLineBreak +
             '  FROM PG_DATABASE PD, PG_USER PU' + sLineBreak +
             'WHERE PU.USESYSID = PD.DATDBA' + sLineBreak +
             '  AND PU.USENAME = ' + QuotedStr(PGUserName) + sLineBreak +
             '  AND PD.DATNAME = ' + QuotedStr(cNameDataBase) + ';';
end;

function TSystemSQLDataBaseCommon.DropDataBase(const ADataBaseAlias: UnicodeString): UnicodeString;
begin
   Result := Format('DROP DATABASE IF EXISTS %s', [ADataBaseAlias]);
end;

{ TSystemSQLDataBaseFireBird }

function TSystemSQLDataBaseFireBird.CreateDataBase(const ADataBaseName: UnicodeString): UnicodeString;
begin
   Result := 'CREATE DATABASE ' + QuotedStr(ADataBaseName) + sLineBreak +
             'USER ''SYSDBA'' PASSWORD ''masterkey''' + sLineBreak +
             'PAGE_SIZE 16384' + sLineBreak +
             'DEFAULT CHARACTER SET WIN1252 NOT NULL COLLATE WIN_PTBR';
end;

function TSystemSQLDataBaseFireBird.CreateField(const ATableName, AFieldName, ATypeText: UnicodeString): UnicodeString;
begin
   Result := Format('ALTER TABLE %s ADD %s %s', [ATableName, AFieldName, ATypeText]);
end;

function TSystemSQLDataBaseFireBird.DropDataBase(const ADataBaseAlias: UnicodeString): UnicodeString;
begin
   raise Exception.Create(SErrorDropDataBaseFireBird);
end;

function TSystemSQLDataBaseFireBird.DropField(const ATableName, AFieldName: UnicodeString): UnicodeString;
begin
   Result := Format('ALTER TABLE %s DROP %s', [ATableName, AFieldName]);
end;

function TSystemSQLDataBaseFireBird.DropForeignKey(const ATableName, AForeignKeyName: UnicodeString): UnicodeString;
begin
   Result := Format('ALTER TABLE %s DROP CONSTRAINT %s', [ATableName, AForeignKeyName]);
end;

function TSystemSQLDataBaseFireBird.DropIndex(const AIndexName: UnicodeString): UnicodeString;
begin
   Result := Format('DROP INDEX %s', [AIndexName]);
end;

function TSystemSQLDataBaseFireBird.DropSequence(const ASequenceName: UnicodeString): UnicodeString;
begin
   Result := Format('DROP SEQUENCE %s', [ASequenceName]);
end;

function TSystemSQLDataBaseFireBird.GetCurrentValueSequence(const ASequenceName: UnicodeString): UnicodeString;
begin
   Result := 'SELECT GEN_ID('+ ASequenceName +', 0) AS ID FROM RDB$DATABASE';
end;

function TSystemSQLDataBaseFireBird.GetFieldsCountFromTable(const ATableName: UnicodeString): UnicodeString;
begin
   Result := Format('SELECT COUNT (*) FROM RDB$RELATION_FIELDS WHERE RDB$RELATION_NAME = %s', [ATableName]);
end;

function TSystemSQLDataBaseFireBird.GetFieldsFromTable(const ATableName: UnicodeString): UnicodeString;
begin
   Result := Format('SELECT P.RDB$FIELD_NAME AS FIELD_NAME, F.RDB$FIELD_LENGTH AS FIELDLENGTH, F.RDB$FIELD_SCALE AS SCALE,' + sLineBreak +
                     'P.RDB$NULL_FLAG AS IS_NULL, F.RDB$FIELD_PRECISION AS FIELDPRECISION, C.RDB$TYPE_NAME AS FIELD_TYPE FROM RDB$RELATION_FIELDS P' + sLineBreak +
                     'INNER JOIN RDB$FIELDS F ON P.RDB$FIELD_SOURCE = F.RDB$FIELD_NAME' + sLineBreak +
                     'LEFT JOIN RDB$TYPES C ON C.RDB$TYPE = F.RDB$FIELD_TYPE AND C.RDB$FIELD_NAME = ''RDB$FIELD_TYPE''' + sLineBreak +
                     'WHERE P.RDB$RELATION_NAME = %s', [ATableName]);
end;

function TSystemSQLDataBaseFireBird.GetForeignKeysFromTable(const ATableName: UnicodeString): UnicodeString;
begin
   Result := Format('SELECT B.RDB$FIELD_NAME AS FIELD_NAME, D.RDB$RELATION_NAME AS REFERENCE_TABLE, E.RDB$FIELD_NAME AS FK_FIELD' + sLineBreak +
                    'FROM RDB$RELATION_CONSTRAINTS A INNER JOIN RDB$INDEX_SEGMENTS B' + sLineBreak +
                    'ON A.RDB$INDEX_NAME = B.RDB$INDEX_NAME INNER JOIN RDB$REF_CONSTRAINTS C' + sLineBreak +
                    'ON A.RDB$CONSTRAINT_NAME = C.RDB$CONSTRAINT_NAME INNER JOIN RDB$RELATION_CONSTRAINTS D' + sLineBreak +
                    'ON C.RDB$CONST_NAME_UQ = D.RDB$CONSTRAINT_NAME INNER JOIN RDB$INDEX_SEGMENTS E' + sLineBreak +
                    'ON D.RDB$INDEX_NAME = E.RDB$INDEX_NAME WHERE A.RDB$CONSTRAINT_TYPE = ''FOREIGN KEY''' + sLineBreak +
                    'AND A.RDB$RELATION_NAME = %s', [ATableName]);
end;

function TSystemSQLDataBaseFireBird.GetIndexsFromTable(const ATableName: UnicodeString): UnicodeString;
begin
   Result := Format('SELECT B.RDB$FIELD_NAME AS FIELD_NAME FROM RDB$INDICES A INNER JOIN RDB$INDEX_SEGMENTS B' + sLineBreak +
                    'ON B.RDB$INDEX_NAME = A.RDB$INDEX_NAME WHERE A.RDB$SYSTEM_FLAG = 0 AND A.RDB$FOREIGN_KEY IS NULL' + sLineBreak +
                    'AND A.RDB$UNIQUE_FLAG IS NULL AND A.RDB$RELATION_NAME = %s', [ATableName]);
end;

function TSystemSQLDataBaseFireBird.GetNextValueSequence(const ASequenceName: UnicodeString): UnicodeString;
begin
   Result := 'SELECT GEN_ID('+ ASequenceName +', 1) AS ID FROM RDB$DATABASE';
end;

function TSystemSQLDataBaseFireBird.TableOnDataBase(const ATableName: UnicodeString): UnicodeString;
begin
   Result := Format('SELECT * FROM RDB$RELATIONS WHERE RDB$SYSTEM_FLAG = 0 AND RDB$RELATION_NAME = %s', [ATableName]);
end;

function TSystemSQLDataBaseFireBird.UpdateDecimalsField(const AFieldName, ATableName: UnicodeString; const ADecimals: Integer): UnicodeString;
begin
   Result := Format('UPDATE RDB$FIELDS SET RDB$FIELD_SCALE = %d WHERE RDB$FIELD_NAME = ' + sLineBreak +
                    '(SELECT A.RDB$FIELD_SOURCE FROM RDB$RELATION_FIELDS A WHERE' + sLineBreak +
                    'A.RDB$FIELD_NAME = %s AND A.RDB$RELATION_NAME = %s)', [ADecimals, AFieldName, ATableName]);
end;

function TSystemSQLDataBaseFireBird.UpdateLengthField(const AFieldName, ATableName: UnicodeString; const ALength: Integer): UnicodeString;
begin
   Result := Format('UPDATE RDB$FIELDS SET RDB$FIELD_LENGTH = %d, RDB$CHARACTER_LENGTH = %d WHERE RDB$FIELD_NAME = ' + sLineBreak +
                    '(SELECT A.RDB$FIELD_SOURCE FROM RDB$RELATION_FIELDS A WHERE' + sLineBreak +
                    'A.RDB$FIELD_NAME = %s AND A.RDB$RELATION_NAME = %s)', [ALength, ALength, AFieldName, ATableName]);
end;

function TSystemSQLDataBaseFireBird.UpdateNullFlagField(const AFieldName, ATableName: UnicodeString; const AValue: Boolean): UnicodeString;
var
   LNullValue: UnicodeString;
begin
   if (AValue) then
      LNullValue := '1'
   else
      LNullValue := 'NULL';

   Result := Format('UPDATE RDB$RELATION_FIELDS SET RDB$NULL_FLAG %s WHERE' + sLineBreak +
                    '(RDB$FIELD_NAME = %s) AND (RDB$RELATION_NAME = %s)', [LNullValue, AFieldName, ATableName]);
end;

{ TSystemSQLDataBasePostGres }

function TSystemSQLDataBasePostGres.CreateDataBase(const ADataBaseName: UnicodeString): UnicodeString;
begin
   Result := Format('CREATE DATABASE %s WITH OWNER = %s' + sLineBreak +
                    '  ENCODING = ' + QuotedStr('UTF8') + sLineBreak +
                    '  TABLESPACE = pg_default ' + sLineBreak +
                    '  LC_COLLATE = ' + QuotedStr('Portuguese_Brazil.1252') + sLineBreak +
                    '  LC_CTYPE = ' + QuotedStr('Portuguese_Brazil.1252') + sLineBreak +
                    '  CONNECTION LIMIT -1', [ADataBaseName, 'postgres']);
end;

function TSystemSQLDataBasePostGres.CreateField(const ATableName, AFieldName, ATypeText: UnicodeString): UnicodeString;
begin
   Result := Format('ALTER TABLE public.%s ADD COLUMN %s %s %s %s', [ATableName, AFieldName, ATypeText]);
end;

function TSystemSQLDataBasePostGres.DropField(const ATableName, AFieldName: UnicodeString): UnicodeString;
begin
   Result := Format('ALTER TABLE public.%s DROP COLUMN %s', [ATableName, AFieldName]);
end;

function TSystemSQLDataBasePostGres.DropForeignKey(const ATableName, AForeignKeyName: UnicodeString): UnicodeString;
begin
   Result := Format('ALTER TABLE public.%s DROP CONSTRAINT %s', [ATableName, AForeignKeyName]);
end;

function TSystemSQLDataBasePostGres.DropIndex(const AIndexName: UnicodeString): UnicodeString;
begin
   Result := Format('DROP INDEX %s', [AIndexName]);
end;

function TSystemSQLDataBasePostGres.DropSequence(const ASequenceName: UnicodeString): UnicodeString;
begin
   Result := Format('DROP SEQUENCE %s', [ASequenceName]);
end;

function TSystemSQLDataBasePostGres.GetCurrentValueSequence(const ASequenceName: UnicodeString): UnicodeString;
begin
   Result := Format('SELECT last_value FROM %s', [ASequenceName]);
end;

function TSystemSQLDataBasePostGres.GetFieldsCountFromTable(const ATableName: UnicodeString): UnicodeString;
begin
   Result := Format('SELECT count (*) FROM information_schema.columns WHERE table_schema = ' + QuotedStr('public') + ' AND table_name = ' +  QuotedStr('%s'), [ATableName]);
end;

function TSystemSQLDataBasePostGres.GetFieldsFromTable(const ATableName: UnicodeString): UnicodeString;
begin
   Result := Format('SELECT column_name AS NAME, is_nullable AS IS_NULL, data_type AS DATA_TYPE, character_maximum_length AS LENGTH, numeric_precision, numeric_scale FROM' + sLineBreak +
             'information_schema.columns WHERE table_schema = ' + QuotedStr('public') + ' AND table_name = ' + QuotedStr('%s'), [ATableName]);
end;

function TSystemSQLDataBasePostGres.GetForeignKeysFromTable(const ATableName: UnicodeString): UnicodeString;
begin
   Result := Format('SELECT a.table_name, b.column_name, c.table_name AS foreign_table_name, c.column_name AS foreign_column_name' + sLineBreak +
                    'FROM information_schema.table_constraints AS A JOIN information_schema.key_column_usage AS B ON A.constraint_name = B.constraint_name' + sLineBreak +
                    'JOIN information_schema.constraint_column_usage AS C ON C.constraint_name = A.constraint_name' + sLineBreak +
                    'WHERE constraint_type = ''FOREIGN KEY'' and A.table_name = ' +   QuotedStr('%s'), [ATableName]);
end;

function TSystemSQLDataBasePostGres.GetIndexsFromTable(const ATableName: UnicodeString): UnicodeString;
begin
   Result := 'SELECT * FROM pg_indexes WHERE tablename = ' +  QuotedStr(ATableName) + 'and indexname like ''%idx%''';
end;

function TSystemSQLDataBasePostGres.GetNextValueSequence(const ASequenceName: UnicodeString): UnicodeString;
begin
   Result := Format('SELECT nextval (''%s'')', [ASequenceName]);
end;

function TSystemSQLDataBasePostGres.TableOnDataBase(const ATableName: UnicodeString): UnicodeString;
begin
   Result := Format('SELECT tablename FROM PG_TABLES WHERE SCHEMANAME = ' + QuotedStr('public') + ' AND TABLENAME = ''%s''', [ATableName]);
end;

function TSystemSQLDataBasePostGres.UpdateDecimalsField(const AFieldName, ATableName: UnicodeString; const ADecimals: Integer): UnicodeString;
begin
   Result := Format('UPDATE information_schema.columns SET numeric_scale = %d WHERE table_schema = ' + QuotedStr('public') +
            ' AND table_name = ' + QuotedStr('%s') + ' AND column_name = ' + QuotedStr('%s'), [ADecimals, ATableName, AFieldName]);
end;

function TSystemSQLDataBasePostGres.UpdateLengthField(const AFieldName, ATableName: UnicodeString; const ALength: Integer): UnicodeString;
begin
   Result := Format('UPDATE information_schema.columns SET character_maximum_length = %d WHERE table_schema = ' + QuotedStr('public') +
            ' AND table_name = ' + QuotedStr('%s') + ' AND column_name = ' + QuotedStr('%s'), [ALength, ATableName, AFieldName]);
end;

function TSystemSQLDataBasePostGres.UpdateNullFlagField(const AFieldName, ATableName: UnicodeString; const AValue: Boolean): UnicodeString;
begin
   Result := Format('UPDATE information_schema.columns SET is_nullable = %d WHERE table_schema = ' + QuotedStr('public') +
            ' AND table_name = ' + QuotedStr('%s') + ' AND column_name = ' + QuotedStr('%s'), [AValue, ATableName, AFieldName]);
end;

{ TSystemSQLDataBaseOracle }

function TSystemSQLDataBaseOracle.CreateDataBase(const ADataBaseName: UnicodeString): UnicodeString;
begin
   raise Exception.Create('Not Implemented!');
end;

function TSystemSQLDataBaseOracle.CreateField(const ATableName, AFieldName, ATypeText: UnicodeString): UnicodeString;
begin
   raise Exception.Create('Not Implemented!');
end;

function TSystemSQLDataBaseOracle.DropField(const ATableName, AFieldName: UnicodeString): UnicodeString;
begin
   raise Exception.Create('Not Implemented!');
end;

function TSystemSQLDataBaseOracle.DropForeignKey(const ATableName, AForeignKeyName: UnicodeString): UnicodeString;
begin
   raise Exception.Create('Not Implemented!');
end;

function TSystemSQLDataBaseOracle.DropIndex(const AIndexName: UnicodeString): UnicodeString;
begin
   raise Exception.Create('Not Implemented!');
end;

function TSystemSQLDataBaseOracle.DropSequence(const ASequenceName: UnicodeString): UnicodeString;
begin
   raise Exception.Create('Not Implemented!');
end;

function TSystemSQLDataBaseOracle.GetCurrentValueSequence(const ASequenceName: UnicodeString): UnicodeString;
begin
   raise Exception.Create('Not Implemented!');
end;

function TSystemSQLDataBaseOracle.GetFieldsCountFromTable(const ATableName: UnicodeString): UnicodeString;
begin
   raise Exception.Create('Not Implemented!');
end;

function TSystemSQLDataBaseOracle.GetFieldsFromTable(const ATableName: UnicodeString): UnicodeString;
begin
   raise Exception.Create('Not Implemented!');
end;

function TSystemSQLDataBaseOracle.GetForeignKeysFromTable(const ATableName: UnicodeString): UnicodeString;
begin
   raise Exception.Create('Not Implemented!');
end;

function TSystemSQLDataBaseOracle.GetIndexsFromTable(const ATableName: UnicodeString): UnicodeString;
begin
   raise Exception.Create('Not Implemented!');
end;

function TSystemSQLDataBaseOracle.GetNextValueSequence(const ASequenceName: UnicodeString): UnicodeString;
begin
   raise Exception.Create('Not Implemented!');
end;

function TSystemSQLDataBaseOracle.TableOnDataBase(const ATableName: UnicodeString): UnicodeString;
begin
   raise Exception.Create('Not Implemented!');
end;

function TSystemSQLDataBaseOracle.UpdateDecimalsField(const AFieldName, ATableName: UnicodeString; const ADecimals: Integer): UnicodeString;
begin
   raise Exception.Create('Not Implemented!');
end;

function TSystemSQLDataBaseOracle.UpdateLengthField(const AFieldName, ATableName: UnicodeString; const ALength: Integer): UnicodeString;
begin
   raise Exception.Create('Not Implemented!');
end;

function TSystemSQLDataBaseOracle.UpdateNullFlagField(const AFieldName, ATableName: UnicodeString; const AValue: Boolean): UnicodeString;
begin
   raise Exception.Create('Not Implemented!');
end;

end.

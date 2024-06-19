{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.Consts.DataBase;

interface

const

{$REGION '| TABLES NAMES |'}
   cTableApplicationControl = 'APPLICATION_CONTROL';
   cTableBlocker = 'BLOCKER_CONTROL';
   cTableEmpresa = 'T_EMPRESA';
   cTableDocumento = 'T_DOCUMENTO';
   cTableUsuario = 'T_USUARIO';
{$ENDREGION}

{$REGION '| TABLE COMMENTS |'}
   cCommentTableBlocker = 'Bloqueios de registros';
   cCommentTableEmpresa = 'Registro de Empresas';
   cCommentTableDocumento = 'Registro de Documentos';
   cCommentTableUsuario = 'Registro de Usuários';
{$ENDREGION}

{$REGION '| SEQUENCES NAMES |'}
   cSequenceCommon = 'GEN_ID_';
{$ENDREGION}

{$REGION '| FIELDS NAMES |'}

   {$REGION '| A |'}
   cFieldApplicationVersion = 'APP_VERSION';
   {$ENDREGION}
   {$REGION '| B |'}
   {$ENDREGION}
   {$REGION '| C |'}
   cFieldCNPJ = 'CNPJ';
   cFieldCPF = 'CPF';
   cFieldCidade = 'CIDADE';
   cFieldComplemento = 'COMPLEMENTO';
   cFieldCEP = 'CEP';
   cFieldClassParentName = 'CLASS_PARENT_NAME';
   {$ENDREGION}
   {$REGION '| D |'}
   cFieldDataCadastro = 'DATA_CADASTRO';
   cFieldDataVencimento = 'DATA_VENCIMENTO';
   cFieldDataHora = 'DATA_HORA';
   {$ENDREGION}
   {$REGION '| E |'}
   {$ENDREGION}
   {$REGION '| F |'}
   cFieldFKField = 'FK_FIELD';
   cFieldLength = 'FIELD_LENGTH';
   {$ENDREGION}
   {$REGION '| G |'}
   {$ENDREGION}
   {$REGION '| H |'}
   {$ENDREGION}
   {$REGION '| I |'}
   cFieldID = 'ID';
   cFieldIdOwner = 'ID_OWNER';
   cFieldIdEmpresa = 'ID_EMPRESA';
   cFieldIsNull = 'IS_NULL';
   cFieldIdParticipante = 'ID_PARTICIPANTE';
   cFieldIdRecord = 'ID_RECORD';
   cFieldIdUsuario = 'ID_USUARIO';
   {$ENDREGION}
   {$REGION '| J |'}
   {$ENDREGION}
   {$REGION '| K |'}
   {$ENDREGION}
   {$REGION '| L |'}
   cFieldLastUpdatedData = 'LAST_UPDATED_DATE';
   cFieldLogradouro = 'LOGRADOURO';
   {$ENDREGION}
   {$REGION '| M |'}
   cFieldMajor = 'MAJOR_VERSION';
   cFieldMinor = 'MINOR_VERSION';
   cFieldMainColor = 'MAIN_COLOR';
   {$ENDREGION}
   {$REGION '| N |'}
   cFieldName = 'FIELD_NAME';
   cFieldNumero = 'NUMERO';
   cFieldNome = 'NOME';
   {$ENDREGION}
   {$REGION '| O |'}
   cFieldObservacao = 'OBSERVACAO';
   {$ENDREGION}
   {$REGION '| P |'}
   cFieldPassWord = 'PASSWORD';
   {$ENDREGION}
   {$REGION '| Q |'}
   {$ENDREGION}
   {$REGION '| R |'}
   cFieldRelease = 'RELEASE_VERSION';
   cFieldReferenceTable = 'REFERENCE_TABLE';
   cFieldRazaoSocial = 'RAZAO_SOCIAL';
   {$ENDREGION}
   {$REGION '| S |'}
   cFieldScale = 'SCALE';
   cFieldStatus = 'STATUS';
   {$ENDREGION}
   {$REGION '| T |'}
   cFieldType = 'FIELD_TYPE';
   cFieldTipoPessoa = 'TIPO_PESSOA';
   cFieldTitleColor = 'TITLE_COLOR';
   {$ENDREGION}
   {$REGION '| U |'}
   cFieldUF = 'UF';
   cFieldUserName = 'USER_NAME';
   {$ENDREGION}
   {$REGION '| V |'}
   cFieldValor = 'VALOR';
   {$ENDREGION}
   {$REGION '| Y |'}
   {$ENDREGION}
   {$REGION '| X |'}
   {$ENDREGION}
   {$REGION '| Z |'}
   {$ENDREGION}
   {$REGION '| W |'}
   {$ENDREGION}

{$ENDREGION}

{$REGION '| LENGTH DB FIELDS |'}
   cLengthNome = 60;
   cLengthCommonUser = 20;
   cLengthCPF = 11;
   cLengthCNPJ = 14;
   cLengthNumeric = 15;
   cLengthNumericScale = 2;
   cLengthObservacao = 500;
{$ENDREGION}

{$REGION '| COMMON DB CONSTS |'}
   cPKCommonTextPG = '  serial primary key ';
   PGDriverName = 'PG';
   PGEncoding = 'UTF8';
   PGUserName = 'postgres';
   PGPassWord = 'postgres';
   PGServer = 'localhost';
   PGPort = '5432';
   PGSchema = 'public';

   FBDriverName = 'FB';
   FBPort = '3050';
   FBUserName = 'SYSDBA';
   FBPassWord = 'masterkey';
   FBCharacterSet = 'win1252';

   cNameDataBase = 'APP_DATABASE';
{$ENDREGION}

implementation

end.

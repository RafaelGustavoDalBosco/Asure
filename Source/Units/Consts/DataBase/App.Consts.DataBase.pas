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
   cTableDocumentoTipo = 'T_DOCUMENTO_TIPO';
   cTableDocumentoParcela = 'T_DOCUMENTO_PARCELA';
   cTableUsuario = 'T_USUARIO';
   cTablePagamento = 'T_PAGAMENTO';
   cTablePagamentoFormas = 'T_PAGAMENTO_FORMAS';
   cTableBancoConta = 'T_BANCO_CONTA';
   cTableBancoContaCartao = 'T_BANCO_CONTA_CARTAO';
   cTableRecebimento = 'T_RECEBIMENTO';
{$ENDREGION}

{$REGION '| TABLE COMMENTS |'}
   cCommentTableBlocker = 'Bloqueios de registros';
   cCommentTableEmpresa = 'Registro de Empresas';
   cCommentTableDocumento = 'Registro de Documentos';
   cCommentTableDocumentoParcela = 'Registro de parcelas de Documentos';
   cCommentTableUsuario = 'Registro de Usuários';
   cCommentTableDocumentoTipo = 'Registro de Tipos de Documentos';
   cCommentTablePagamentoFormas = 'Registro de Formas de Pagamento';
   cCommentTableBancoConta = 'Registro de Contas em Bancos';
   cCommentTableBancoContaCartao = 'Registro de Cartões de Crédito';
   cCommentTablePagamento = 'Registro de Pagamentos';
   cCommentTableRecebimento = 'Registro de Recebimentos';
{$ENDREGION}

{$REGION '| SEQUENCES NAMES |'}
   cSequenceCommon = 'GEN_ID_';
{$ENDREGION}

{$REGION '| FIELDS NAMES |'}

   {$REGION '| A |'}
   cFieldApplicationVersion = 'APP_VERSION';
   cFieldAgencia = 'AGENCIA';
   {$ENDREGION}
   {$REGION '| B |'}
   cFieldBanco = 'BANCO';
   cFieldBandeira = 'BANDEIRA';
   {$ENDREGION}
   {$REGION '| C |'}
   cFieldCNPJ = 'CNPJ';
   cFieldCPF = 'CPF';
   cFieldCpfCnpj = 'CPF_CNPJ';
   cFieldCidade = 'CIDADE';
   cFieldComplemento = 'COMPLEMENTO';
   cFieldCEP = 'CEP';
   cFieldClassParentName = 'CLASS_PARENT_NAME';
   cFieldCVV = 'CVV';
   {$ENDREGION}
   {$REGION '| D |'}
   cFieldDataCadastro = 'DATA_CADASTRO';
   cFieldDataVencimento = 'DATA_VENCIMENTO';
   cFieldDataHora = 'DATA_HORA';
   cFieldDataPagamento = 'DATA_PAGAMENTO';
   cFieldDescricao = 'DESCRICAO';
   cFieldDataValidade = 'DATA_VALIDADE';
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
   cFieldIdTipo = 'ID_TIPO';
   cFieldIdCartao = 'ID_CARTAO';
   cFieldIdForma = 'ID_FORMA';
   cFieldIdDocumento = 'ID_DOCUMENTO';
   cFieldIdConta = 'ID_CONTA';
   {$ENDREGION}
   {$REGION '| J |'}
   {$ENDREGION}
   {$REGION '| K |'}
   {$ENDREGION}
   {$REGION '| L |'}
   cFieldLastUpdatedData = 'LAST_UPDATED_DATE';
   cFieldLogradouro = 'LOGRADOURO';
   cFieldLimite = 'LIMITE';
   cfieldLimiteUtilizado = 'LIMITE_UTILIZADO';
   {$ENDREGION}
   {$REGION '| M |'}
   cFieldMajor = 'MAJOR_VERSION';
   cFieldMinor = 'MINOR_VERSION';
   cFieldMainColor = 'MAIN_COLOR';
   cFieldMesAnoRef = 'MES_ANO_REF';
   {$ENDREGION}
   {$REGION '| N |'}
   cFieldName = 'FIELD_NAME';
   cFieldNumero = 'NUMERO';
   cFieldNome = 'NOME';
   {$ENDREGION}
   {$REGION '| O |'}
   cFieldObservacao = 'OBSERVACAO';
   cFieldOrigem = 'ORIGEM';
   {$ENDREGION}
   {$REGION '| P |'}
   cFieldPassWord = 'PASSWORD';
   cFieldParcelado = 'PARCELADO';
   {$ENDREGION}
   {$REGION '| Q |'}
   cFieldQuantidadeParcelas = 'QTDE_PARCELAS';
   {$ENDREGION}
   {$REGION '| R |'}
   cFieldRelease = 'RELEASE_VERSION';
   cFieldReferenceTable = 'REFERENCE_TABLE';
   cFieldRazaoSocial = 'RAZAO_SOCIAL';
   {$ENDREGION}
   {$REGION '| S |'}
   cFieldScale = 'SCALE';
   cFieldStatus = 'STATUS';
   cFieldSaldo = 'SALDO';
   cFieldSequencia = 'SEQUENCIA';
   {$ENDREGION}
   {$REGION '| T |'}
   cFieldType = 'FIELD_TYPE';
   cFieldTipoPessoa = 'TIPO_PESSOA';
   cFieldTitleColor = 'TITLE_COLOR';
   cFieldTipo = 'TIPO';
   cFieldTotalProximasFaturas = 'TOTAL_PROX_FATURAS';
   {$ENDREGION}
   {$REGION '| U |'}
   cFieldUF = 'UF';
   cFieldUserName = 'USER_NAME';
   {$ENDREGION}
   {$REGION '| V |'}
   cFieldValor = 'VALOR';
   cFieldValorAplicado = 'VALOR_APLICADO';
   cFieldValidade = 'VALIDADE';
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
   cLengthCPF = 11;
   cLengthCNPJ = 14;
   cLengthCpfCnpj = 14;
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

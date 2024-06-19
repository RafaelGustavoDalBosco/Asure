{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  � �           }
{=====================================================}
unit App.Consts.Messages;

interface

uses
  System.SysUtils;

const

{$REGION '| MESSAGE TEXTS |'}
   SMessageSucess = 'Opera��o realizada com sucesso!';
   SMessageError = 'Erro ao realizar a opera��o!' + sLineBreak + 'Motivo: %s';
   SMessageInformation = 'Informativo: %s';
   SMessageConfirm = 'Confirma a opera��o?';
   SMessageCancel = 'Deseja realmente cancelar?';
   SMessageExitScreen = 'Deseja sair da tela?';
   SMessageFileExistReWrite = 'O Arquivo %s j� existe!' + sLineBreak + ' Deseja sobrescrever?';
   SMessageFileOpenQuestion = 'Deseja abrir o arquivo agora?';
{$ENDREGION}

{$REGION '| ERRORS |'}
   SErrorFocusControl = 'O componente %s n�o pode ser focado! Form %s';
   SErrorExceptionSilent = 'Exce��o Silenciosa';
   SErrorFocusedRowGrid = 'Erro ao focar a linha no CxGrid';
   SErrorConvertQueryToMemTable = 'Erro ao tentar converter uma Query em TFDMemTable! Motivo: ';
   SErrorExecSQL = 'Erro ao executar a SQL:' + sLineBreak + '%s' + sLineBreak + 'Motivo: %s';
   SErrorConnectionDB = 'Erro ao tentar conectar ao banco de dados! Motivo: %s';
   SErrorAddCollectionClass = 'Erro ao adicionar uma novo objeto da classe %s na lista! Motivo: %s';
   SErrorDuplicatesNotAllowed = 'Erro ao adicionar a �ndice %s no dicion�rio! J� existe um registro!';
   SErrorNotEnoughResource = 'N�o h� recursos dispon�veis para executar a a��o %s';
   SErrorCreateFolder = 'N�o foi poss�vel criar a pasta no caminho %s!' + sLineBreak + 'Motivo: %s';
   SErrorConvertion = 'Erro ao converter o tipo de vari�vel %s com o valor %s para %s!' + sLineBreak;
   SErrorDropDataBaseFireBird = 'N�o � poss�vel excluir a base de dados do FireBird pela aplica��o';
   SErrorObjectWithOutDBRelation = 'O Objeto %s n�o tem o CustomAttribute de TDataBaseRelation';
   SErrorPropertyWithOutData = 'A property do objeto %s n�o tem o CustomAttribute TPropertyData';
   SErrorObjectNil = 'Objeto vazio!';
   SErrorPersistentObject = 'Action: %s' + sLineBreak + 'Erro ao persistir os dados do objeto %s! Motivo:' + sLineBreak + '%s';
{$ENDREGION}

{$REGION '| EMPTY |'}
   SEmptyObjectParamsConnection = 'N�o h� par�metros para a Conex�o ao banco de dados!';
   SEmptyObjectTransaction = 'N�o h� uma transa��o criada!';
   SEmptyParamName = 'Nome do par�metro est� em branco!';
   SEmptyFieldName = 'Nome do campo est� em branco!';
   SEmptyParamOnQuery = 'Par�metro %s n�o encontrado na query!';
   SEmptyFieldOnQuery = 'Campo %s n�o encontrado na query!';
   SEmptySQLOnQuery = 'N�o h� uma SQL adicionada na query!';
   SEmptyFieldValue = 'O campo %s est� vazio!';
{$ENDREGION}

{$REGION '| WARN |'}
   SWarnFileDontExist = 'Arquivo n�o encontrado no caminho %s';
   SWarnFileDeleted = 'Arquivo %s deletado';
   SWarnFileMoved = 'Arquivo %s movido para o caminho %s';
   SWarnFolderCreated = 'Pasta criada no caminho %s';
   SWarnRecordChanging = 'Este registro est� sendo editado pelo usu�rio %s!';
{$ENDREGION}

{$REGION '| ACTIONS |'}
   SActionDBOperation = 'DataBase Operation';
   SActionUpdateDataBase = 'Atualizando o banco de dados! Total de tabelas %d';
   SActionUpdateTable = 'Atualizando a tabela %s';
   SActionUpdateTableIndex = 'Atualizando os INDEX da tabela %s';
   SActionUpdateTableFK = 'Atualizando as FK da tabela %s';
   SActionUpdateTableFields = 'Atualizando os FIELDS da tabela %s';
   SActionCreateDataBase = 'Criando o banco de dados! Total de tabelas %d';
   SActionCreateTable = 'Criando a tabela %s';
   SActionCreateTableIndex = 'Criando os INDEX da tabela %s';
   SActionCreateTableFK = 'Criando as FK da tabela %s';
   SActionCreateTableFields = 'Criando os FIELDS da tabela %s';
   SActionSQLExecuted = 'Execution SQL: %s';
   SActionCreateDBFireBirdFile = 'Criando banco de dados do FIREBIRD';
   SActionCreateDBPostGresFile = 'Criando banco de dados do POSTGRES';
   SActionCreateDBOracleFile = 'Criando banco de dados do ORACLE';
{$ENDREGION}

implementation

end.

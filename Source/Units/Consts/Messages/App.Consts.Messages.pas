{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.Consts.Messages;

interface

uses
  System.SysUtils;

const

{$REGION '| MESSAGE TEXTS |'}
   SMessageSucess = 'Operação realizada com sucesso!';
   SMessageError = 'Erro ao realizar a operação!' + sLineBreak + 'Motivo: %s';
   SMessageInformation = 'Informativo: %s';
   SMessageConfirm = 'Confirma a operação?';
   SMessageCancel = 'Deseja realmente cancelar?';
   SMessageExitScreen = 'Deseja sair da tela?';
   SMessageFileExistReWrite = 'O Arquivo %s já existe!' + sLineBreak + ' Deseja sobrescrever?';
   SMessageFileOpenQuestion = 'Deseja abrir o arquivo agora?';
{$ENDREGION}

{$REGION '| ERRORS |'}
   SErrorFocusControl = 'O componente %s não pode ser focado! Form %s';
   SErrorExceptionSilent = 'Exceção Silenciosa';
   SErrorFocusedRowGrid = 'Erro ao focar a linha no CxGrid';
   SErrorConvertQueryToMemTable = 'Erro ao tentar converter uma Query em TFDMemTable! Motivo: ';
   SErrorExecSQL = 'Erro ao executar a SQL:' + sLineBreak + '%s' + sLineBreak + 'Motivo: %s';
   SErrorConnectionDB = 'Erro ao tentar conectar ao banco de dados! Motivo: %s';
   SErrorAddCollectionClass = 'Erro ao adicionar uma novo objeto da classe %s na lista! Motivo: %s';
   SErrorDuplicatesNotAllowed = 'Erro ao adicionar a índice %s no dicionário! Já existe um registro!';
   SErrorNotEnoughResource = 'Não há recursos disponíveis para executar a ação %s';
   SErrorCreateFolder = 'Não foi possível criar a pasta no caminho %s!' + sLineBreak + 'Motivo: %s';
   SErrorConvertion = 'Erro ao converter o tipo de variável %s com o valor %s para %s!' + sLineBreak;
   SErrorDropDataBaseFireBird = 'Não é possível excluir a base de dados do FireBird pela aplicação';
   SErrorObjectWithOutDBRelation = 'O Objeto %s não tem o CustomAttribute de TDataBaseRelation';
   SErrorPropertyWithOutData = 'A property do objeto %s não tem o CustomAttribute TPropertyData';
   SErrorObjectNil = 'Objeto vazio!';
   SErrorPersistentObject = 'Action: %s' + sLineBreak + 'Erro ao persistir os dados do objeto %s! Motivo:' + sLineBreak + '%s';
{$ENDREGION}

{$REGION '| EMPTY |'}
   SEmptyObjectParamsConnection = 'Não há parâmetros para a Conexão ao banco de dados!';
   SEmptyObjectTransaction = 'Não há uma transação criada!';
   SEmptyParamName = 'Nome do parâmetro está em branco!';
   SEmptyFieldName = 'Nome do campo está em branco!';
   SEmptyParamOnQuery = 'Parâmetro %s não encontrado na query!';
   SEmptyFieldOnQuery = 'Campo %s não encontrado na query!';
   SEmptySQLOnQuery = 'Não há uma SQL adicionada na query!';
   SEmptyFieldValue = 'O campo %s está vazio!';
{$ENDREGION}

{$REGION '| WARN |'}
   SWarnFileDontExist = 'Arquivo não encontrado no caminho %s';
   SWarnFileDeleted = 'Arquivo %s deletado';
   SWarnFileMoved = 'Arquivo %s movido para o caminho %s';
   SWarnFolderCreated = 'Pasta criada no caminho %s';
   SWarnRecordChanging = 'Este registro está sendo editado pelo usuário %s!';
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

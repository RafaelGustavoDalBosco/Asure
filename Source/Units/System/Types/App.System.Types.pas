{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  � �           }
{=====================================================}
unit App.System.Types;

interface

type

  /// <summary>
  ///   Tipos de conex�o da aplica��o
  /// </summary>
  TTypeConnection = (ttcFireBird, ttcPostGres, ttcOracle, ttcNone);

  /// <summary>
  ///   Tipos de constru��o de SQL dos objetos
  /// </summary>
  TTypeBuilderSQL = (tbsInsert, tbsUpdate, tbsSelect, tbsDelete, tbsCreate, tbsAlter, tbsInsertOrUpdate, tbsDrop, tbsList, tbsNone);

  /// <summary>
  ///    Tipos de execu��o no banco de dados
  /// </summary>
  TTypeExecuteDataBase = (tedCreate, tedUpdate, tedDrop, tedNone, tedMaintenance);

  /// <summary>
  ///    Tipos de mensagens
  /// </summary>
  TTypeMessage = (tmWarning, tmError, tmQuestion, tmSucess, tmInformation, tmNone);

  /// <summary>
  ///    Tipos de Resultado de confirma��o
  /// </summary>
  TTypeResult = (trConfirmed, trCanceled, trAborted, trNone);

  /// <summary>
  ///    Tipos de a��es de dados
  /// </summary>
  TTypeAction = (taInsert, taUpdate, taSelect, taDelete, taList);

  /// <summary>
  ///    Tipos de flags das properties
  /// </summary>
  TTypePropertyObjectFlag = (pofCreating, pofChanged);

implementation

end.

unit App.Consts.Common;

interface

uses
   Vcl.Graphics;

const

   ApplicationVersion = 100;

{$REGION '| DIRECTORYS |'}
   /// <summary>
   ///    Diretório Padrão do Sistema
   /// </summary>
   DirectoryApplication = 'C:\Dream';

   /// <summary>
   ///    Pasta SYSTEM da aplicação
   ///    System.ini, etc...
   /// </summary>
   DirectorySystem = DirectoryApplication + '\System';

   /// <summary>
   ///    Pasta DATABASE
   /// </summary>
   DirectoryDataBase = DirectorySystem + '\DataBase';

   /// <summary>
   ///    Pasta de LOG da aplicação
   /// </summary>
   DirectoryLog = DirectoryApplication + '\Log';

   /// <summary>
   ///    SubPasta da pasta LOG, que irá conter os PRINTS
   /// </summary>
   DirectoryPrint = DirectoryLog + '\Prints';

   /// <summary>
   ///    Pasta de arquivos COMMON da aplicação
   /// </summary>
   DirectoryCommon = DirectoryApplication + '\Common';

   /// <summary>
   ///    Pasta de recebimentos de arquivos comuns
   /// </summary>
   DirectoryCommonFiles = DirectoryCommon + '\Files';

   /// <summary>
   ///    Pasta de recebimentos de arquivos oculta
   /// </summary>
   DirectoryCommonFilesReceived = DirectoryCommonFiles + '\.Received';

   /// <summary>
   ///    SubPasta da pasta COMMON, que irá conter os HTMLS
   /// </summary>
   DirectoryHTML = DirectoryCommon + '\HTML';

   /// <summary>
   ///    SubPasta da pasta COMMON, que irá conter as IMAGENS
   /// </summary>
   DirectoryImage = DirectoryCommon + '\Imagens';
{$ENDREGION}

{$REGION '| INI FIELDS |'}
   /// <summary>
   ///    Caminho do arquivo .ini da aplicação
   /// </summary>
   IniPath = DirectorySystem + '\ApplicationSystem.ini';

   /// <summary>
   ///    SECTOR = SYSTEM
   /// </summary>
   IniSectorSystem = 'SYSTEM';

   /// <summary>
   ///    SECTOR = SYSTEM
   ///    ROW = DATABASE
   /// </summary>
   IniRowDataBasePath = 'data_base_path';

   /// <summary>
   ///    SECTOR = SYSTEM
   ///    ROW = SERVER
   /// </summary>
   IniRowServer = 'server';

   /// <summary>
   ///    SECTOR = SYSTEM
   ///    ROW = TYPE_CONNECTION
   /// </summary>
   IniRowTypeConnection = 'type_connection';

   /// <summary>
   ///    SECTOR = PROPERTIES
   /// </summary>
   IniSectorOptions = 'PROPERTIES';

   /// <summary>
   ///    SECTOR = PROPERTIES
   ///    ROW = USER
   /// </summary>
   IniRowCommonUser = 'user';

   /// <summary>
   ///    SECTOR = SYSTEM
   ///    ROW = DEBUGMODE
   /// </summary>
   IniRowDebugmode = 'debug_mode';
{$ENDREGION}

{$REGION '|DEFAULTS|'}
   DefaultMainColor = $00FF8000;
   DefaultTitleColor = clBlack;
   DefaultColumnColor = clWhite;
{$ENDREGION}

{$REGION '| MASKS|'}
   MaskTelefone = '!\(99\)0000-0000;1;_';
   MaskCelular = '!\(99\)00000-0000;1;_';
   MaskCPF = '000.000.000-00;0';
   MaskCNPJ = '00.000.000/0000-00;0';
   MaskRG = '00.000.000-0;_';
{$ENDREGION}

implementation

end.

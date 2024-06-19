{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.System.Vars;

interface

uses
  App.System.Connection, App.System.Types, App.System.Classes.Collection, System.SysUtils;

var

   /// <summary>
   ///   Objeto de Conexão selecionado pela aplicação
   /// </summary>
   gvApplicationConnection: TConnection;

   /// <summary>
   ///   Tipo da conexão com o banco de dados usado na aplicação
   /// </summary>
   gvTypeConnection: TTypeConnection;

   /// <summary>
   ///    Folder principal da aplicação
   /// </summary>
   gvCurrentFolder: UnicodeString;

   /// <summary>
   ///    Flag para carregar o log inteiro do sistema
   /// </summary>
   gvTraceLog: Boolean;

   /// <summary>
   ///    Lista das entidades da aplicação
   /// </summary>
   gvListOfEntys: TCommonCollection;

implementation

end.

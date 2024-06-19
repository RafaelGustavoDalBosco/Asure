{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  � �           }
{=====================================================}
unit App.System.Vars;

interface

uses
  App.System.Connection, App.System.Types, App.System.Classes.Collection, System.SysUtils;

var

   /// <summary>
   ///   Objeto de Conex�o selecionado pela aplica��o
   /// </summary>
   gvApplicationConnection: TConnection;

   /// <summary>
   ///   Tipo da conex�o com o banco de dados usado na aplica��o
   /// </summary>
   gvTypeConnection: TTypeConnection;

   /// <summary>
   ///    Folder principal da aplica��o
   /// </summary>
   gvCurrentFolder: UnicodeString;

   /// <summary>
   ///    Flag para carregar o log inteiro do sistema
   /// </summary>
   gvTraceLog: Boolean;

   /// <summary>
   ///    Lista das entidades da aplica��o
   /// </summary>
   gvListOfEntys: TCommonCollection;

implementation

end.

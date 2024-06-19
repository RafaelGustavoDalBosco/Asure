unit App.Common.Types;

interface

type

   /// <summary>
   ///    Tipos de pessoa
   /// </summary>
   TTipoPessoa = (tipJuridica, tipFisica);

   /// <summary>
   ///    Tipos de número de telefone
   /// </summary>
   TTipoTelefone = (tifCelular, tifComercial, tifResencial, tifNone);

   /// <summary>
   ///    Tipos de exportação de CxGrids
   /// </summary>
   TTypeExportGrid = (teXLS, teXML, teHTML, teTXT, teCSV, teXLSx);

   /// <summary>
   ///    Tipos de apresentam de hint
   /// </summary>
   TTypeShowHint = (tshInformation, tshWarning, tshError);

   /// <summary>
   ///    Tipos de Arquivos:
   ///    TXT
   ///    PDF
   ///    XLS - Excel
   ///    DOC
   ///    OTHER
   ///    FDB - FireBird DataBase
   /// </summary>
   TTypeFile = (tfPDF, tfText, tfWord, tfFDB, tfXLS, tfImg, tfOther, tfNone);

implementation

end.

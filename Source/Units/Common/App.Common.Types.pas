unit App.Common.Types;

interface

type

   /// <summary>
   ///    Tipos de pessoa
   /// </summary>
   TTypePessoa = (tipFisica, tipJuridica);

   /// <summary>
   ///    Tipos de Formas de Pagamento
   /// </summary>
   TTypeFormaPagamento = (tfpVista, tfpPrazo, tfpOutros);

   /// <summary>
   ///    Bandeiras de cartão
   /// </summary>
   TTypeBandeiraCartao = (tbcVisa, tbcMasterCard, tbcOutros);

   /// <summary>
   ///    Tipos de recebimento
   /// </summary>
   TTypeRecebimentoOrigem = (troRevelo, troEco, troOutros);

   /// <summary>
   ///    Tipos de número de telefone
   /// </summary>
   TTypeTelefone = (tifCelular, tifComercial, tifResencial, tifNone);

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

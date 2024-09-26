unit App.Common.Arrays;

interface

uses
 App.Common.Types, App.Common.Records;

const
   ExportExts: array [0..5] of String = ('xls','xml', 'html', 'txt', 'csv', 'xlsx');

   FilesTypes: array [0..5] of TFileTypeRecord =
   (
      (fType: tfText;
       fText: '.pdf'),
      (fType: tfPDF;
       fText: '.txt'),
      (fType: tfWord;
       fText: '.doc'),
      (fType: tfFDB;
       fText: '.FDB'),
      (fType: tfXLS;
       fText: '.xls'),
      (fType: tfOther;
       fText: '*.*')
   );

   Bandeiras: array [0..2] of TBandeiraCartaoRecord =
   (
     (fText: 'Visa';
      fType: TTypeBandeiraCartao.tbcVisa),
     (fText: 'Master Card';
      fType: TTypeBandeiraCartao.tbcMasterCard),
     (fText: 'Outros';
      fType: TTypeBandeiraCartao.tbcOutros)
   );

   TiposPagamentoForma: array [0..2] of TTypePagamentoFormaRecord =
   (
    (fText: 'Vista';
     fType: tfpVista),
    (fText: 'Prazo';
     fType: tfpPrazo),
    (fText: 'Outros';
     fType: tfpOutros)
   );

implementation

end.

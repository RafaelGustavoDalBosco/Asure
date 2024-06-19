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

implementation

end.

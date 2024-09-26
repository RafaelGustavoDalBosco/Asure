unit App.Common.Records;

interface

uses App.Common.Types;

type

   TBandeiraCartaoRecord = record
      fText: UnicodeString;
      fType: TTypeBandeiraCartao;
   end;

   TTypePagamentoFormaRecord = record
      fText: UnicodeString;
      fType: TTypeFormaPagamento;
   end;

   TFileTypeRecord = record
      fType: TTypeFile;
      fText: UnicodeString;
   end;

   TSearchColumnRecord = record
      fCaption: UnicodeString;
      fWidth: Integer;
      fFieldName: UnicodeString;
      fAutoSize: Boolean;
   end;

implementation

end.

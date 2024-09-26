unit App.System.Search;

interface

uses
   Frm.System.Search, System.SysUtils, App.Common.Records;

type

   TColumnGrid = array of TSearchColumnRecord;

   TSystemSearch = class
   strict protected
      /// <summary>
      ///    Obtém o valor selecionado da linha
      /// </summary>
      function GetAs: Variant;

      /// <summary>
      ///    Cria as colunas do grid
      /// </summary>
      procedure SetColumnsOnForm;
   private
      FForm: TFrmSystemSearch;
      FCaption: UnicodeString;
      FColumnIndex: Integer;
      procedure SetForm(const Value: TFrmSystemSearch);
      procedure SetCaption(const Value: UnicodeString);
      procedure SetColumnIndex(const Value: Integer);
   protected
      /// <summary>
      ///    Obtém a SQL que será executada
      /// </summary>
      function GetSQL: UnicodeString; virtual; abstract;

      /// <summary>
      ///    Define as colunas que serão criadas
      /// </summary>
      procedure DefineColumns; virtual; abstract;
   strict private
      property Form: TFrmSystemSearch read FForm write SetForm;
      property Caption: UnicodeString read FCaption write SetCaption;
      property ColumnIndex: Integer read FColumnIndex write SetColumnIndex;
   public
      FListOfColumns: TColumnGrid;
      function AsInt: Integer;
      function AsInt64: Int64;
      function AsString: UnicodeString;

      constructor Create(const ACaption: UnicodeString; const AColumnIndex: Integer = 0); overload;
      destructor Destroy; override;
   end;

implementation

{ TSystemSearch }

uses App.Common.Utils, App.System.Wrapper, App.Consts.Messages, cxGridDBTableView,
     App.Common.Types, App.System.Types, System.Variants;

function TSystemSearch.AsInt: Integer;
begin
   SysCon.VarTo(GetAs, Result);
end;

function TSystemSearch.AsInt64: Int64;
begin
   SysCon.VarTo(GetAs, Result);
end;

function TSystemSearch.AsString: UnicodeString;
begin
   SysCon.VarTo(GetAs, Result);
end;

constructor TSystemSearch.Create(const ACaption: UnicodeString; const AColumnIndex: Integer);
begin
   SetCaption(ACaption);
   SetColumnIndex(AColumnIndex);

   inherited Create;
end;

destructor TSystemSearch.Destroy;
begin
   inherited Destroy;
end;

function TSystemSearch.GetAs: Variant;
var
   LQuery: TQuery;
begin
   LQuery := SysDB.CreateQuery(GetSQL);

   if LQuery.GetData then
   begin
      Form := TFrmSystemSearch.Create(nil);
      try
         Form.Caption := Caption;
         DefineColumns;
         SetColumnsOnForm;
         SysGrid.SetDataOnGrid(Form.RecordDB, LQuery);
         FForm.ShowModal;

         if (FForm.TypeResult = trConfirmed) then
            Result := SysGrid.GetValue(Form.RecordDB, ColumnIndex)
         else
            Result := Null; 
      finally
         FreeAndNil(FForm);
      end;
   end
   else
      SysMsg.ShowWarn(SWarnEmptyQuery);
end;

procedure TSystemSearch.SetCaption(const Value: UnicodeString);
begin
   FCaption := Value;
end;

procedure TSystemSearch.SetColumnIndex(const Value: Integer);
begin
   FColumnIndex := Value;
end;

procedure TSystemSearch.SetColumnsOnForm;
var
   LLoop: Integer;
   LInstance: TSearchColumnRecord;
   LColumn: TcxGridDBColumn;
begin
   for LLoop := Low(FListOfColumns) to High(FListOfColumns) do
   begin
      LInstance := FListOfColumns[LLoop];

      LColumn := FForm.RecordDB.CreateColumn;
      LColumn.Caption := LInstance.fCaption;
      LColumn.Width := LInstance.fWidth;
      LColumn.DataBinding.FieldName := LInstance.fFieldName;
      SysGrid.SetFalseOptionsColumns(LColumn);
      LColumn.Options.AutoWidthSizable := LInstance.fAutoSize;
   end;
end;

procedure TSystemSearch.SetForm(const Value: TFrmSystemSearch);
begin
   FForm := Value;
end;

end.

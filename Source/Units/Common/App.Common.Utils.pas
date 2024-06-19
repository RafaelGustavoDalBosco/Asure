{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.Common.Utils;

interface

uses

{$REGION '| DEVEXPRESS |'}
   cxTextEdit,
   cxMaskEdit,
   cxDropDownEdit,
   cxLabel,
   cxCurrencyEdit,
   cxClasses,
   cxGridCustomView,
   cxGridCustomTableView,
   cxGridTableView,
   cxGridDBTableView,
   cxGridDBLayoutView,
   cxGridCustomLayoutView,
   cxGridCardView,
   cxGridDBCardView,
   cxGridBandedTableView,
   cxGridDBBandedTableView,
   cxGroupBox,
   cxGridLevel,
   cxCalendar,
   CxPC,
   dxStatusBar,
   cxImage,
   cxButtons,
   cxControls,
   cxContainer,
   cxEdit,
   cxRadioGroup,
   dxToggleSwitch,
   dxGDIPlusClasses,
   cxMemo,
   cxHint,
   cxRichEdit,
   cxStyles,
   cxGrid,
   cxDBData,
   cxFilter,
   cxGraphics,
   cxCustomData,
   cxGridExportLink,
{$ENDREGION}

{$REGION '| VCL |'}
   Vcl.Forms,
   Vcl.Controls,
   Vcl.Dialogs,
   Vcl.StdCtrls,
{$ENDREGION}

{$REGION '| DATA |'}
   Data.DB,
   DataSnap.DBClient,
{$ENDREGION'}

{$REGION '| WINDOWS |'}
   Winapi.Windows,
   Winapi.ShellAPI,
{$ENDREGION}

{$REGION '| FIREDAC |'}
   FireDAC.Stan.Intf,
   FireDAC.Stan.Option,
   FireDAC.Stan.Param,
   FireDAC.Stan.Error,
   FireDAC.DatS,
   FireDAC.Phys.Intf,
   FireDAC.DApt.Intf,
   FireDAC.Comp.DataSet,
   FireDAC.Comp.Client,
{$ENDREGION}

{$REGION '| SYSTEM |'}
   System.SysUtils,
   System.IniFiles,
   System.Variants,
   System.Classes,
   System.MaskUtils,
   System.DateUtils,
   System.Win.ComObj,
   System.UITypes,
   System.Math,
   System.Generics.Collections,
{$ENDREGION}

{$REGION '| APP |'}
   App.Common.Objects,
   App.Common.Types,
   App.Common.Arrays,
   App.Consts.Messages,
   App.Consts.Common,
   App.System.Classes.Collection,
   App.System.DataBase.Objects,
   App.System.SQL.DataBase,
   App.System.Log,
   App.System.Wrapper,
   App.System.Types,
   App.Consts.DataBase,

   Frm.System.Watcher,
   Frm.System.Message,
   Frm.System.CompAssistence, App.System.Controller.Component.Border,
  App.System.RTTI.CustomAttributes, App.System.RTTI.Inspect;
{$ENDREGION}

type

   TcxPainterAccess = class(TcxGridTableDataCellPainter);
   TcxViewInfoAcess = class(TcxGridTableDataCellViewInfo);
   TcxGridSiteAccess = class(TcxGridSite);

   TApplicationControl = class
   public
      /// <summary>
      ///    Obtém a versão que está no banco de dados
      /// </summary>
      class function GetDataBaseVersion: Integer; static;

      /// <summary>
      ///    Obtém a versão atual do projeto
      /// </summary>
      class function GetApplicationVersion: UnicodeString; static;
   end;

   TMessageControl = class
   public
      /// <summary>
      ///    Mostra a mensagem padrão da aplicação
      /// </summary>
      class function ShowMessage(const AType: TTypeMessage; const AText: UnicodeString): Boolean; static;

      /// <summary>
      ///    Mostra a tela de mensagem de WARNING
      /// </summary>
      class function ShowWarn(const AText: UnicodeString): Boolean; static;

      /// <summary>
      ///    Mostra a tela de mensagem de ERROR
      /// </summary>
      class function ShowError(const AText: UnicodeString): Boolean; static;

      /// <summary>
      ///    Mostra a tela de mensagem de SUCESS
      /// </summary>
      class function ShowSucess(const AText: UnicodeString): Boolean; static;

      /// <summary>
      ///    Mostra a tela de mensagem de QUESTION
      /// </summary>
      class function ShowQuestion(const AText: UnicodeString): Boolean; static;

      /// <summary>
      ///    Mostra a tela de mensagem de INFORMATION
      /// </summary>
      class function ShowInformation(const AText: UnicodeString): Boolean; static;
   end;

   TComponentControl = class
   public
      /// <summary>
      ///    Mostra a mensagem de warning, referente ao campo vazio
      /// </summary>
      class procedure ShowWarnFocus(const AComponent: TComponent; const ACaption: UnicodeString); static;

      /// <summary>
      ///    Seta o foco a um componente
      /// </summary>
      class procedure SetFocus(const AComponent: TComponent); static;

      /// <summary>
      ///    Seta o foco no componente e mantém a borda vermelha bold por alguns segundos
      /// </summary>
      class procedure FocusIndicator(const AComponent: TComponent); overload; static;

      /// <summary>
      ///    Seta o foco no componente e abre o Hint de mensagem
      /// </summary>
      class procedure FocusIndicator(const AComponent: TComponent; const AMessageHint: UnicodeString); overload; static;

      /// <summary>
      ///    Mostra um hint do component TcxHint Controller [ Inherited ]
      /// </summary>
      class procedure ShowInheritedHint(const AHint: UnicodeString; AComponent: TComponent; const AType: TTypeShowHint = tshInformation); static;

      /// <summary>
      ///    Esconde o Hint
      /// </summary>
      class procedure HideInheritedHint; static;

      /// <summary>
      ///    Obtém o Texto de um Componente TcxTextEdit
      /// </summary>
      class function GetTextFrom(const ACxEdit: TcxTextEdit): UnicodeString; overload; static;

      /// <summary>
      ///    Obtém o Texto de um Componente TcxMaskEdit
      /// </summary>
      class function GetTextFrom(const ACxMaskEdit: TcxMaskEdit): UnicodeString; overload; static;

      /// <summary>
      ///    Limpa os componentes de uma fonte
      /// </summary>
      class procedure ClearComponents(const ASource: TComponent); static;

      /// <summary>
      ///    Seta ao status READ ONLY dos componentes de um form específico
      /// </summary>
      class procedure ReadOnlyForm(const AForm: TForm; const AStatus: Boolean); static;

      /// <summary>
      ///    Seta ao status ENABLE dos componentes de um form específico
      /// </summary>
      class procedure EnableForm(const AForm: TForm; const AEnabled: Boolean); static;
   end;

   TGridControl = class
   public
      /// <summary>
      ///    Obtém a Linha atual focada no grid
      /// </summary>
      class function FocusedRow(const ADBView: TcxGridDBTableView): Integer; static;

      /// <summary>
      ///    Obtém o contador de linhas
      /// </summary>
      class function RowCount(const ADBView: TcxGridDBTableView): Integer; static;

      /// <summary>
      ///    Cria um TFDMemTable baseado em um TQuery
      /// </summary>
      class function GetDataFromQuery(const AQuery: TQuery): TFDMemTable; static;

      /// <summary>
      ///    Filtra os registros através do LOCATE
      /// </summary>
      class procedure Locate(const ADBView: TcxGridDBTableView; const AField, AText: UnicodeString); static;

      /// <summary>
      ///    Liberá a memória do DataSource/DataSet do Grid
      /// </summary>
      class procedure FreeSource(const ADBView: TcxGridDBTableView); overload; static;

      /// <summary>
      ///    Libera a memória do DataSource/DataSet do LayOutView
      /// </summary>
      class procedure FreeSource(const ALayoutView: TcxGridDBLayoutView); overload; static;

      /// <summary>
      ///    Libera a memória do DataSource/DataSet do DBCardView
      /// </summary>
      class procedure FreeSource(const ADBCardView: TcxGridDBCardView); overload; static;

      /// <summary>
      ///    Seta o indice a linha de foco do grid
      /// </summary>
      class procedure SetFocusedRow(const ADBView: TcxGridDBTableView; const ARow: Integer); static;

      /// <summary>
      ///    Alimenta um grid através de um TQuery
      /// </summary>
      class procedure SetDataOnGrid(const ADBView: TcxGridDBTableView; AQuery: TQuery); overload; static;

      /// <summary>
      ///    Alimenta um grid através de um TClientDataSet
      /// </summary>
      class procedure SetDataOnGrid(const ADBView: TcxGridDBTableView; ADataSet: TDataSet); overload; static;

      /// <summary>
      ///    Alimenta um grid através de um TQuery, juntamente com o CDS que já está criado
      /// </summary>
      class procedure SetDataOnGridCopyFields(const ADBView: TcxGridDBTableView; AQuery: TQuery); static;

      /// <summary>
      ///    Obtém o valor da linha focada do Grid
      /// </summary>
      class function GetValue(const ADBView: TcxGridDBTableView; const AColIndex: Integer): Variant; overload; static;

      /// <summary>
      ///    Obtém o valor da linha passado em parâmetro
      /// </summary>
      class function GetValue(const ADBView: TcxGridDBTableView; const AColIndex, ARow: Integer): Variant; overload; static;

      /// <summary>
      ///    Obtém o valor da linha focado do Grid em INTEGER
      /// </summary>
      class function GetValueInteger(const ADBView: TcxGridDBTableView; const AColIndex: Integer): Integer; overload; static;

      /// <summary>
      ///    Obtém o valor em inteiro da linha passado em parâmetro
      /// </summary>
      class function GetValueInteger(const ADBView: TcxGridDBTableView; const AColIndex, ARow: Integer): Integer; overload; static;

      /// <summary>
      ///    Obtém o valor da linha focado do Grid em INT64
      /// </summary>
      class function GetValueInt64(const ADBView: TcxGridDBTableView; const AColIndex: Integer): Int64; static;

      /// <summary>
      ///    Obtém o valor da linha focado do Grid em STRING
      /// </summary>
      class function GetValueUnicodeString(const ADBView: TcxGridDBTableView; const AColIndex: Integer): UnicodeString; static;

      /// <summary>
      ///    Obtém o valor da linha focada do Grid em CURRENCY
      /// </summary>
      class function GetValueCurrency(const ADBView: TcxGridDBTableView; const AColIndex: Integer): Currency; static;

      /// <summary>
      ///    Seta a property READONLY das colunas
      /// </summary>
      class procedure SetReadOnlyColumns(const AColumn: TCxGridColumn; const AState: Boolean); static;

      /// <summary>
      ///    Obtém o tipo da coluna do CxGrid
      /// </summary>
      class function GetColumnFieldType(const AColumn: TCxGridColumn): TFieldType; static;

      /// <summary>
      ///    Prepara e filtra o grid
      /// </summary>
      class procedure SetFilterToSearch(const AColumn: TcxGridColumn; const ACxEdit: TcxTextEdit; const ACxGroup: TcxGroupBox; out AFieldLocate: UnicodeString); static;

      /// <summary>
      ///    Seta FALSE nas options das colunas
      /// </summary>
      class procedure SetFalseOptionsColumns(const AColumn: TcxGridColumn); static;

      /// <summary>
      ///    Exporta os registros do CxGrid
      /// </summary>
      class procedure ExportToFile(const AGrid: TcxGrid; const ATypeExportGrid: TTypeExportGrid); static;

      /// <summary>
      ///    Obtém o nome do arquivo que será exportado
      /// </summary>
      class function GetFileNameInternal(const AFileType: UnicodeString): UnicodeString; static;

      /// <summary>
      ///    Seta um Style a uma determinada linha em RUNTIME para EXCLUSÃO
      /// </summary>
      class procedure OnGetContextStyleDelete(Sender: TcxCustomGridTableView; AColIndex: Integer; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle); static;

      /// <summary>
      ///    Insere uma imagem de botão para visualização
      /// </summary>
      class procedure OnCustomDrawCellCxGrid(const ADataSet: TDataSet; ACol: TcxGridDBColumn; Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean; const AIndexImage: Integer); static;
   end;

   TDataBaseControl = class
   public
      /// <summary>
      ///    Carrega os campos de uma tabela do banco de dados
      /// </summary>
      class function GetTableFieldsFromDataBase(const ATableName, ASQL: UnicodeString): TCommonCollection; static;

      /// <summary>
      ///    Carrega as FK de uma tabela do banco de dados
      /// </summary>
      class function GetTableForeignKeysFromDataBase(const ATableName, ASQL: UnicodeString): TCommonCollection; static;

      /// <summary>
      ///    Carrega os Index de uma tabela do banco de dados
      /// </summary>
      class function GetTableIndexsFromDataBase(const ATableName, ASQL: UnicodeString): TCommonCollection; static;

      /// <summary>
      ///    Verifica se o banco dados existe no Schema do PostGres
      /// </summary>
      class function DataBaseOnSchemaPostGres: Boolean; static;

      /// <summary>
      ///    Executa uma SQL pelo objeto TQuery
      /// </summary>
      class function ExecuteSQL(const ASQL: UnicodeString): Boolean; static;

      /// <summary>
      ///    Obtém o próximo valor de PK de um objeto [INT64]
      /// </summary>
      class function NextValueFrom(const AObject: TObject): Int64; static;
   end;

   TFileControl = class
   public
      /// <summary>
      ///    Cria uma pasta em um determinado caminho, apresenta mensagem, caso de erro
      /// </summary>
      class procedure CreateFolder(const APath: UnicodeString); static;

      /// <summary>
      ///    Verifica se determinado arquivo, existe no caminho
      /// </summary>
      class function FileExists(const APath: UnicodeString): Boolean; static;

      /// <summary>
      ///    Move um arquivo para outro destino
      /// </summary>
      class procedure MoveFile(const AFilePath, AFileDestiny: UnicodeString); static;

      /// <summary>
      ///    Remove um arquivo definido no seu path
      /// </summary>
      class procedure RemoveFile(const AFilePath: UnicodeString); static;

      /// <summary>
      ///    Escreve no log qualquer atividade referente a arquivo
      /// </summary>
      class procedure SetLogActivityFile(const AText: UnicodeString); static;

      /// <summary>
      ///    Obtem o caminho onde está a aplicação
      /// </summary>
      class function GetApplicationPath: UnicodeString; static;
   end;

   TIniControl = class
   public
      /// <summary>
      ///    Le o caminho do banco de dados no arquivo .ini
      /// </summary>
      class function ReadDataBasePath: UnicodeString; static;

      /// <summary>
      ///    Le o user padrão no arquivo .ini
      /// </summary>
      class function ReadUser: UnicodeString; static;

      /// <summary>
      ///    Le o SERVER de conexão
      /// </summary>
      class function ReadServer: UnicodeString; static;

      /// <summary>
      ///    Le o tipo da conexão com o banco de dados
      /// </summary>
      class function ReadTypeConnection: TTypeConnection; static;

      /// <summary>
      ///    Escreve o user padrão no arquivo.ini
      /// </summary>
      class procedure WriteUser(const AValue: UnicodeString); static;

      /// <summary>
      ///    Escreve o caminho do banco de dados no arquivo .ini
      /// </summary>
      class procedure WriteDataBasePath(const AValue: UnicodeString); static;

      /// <summary>
      ///    Escreve o tipo da conexão com o banco de dados
      /// </summary>
      class procedure WriteTypeConnection(const AValue: TTypeConnection); static;

      /// <summary>
      ///    Escreve o SERVER do banco de dados
      /// </summary>
      class procedure WriteServer(const AValue: UnicodeString); static;
   end;

   TStringControl = class
   public
      /// <summary>
      ///    Remove Chars inválidos de uma String
      /// </summary>
      class function RemoveInvalidChars(const AValue: UnicodeString): UnicodeString; static;

      /// <summary>
      ///    Insere uma quantidade de Char a esquerda de uma String
      /// </summary>
      class function InputCharLeft(const AChar: Char; const AValue: UnicodeString; const ACount: Integer): UnicodeString; static;

      /// <summary>
      ///    Insere uma quantidade de Char a direita de uma String
      /// </summary>
      class function InputCharRigth(const AChar: Char; const AValue: UnicodeString; const ACount: Integer): UnicodeString; static;

      /// <summary>
      ///    Formata um CNPJ
      /// </summary>
      class function FormatCNPJ(const AValue: UnicodeString): UnicodeString; static;

      /// <summary>
      ///    Formata um CPF
      /// </summary>
      class function FormatCPF(const AValue: UnicodeString): UnicodeString; static;
   end;

   TConvertControl = class
   public
      /// <summary>
      ///    Converte uma String em Integer
      /// </summary>
      class function StringToInteger(const AValue: UnicodeString; const ADefValue: Integer = 0): Integer; static;

      /// <summary>
      ///    Converte uma String em Currency
      /// </summary>
      class function StringToCurrency(const AValue: UnicodeString): Currency; static;

      /// <summary>
      ///    Converte uma String em TDateTime
      /// </summary>
      class function StringToDateTime(const AValue: UnicodeString): TDateTime; static;

      /// <summary>
      ///    Converte uma String em Int64
      /// </summary>
      class function StringToInt64(const AValue: UnicodeString; const ADefValue: Int64 = 0): Int64; static;

      /// <summary>
      ///    Converte uma String em Boolean
      /// </summary>
      class function StringToBool(const AValue: UnicodeString): Boolean; static;

      /// <summary>
      ///    Converte um Integer em Boolean
      /// </summary>
      class function IntegerToBool(const AValue: Integer): Boolean; static;

      /// <summary>
      ///    Converte um Integer em String
      /// </summary>
      class function IntegerToString(const AValue: Integer): UnicodeString; static;

      /// <summary>
      ///    Converte um Currency em String
      /// </summary>
      class function CurrencyToString(const AValue: Currency): UnicodeString; static;

      /// <summary>
      ///    Converte um Currency em Moeda String
      /// </summary>
      class function CurrencyToMoneyStr(const AValue: Currency): UnicodeString; static;

      /// <summary>
      ///    Converte um Variant em String
      /// </summary>
      class procedure VarTo(const AVariant: Variant; out AValue: String); overload; static;

      /// <summary>
      ///    Converte um Variant em INT64
      /// </summary>
      class procedure VarTo(const AVariant: Variant; out AValue: Int64); overload; static;

      /// <summary>
      ///    Converte um Variant em Integer
      /// </summary>
      class procedure VarTo(const AVariant: Variant; out AValue: Integer); overload; static;

      /// <summary>
      ///    Converte um Variant em Currency
      /// </summary>
      class procedure VarTo(const AVariant: Variant; out AValue: Currency); overload; static;

      /// <summary>
      ///    Converte um Variant em TDateTime
      /// </summary>
      class procedure VarTo(const AVariant: Variant; out AValue: TDateTime); overload; static;

      /// <summary>
      ///    Converte um Variant em Boolean
      /// </summary>
      class procedure VarTo(const AVariant: Variant; out AValue: Boolean); overload; static;

      /// <summary>
      ///    Grava no log, caso esteja configurado, o erro de conversão
      /// </summary>
      class procedure SetLogErrorConversion(const AValue: Variant; const ATypeIn, ATypeOut, AInfo: UnicodeString); static;
   end;

   TCompareControl = class
   public
      /// <summary>
      ///    IsEqual = INTEGER
      /// </summary>
      class function IsEqual(const A, B: Integer): Boolean; overload; static;

      /// <summary>
      ///    IsEqual = STRING
      /// </summary>
      class function IsEqual(const A, B: UnicodeString): Boolean; overload; static;

      /// <summary>
      ///    IsDistinct = INTEGER
      /// </summary>
      class function IsDistinct(const A, B: Integer): Boolean; overload; static;

      /// <summary>
      ///    IsDistinct = STRING
      /// </summary>
      class function IsDistinct(const A, B: UnicodeString): Boolean; overload; static;

      /// <summary>
      ///    IsDistinct = CURRENCY
      /// </summary>
      class function IsDisctinct(const A, B: Currency): Boolean; overload; static;

      /// <summary>
      ///    IsSmaller = INTEGER
      /// </summary>
      class function IsSmaller(const A, B: Integer): Boolean; overload; static;

      /// <summary>
      ///    IsSmaller = INT64
      /// </summary>
      class function IsSmaller(const A, B: Int64): Boolean; overload; static;

      /// <summary>
      ///    IsSmaller = EXTENDED
      /// </summary>
      class function IsSmaller(const A, B: Extended): Boolean; overload; static;

      /// <summary>
      ///    IsBigger = INTEGER
      /// </summary>
      class function IsBigger(const A, B: Integer): Boolean; overload; static;

      /// <summary>
      ///    IsBigger = EXTENDED
      /// </summary>
      class function IsBigger(const A, B: Extended): Boolean; overload; static;

      /// <summary>
      ///    SameText = STRING
      /// </summary>
      class function SameText(const A, B: UnicodeString): Boolean; static;
   end;

   TWatcherControl = class
   public
      /// <summary>
      ///    Mostra a tela de Watch
      /// </summary>
      class procedure Show(const AMainExecution, ASubExecution: UnicodeString; const ACount: Integer = 0); static;

      /// <summary>
      ///    Atualiza o texto da subexecution
      /// </summary>
      class procedure UpdateSubExecution(const AText: UnicodeString); static;

      /// <summary>
      ///    Atualiza o texto da action
      /// </summary>
      class procedure UpdateActionText(const AText: UnicodeString); static;

      /// <summary>
      ///    Incrementa o progress bar
      /// </summary>
      class procedure IncProgressBar; static;

      /// <summary>
      ///    Seta o valor máximo do progress bar
      /// </summary>
      class procedure SetMaxToProgressBar(const AValue: Double); static;

      /// <summary>
      ///    Fecha a tela de Watch
      /// </summary>
      class procedure Close; static;
   end;


var
   SysFile: TFileControl;
   SysCon: TConvertControl;
   SysIni: TIniControl;
   SysStr: TStringControl;
   SysApp: TApplicationControl;
   SysCc: TCompareControl;
   SysWatcher: TWatcherControl;
   SysDB: TDataBaseControl;
   SysComp: TComponentControl;
   SysGrid: TGridControl;
   SysMsg: TMessageControl;

implementation

{ TFileControl }

uses
   App.System.Vars,
   App.System.RTTI.DAO,
   App.Objects.Entys.Common,
   App.Common.Vars;

class procedure TFileControl.CreateFolder(const APath: UnicodeString);
begin
   if (not DirectoryExists(APath)) then
   begin
      try
         ForceDirectories(APath);
         SysFile.SetLogActivityFile(Format(SWarnFolderCreated, [APath]));
      except
         raise Exception.CreateFmt(SErrorCreateFolder, [APath]);
      end;
   end;
end;

class procedure TFileControl.RemoveFile(const AFilePath: UnicodeString);
begin
   if (not SysFile.FileExists(AFilePath)) then
   begin
      DeleteFile(AFilePath);
      SysFile.SetLogActivityFile(Format(SWarnFileDeleted, [AFilePath]));
   end;
end;

class procedure TFileControl.SetLogActivityFile(const AText: UnicodeString);
begin
   if (gvTraceLog) then
      Log.Write(UnitName, 'TFileControl.Activity', AText);
end;

class function TFileControl.FileExists(const APath: UnicodeString): Boolean;
begin
   Result := System.SysUtils.FileExists(APath);

   if (not Result) then
      SysFile.SetLogActivityFile(Format(SWarnFileDontExist, [APath]));
end;

class function TFileControl.GetApplicationPath: UnicodeString;
begin
   Result := ExtractFilePath(Application.ExeName);
end;

class procedure TFileControl.MoveFile(const AFilePath, AFileDestiny: UnicodeString);
begin
   if SysFile.FileExists(AFilePath) then
   begin
      ChangeFilePath(AFilePath, AFileDestiny);
      SysFile.RemoveFile(AFilePath);
      SysFile.SetLogActivityFile(Format(SWarnFileMoved, [AFilePath, AFileDestiny]));
   end;
end;

{ TConvertControl }

class function TConvertControl.CurrencyToMoneyStr(const AValue: Currency): UnicodeString;
begin
   if (AValue > 0) then
      Result := FormatFloat('#.00', AValue)
   else
      Result := '0';
end;

class function TConvertControl.CurrencyToString(const AValue: Currency): UnicodeString;
begin
   Result := CurrToStr(AValue);
end;

class function TConvertControl.IntegerToBool(const AValue: Integer): Boolean;
begin
   Result := (AValue <> 0);
end;

class function TConvertControl.IntegerToString(const AValue: Integer): UnicodeString;
begin
   try
      Result := AValue.ToString;
   except
      on E: Exception do
      begin
         Result := EmptyStr;
         SysCon.SetLogErrorConversion(AValue, 'Integer', 'String', 'Default Value: Empty');
      end;
   end;
end;

class procedure TConvertControl.SetLogErrorConversion(const AValue: Variant; const ATypeIn, ATypeOut, AInfo: UnicodeString);
begin
   if (gvTraceLog) then
      Log.Write(UnitName, 'Erro de conversão de variavéis', Format(SErrorConvertion, [ATypeIn, AValue, ATypeOut]), AInfo);
end;

class function TConvertControl.StringToBool(const AValue: UnicodeString): Boolean;
begin
   if (not TryStrToBool(AValue, Result)) then
   begin
      Result := False;
      SysCon.SetLogErrorConversion(AValue, 'String', 'Boolean', 'Default Value: False');
   end;
end;

class function TConvertControl.StringToCurrency(const AValue: UnicodeString): Currency;
begin
   if (not TryStrToCurr(AValue, Result)) then
   begin
      Result := 0.00;
      SysCon.SetLogErrorConversion(AValue, 'String', 'Currency', 'Default Value: 0.00');
   end;
end;

class function TConvertControl.StringToDateTime(const AValue: UnicodeString): TDateTime;
begin
   if (not TryStrToDateTime(AValue, Result)) then
   begin
      Result := 0;
      SysCon.SetLogErrorConversion(AValue, 'String', 'TDateTime', 'Default Value: 31/12/1899');
   end;
end;

class function TConvertControl.StringToInt64(const AValue: UnicodeString; const ADefValue: Int64 = 0): Int64;
begin
   if (not TryStrToInt64(AValue, Result)) then
   begin
      Result := ADefValue;
      SysCon.SetLogErrorConversion(AValue, 'String', 'Int64', 'Default Value: ' + ADefValue.ToString);
   end;
end;

class function TConvertControl.StringToInteger(const AValue: UnicodeString; const ADefValue: Integer): Integer;
begin
   if (not TryStrToInt(AValue, Result)) then
   begin
      Result := ADefValue;
      SysCon.SetLogErrorConversion(AValue, 'String', 'Integer', 'Default Value: ' + ADefValue.ToString);
   end;
end;

class procedure TConvertControl.VarTo(const AVariant: Variant; out AValue: Int64);
var
   LStringValue: UnicodeString;
begin
   if (not VarIsNull(AVariant)) then
   begin
      if VarIsType(AVariant, varInt64) then
         AValue := AValue
      else
      if VarIsNumeric(AVariant) then
      begin
         SysCon.VarTo(AVariant, LStringValue);

         if (not LStringValue.IsEmpty) then
            AValue := SysCon.StringToInt64(LStringValue)
         else
            AValue := Null;
      end;
   end
   else
   begin
      AValue := Null;
      SysCon.SetLogErrorConversion(AVariant, 'Variant', 'Int64', 'VarIsNull');
   end
end;

class procedure TConvertControl.VarTo(const AVariant: Variant; out AValue: Currency);
var
   LStringValue: UnicodeString;
begin
   if (not VarIsNull(AVariant)) then
   begin
      if VarIsType(AVariant, varCurrency) then
         AValue := AValue
      else
      if VarIsFloat(AVariant) then
      begin
         SysCon.VarTo(AVariant, LStringValue);

         if (not LStringValue.IsEmpty) then
            AValue := SysCon.StringToCurrency(LStringValue)
         else
            AValue := 0.00;
      end;
   end
   else
   begin
      AValue := 0.00;
      SysCon.SetLogErrorConversion(AVariant, 'Variant', 'Currency', 'VarIsNull');
   end;
end;

class procedure TConvertControl.VarTo(const AVariant: Variant; out AValue: Integer);
var
   LStringValue: UnicodeString;
begin
   if (not VarIsNull(AVariant)) then
   begin
      if VarIsType(AVariant, varInteger) then
         AValue := AValue
      else
      if VarIsNumeric(AVariant) then
      begin
         SysCon.VarTo(AVariant, LStringValue);

         if (not LStringValue.IsEmpty) then
            AValue := SysCon.StringToInteger(LStringValue)
         else
            AValue := Null;
      end;
   end
   else
   begin
      AValue := Null;
      SysCon.SetLogErrorConversion(AVariant, 'Variant', 'Integer', 'VarIsNull');
   end;
end;

class procedure TConvertControl.VarTo(const AVariant: Variant; out AValue: String);
begin
   if (not VarIsNull(AVariant)) then
      AValue := VarToStr(AVariant)
   else
      SysCon.SetLogErrorConversion(AVariant, 'Variant', 'String', 'VarIsNull');
end;

class procedure TConvertControl.VarTo(const AVariant: Variant; out AValue: TDateTime);
var
   LStringValue: UnicodeString;
begin
   if (not VarIsNull(AVariant)) then
   begin
      if VarIsType(AVariant, varDate) then
         AValue := AValue
      else
      if VarIsFloat(AVariant) then
      begin
         SysCon.VarTo(AVariant, LStringValue);

         if (not LStringValue.IsEmpty) then
            AValue := SysCon.StringToDateTime(LStringValue)
         else
            AValue := 0;
      end;
   end
   else
   begin
      AValue := 0;
      SysCon.SetLogErrorConversion(AVariant, 'Variant', 'TDateTime', 'VarIsNull');
   end;
end;

class procedure TConvertControl.VarTo(const AVariant: Variant; out AValue: Boolean);
var
   LIntValue: Integer;
begin
   if (not VarIsNull(AVariant)) then
   begin
      if VarIsType(AVariant, varBoolean) then
         AValue := AVariant
      else
      if VarIsNumeric(AVariant) then
      begin
         SysCon.VarTo(AVariant, LIntValue);
         AValue := (LIntValue <> 0);
      end;
   end
   else
   begin
      AValue := False;
      SysCon.SetLogErrorConversion(AVariant, 'Variant', 'Boolean', 'VarIsNull');
   end;
end;

{ TIniControl }

class function TIniControl.ReadDataBasePath: UnicodeString;
var
   LIniFile: TIniFile;
begin
   LIniFile := TIniFile.Create(IniPath);
   try
      Result := LIniFile.ReadString(IniSectorSystem, IniRowDataBasePath, EmptyStr);
   finally
      FreeAndNil(LIniFile);
   end;
end;

class function TIniControl.ReadServer: UnicodeString;
var
   LIniFile: TIniFile;
begin
   LIniFile := TIniFile.Create(IniPath);
   try
      Result := LIniFile.ReadString(IniSectorSystem, IniRowServer, EmptyStr);
   finally
      FreeAndNil(LIniFile);
   end;
end;

class function TIniControl.ReadTypeConnection: TTypeConnection;
var
   LIniFile: TIniFile;
   LValue: Integer;
begin
   LIniFile := TIniFile.Create(IniPath);
   try
      LValue := LIniFile.ReadInteger(IniSectorSystem, IniRowTypeConnection, -1);

      if (LValue = -1) then
         Result := ttcNone
      else
         Result := TTypeConnection(LValue);
   finally
      FreeAndNil(LIniFile);
   end;
end;

class function TIniControl.ReadUser: UnicodeString;
var
   LIniFile: TIniFile;
begin
   LIniFile := TIniFile.Create(IniPath);
   try
      Result := LIniFile.ReadString(IniSectorSystem, IniRowCommonUser, EmptyStr);
   finally
      FreeAndNil(LIniFile);
   end;
end;

class procedure TIniControl.WriteDataBasePath(const AValue: UnicodeString);
var
   LIniFile: TIniFile;
begin
   LIniFile := TIniFile.Create(IniPath);
   try
      LIniFile.WriteString(IniSectorSystem, IniRowDataBasePath, AValue);
   finally
      FreeAndNil(LIniFile);
   end;
end;

class procedure TIniControl.WriteServer(const AValue: UnicodeString);
var
   LIniFile: TIniFile;
begin
   LIniFile := TIniFile.Create(IniPath);
   try
      LIniFile.WriteString(IniSectorSystem, IniRowServer, AValue);
   finally
      FreeAndNil(LIniFile);
   end;
end;

class procedure TIniControl.WriteTypeConnection(const AValue: TTypeConnection);
var
   LIniFile: TIniFile;
begin
   LIniFile := TIniFile.Create(IniPath);
   try
      LIniFile.WriteInteger(IniSectorSystem, IniRowTypeConnection, Integer(AValue));
   finally
      FreeAndNil(LIniFile);
   end;
end;

class procedure TIniControl.WriteUser(const AValue: UnicodeString);
var
   LIniFile: TIniFile;
begin
   LIniFile := TIniFile.Create(IniPath);
   try
      LIniFile.WriteString(IniSectorSystem, IniRowCommonUser, AValue);
   finally
      FreeAndNil(LIniFile);
   end;
end;

{ TStringControl }

class function TStringControl.FormatCNPJ(const AValue: UnicodeString): UnicodeString;
begin
   Result := FormatMaskText(MaskCNPJ, AValue);
end;

class function TStringControl.FormatCPF(const AValue: UnicodeString): UnicodeString;
begin
   Result := FormatMaskText(MaskCPF, AValue);
end;

class function TStringControl.InputCharLeft(const AChar: Char; const AValue: UnicodeString; const ACount: Integer): UnicodeString;
begin
   Result := StringOfChar(AChar, ACount) + AValue;
end;

class function TStringControl.InputCharRigth(const AChar: Char; const AValue: UnicodeString; const ACount: Integer): UnicodeString;
begin
   Result := AValue + StringOfChar(AChar, ACount);
end;

class function TStringControl.RemoveInvalidChars(const AValue: UnicodeString): UnicodeString;
const
   ArrayOfChars: array [1..55] of String =
   ('<', '>', '!', '@', '#', '$', '%', '¨', '&', '*', '(', ')', '_', '+', '=', '{', '}', '[', ']',
    '?', ';', ':', ',', '|', '*', '"', '~', '^', '´', '`', '¨', 'æ', 'Æ', 'ø', '£', 'Ø', '', 'ª',
    'º', '¿', '®', '½', '¼', 'ß', 'µ', 'þ', 'ý', 'Ý', '/', '\', '{', '|', '}', '-', '.');
var
   LLoop: Integer;
   LNewValue: UnicodeString;
begin
   LNewValue := AValue;

   for LLoop := Low(ArrayOfChars) to High(ArrayOfChars) do
      LNewValue := StringReplace(LNewValue, ArrayOfChars[LLoop], '', [rfReplaceAll]);

   Result := LNewValue;
end;

{ TCompareControl }

class function TCompareControl.IsBigger(const A, B: Integer): Boolean;
begin
   Result := (A > B);
end;

class function TCompareControl.IsDistinct(const A, B: Integer): Boolean;
begin
   Result := (not CompareValue(A, B) > 0) ;
end;

class function TCompareControl.IsEqual(const A, B: Integer): Boolean;
begin
   Result := CompareValue(A, B) = 0;
end;

class function TCompareControl.IsSmaller(const A, B: Integer): Boolean;
begin
   Result := (A < B);
end;

class function TCompareControl.IsBigger(const A, B: Extended): Boolean;
begin
   Result := (A > B);
end;

class function TCompareControl.IsDisctinct(const A, B: Currency): Boolean;
begin
   Result := (A = B);
end;

class function TCompareControl.IsDistinct(const A, B: UnicodeString): Boolean;
begin
   Result := (not A.Equals(B));
end;

class function TCompareControl.IsEqual(const A, B: UnicodeString): Boolean;
begin
   Result := LowerCase(A).Equals(LowerCase(B));
end;

class function TCompareControl.IsSmaller(const A, B: Int64): Boolean;
begin
   if (A = Low(Int64)) or (B = Low(Int64)) then
      Exit(False);

   Result := (A < B);
end;

class function TCompareControl.IsSmaller(const A, B: Extended): Boolean;
begin
   Result := (A < B);
end;

class function TCompareControl.SameText(const A, B: UnicodeString): Boolean;
begin
   Result := System.SysUtils.SameText(A, B);
end;

{ TApplicationControl }

class function TApplicationControl.GetApplicationVersion: UnicodeString;
const
   c_StringInfo = 'StringFileInfo\040904E4\FileVersion';
var
   LInfoSize, LLength: Cardinal;
   LBuffer, LValue: PChar;
begin
   Result := '';

   LInfoSize := GetFileVersionInfoSize(PChar(Application.ExeName), LInfoSize);

   if (LInfoSize > 0) then
   begin
      LBuffer := AllocMem(LInfoSize);
      try
         GetFileVersionInfo(PChar(Application.ExeName), 0, LInfoSize, LBuffer);

         if VerQueryValue(LBuffer, PChar(c_StringInfo), Pointer(LValue), LLength) then
           Result := Trim(LValue);
      finally
         FreeMem(LBuffer, LInfoSize);
      end;
   end;
end;

class function TApplicationControl.GetDataBaseVersion: Integer;
const
   SQL = 'SELECT APPLICATION_VERSION FROM APPLICATION_CONTROL';
var
   LQuery: TQuery;
begin
   LQuery := TQuery.Create;
   try
      LQuery.AddSQL(SQL);

      if LQuery.GetData then
         Result := LQuery.FieldToInteger(cFieldApplicationVersion)
      else
         Result := 0;
   finally
      FreeAndNil(LQuery)
   end;
end;

{ TMessageControl }

class function TMessageControl.ShowError(const AText: UnicodeString): Boolean;
begin
   Result := SysMsg.ShowMessage(tmError, AText);
end;

class function TMessageControl.ShowInformation(const AText: UnicodeString): Boolean;
begin
   Result := SysMSg.ShowMessage(tmInformation, AText);
end;

class function TMessageControl.ShowMessage(const AType: TTypeMessage; const AText: UnicodeString): Boolean;
var
   LForm: TFrmSystemMessage;
begin
   LForm := TFrmSystemMessage.Create(nil);
   try
      LForm.TypeMessage := AType;
      LForm.MessageText := AText;
      LForm.ShowModal;

      Result := (LForm.TypeResult = trConfirmed);
   finally
      FreeAndNil(LForm);
   end;
end;

class function TMessageControl.ShowQuestion(const AText: UnicodeString): Boolean;
begin
   Result := SysMsg.ShowMessage(tmQuestion, AText);
end;

class function TMessageControl.ShowSucess(const AText: UnicodeString): Boolean;
begin
   Result := SysMsg.ShowMessage(tmSucess, AText);
end;

class function TMessageControl.ShowWarn(const AText: UnicodeString): Boolean;
begin
   Result := SysMsg.ShowMessage(tmWarning, AText);
end;

{ TWatcherControl }

class procedure TWatcherControl.Close;
begin
   if Assigned(FrmSystemWatcher) then
   begin
      FrmSystemWatcher.CloseForm;
      FreeAndNil(FrmSystemWatcher);
   end;
end;

class procedure TWatcherControl.IncProgressBar;
begin
   FrmSystemWatcher.IncProgressBar;
end;

class procedure TWatcherControl.SetMaxToProgressBar(const AValue: Double);
begin
   FrmSystemWatcher.SetMaxToProgressBar(AValue);
end;

class procedure TWatcherControl.Show(const AMainExecution, ASubExecution: UnicodeString; const ACount: Integer);
begin
   if (not Assigned(FrmSystemWatcher)) then
      FrmSystemWatcher := TFrmSystemWatcher.Create(nil);

   if (ACount > 0) then
      FrmSystemWatcher.SetMaxToProgressBar(ACount);

   FrmSystemWatcher.SetMainText(AMainExecution);
   FrmSystemWatcher.SetSubText(AMainExecution);
   FrmSystemWatcher.ShowForm;
end;

class procedure TWatcherControl.UpdateActionText(const AText: UnicodeString);
begin
   FrmSystemWatcher.SetActionText(AText);
end;

class procedure TWatcherControl.UpdateSubExecution(const AText: UnicodeString);
begin
   FrmSystemWatcher.SetSubText(AText);
end;

{ TDataBaseControl }

class function TDataBaseControl.ExecuteSQL(const ASQL: UnicodeString): Boolean;
var
   LQuery: TQuery;
begin
   LQuery := TQuery.Create;
   try
      LQuery.AddSQL(ASQL);
      Result := LQuery.Execute;
   finally
      FreeAndNil(LQuery);
   end;
end;

class function TDataBaseControl.DataBaseOnSchemaPostGres: Boolean;
var
   LQuery: TQuery;
   LSystemSQL: TSystemSQLDataBasePostGres;
begin
   LQuery := TQuery.Create;
   LSystemSQL := TSystemSQLDataBasePostGres.Create;
   try
      LQuery.AddSQL(LSystemSQL.DataBaseOnSchemaPostGres);

      Result := LQuery.GetData;
   finally
      FreeAndNil(LSystemSQL);
      FreeAndNil(LQuery);
   end;
end;

class function TDataBaseControl.GetTableFieldsFromDataBase(const ATableName, ASQL: UnicodeString): TCommonCollection;
var
   LQuery: TQuery;
   LDataBaseField: TDataBaseField;
begin
   Result := TCommonCollection.Create;

   LQuery := TQuery.Create;
   try
      LQuery.AddSQL(ASQL);

      if LQuery.GetData then
      begin
         repeat
            LDataBaseField := TDataBaseField.Create;
            LDataBaseField.Name := LQuery.FieldToString(cFieldName);
            LDataBaseField.TypeText := LQuery.FieldToString(cFieldType);
            LDataBaseField.Length := LQuery.FieldToInteger(cFieldLength);
            LDataBaseField.Decimals := LQuery.FieldToInteger(cFieldScale);
            LDataBaseField.IsPrimaryKey := False;
            LDataBaseField.IsNotNull := LQuery.FieldToBool(cFieldIsNull);

            Result.Add(LDataBaseField);

            LQuery.Next;
         until (LQuery.EndOfData);
      end;
   finally
      FreeAndNil(LQuery);
   end;
end;

class function TDataBaseControl.GetTableForeignKeysFromDataBase(const ATableName, ASQL: UnicodeString): TCommonCollection;
var
   LQuery: TQuery;
   LDataBaseFK: TDataBaseForeignKey;
begin
   Result := TCommonCollection.Create;

   LQuery := TQuery.Create;
   try
      LQuery.AddSQL(ASQL);

      if LQuery.GetData then
      begin
         repeat
            LDataBaseFK := TDataBaseForeignKey.Create;
            LDataBaseFK.FieldName := LQuery.FieldToString(cFieldName);
            LDataBaseFK.TableName := ATableName;
            LDataBaseFK.FieldReference := LQuery.FieldToString(cFieldFKField);
            LDataBaseFK.TableReference := LQuery.FieldToString(cFieldReferenceTable);

            Result.Add(LDataBaseFK);

            LQuery.Next;
         until (LQuery.EndOfData);
      end;
   finally
      FreeAndNil(LQuery);
   end;
end;

class function TDataBaseControl.GetTableIndexsFromDataBase(const ATableName, ASQL: UnicodeString): TCommonCollection;
var
   LQuery: TQuery;
   LDataBaseIndex: TDataBaseIndex;
begin
   Result := TCommonCollection.Create;

   LQuery := TQuery.Create;
   try
      LQuery.AddSQL(ASQL);

      if LQuery.GetData then
      begin
         repeat
            LDataBaseIndex := TDataBaseIndex.Create;
            LDataBaseIndex.FieldName := LQuery.FieldToString(cFieldName);
            LDataBaseIndex.TableName := ATableName;

            Result.Add(LDataBaseIndex);
            LQuery.Next;
         until (LQuery.EndOfData);
      end;
   finally
      FreeAndNil(LQuery);
   end;
end;

class function TDataBaseControl.NextValueFrom(const AObject: TObject): Int64;
var
   LQuery: TQuery;
   LSystemSQL: TSystemSQLDataBaseCommon;
   LDBRelation: TDBRelation;
   LInspect: TRTTIInspectObject;
   LSequence: UnicodeString;
begin
   LInspect := TRTTIInspectObject.Create(AObject);
   try
      LDBRelation := LInspect.GetObjectDBRelation;

      LSequence := LDBRelation.Sequence;
   finally
      FreeAndNil(LInspect);
   end;

   case gvTypeConnection of
      ttcFireBird: LSystemSQL := TSystemSQLDataBaseFireBird.Create;
      ttcPostGres: LSystemSQL := TSystemSQLDataBasePostGres.Create;
      ttcOracle: LSystemSQL := TSystemSQLDataBaseOracle.Create;
   else
      LSystemSQL := nil;
   end;

   if (not LSequence.IsEmpty) and (LSystemSQL <> nil) then
   begin
      LQuery := TQuery.Create;
      try
         LQuery.AddSQL(LSystemSQL.GetNextValueSequence(LSequence));

         if LQuery.GetData then
            Result := LQuery.FieldToInt64('ID')
         else
            Result := 0;
      finally
         FreeAndNil(LQuery);
      end;
   end
   else
      Result := 0;
end;

{ TComponentControl }

class function TComponentControl.GetTextFrom(const ACxEdit: TcxTextEdit): UnicodeString;
begin
   Result := ACxEdit.Text;
end;

class procedure TComponentControl.ClearComponents(const ASource: TComponent);
var
   LComponent: TComponent;
begin
   for LComponent in ASource do
   begin
      if LComponent is TEdit then
         TEdit(LComponent).Text := EmptyStr;

      if LComponent is TLabel then
         TLabel(LComponent).Caption := EmptyStr;

      if LComponent is TcxTextEdit then
         TcxTextEdit(LComponent).Text := EmptyStr;

      if LComponent is TCheckBox then
         TCheckBox(LComponent).Checked := False;

      if LComponent is TComboBox then
         TComboBox(LComponent).ItemIndex := -1;

      if LComponent is TcxComboBox then
         TcxComboBox(LComponent).ItemIndex := -1;

      if LComponent is TcxMaskEdit then
         TcxMaskEdit(LComponent).EditText := EmptyStr;

      if LComponent is TcxMemo then
         TcxMemo(LComponent).Lines.Text := EmptyStr;

      if LComponent is TcxRichEdit then
         TcxRichEdit(LComponent).Lines.Text := EmptyStr;

      if LComponent is TcxCurrencyEdit then
         TcxCurrencyEdit(LComponent).Value := 0.00;

      if LComponent is TcxMemo then
         TcxMemo(LComponent).Lines.Text := EmptyStr;

      if LComponent is TcxGridDBTableView then
         SysGrid.FreeSource(TcxGridDBTableView(LComponent));

      if LComponent is TFrame then
         SysComp.ClearComponents(TFrame(LComponent));
   end;
end;

class procedure TComponentControl.EnableForm(const AForm: TForm; const AEnabled: Boolean);
var
   LComponent: TComponent;
   LWinControl: TWinControl;
begin
   for LComponent in AForm do
   begin
      LWinControl := TWinControlClass.Create(LComponent);
      LWinControl.Enabled := AEnabled;
   end;
end;

class procedure TComponentControl.FocusIndicator(const AComponent: TComponent; const AMessageHint: UnicodeString);
begin
   SysComp.ShowInheritedHint(AMessageHint, AComponent,  tshWarning);
   Sleep(1500);
   SysComp.HideInheritedHint;
   SysComp.FocusIndicator(AComponent);
end;

class procedure TComponentControl.FocusIndicator(const AComponent: TComponent);
var
   LWinControl: TWinControl;
begin
   LWinControl := TComponent(AComponent) as TWinControl;
   BorderControl(LWinControl);
   SysComp.SetFocus(AComponent);
end;

class function TComponentControl.GetTextFrom(const ACxMaskEdit: TcxMaskEdit): UnicodeString;
begin
   Result := ACxMaskEdit.EditText;
end;

class procedure TComponentControl.HideInheritedHint;
begin
   FSystemCompAssistence.HintController.HideHint;
end;

class procedure TComponentControl.ReadOnlyForm(const AForm: TForm; const AStatus: Boolean);
var
   LComponent: TComponent;
begin
   for LComponent in AForm do
   begin
      if LComponent is TcxTextEdit then
         TcxTextEdit(LComponent).Properties.ReadOnly := AStatus;

      if LComponent is TcxComboBox then
         TcxComboBox(LComponent).Properties.ReadOnly := AStatus;

      if LComponent is TcxMaskEdit then
         TcxMaskEdit(LComponent).Properties.ReadOnly := AStatus;

      if LComponent is TcxDateEdit then
         TcxDateEdit(LComponent).Properties.ReadOnly := AStatus;

      if LComponent is TdxToggleSwitch then
         TdxToggleSwitch(LComponent).Properties.ReadOnly := AStatus;
   end;
end;

class procedure TComponentControl.SetFocus(const AComponent: TComponent);
var
   LControl: TWinControl;
begin
   LControl := TWinControl(AComponent);

   if (LControl.CanFocus) then
      LControl.SetFocus
   else
     Log.Write(UnitName, 'Focus [Component]', Format(SErrorFocusControl, [LControl.Name, LControl.Owner.Name]));
end;

class procedure TComponentControl.ShowInheritedHint(const AHint: UnicodeString; AComponent: TComponent; const AType: TTypeShowHint);
var
   LPoint: TPoint;
   LWidth: Integer;
   LWinControl: TWinControl;
   LStyle: TcxHintStyle;
   LCaption: UnicodeString;
begin
   LWinControl := TComponent(AComponent) as TWinControl;

   LWidth := LWinControl.Width;

   LPoint.X := LWidth Div 2;
   LPoint.Y := 0;

   LPoint := LWinControl.ClientToScreen(LPoint);

   LStyle := TcxHintStyle(FSystemCompAssistence.HintController.HintStyle);

   case AType of
      tshInformation: begin
                        LCaption := 'Informativo';
                        LStyle.IconType := cxhiInformation;
                      end;
      tshError:       begin
                        LCaption := 'Erro';
                        LStyle.IconType := cxhiError;
                      end;
      tshWarning:     begin
                        LCaption := 'Aviso';
                        LStyle.IconType := cxhiWarning;
                      end;
   end;

   FSystemCompAssistence.HintController.ShowHint(LPoint.X, LPoint.Y, LCaption, AHint);
end;

class procedure TComponentControl.ShowWarnFocus(const AComponent: TComponent; const ACaption: UnicodeString);
begin
   SysMsg.ShowWarn(Format(SEmptyFieldValue, [ACaption]));
   SysComp.FocusIndicator(AComponent);
end;

{ TGridControl }

class procedure TGridControl.ExportToFile(const AGrid: TcxGrid; const ATypeExportGrid: TTypeExportGrid);
var
   LSaveDialog: TSaveDialog;
   LFileName: UnicodeString;
begin
   LSaveDialog := TSaveDialog.Create(nil);
   try
      case ATypeExportGrid of
         teXLS: LFileName := SysGrid.GetFileNameInternal('XLS') + ExportExts[Ord(ATypeExportGrid)];
         teXML: LFileName := SysGrid.GetFileNameInternal('XML') + ExportExts[Ord(ATypeExportGrid)];
         teHTML: LFileName := SysGrid.GetFileNameInternal('HTML') + ExportExts[Ord(ATypeExportGrid)];
         teTXT: LFileName := SysGrid.GetFileNameInternal('TXT') + ExportExts[Ord(ATypeExportGrid)];
         teCSV: LFileName := SysGrid.GetFileNameInternal('CSV') + ExportExts[Ord(ATypeExportGrid)];
         teXLSx: LFileName := SysGrid.GetFileNameInternal('XLSx') + ExportExts[Ord(ATypeExportGrid)];
      end;

      LSaveDialog.FileName := LFileName;
      LSaveDialog.Filter := '*.' + ExportExts[Ord(ATypeExportGrid)] + '| *.' + ExportExts[Ord(ATypeExportGrid)];

      if LSaveDialog.Execute then
      begin
         LFileName := ChangeFileExt(LSaveDialog.FileName, '.' + ExportExts[Ord(ATypeExportGrid)]);

         if FileExists(LFileName) and (not SysMsg.ShowQuestion(Format(SMessageFileExistReWrite, [LFileName]))) then
            Exit;

         case ATypeExportGrid of
            teXLS: ExportGridToExcel(LFileName, AGrid);
            teXML: ExportGridToXML(LFileName, AGrid);
            teHTML: ExportGridToHTML(LFileName, AGrid);
            teTXT: ExportGridToText(LFileName, AGrid);
            teCSV: ExportGridToCSV(LFileName, AGrid);
            teXLSx: ExportGridToXLSX(LFileName, AGrid);
         end;

         if SysMsg.ShowQuestion(Format(SMessageFileOpenQuestion, [LFileName])) then
            ShellExecute(Application.Handle, PChar('OPEN'), PChar(LFileName), nil, nil, 3);
      end;
   finally
      FreeAndNil(LSaveDialog);
   end;
end;

class function TGridControl.FocusedRow(const ADBView: TcxGridDBTableView): Integer;
begin
   Result := ADBView.DataController.GetFocusedRowIndex;
end;

class procedure TGridControl.FreeSource(const ADBView: TcxGridDBTableView);
begin
   if Assigned(ADBView.DataController.DataSet) then
      ADBView.DataController.DataSet.Free;

   if Assigned(ADBView.DataController.DataSource) then
      ADBView.DataController.DataSource.Free;
end;

class procedure TGridControl.FreeSource(const ALayoutView: TcxGridDBLayoutView);
begin
   if Assigned(ALayoutView.DataController.DataSet) then
      ALayoutView.DataController.DataSet.Free;

   if Assigned(ALayoutView.DataController.DataSource) then
      ALayoutView.DataController.DataSource.Free;
end;

class procedure TGridControl.FreeSource(const ADBCardView: TcxGridDBCardView);
begin
   if Assigned(ADBCardView.DataController.DataSet) then
      ADBCardView.DataController.DataSet.Free;

   if Assigned(ADBCardView.DataController.DataSource) then
      ADBCardView.DataController.DataSource.Free;
end;

class function TGridControl.GetColumnFieldType(const AColumn: TCxGridColumn): TFieldType;
var
   LStringValueType: UnicodeString;
begin
   LStringValueType := AColumn.DataBinding.ValueType;

   if LStringValueType.Equals('Integer') then
      Result := ftInteger
   else
   if LStringValueType.Equals('LargeInt') then
      Result := ftLargeint
   else
   if LStringValueType.Equals('String') then
      Result := ftString
   else
   if LStringValueType.Equals('Currency') then
      Result := ftCurrency
   else
   if LStringValueType.Equals('TDateTime') then
      Result := ftDateTime
   else
      Result := ftUnknown;
end;

class function TGridControl.GetDataFromQuery(const AQuery: TQuery): TFDMemTable;
var
   LLoop: Integer;
   LFieldDef: TFieldDef;
begin
   if AQuery = nil then
      Exit(nil);

   Result := TFDMemTable.Create(nil);
   try
      Result.Close;

      for LLoop := 0 to AQuery.GetFieldDef.Count - 1 do
      begin
         LFieldDef := AQuery.GetFieldDef[LLoop];

         Result.FieldDefs.Add(LFieldDef.Name, LFieldDef.DataType, LFieldDef.Size, False);
      end;

      Result.CreateDataSet;

      AQuery.First;
      repeat

         Result.Append;
         Result.CopyFields(AQuery.GetDataSet);
         Result.Post;

         AQuery.Next;
      until AQuery.EndOfData;

      Result.First;
   except
      on E: Exception do
      begin
         Result.Free;
         raise Exception.Create(SErrorConvertQueryToMemTable + sLineBreak + E.Message);
      end;
   end
end;

class function TGridControl.GetFileNameInternal(const AFileType: UnicodeString): UnicodeString;
begin
   Result := AFileType + '_' + 'USER_NAME_AQUI' + '.';
end;

class function TGridControl.GetValue(const ADBView: TcxGridDBTableView; const AColIndex: Integer): Variant;
var
   LFocusedRow: Integer;
begin
   LFocusedRow := SysGrid.FocusedRow(ADBView);

   if (AColIndex > -1) and (LFocusedRow > -1) then
      Result := ADBView.ViewData.Rows[LFocusedRow].Values[AColIndex]
   else
      Result := Null;
end;

class function TGridControl.GetValue(const ADBView: TcxGridDBTableView; const AColIndex, ARow: Integer): Variant;
begin
   if (AColIndex > -1) and (ARow > -1) then
      Result := ADBView.ViewData.Rows[ARow].Values[AColIndex]
   else
      Result := Null;
end;

class function TGridControl.GetValueCurrency(const ADBView: TcxGridDBTableView; const AColIndex: Integer): Currency;
var
   LVariant: Variant;
begin
   LVariant := SysGrid.GetValue(ADBView, AColIndex);

   SysCon.VarTo(LVariant, Result);
end;

class function TGridControl.GetValueInt64(const ADBView: TcxGridDBTableView; const AColIndex: Integer): Int64;
var
   LVariant: Variant;
begin
   LVariant := SysGrid.GetValue(ADBView, AColIndex);

   SysCon.VarTo(LVariant, Result);
end;

class function TGridControl.GetValueInteger(const ADBView: TcxGridDBTableView; const AColIndex: Integer): Integer;
var
   LVariant: Variant;
begin
   LVariant := SysGrid.GetValue(ADBView, AColIndex);

   SysCon.VarTo(LVariant, Result);
end;

class function TGridControl.GetValueInteger(const ADBView: TcxGridDBTableView; const AColIndex, ARow: Integer): Integer;
var
   LVariant: Variant;
begin
   LVariant := SysGrid.GetValue(ADBView, AColIndex);

   SysCon.VarTo(LVariant, Result);
end;

class function TGridControl.GetValueUnicodeString(const ADBView: TcxGridDBTableView; const AColIndex: Integer): UnicodeString;
var
   LVariant: Variant;
begin
   LVariant := SysGrid.GetValue(ADBView, AColIndex);

   SysCon.VarTo(LVariant, Result);
end;

class procedure TGridControl.Locate(const ADBView: TcxGridDBTableView; const AField, AText: UnicodeString);
var
   LMemTable: TFDMemTable;
   LFieldType: TFieldType;
begin
   if (AField.IsEmpty) then
      Exit;

   if Assigned(ADBView.DataController.DataSet) then
   begin
      LMemTable := TFDMemTable(ADBView.DataController.DataSet);

      if AText.IsEmpty then
      begin
         LMemTable.Filter := EmptyStr;
         LMemTable.Filtered := False;
         Exit;
      end;

      LMemTable.DisableControls;
      ADBView.DataController.BeginFullUpdate;
      try
         LFieldType := LMemTable.FieldByName(AField).DataType;

         if LFieldType in [ftInteger, ftLargeint, ftSmallint, ftShortint] then
            LMemTable.Filter := AField + ' = ' + AText
         else
            LMemTable.Filter := AField + ' LIKE ''%' + AText + '%''';

         LMemTable.FilterOptions := [foCaseInsensitive];
         LMemTable.Filtered := True;
      finally
         ADBView.DataController.EndFullUpdate;
         LMemTable.EnableControls;
      end;
   end;
end;

class procedure TGridControl.OnCustomDrawCellCxGrid(const ADataSet: TDataSet; ACol: TcxGridDBColumn; Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean; const AIndexImage: Integer);
var
   LPainter: TcxPainterAccess;
begin
   if (ADataSet = nil) then
      Exit;

   if (AViewInfo.Item = ACol) then
   begin
      try
         LPainter := TcxPainterAccess(TcxViewInfoAcess(AViewInfo).GetPainterClass.Create(ACanvas, AViewInfo));
         LPainter.DrawContent;
         LPainter.DrawBorders;

         FSystemCompAssistence.IconList16.Draw(ACanvas.Canvas, AViewInfo.ClientBounds.Left + 1, AViewInfo.ClientBounds.Top + 1, AIndexImage);

         ADone := True;
      finally
         FreeAndNil(LPainter);
      end;
   end;
end;

class procedure TGridControl.OnGetContextStyleDelete(Sender: TcxCustomGridTableView; AColIndex: Integer; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
   LDeleted: Boolean;
begin
   if (Sender.DataController.RecordCount > 0) then
   begin
      Sender.DataController.BeginUpdate;

      SysCon.VarTo(ARecord.Values[AColIndex], LDeleted);

      if (LDeleted) then
         AStyle := FSystemCompAssistence.CxStyleDeleted
      else
         AStyle := nil;

      Sender.DataController.EndUpdate;
   end;
end;

class function TGridControl.RowCount(const ADBView: TcxGridDBTableView): Integer;
begin
   Result := ADBView.DataController.RowCount;
end;

class procedure TGridControl.SetDataOnGrid(const ADBView: TcxGridDBTableView; ADataSet: TDataSet);
var
   LDataSource: TDataSource;
begin
   if (ADataSet <> nil) then
   begin
      ADBView.DataController.BeginFullUpdate;
      try
         if (not Assigned(ADBView.DataController.DataSource)) then
            LDataSource := TDataSource.Create(nil)
         else
            LDataSource := ADBView.DataController.DataSource;

         LDataSource.DataSet := ADataSet;
         ADBView.DataController.DataSource := LDataSource;
      finally
         ADBView.DataController.EndFullUpdate;
      end;
   end;
end;

class procedure TGridControl.SetDataOnGrid(const ADBView: TcxGridDBTableView; AQuery: TQuery);
var
   LDataSource: TDataSource;
begin
   SysGrid.FreeSource(ADBView);

   if (AQuery <> nil) then
   begin
      LDataSource := TDataSource.Create(nil);
      LDataSource.DataSet := AQuery.GetDataSet;

      ADBView.DataController.BeginFullUpdate;
      try
         ADBView.DataController.DataSource := LDataSource;
      finally
         ADBView.DataController.EndFullUpdate;
      end;
   end;
end;

class procedure TGridControl.SetDataOnGridCopyFields(const ADBView: TcxGridDBTableView; AQuery: TQuery);
var
   LFDMemTable: TFDMemTable;
begin
   if (AQuery.EmptyData) then
      Exit;

   LFDMemTable := TFDMemTable(ADBView.DataController.DataSet);
   LFDMemTable.DisableControls;
   try
      ADBView.DataController.BeginFullUpdate;
      repeat

         LFDMemTable.Append;
         LFDMemTable.CopyFields(AQuery.GetDataSet);
         LFDMemTable.Post;

         AQuery.Next;
      until AQuery.EndOfData;

      ADBView.DataController.EndFullUpdate;
   finally
      LFDMemTable.EnableControls;
   end;
end;

class procedure TGridControl.SetFalseOptionsColumns(const AColumn: TcxGridColumn);
begin
   AColumn.Options.AutoWidthSizable := False;
   AColumn.Options.CellMerging := False;
   AColumn.Options.GroupFooters := False;
   AColumn.Options.Grouping := False;
   AColumn.Options.HorzSizing := False;
   AColumn.Options.Moving := False;
   AColumn.Options.Editing := False;
   AColumn.Options.Filtering := False;
   AColumn.Options.FilteringAddValueItems := False;
   AColumn.Options.FilteringFilteredItemsList := False;
   AColumn.Options.FilteringMRUItemsList := False;
   AColumn.Options.FilteringPopup := False;
   AColumn.Options.FilteringPopupMultiSelect := False;
   AColumn.Options.FilteringWithFindPanel := False;
   AColumn.Options.IgnoreTimeForFiltering := False;
   AColumn.Options.IncSearch := False;
end;

class procedure TGridControl.SetFilterToSearch(const AColumn: TcxGridColumn; const ACxEdit: TcxTextEdit; const ACxGroup: TcxGroupBox; out AFieldLocate: UnicodeString);
begin
   ACxGroup.Caption := 'Pesquisar por ' + AnsiUpperCase(AColumn.Caption);
   AFieldLocate := AColumn.DataBinding.FilterFieldName;
   ACxEdit.Text := EmptyStr;
   SysComp.SetFocus(ACxEdit);
end;

class procedure TGridControl.SetFocusedRow(const ADBView: TcxGridDBTableView; const ARow: Integer);
begin
   if (ARow <= ADBView.DataController.RecordCount) then
      ADBView.DataController.FocusedRowIndex := ARow
   else
      Log.Write('App.Common.Utils', SErrorExceptionSilent, SErrorFocusedRowGrid, 'ComponentName: ' + ADBView.Name);
end;

class procedure TGridControl.SetReadOnlyColumns(const AColumn: TCxGridColumn; const AState: Boolean);
begin
   AColumn.Properties.ReadOnly := AState;
end;

end.

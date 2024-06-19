unit Frm.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxContainer,
  cxEdit,
  cxTextEdit,
  cxMaskEdit,
  cxDropDownEdit,
  cxBlobEdit,
  Vcl.Menus,
  Vcl.StdCtrls, cxButtons,
  App.System.Classes.Collection,
  App.System.RTTI.Builder.SQL.Generate,
  App.System.RTTI.CustomAttributes,
  App.System.Types, dxSparkline, dxflchrt, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.WinXPanels, Vcl.ExtCtrls, Vcl.TitleBarCtrls;

type

  [TDBRelation('TESTE', 'ID_TESTE')]
  TTeste = class
  private
    FfDescricao: UnicodeString;
    FfID: Integer;
    procedure SetfDescricao(const Value: UnicodeString);
    procedure SetfID(const Value: Integer);
  public
     [TPropertyData('ID', True, True)]
     [TPropertyInteger]
     property fID: Integer read FfID write SetfID;

     [TPropertyData('DESC_TESTE', False, False)]
     [TPropertyString(15)]
     property fDescricao: UnicodeString read FfDescricao write SetfDescricao;
  end;

  TFrmMain = class(TForm)
    cxButton1: TcxButton;
    MemoSQL: TMemo;
    FDMemTable1: TFDMemTable;
    procedure cxButton1Click(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses App.System.Vars, App.System.RTTI.DAO;

{ TTeste }

procedure TTeste.SetfDescricao(const Value: UnicodeString);
begin
  FfDescricao := Value;
end;

procedure TTeste.SetfID(const Value: Integer);
begin
  FfID := Value;
end;

procedure TFrmMain.cxButton1Click(Sender: TObject);
var
   LSQL: UnicodeString;
   LBuilder: TRTTIBuilderSQL;
   LTeste, TestOuter: TTeste;
   LPersistent: TRTTIDataAcessObject;
   LList: TCommonCollection;
   LLoop: TObject;
begin
   gvTraceLog := True;


{   LBuilder := TRTTIBuilderSQL.Create(LTeste, tbscreate);
   try
      LSQL := LBuilder.GetSQL;
      MemoSQL.Lines.Text := LSQL;
   finally
      FreeAndNil(LBuilder);
//      FreeAndNil(LTeste);
   end;

   LBuilder := TRTTIBuilderSQL.Create(LTeste, tbsList);
   try
      LSQL := LBuilder.GetSQL;
      MemoSQL.Lines.Text := LSQL;
   finally
      FreeAndNil(LBuilder);
   end;   }


   try
      {for LLoop := 0 to 9 do
      begin

         LTeste := TTeste.Create;
         LPersistent := TRTTIDataAcessObject.Create(LTeste);
         LTeste.FfDescricao := LLoop.ToString + 'RAFAEL';
         LPersistent.Insert;
         FreeAndNil(LTeste);
         LPersistent.Free;
      end;     }

    LTeste := TTeste.Create;
    LPersistent := TRTTIDataAcessObject.Create(LTeste);
    //  LList := LPersistent.ListOf;


    for LLoop in LList do
    begin
       TestOuter := TTeste(LLoop);

       MemoSQL.Lines.Add(TestOuter.FfDescricao);
    end;

   finally
      if Assigned(LTeste) then
         LTeste.Free;

      FreeAndNil(LPersistent);
   end;


end;

end.

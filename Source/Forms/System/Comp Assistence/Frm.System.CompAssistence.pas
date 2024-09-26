{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit Frm.System.CompAssistence;

interface

uses
  Winapi.Windows,  cxHint, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  cxGraphics, cxClasses, cxStyles, Vcl.AppEvnts, FireDAC.Phys.FBDef, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, dxScreenTip, dxCustomHint,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxTextEdit, cxGroupBox,
  dxCore, dxColorEdit, FireDAC.Phys.PGDef, FireDAC.Phys.PG,
  App.System.Vars, cxImageList, App.Consts.Common;

type

   TFSystemCompAssistence = class(TForm)
      IconList16: TcxImageList;
      IconList32: TcxImageList;
      HintController: TcxHintStyleController;
      OpenDialog: TOpenDialog;
      ApplicationEvents: TApplicationEvents;
      FDPhysPgDriverLink: TFDPhysPgDriverLink;
      StyleRepository: TcxStyleRepository;
      CxStyleTitle: TcxStyle;
      CxStyleContent: TcxStyle;
      CxStyleDeleted: TcxStyle;
      CxStyleSelection: TcxStyle;
      CxStyleConfirmed: TcxStyle;
      CxStyleWait: TcxStyle;
      CxStyleExecuted: TcxStyle;
      procedure ApplicationEventsDeactivate(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure ApplicationEventsException(Sender: TObject; E: Exception);
   private
   public
   end;

var
  FSystemCompAssistence: TFSystemCompAssistence;

implementation

uses
   App.Common.Utils, App.System.Log;

{$R *.dfm}

procedure TFSystemCompAssistence.ApplicationEventsDeactivate(Sender: TObject);
begin
   HintController.HideHint;
end;

procedure TFSystemCompAssistence.ApplicationEventsException(Sender: TObject; E: Exception);
var
   LExceptionObject: TObject;
   LStackTrace: UnicodeString;
begin
   LExceptionObject := System.ExceptObject;

   if (LExceptionObject <> nil) and (LExceptionObject.InheritsFrom(Exception)) then
      LStackTrace := Exception(LExceptionObject).StackTrace;

   SysMsg.ShowError(E.Message);
   Log.Write('ApplicationEvents', 'ExceptionRaised', E.Message + sLineBreak + 'Stack Trace:' + sLineBreak + LStackTrace);
end;

procedure TFSystemCompAssistence.FormCreate(Sender: TObject);
begin
   inherited;
   FSystemCompAssistence.CxStyleSelection.Color := DefaultMainColor;
   FSystemCompAssistence.CxStyleTitle.Color := DefaultColumnColor;
   FSystemCompAssistence.CxStyleTitle.TextColor := DefaultTitleColor;
end;

end.

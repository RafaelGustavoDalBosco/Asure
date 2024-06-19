{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit Frm.System.Ancestral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  Vcl.Buttons, App.Consts.Common, App.Consts.Messages;

type

   TFrmSystemAncestral = class(TForm)
      PnlMain: TPanel;
      PnlUpper: TPanel;
      BtMaximize: TcxButton;
      BtMinimize: TcxButton;
      BtClose: TcxButton;
      procedure PnlUpperMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure BtMaximizeClick(Sender: TObject);
      procedure BtMinimizeClick(Sender: TObject);
      procedure BtCloseClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   protected
      /// <summary>
      ///    Controla a digitação da tecla Alt para os atalhos
      /// </summary>
      procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;

      /// <summary>
      ///    Envia o comando para manipular a posição do Form
      /// </summary>
      procedure SendSystemCommand(const ACommand: Integer);
   strict protected
      /// <summary>
      ///    Método Call Show
      /// </summary>
      procedure OpeningForm; virtual;

      /// <summary>
      ///    Método Call Create
      /// </summary>
      procedure CreatingForm; virtual;

      /// <summary>
      ///    Método Call Close
      /// </summary>
      procedure ClosingForm; virtual;
   end;

var
  FrmSystemAncestral: TFrmSystemAncestral;

implementation

uses
   App.Common.Utils, App.System.Vars;

{$R *.dfm}

{ TFrmAncestral }

procedure TFrmSystemAncestral.BtCloseClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFrmSystemAncestral.BtMaximizeClick(Sender: TObject);
begin
   if (Self.WindowState <> wsMaximized) then
      Self.WindowState := wsMaximized
   else
      Self.WindowState := wsNormal;
end;

procedure TFrmSystemAncestral.BtMinimizeClick(Sender: TObject);
begin
   Self.WindowState := wsMinimized;
end;

procedure TFrmSystemAncestral.ClosingForm;
begin
   // -> Cada form pode ter as suas implementações
end;

procedure TFrmSystemAncestral.CMDialogChar(var Message: TCMDialogChar);
begin
   if (ssAlt in KeyDataToShiftState(Message.KeyData)) then
      inherited;
end;

procedure TFrmSystemAncestral.CreatingForm;
begin
   // -> Cada form pode ter as suas implementações
end;

procedure TFrmSystemAncestral.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ClosingForm;
end;

procedure TFrmSystemAncestral.FormCreate(Sender: TObject);
begin
   inherited;
   CreatingForm;
end;

procedure TFrmSystemAncestral.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_ESCAPE) then
   begin
      if SysMsg.ShowQuestion(SMessageExitScreen) then
         Close;
   end;

   inherited;
end;

procedure TFrmSystemAncestral.FormShow(Sender: TObject);
begin
   inherited;
   PnlUpper.Caption := Caption;
   PnlUpper.Color := DefaultMainColor;
   OpeningForm;
end;

procedure TFrmSystemAncestral.OpeningForm;
begin
   // -> Cada form pode ter as suas implementações
end;

procedure TFrmSystemAncestral.PnlUpperMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   inherited;
   ReleaseCapture;
   BringToFront;
   SendSystemCommand($F012);
end;

procedure TFrmSystemAncestral.SendSystemCommand(const ACommand: Integer);
begin
   Perform(WM_SYSCOMMAND, ACommand, 0);

   if Assigned(Parent) then
      Parent.Repaint;
end;

end.

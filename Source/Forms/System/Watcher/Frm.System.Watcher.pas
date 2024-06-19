{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit Frm.System.Watcher;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, cxControls, cxContainer, cxEdit, dxActivityIndicator,
  cxProgressBar, cxLabel, System.Types, Vcl.WinXCtrls, Frm.System.CompAssistence,
  cxHeader, App.System.Vars, App.Consts.Common;

type

   TFrmSystemWatcher = class(TFrmSystemAncestral)
      ProgressBar: TcxProgressBar;
      ActivityIndicator: TdxActivityIndicator;
      LblMainExecution: TLabel;
      LblSubExecution: TLabel;
      LblAction: TLabel;
   private
      FCanClose: Boolean;
      FWindowList: TTaskWindowList;
      FLSaveFocusState: TFocusState;
      FSaveCursor: TCursor;
      FSaveCount: Integer;
      FActiveWindow: HWnd;
   protected
      /// <summary>
      ///    Action Close Form
      /// </summary>
      procedure DoClose(var Action: TCloseAction); override;
   public
      ModeSilent: Boolean;

      /// <summary>
      ///    Evento abertura Form
      /// </summary>
      procedure ShowForm;

      /// <summary>
      ///    Evento fechamento Form
      /// </summary>
      procedure CloseForm;

      /// <summary>
      ///    Fechamento do Form
      /// </summary>
      procedure Close;

      /// <summary>
      ///    Incrementa o ProgressBar em + 1
      /// </summary>
      procedure IncProgressBar;

      /// <summary>
      ///    Determina o máximo do ProgressBar
      /// </summary>
      procedure SetMaxToProgressBar(const AValue: Double);

      /// <summary>
      ///    Seta o texto principal da tela
      /// </summary>
      procedure SetMainText(const ACaption: UnicodeString);

      /// <summary>
      ///    Seta o sub texto da tela
      /// </summary>
      procedure SetSubText(const ACaption: UnicodeString);

      /// <summary>
      ///    Seta o texto de ação da tela
      /// </summary>
      procedure SetActionText(const ACaption: UnicodeString);

      /// <summary>
      ///    Evento de abertura do Form
      /// </summary>
      procedure OpeningForm; override;
   end;

var
  FrmSystemWatcher: TFrmSystemWatcher;

implementation

type
   PTaskWindow = ^TTaskWindow;

   TTaskWindow = record
      Next: PTaskWindow;
      Window: HWnd;
   end;

   TTaskWindowType = PTaskWindow;

var
  TaskActiveWindow: HWnd = 0;
  TaskFirstWindow: HWnd = 0;
  TaskFirstTopMost: HWnd = 0;
  DisablingWindows: Boolean = False;
  TaskWindowList: TTaskWindowType = nil;

{$R *.dfm}

function DoFindWindow(Window: HWnd; Param: LPARAM): Bool; {$IFNDEF CLR} stdcall; {$ENDIF}
begin
   if (Window <> TaskActiveWindow) and (Window <> Application.Handle) and IsWindowVisible(Window) and IsWindowEnabled(Window) then
   begin
      if GetWindowLong(Window, GWL_EXSTYLE) and WS_EX_TOPMOST = 0 then
      begin
         if TaskFirstWindow = 0 then
            TaskFirstWindow := Window;
      end
      else
      begin
         if TaskFirstTopMost = 0 then
            TaskFirstTopMost := Window;
      end;
   end;

   Result := True;
end;

function FindTopMostWindow(ActiveWindow: HWnd): HWnd;
var
   EnumProc: TFNWndEnumProc;
begin
   TaskActiveWindow := ActiveWindow;
   TaskFirstWindow := 0;
   TaskFirstTopMost := 0;
   EnumProc := @DoFindWindow;
   EnumThreadWindows(GetCurrentThreadID, EnumProc, 0);

   if (TaskFirstWindow <> 0) then
      Result := TaskFirstWindow
   else
      Result := TaskFirstTopMost;
end;

{ TFrmSystemWatcher }

procedure TFrmSystemWatcher.Close;
var
   CloseAction: TCloseAction;
begin
   FCanClose := System.True;

   if fsModal in FFormState then
      ModalResult := mrCancel
   else
   if CloseQuery then
   begin
      if FormStyle = fsMDIChild then
      begin
         if biMinimize in BorderIcons then
            CloseAction := caMinimize
         else
            CloseAction := caNone;
      end
      else
         CloseAction := caHide;

      DoClose(CloseAction);

      if CloseAction <> caNone then
      begin
         if Application.MainForm = Self then
            Application.Terminate
         else if CloseAction = caHide then
            Hide
         else if CloseAction = caMinimize then
            WindowState := wsMinimized
         else
            Release;
      end;
   end;
end;

procedure TFrmSystemWatcher.CloseForm;
begin
   FCanClose := System.True;

   SendMessage(Handle, CM_DEACTIVATE, 0, 0);

   if GetActiveWindow <> Handle then
      FActiveWindow := 0;

   Hide;

   if Screen.CursorCount = FSaveCount then
      Screen.Cursor := FSaveCursor
   else
      Screen.Cursor := crDefault;

   EnableTaskWindows(FWindowList);

   if Screen.SaveFocusedList.Count > 0 then
   begin
      Screen.FocusedForm := TCustomForm(Screen.SaveFocusedList.First);
      Screen.SaveFocusedList.Remove(Screen.FocusedForm);
   end
   else
      Screen.FocusedForm := nil;

   if (FActiveWindow <> 0) and not IsWindow(FActiveWindow) then
      FActiveWindow := FindTopMostWindow(0);

   if FActiveWindow <> 0 then
      SetActiveWindow(FActiveWindow);

   RestoreFocusState(FLSaveFocusState);
   Exclude(FFormState, fsModal);

   Application.ModalFinished;
end;

procedure TFrmSystemWatcher.DoClose(var Action: TCloseAction);
begin
   inherited;
   if (not FCanClose) then
      Action := caNone;
end;

procedure TFrmSystemWatcher.IncProgressBar;
begin
   ProgressBar.Position := ProgressBar.Position + 1;
   Application.ProcessMessages;
end;

procedure TFrmSystemWatcher.OpeningForm;
begin
   if ModeSilent then
      ProgressBar.Visible := False;

   ActivityIndicator.Active := True;
end;

procedure TFrmSystemWatcher.SetActionText(const ACaption: UnicodeString);
begin
   LblAction.Caption := ACaption;
   Self.Refresh;
end;

procedure TFrmSystemWatcher.SetMainText(const ACaption: UnicodeString);
begin
   LblMainExecution.Caption := ACaption;
   Self.Refresh;
end;

procedure TFrmSystemWatcher.SetSubText(const ACaption: UnicodeString);
begin
   LblSubExecution.Caption := ACaption;
   Self.Refresh;
end;

procedure TFrmSystemWatcher.SetMaxToProgressBar(const AValue: Double);
begin
   ProgressBar.Properties.Max := AValue;
   ProgressBar.Properties.Min := 0; // do not change
   Self.Refresh;
end;

procedure TFrmSystemWatcher.ShowForm;
begin
   CancelDrag;

   if GetCapture <> 0 then
      SendMessage(GetCapture, WM_CANCELMODE, 0, 0);

   ReleaseCapture;
   Application.ModalStarted;

   FActiveWindow := GetActiveWindow;
   Include(FFormState, fsModal);

   if (PopupMode = pmNone) and (Application.ModalPopupMode <> pmNone) then
   begin
      RecreateWnd;
      HandleNeeded;

      if (FActiveWindow = 0) or not IsWindow(FActiveWindow) then
         FActiveWindow := GetActiveWindow;
   end;

   FLSaveFocusState := SaveFocusState;
   Screen.SaveFocusedList.Insert(0, Screen.FocusedForm);
   Screen.FocusedForm := Self;
   FSaveCursor := Screen.Cursor;
   Screen.Cursor := crDefault;
   FSaveCount := Screen.CursorCount;
   FWindowList := DisableTaskWindows(0);

   SendMessage(Handle, CM_ACTIVATE, 0, 0);

   ProgressBar.Properties.BeginColor := DefaultMainColor;
   ProgressBar.Properties.EndColor := DefaultTitleColor;

   Show;
end;

end.

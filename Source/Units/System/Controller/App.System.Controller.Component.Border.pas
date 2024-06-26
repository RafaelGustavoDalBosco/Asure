﻿{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.System.Controller.Component.Border;

interface

uses
   Winapi.Windows,
   Winapi.Messages,
   System.Types,
   System.SysUtils,
   System.Variants,
   System.Classes,

   Vcl.Graphics,
   Vcl.Controls,
   Vcl.Forms,
   Vcl.Dialogs,
   Vcl.Themes;

type

   TBorderComponent = class(TCustomControl)
   public
      const
      WidthBorder = 2;

      procedure WMTimer(var Message: TWMTimer); message WM_TIMER;
   protected
      /// <summary>
      ///    Mensagem de transparência
      /// </summary>
      procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;

      /// <summary>
      ///    Mensagem de pintura do Windows
      /// </summary>
      procedure WMNCPaint(var Message: TWMNCPaint); message WM_NCPAINT;

      /// <summary>
      ///    Cria os parâmetros
      /// </summary>
      procedure CreateParams(var Params: TCreateParams); override;
   public
      FromColor: TColor;
      ToColor: TColor;
      Factor: Integer;
      Activating: Boolean;

      /// <summary>
      ///    Ativa a borda
      /// </summary>
      procedure ActiveBorder(Rect: TRect);

      /// <summary>
      ///    Colore a borda
      /// </summary>
      procedure Paint; override;

      /// <summary>
      ///    Encerra a pintura
      /// </summary>
      procedure EndThis;

      constructor Create(AControl: TControl; var CursorPos: TPoint); reintroduce;
   end;

procedure BorderControl(Control: TControl);

implementation

procedure BorderControl(Control: TControl);
var
   CursorPos: TPoint;
begin
   if Control <> nil then
   begin
      TBorderComponent.Create(Control, CursorPos);
      Winapi.Windows.SetCursorPos(CursorPos.X, CursorPos.Y);
   end;
end;

{ TBorderComponent }

procedure TBorderComponent.ActiveBorder(Rect: TRect);
type
   TAnimationStyle = (atSlideNeg, atSlidePos, atBlend);
const
   AnimationStyle: array[TAnimationStyle] of Integer = (AW_VER_NEGATIVE, AW_VER_POSITIVE, AW_BLEND);
var
   Animate: BOOL;
   Style: TAnimationStyle;
   RGNIn, RGNOut: HRGN;
begin
   Activating := True;
   try
      UpdateBoundsRect(Rect);

      SetWindowPos(Handle, HWND_TOPMOST, Rect.Left, Rect.Top, Width, Height, SWP_NOACTIVATE);

      RGNOut := Winapi.Windows.CreateRectRgn(0, 0, ClientWidth, ClientHeight);
      RGNIn := Winapi.Windows.CreateRectRgn(WidthBorder, WidthBorder, (ClientWidth - WidthBorder), (ClientHeight - (WidthBorder)));

      Winapi.Windows.CombineRgn(RGNOut, RGNOut, RGNIn, RGN_XOR);
      Winapi.Windows.SetWindowRgn(Handle, RGNOut, False);

      if Assigned(AnimateWindowProc) and IsConsole then
      begin
         SystemParametersInfo(SPI_GETTOOLTIPANIMATION, 0, {$IFNDEF CLR}@{$ENDIF}Animate, 0);

         if Animate then
         begin
            SystemParametersInfo(SPI_GETTOOLTIPFADE, 0, {$IFNDEF CLR}@{$ENDIF}Animate, 0);

            if Animate then
               Style := TAnimationStyle.atBlend
            else
            if Mouse.CursorPos.Y > Rect.Top then
               Style := TAnimationStyle.atSlideNeg
            else
               Style := TAnimationStyle.atSlidePos;

            AnimateWindowProc(Handle, 100, AnimationStyle[Style] or AW_SLIDE);
         end;
      end;

      ShowWindow(Handle, SW_SHOWNOACTIVATE);
      Invalidate;
   finally
      Activating := False;
   end;
end;

constructor TBorderComponent.Create(AControl: TControl; var CursorPos: TPoint);
var
   R: TRect;
   ControlBounds: TRect;
begin
   FromColor := clWebRed;
   ToColor := clWhite;

   inherited Create(nil);

   ControlBounds := AControl.BoundsRect;
   ControlBounds.SetLocation(AControl.ClientToScreen(Point(0, 0)));

   ActiveBorder(Rect(ControlBounds.Left - WidthBorder, ControlBounds.Top - WidthBorder, ControlBounds.Left + ControlBounds.Width + (WidthBorder * 1),
    ControlBounds.Top + ControlBounds.Height + (WidthBorder * 1)));

   Winapi.Windows.GetWindowRect(Handle, R);
   CursorPos.X := (R.Left + (R.Right - R.Left) div 2);
   CursorPos.Y := (R.Top + (R.Bottom - R.Top) div 2);
   Winapi.Windows.SetTimer(Handle, 1, 125, nil);
end;

procedure TBorderComponent.CreateParams(var Params: TCreateParams);
begin
   inherited CreateParams(Params);

   Params.Style := WS_POPUP or WS_BORDER;
   Params.WindowClass.Style := Params.WindowClass.Style or CS_SAVEBITS;

   if CheckWin32Version(5, 1) then
      Params.WindowClass.Style := Params.WindowClass.style or CS_DROPSHADOW;

   if NewStyleControls then
      Params.ExStyle := WS_EX_TOOLWINDOW;

   AddBiDiModeExStyle(Params.ExStyle);
end;

procedure TBorderComponent.EndThis;
begin
   KillTimer(Handle, 1);
   Hide;
   Destroy;
end;

procedure TBorderComponent.Paint;
var
   R1, R2, G1, G2, B1, B2, R, G, B: Byte;
   F1, F2: Double;
begin
   F2 := (Factor / 16);
   F1 := (1 - F2);

   // RED
   R1 := GetRValue(FromColor);
   R2 := GetRValue(ToColor);

   // GREEN
   G1 := GetGValue(FromColor);
   G2 := GetGValue(ToColor);

   // BLUE
   B1 := GetBValue(FromColor);
   B2 := GetBValue(ToColor);

   R := Round((R1 * F1) + (R2 * F2));
   G := Round((G1 * F1) + (G2 * F2));
   B := Round((B1 * F1) + (B2 * F2));

   Canvas.Brush.Color := RGB(R, G, B);
   Canvas.FillRect(ClientRect);
end;

procedure TBorderComponent.WMNCHitTest(var Message: TWMNCHitTest);
begin
   Message.Result := HTTRANSPARENT;
end;

procedure TBorderComponent.WMNCPaint(var Message: TWMNCPaint);
var
   DC: HDC;
   R: TRect;
   Details: TThemedElementDetails;
begin
   DC := GetWindowDC(Handle);
   try
      R := System.Types.Rect(0, 0, Width, Height);

      if not StyleServices.Enabled then
         Winapi.Windows.DrawEdge(DC, R, BDR_RAISEDOUTER, BF_RECT)
      else
      begin
         Details := StyleServices.GetElementDetails(twWindowRoot);
         StyleServices.DrawEdge(DC, Details, R, [eeRaisedOuter], [efRect]);
      end;
   finally
      ReleaseDC(Handle, DC);
   end;
end;

procedure TBorderComponent.WMTimer(var Message: TWMTimer);
begin
   Inc(Factor);

   if (Factor = 16) then
      EndThis
   else
      Repaint;
end;

end.

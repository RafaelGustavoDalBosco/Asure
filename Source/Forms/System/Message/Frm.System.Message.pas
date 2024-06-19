unit Frm.System.Message;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral, cxGraphics,
   cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons,
   Vcl.ExtCtrls, cxControls, cxContainer, cxEdit, dxGDIPlusClasses, cxImage,
   cxTextEdit, cxMemo, cxRichEdit, App.System.Types;

type

   TFrmSystemMessage = class(TFrmSystemAncestral)
      BtConfirm: TcxButton;
      BtCancel: TcxButton;
      BtOk: TcxButton;
      CxImgSucess: TcxImage;
      CxImgError: TcxImage;
      CxImgQuestion: TcxImage;
      CxImgWarning: TcxImage;
      CxImgInformation: TcxImage;
      MemoText: TcxMemo;
      procedure BtConfirmClick(Sender: TObject);
      procedure BtCancelClick(Sender: TObject);
      procedure BtOkClick(Sender: TObject);
   private
      FTypeMessage: TTypeMessage;
      FMessageText: UnicodeString;
      FTypeResult: TTypeResult;
      procedure SetTypeMessage(const Value: TTypeMessage);
      procedure SetMessageText(const Value: UnicodeString);
      procedure SetTypeResult(const Value: TTypeResult);
   strict private
      /// <summary>
      ///    Altera o form baseado no tipo da mensagem
      /// </summary>
      procedure SetFormByType;

      /// <summary>
      ///    Altera o form para WARNING
      /// </summary>
      procedure SetTypeWarning;

      /// <summary>
      ///    Altera o form para ERROR
      /// </summary>
      procedure SetTypeError;

      /// <summary>
      ///    Altera o form para SUCESS
      /// </summary>
      procedure SetTypeSucess;

      /// <summary>
      ///    Altera o form para QUESTION
      /// </summary>
      procedure SetTypeQuestion;

      /// <summary>
      ///    Altera o form para Information
      /// </summary>
      procedure SetTypeInformation;
   strict protected
      /// <summary>
      /// Método Call Show
      /// </summary>
      procedure OpeningForm; override;
   public
      property TypeMessage: TTypeMessage read FTypeMessage write SetTypeMessage;
      property MessageText: UnicodeString read FMessageText write SetMessageText;
      property TypeResult: TTypeResult read FTypeResult write SetTypeResult;
   end;

var
   FrmSystemMessage: TFrmSystemMessage;

implementation

{$R *.dfm}
{ TFrmSystemMessage }

procedure TFrmSystemMessage.BtCancelClick(Sender: TObject);
begin
   inherited;
   SetTypeResult(trCanceled);
   Close;
end;

procedure TFrmSystemMessage.BtConfirmClick(Sender: TObject);
begin
   inherited;
   SetTypeResult(trConfirmed);
   Close;
end;

procedure TFrmSystemMessage.BtOkClick(Sender: TObject);
begin
   inherited;
   SetTypeResult(trConfirmed);
   Close;
end;

procedure TFrmSystemMessage.OpeningForm;
begin
   inherited;
   SetFormByType;
   MemoText.Lines.Add(MessageText);
end;

procedure TFrmSystemMessage.SetFormByType;
begin
   case FTypeMessage of
      tmWarning: SetTypeWarning;
      tmError: SetTypeError;
      tmQuestion: SetTypeQuestion;
      tmSucess: SetTypeSucess;
      tmInformation: SetTypeInformation;
      tmNone: raise Exception.Create('Type Not Defined!');
   end;
end;

procedure TFrmSystemMessage.SetMessageText(const Value: UnicodeString);
begin
   FMessageText := Value;
end;

procedure TFrmSystemMessage.SetTypeError;
begin
   CxImgError.Visible := True;
   BtOk.Visible := True;
   BtOk.Enabled := True;
end;

procedure TFrmSystemMessage.SetTypeInformation;
begin
   CxImgInformation.Visible := True;
   BtOk.Visible := True;
   BtOk.Enabled := True;
end;

procedure TFrmSystemMessage.SetTypeMessage(const Value: TTypeMessage);
begin
   FTypeMessage := Value;
end;

procedure TFrmSystemMessage.SetTypeQuestion;
begin
   CxImgQuestion.Visible := True;
   BtConfirm.Visible := True;
   BtCancel.Visible := True;
   BtConfirm.Enabled := True;
   BtCancel.Enabled := True;
end;

procedure TFrmSystemMessage.SetTypeResult(const Value: TTypeResult);
begin
   FTypeResult := Value;
end;

procedure TFrmSystemMessage.SetTypeSucess;
begin
   CxImgSucess.Visible := True;
   BtOk.Visible := True;
   BtOk.Enabled := True;
end;

procedure TFrmSystemMessage.SetTypeWarning;
begin
   CxImgWarning.Visible := True;
   BtOk.Visible := True;
   BtOk.Enabled := True;
end;

end.

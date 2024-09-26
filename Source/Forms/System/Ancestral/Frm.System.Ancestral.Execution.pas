unit Frm.System.Ancestral.Execution;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, cxControls, cxContainer, cxEdit, cxGroupBox;

type

   TFrmSystemAncestralExecution = class(TFrmSystemAncestral)
      GrbButtons: TcxGroupBox;
      BtConfirm: TcxButton;
      BtCancel: TcxButton;
   private

   public

   end;

var
  FrmSystemAncestralExecution: TFrmSystemAncestralExecution;

implementation

{$R *.dfm}

end.

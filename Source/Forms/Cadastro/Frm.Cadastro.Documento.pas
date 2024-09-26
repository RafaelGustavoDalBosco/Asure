unit Frm.Cadastro.Documento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral.Cadastro,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxBarBuiltInMenu, cxControls, cxContainer, cxEdit, cxCheckBox, dxToggleSwitch,
  cxTextEdit, cxGroupBox, cxPC, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls;

type
  TFrmCadastroDocumento = class(TFrmSystemAncestralCadastro)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroDocumento: TFrmCadastroDocumento;

implementation

{$R *.dfm}

end.

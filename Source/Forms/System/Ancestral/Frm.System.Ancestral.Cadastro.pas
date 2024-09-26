{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit Frm.System.Ancestral.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, dxBarBuiltInMenu, cxControls, cxPC, cxContainer, cxEdit,
  cxGroupBox, Frm.System.CompAssistence, App.Objects.Entys, cxTextEdit,
  App.Common.Utils, App.System.Types, cxMaskEdit, cxDropDownEdit, cxLabel,
  cxCurrencyEdit, cxCheckBox, dxToggleSwitch, App.Consts.Messages,
  App.System.RTTI.DAO, App.Common.Vars, App.System.Controller.Blocker;

type

   TFrmSystemAncestralCadastro = class(TFrmSystemAncestral)
      PgMain: TcxPageControl;
      PnlHeader: TPanel;
      TabSheetDados: TcxTabSheet;
      GrbButtons: TcxGroupBox;
      BtConfirm: TcxButton;
      BtCancel: TcxButton;
      GrbID: TcxGroupBox;
      EdtID: TcxTextEdit;
      GrbStatus: TcxGroupBox;
      TsStatus: TdxToggleSwitch;
      procedure BtConfirmClick(Sender: TObject);
      procedure BtCancelClick(Sender: TObject);
   private
      FID: Int64;
      FEnty: TEntyRecord;
      FTypeAction: TTypeAction;
      FStatus: Boolean;
      FTypeResult: TTypeResult;
      FBlocker: TSystemControllerBlocker;
      procedure SetID(const Value: Int64);
      procedure SetEnty(const Value: TEntyRecord);
      procedure SetTypeAction(const Value: TTypeAction);
      procedure SetStatus(const Value: Boolean);
      procedure SetTypeResult(const Value: TTypeResult);
      procedure SetBlocker(const Value: TSystemControllerBlocker);

      /// <summary>
      ///    Obtém o ID do registro
      /// </summary>
      function GetID: Int64;

      /// <summary>
      ///    Obtém a Entidade correspondente do Form
      /// </summary>
      function GetEnty: TEntyRecord;

      /// <summary>
      ///    Obtém o Status da Entidade
      /// </summary>
      function GetStatus: Boolean;

      /// <summary>
      ///    Obtém o Controle de Blocker
      /// </summary>
      function GetBlocker: TSystemControllerBlocker;
   protected
      /// <summary>
      ///    Limpa os componentes da tela
      /// </summary>
      procedure ClearForm; virtual;

      /// <summary>
      ///    Insere os dados no objeto do form
      /// </summary>
      procedure SetValuesOnObject; virtual;

      /// <summary>
      ///    Insere os dados no form do objeto
      /// </summary>
      procedure SetValuesOnForm; virtual;

      /// <summary>
      ///    Preenche os campos do form
      /// </summary>
      procedure AssignSelfFields; virtual; abstract;

      /// <summary>
      ///    Obtém a Class Parent do Form
      /// </summary>
      function GetParentClass: TClass; virtual; abstract;

      /// <summary>
      ///    Valida as informações digitadas no FORM
      /// </summary>
      function Validate: Boolean; virtual;
   strict protected
      /// <summary>
      ///    Persiste as informações do objeto
      /// </summary>
      function PersistForm: Boolean;

      /// <summary>
      ///    Confirma o Form
      /// </summary>
      procedure ApplyForm;

      /// <summary>
      ///    Cancela o Form
      /// </summary>
      procedure CancelForm;

      /// <summary>
      ///    Altera o form para se comportar como INSERT
      /// </summary>
      procedure ShapeShiftInsert;

      /// <summary>
      ///    Altera o form para se comportar como UPDATE
      /// </summary>
      procedure ShapeShiftUpdate;

      /// <summary>
      ///    Altera o form para se comportar como DELETE
      /// </summary>
      procedure ShapeShiftDelete;

       /// <summary>
      ///    Método Call Show
      /// </summary>
      procedure OpeningForm; override;
   public
      property ID: Int64 read GetID write SetID;
      property Enty: TEntyRecord read GetEnty write SetEnty;
      property Blocker: TSystemControllerBlocker read GetBlocker write SetBlocker;
      property TypeAction: TTypeAction read FTypeAction write SetTypeAction;
      property TypeResult: TTypeResult read FTypeResult write SetTypeResult;
      property Status: Boolean read GetStatus write SetStatus;
   end;

var
  FrmSystemAncestralCadastro: TFrmSystemAncestralCadastro;

implementation

{$R *.dfm}

{ TFrmSystemAncestralCadastro }

procedure TFrmSystemAncestralCadastro.ApplyForm;
begin
   if (Validate) and (SysMsg.ShowQuestion(SMessageConfirm)) then
   begin
      SetValuesOnObject;

      if PersistForm then
      begin
         TypeResult := trConfirmed;
         SysMsg.ShowSucess(SMessageSucess);
         Close;
      end
      else
      begin
         TypeResult := trCanceled;
         SysMsg.ShowError(Format(SMessageError, ['Persistent Failure!']));
      end;
   end;
end;

procedure TFrmSystemAncestralCadastro.BtCancelClick(Sender: TObject);
begin
   inherited;
   CancelForm;
end;

procedure TFrmSystemAncestralCadastro.BtConfirmClick(Sender: TObject);
begin
   inherited;
   ApplyForm;
end;

procedure TFrmSystemAncestralCadastro.CancelForm;
begin
   FTypeResult := trCanceled;
   Close;
end;

procedure TFrmSystemAncestralCadastro.ClearForm;
begin
   EdtID.Text := '';
   TsStatus.Checked := True;
   SysComp.ClearComponents(Self);
   Blocker.Finalize;
   FreeAndNil(FBlocker);
end;

function TFrmSystemAncestralCadastro.GetBlocker: TSystemControllerBlocker;
begin
   if (not Assigned(FBlocker)) then
      FBlocker := TSystemControllerBlocker.Create(ID, Enty.ClassName);

   Result := FBlocker;
end;

function TFrmSystemAncestralCadastro.GetEnty: TEntyRecord;
begin
   if (not Assigned(FEnty)) then
      FEnty := TEntyRecord(GetParentClass.Create);

   Result := FEnty;
end;

function TFrmSystemAncestralCadastro.GetID: Int64;
begin
   Result := SysCon.StringToInt64(EdtID.Text);
end;

function TFrmSystemAncestralCadastro.GetStatus: Boolean;
begin
   Result := TsStatus.Checked;
end;

procedure TFrmSystemAncestralCadastro.OpeningForm;
begin
   inherited;

   case TypeAction of
      taInsert: ShapeShiftInsert;
      taUpdate: ShapeShiftUpdate;
      taDelete: ShapeShiftDelete;
   end;
end;

function TFrmSystemAncestralCadastro.PersistForm: Boolean;
var
   LDAO: TRTTIDataAcessObject;
begin
   LDAO := TRTTIDataAcessObject.Create(Enty);
   try
      case TypeAction of
         taInsert: Result := LDAO.Insert;
         taUpdate: Result := LDAO.Update;
         taDelete: Result := LDAO.Delete;
      else
         Result := False;
      end;
   finally
      FreeAndNil(LDAO);
   end;
end;

procedure TFrmSystemAncestralCadastro.SetBlocker(const Value: TSystemControllerBlocker);
begin
   FBlocker := Value;
end;

procedure TFrmSystemAncestralCadastro.SetEnty(const Value: TEntyRecord);
begin
   FEnty := Value;
end;

procedure TFrmSystemAncestralCadastro.SetID(const Value: Int64);
begin
   FID := Value;
end;

procedure TFrmSystemAncestralCadastro.SetStatus(const Value: Boolean);
begin
   FStatus := Value;
end;

procedure TFrmSystemAncestralCadastro.SetTypeAction(const Value: TTypeAction);
begin
   FTypeAction := Value;
end;

procedure TFrmSystemAncestralCadastro.SetTypeResult(const Value: TTypeResult);
begin
   FTypeResult := Value;
end;

procedure TFrmSystemAncestralCadastro.SetValuesOnForm;
var
   LDAO: TRTTIDataAcessObject;
begin
   Enty.ID := ID;
   Enty.IdEmpresa := gvEmpresa.ID;

   LDAO := TRTTIDataAcessObject.Create(Enty);
   try
      if LDAO.Select then
      begin
         if (not Blocker.Get) then
            Exit;

         EdtID.Text := SysCon.IntegerToString(Enty.ID);
         TsStatus.Checked := Enty.Status;
         AssignSelfFields;
      end;
   finally
      FreeAndNil(LDAO);
   end;
end;

procedure TFrmSystemAncestralCadastro.SetValuesOnObject;
begin
   Enty.ID := ID;
   Enty.Status := Status;
   Enty.IdEmpresa := gvEmpresa.ID;
end;

procedure TFrmSystemAncestralCadastro.ShapeShiftDelete;
begin
   ClearForm;
   PnlHeader.Caption := 'EXCLUIR';
   PnlHeader.Font.Color := clWebRed;
   SetValuesOnForm;
end;

procedure TFrmSystemAncestralCadastro.ShapeShiftInsert;
var
   LID: Int64;
begin
   LID := SysDB.NextValueFrom(Enty);

   if (LID < 0) then
      LID := 1;

   ClearForm;
   PnlHeader.Caption := 'NOVO';
   PnlHeader.Font.Color := clWebGreen;
   EdtID.Text := SysCon.IntegerToString(LID);
end;

procedure TFrmSystemAncestralCadastro.ShapeShiftUpdate;
begin
   ClearForm;
   PnlHeader.Caption := 'EDITAR';
   PnlHeader.Font.Color := clWebYellow;
   SetValuesOnForm;
end;

function TFrmSystemAncestralCadastro.Validate: Boolean;
begin
   if (ID <= 0) then
   begin
      SysComp.ShowWarnFocus(EdtID, 'ID');
      Exit(False);
   end;

   Result := True;
end;

end.

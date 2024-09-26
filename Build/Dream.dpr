program Dream;



{$R *.dres}

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Frm.Main in '..\Source\Forms\Frm.Main.pas' {FrmMain},
  App.System.Connection in '..\Source\Units\System\Connection\App.System.Connection.pas',
  App.System.Types in '..\Source\Units\System\Types\App.System.Types.pas',
  App.System.Connection.Params in '..\Source\Units\System\Connection\App.System.Connection.Params.pas',
  App.Consts.Messages in '..\Source\Units\Consts\Messages\App.Consts.Messages.pas',
  App.System.Connection.Transaction in '..\Source\Units\System\Connection\App.System.Connection.Transaction.pas',
  App.System.Vars in '..\Source\Units\System\Vars\App.System.Vars.pas',
  App.System.Wrapper in '..\Source\Units\System\Wrapper\App.System.Wrapper.pas',
  App.System.RTTI.CustomAttributes in '..\Source\Units\System\RTTI\App.System.RTTI.CustomAttributes.pas',
  App.System.RTTI.Inspect in '..\Source\Units\System\RTTI\App.System.RTTI.Inspect.pas',
  App.System.RTTI.Builder.SQL.Generate in '..\Source\Units\System\RTTI\App.System.RTTI.Builder.SQL.Generate.pas',
  App.System.DataBase.Objects in '..\Source\Units\System\DataBase\App.System.DataBase.Objects.pas',
  App.System.Classes.Collection in '..\Source\Units\System\Classes\App.System.Classes.Collection.pas',
  App.System.Engine in '..\Source\Units\System\Engine\App.System.Engine.pas',
  App.System.Log in '..\Source\Units\System\Log\App.System.Log.pas',
  App.Consts.Common in '..\Source\Units\Consts\Common\App.Consts.Common.pas',
  App.Common.Utils in '..\Source\Units\Common\App.Common.Utils.pas',
  App.System.DataBase.Controller in '..\Source\Units\System\DataBase\App.System.DataBase.Controller.pas',
  App.System.SQL.DataBase in '..\Source\Units\System\SQL\App.System.SQL.DataBase.pas',
  App.Objects.Entys.Common in '..\Source\Units\Objects\Entys\Common\App.Objects.Entys.Common.pas',
  App.Consts.DataBase in '..\Source\Units\Consts\DataBase\App.Consts.DataBase.pas',
  App.Objects.Entys in '..\Source\Units\Objects\Entys\App.Objects.Entys.pas',
  App.System.DataBase.Consistency in '..\Source\Units\System\DataBase\App.System.DataBase.Consistency.pas',
  Frm.System.Watcher in '..\Source\Forms\System\Watcher\Frm.System.Watcher.pas',
  Frm.System.Ancestral in '..\Source\Forms\System\Ancestral\Frm.System.Ancestral.pas' {FrmSystemAncestral},
  Frm.System.CompAssistence in '..\Source\Forms\System\Comp Assistence\Frm.System.CompAssistence.pas' {FSystemCompAssistence},
  Frm.System.Message in '..\Source\Forms\System\Message\Frm.System.Message.pas' {FrmSystemMessage},
  App.System.RTTI.DAO in '..\Source\Units\System\RTTI\App.System.RTTI.DAO.pas',
  Frm.System.Ancestral.Cadastro in '..\Source\Forms\System\Ancestral\Frm.System.Ancestral.Cadastro.pas' {FrmSystemAncestralCadastro},
  App.System.Classes in '..\Source\Units\System\Classes\App.System.Classes.pas',
  App.Common.Types in '..\Source\Units\Common\App.Common.Types.pas',
  App.Common.Objects in '..\Source\Units\Common\App.Common.Objects.pas',
  App.Common.Arrays in '..\Source\Units\Common\App.Common.Arrays.pas',
  App.Common.Records in '..\Source\Units\Common\App.Common.Records.pas',
  App.System.Controller.Component.Border in '..\Source\Units\System\Controller\App.System.Controller.Component.Border.pas',
  App.Common.Vars in '..\Source\Units\Common\App.Common.Vars.pas',
  App.Objects.Enty.Documento in '..\Source\Units\Objects\Entys\Cadastro\App.Objects.Enty.Documento.pas',
  App.Objects.Enty.Empresa in '..\Source\Units\Objects\Entys\Cadastro\App.Objects.Enty.Empresa.pas',
  App.Objects.Enty.Usuario in '..\Source\Units\Objects\Entys\Cadastro\App.Objects.Enty.Usuario.pas',
  App.System.Controller.Blocker in '..\Source\Units\System\Controller\App.System.Controller.Blocker.pas',
  Frm.System.Ancestral.CRUD in '..\Source\Forms\System\Ancestral\Frm.System.Ancestral.CRUD.pas' {FrmSystemAncestralCRUD},
  App.System.Controller.Register in '..\Source\Units\System\Controller\App.System.Controller.Register.pas',
  Frm.Cadastro.Empresa in '..\Source\Forms\Cadastro\Frm.Cadastro.Empresa.pas' {FrmCadastroEmpresa},
  Frm.CRUD.Empresa in '..\Source\Forms\CRUD\Frm.CRUD.Empresa.pas' {FrmCRUDEmpresa},
  Frm.Cadastro.Usuario in '..\Source\Forms\Cadastro\Frm.Cadastro.Usuario.pas' {FrmCadastroUsuario},
  Frm.CRUD.Usuario in '..\Source\Forms\CRUD\Frm.CRUD.Usuario.pas' {FrmCRUDUsuario},
  App.Objects.Enty.Documento.Tipo in '..\Source\Units\Objects\Entys\Cadastro\App.Objects.Enty.Documento.Tipo.pas',
  App.Objects.Enty.Pagamento.Formas in '..\Source\Units\Objects\Entys\Cadastro\App.Objects.Enty.Pagamento.Formas.pas',
  App.Objects.Enty.Banco.Conta in '..\Source\Units\Objects\Entys\Cadastro\App.Objects.Enty.Banco.Conta.pas',
  App.Objects.Enty.Banco.Conta.Cartao in '..\Source\Units\Objects\Entys\Cadastro\App.Objects.Enty.Banco.Conta.Cartao.pas',
  App.Objects.Enty.Pagamento in '..\Source\Units\Objects\Entys\Cadastro\App.Objects.Enty.Pagamento.pas',
  App.Objects.Enty.Root.Documento.Parcela in '..\Source\Units\Objects\Entys\Root\App.Objects.Enty.Root.Documento.Parcela.pas',
  App.Objects.Enty.Income.Month in '..\Source\Units\Objects\Entys\Cadastro\App.Objects.Enty.Income.Month.pas',
  Frm.Cadastro.Banco.Conta in '..\Source\Forms\Cadastro\Frm.Cadastro.Banco.Conta.pas' {FrmCadastroBancoConta},
  Frm.CRUD.Banco.Conta in '..\Source\Forms\CRUD\Frm.CRUD.Banco.Conta.pas' {FrmCRUDBancoConta},
  Frm.Cadastro.Banco.Conta.Cartao in '..\Source\Forms\Cadastro\Frm.Cadastro.Banco.Conta.Cartao.pas' {FrmCadastroBancoContaCartao},
  Frm.CRUD.Banco.Conta.Cartao in '..\Source\Forms\CRUD\Frm.CRUD.Banco.Conta.Cartao.pas' {FrmCRUDBancoContaCartao},
  App.Common.SQL.Custom in '..\Source\Units\Common\App.Common.SQL.Custom.pas',
  Frm.Cadastro.Documento.Tipo in '..\Source\Forms\Cadastro\Frm.Cadastro.Documento.Tipo.pas' {FrmCadastroDocumentoTipo},
  Frm.Cadastro.Pagamento.Formas in '..\Source\Forms\Cadastro\Frm.Cadastro.Pagamento.Formas.pas' {FrmCadastroPagamentoFormas},
  Frm.CRUD.Pagamento.Formas in '..\Source\Forms\CRUD\Frm.CRUD.Pagamento.Formas.pas' {FrmCRUDPagamentoFormas},
  Frm.CRUD.Documento.Tipo in '..\Source\Forms\CRUD\Frm.CRUD.Documento.Tipo.pas' {FrmCRUDDocumentoTipo},
  Frm.Cadastro.Documento in '..\Source\Forms\Cadastro\Frm.Cadastro.Documento.pas' {FrmCadastroDocumento},
  Frm.System.Ancestral.Execution in '..\Source\Forms\System\Ancestral\Frm.System.Ancestral.Execution.pas' {FrmSystemAncestralExecution},
  App.System.Search in '..\Source\Units\System\Search\App.System.Search.pas',
  Frm.System.Search in '..\Source\Forms\System\Search\Frm.System.Search.pas' {FrmSystemSearch},
  App.Objects.Searchs in '..\Source\Units\Objects\Searchs\App.Objects.Searchs.pas';

{$R *.res}

var
   LEngine: TSystemEngine;
begin
   ReportMemoryLeaksOnShutdown := True;

   LEngine := TSystemEngine.Create;
   try
      if LEngine.Execute then
      begin
         Application.Initialize;
         Application.MainFormOnTaskbar := True;
         Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFSystemCompAssistence, FSystemCompAssistence);
  Application.Run;
      end;
   finally
      LEngine.Free;
   end;

end.

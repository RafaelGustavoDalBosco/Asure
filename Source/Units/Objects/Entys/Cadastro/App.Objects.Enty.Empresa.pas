{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.Objects.Enty.Empresa;

interface

uses
   App.Objects.Entys, App.System.RTTI.CustomAttributes, App.Consts.DataBase, App.Common.Utils, App.System.Classes, App.System.Vars;

type

   [TDBRelation(cTableEmpresa, cSequenceCommon + 'EMPRESA', cCommentTableEmpresa)]
   TEntyEmpresa = class(TEnty)
   strict private
      FTipoPessoa: Integer;
      FCNPJ: UnicodeString;
      FCPF: UnicodeString;
      FRazaoSocial: UnicodeString;
      procedure SetCNPJ(const Value: UnicodeString);
      procedure SetCPF(const Value: UnicodeString);
      procedure SetRazaoSocial(const Value: UnicodeString);
      procedure SetTipoPessoa(const Value: Integer);
   public
      [TPropertyData(cFieldRazaoSocial, True)]
      [TPropertyString(cLengthNome)]
      property RazaoSocial: UnicodeString read FRazaoSocial write SetRazaoSocial;

      [TPropertyData(cFieldTipoPessoa, True)]
      [TPropertyInteger]
      property TipoPessoa: Integer read FTipoPessoa write SetTipoPessoa;

      [TPropertyData(cFieldCPF)]
      [TPropertyString(cLengthCPF)]
      property CPF: UnicodeString read FCPF write SetCPF;

      [TPropertyData(cFieldCNPJ)]
      [TPropertyString(cLengthCNPJ)]
      property CNPJ: UnicodeString read FCNPJ write SetCNPJ;
   end;

implementation

{ TEntyEmpresa }

uses App.System.Controller.Register;

procedure TEntyEmpresa.SetCNPJ(const Value: UnicodeString);
begin
   SetFieldValue(FCNPJ, Value);
end;

procedure TEntyEmpresa.SetCPF(const Value: UnicodeString);
begin
   SetFieldValue(FCPF, Value);
end;

procedure TEntyEmpresa.SetRazaoSocial(const Value: UnicodeString);
begin
   SetFieldValue(FRazaoSocial, Value);
end;

procedure TEntyEmpresa.SetTipoPessoa(const Value: Integer);
begin
   SetFieldValue(FTipoPessoa, Value);
end;

initialization
   TSystemRegisterRelation.Register(TEntyEmpresa);
end.

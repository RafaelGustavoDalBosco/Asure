unit App.Objects.Enty.Usuario;

interface

uses
   App.Objects.Entys, App.System.RTTI.CustomAttributes, App.Consts.DataBase, App.Common.Utils, App.System.Classes, App.System.Vars;

type

   [TDBRelation(cTableUsuario, cSequenceCommon + 'USUARIO', cCommentTableUsuario)]
   TEntyUser = class(TEntyRecord)
   strict private
      FMainColor: Integer;
      FTitleColor: Integer;
      FNome: UnicodeString;
      FPassWord: UnicodeString;
      FUserName: UnicodeString;
      procedure SetUserName(const Value: UnicodeString);
      procedure SetPassWord(const Value: UnicodeString);
      procedure SetMainColor(const Value: Integer);
      procedure SetNome(const Value: UnicodeString);
      procedure SetTitleColor(const Value: Integer);
   public
      [TPropertyData(cFieldNome, True)]
      [TPropertyString(cLengthNome)]
      property Nome: UnicodeString read FNome write SetNome;

      [TPropertyData(cFieldUserName, True)]
      [TPropertyString(cLengthCommonUser)]
      property UserName: UnicodeString read FUserName write SetUserName;

      [TPropertyData(cFieldPassWord, True)]
      [TPropertyString(cLengthCommonUser)]
      property PassWord: UnicodeString read FPassWord write SetPassWord;

      [TPropertyData(cFieldTitleColor)]
      [TPropertyInteger]
      property TitleColor: Integer read FTitleColor write SetTitleColor;

      [TPropertyData(cFieldMainColor)]
      [TPropertyInteger]
      property MainColor: Integer read FMainColor write SetMainColor;
   end;

implementation

{ TEntyUser }

uses App.System.Controller.Register;

procedure TEntyUser.SetMainColor(const Value: Integer);
begin
   SetFieldValue(FMainColor, Value);
end;

procedure TEntyUser.SetNome(const Value: UnicodeString);
begin
   SetFieldValue(FNome, Value);
end;

procedure TEntyUser.SetPassWord(const Value: UnicodeString);
begin
   SetFieldValue(FPassWord, Value);
end;

procedure TEntyUser.SetTitleColor(const Value: Integer);
begin
   SetFieldValue(FTitleColor, Value);
end;

procedure TEntyUser.SetUserName(const Value: UnicodeString);
begin
   SetFieldValue(FUserName, Value);
end;

initialization
   TSystemRegisterRelation.Register(TEntyUser);
end.

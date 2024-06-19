{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.System.Classes.Collection;

interface

uses
   System.SysUtils, System.Generics.Collections, System.Generics.Defaults, App.Consts.Messages;

type

   TCommonCollection = class(TObjectList<TObject>)
   public
      /// <summary>
      ///   Remove todos os itens da lista
      /// </summary>
      procedure RemoveAllItems;

      /// <summary>
      ///    Adiciona um objeto a lista, e retorna o mesmo
      /// </summary>
      function AddInstanceOf(const AClass: TClass): TObject;

      constructor Create; overload;
   end;

   TCommonDictionary = class(TObjectDictionary<Variant, TObject>)
   public
   end;

   TCommonDictionary<ClassObject: class> = class(TCommonDictionary)
   public
       /// <summary>
      ///    Adiciona um novo objeto ao dicionário
      /// </summary>
      function Add(const AKey: Variant): ClassObject; inline;
   end;

   TCollectionHelper = class
   public
      /// <summary>
      ///   Obtém uma coleção de objetos através de uma classe
      /// </summary>
      class function GetCollectionOf(const AClass: TClass): TCommonCollection; overload; static;

      /// <summary>
      ///    Obtém uma coleção de objetos através de uma classe e uma SQL
      /// </summary>
      class function GetCollectionOf(const AClass: TClass; const ASQL: UnicodeString): TCommonCollection; overload; static;
   end;

var
   SysColl: TCollectionHelper;

implementation

uses
   App.System.RTTI.DAO;

{ TCommonCollection }

function TCommonCollection.AddInstanceOf(const AClass: TClass): TObject;
begin
   Result := AClass.Create;
   inherited Add(Result);
end;

constructor TCommonCollection.Create;
begin
   inherited Create(True);
end;

procedure TCommonCollection.RemoveAllItems;
var
   LLoop: Integer;
begin
   for LLoop := Count - 1 downto 0 do
      Delete(LLoop);
end;

{ TCommonDictionary<ClassKey, ClassObject> }

function TCommonDictionary<ClassObject>.Add(const AKey: Variant): ClassObject;
begin
   // -> Verifica se já não existe
   if ContainsKey(AKey) then
      raise Exception.CreateFmt(SErrorDuplicatesNotAllowed, [AKey]);

   try
      Result := ClassObject(NewInstance.ClassType.Create);
      inherited Add(AKey, Result);
   except
      on E: Exception do
         raise Exception.CreateFmt(SErrorAddCollectionClass, [NewInstance.ClassType.ClassName, E.Message]);
   end;
end;

{ TCollectionHelper }

class function TCollectionHelper.GetCollectionOf(const AClass: TClass): TCommonCollection;
var
   LDAO: TRTTIDataAcessObject;
begin
   LDAO := TRTTIDataAcessObject.Create(AClass.Create);
   try
      Result := LDAO.ListOf;
   finally
      FreeAndNil(LDAO);
   end;
end;

class function TCollectionHelper.GetCollectionOf(const AClass: TClass; const ASQL: UnicodeString): TCommonCollection;
var
   LDAO: TRTTIDataAcessObject;
begin
   LDAO := TRTTIDataAcessObject.Create(AClass.Create);
   try
      Result := LDAO.ListOf(ASQL);
   finally
      FreeAndNil(LDAO);
   end;
end;

end.

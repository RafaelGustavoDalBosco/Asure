unit App.System.Controller.Register;

interface

uses
   App.System.Vars, App.System.Classes.Collection, System.SysUtils, App.System.Classes, App.Objects.Entys;

type

   TSystemRegisterRelation = class
   public
      /// <summary>
      ///    Register Class
      /// </summary>
      class procedure Register(const AClass: TClass); static;
   end;

implementation

{ TSystemRegisterRelation }

class procedure TSystemRegisterRelation.Register(const AClass: TClass);
var
   LInstance: TEnty;
begin
   if (gvListOfEntys = nil) then
      gvListOfEntys := TCommonCollection.Create;

   LInstance := AClass.NewInstance as TEnty;

   gvListOfEntys.Add(LInstance);
end;

initialization
   // -> bloco obrigatório

finalization
   if Assigned(gvListOfEntys) then
    FreeAndNil(gvListOfEntys);

end.

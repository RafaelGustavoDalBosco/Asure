unit App.Common.Objects;

interface

type

   TVersionApplication = class
   strict private
      FMinor: Word;
      FRelease: Word;
      FMajor: Word;
      FBuild: Word;
      procedure SetBuild(const Value: Word);
      procedure SetMajor(const Value: Word);
      procedure SetMinor(const Value: Word);
      procedure SetRelease(const Value: Word);
   public
      property Major: Word read FMajor write SetMajor;
      property Minor: Word read FMinor write SetMinor;
      property Release: Word read FRelease write SetRelease;
      property Build: Word read FBuild write SetBuild;
   end;

implementation

{ TVersionApplication }

procedure TVersionApplication.SetBuild(const Value: Word);
begin
   FBuild := Value;
end;

procedure TVersionApplication.SetMajor(const Value: Word);
begin
   FMajor := Value;
end;

procedure TVersionApplication.SetMinor(const Value: Word);
begin
   FMinor := Value;
end;

procedure TVersionApplication.SetRelease(const Value: Word);
begin
   FRelease := Value;
end;

end.

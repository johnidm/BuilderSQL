unit DSL.Core.Builder;

interface

uses
  System.SysUtils,
  System.Rtti,
  DSL.Core.SQL.DML.Delete,
  DSL.Core.Utils,
  DSL.Core.SQL.DML.Update,
  DSL.Core.SQL.DML.Insert;

type

  TBuild<T : class, constructor> = class
  public
    class function Instance(): T;
  end;

  TBuilder = class
  public
    function Delete: TDelete;
    function Update: TUpdate;
    class function Insert: TInsert;
  end;


implementation

{ TBuilder }

function TBuilder.Delete: TDelete;
begin
  Result:= TDelete.Create();
end;

class function TBuilder.Insert: TInsert;
begin
  Result:= TInsert.Create();
end;

function TBuilder.Update: TUpdate;
begin
   Result:= TUpdate.Create();
end;

{ TBuild<T> }

class function TBuild<T>.Instance: T;
begin
  Result:= T.Create();
end;



end.

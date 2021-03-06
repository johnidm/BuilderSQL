{ TODO support insert select }
unit DSL.Core.SQL.DML.Insert;

interface

uses
  System.StrUtils,
  DSL.Core.SQL, System.Rtti, DSL.Core.SQL.Utils, System.Generics.Collections;

type

  IInsert = interface(ISQL)
    ['{16829AD5-DE0D-473A-8E8A-4969D123DBB4}']
    function Into(const ATable: string): IInsert;
    function Field(const AField: string): IInsert;
    function Value(const AValue: TValue): IInsert;
  end;

  TInsert = class(TSQL, IInsert)
  strict private
  type
    TFields = class
    private
      Field: string;
      Value: TValue;
    public
      constructor Create(const AField: string; const AValue: TValue);
    end;

  strict private
    Fields: TObjectList<TFields>;

    Table: string;
  public

    function Into(const ATable: string): IInsert;
    function Field(const AField: string): IInsert;
    function Value(const AValue: TValue): IInsert;

  public
    function ToSQL(): string; override;

    constructor Create();
    destructor Destroy(); override;
  end;

implementation

uses
  System.SysUtils;

{ TInsert }

constructor TInsert.Create;
begin
  inherited;

  Fields := TObjectList<TFields>.Create();
end;

destructor TInsert.Destroy;
begin
  if (Assigned(Fields)) then
    FreeAndNil(Fields);

  inherited;
end;

function TInsert.Into(const ATable: string): IInsert;
begin
  Table := ATable;

  Result := Self;
end;

function TInsert.ToSQL: string;
var
  Index: Integer;
begin
  SQL.Clear();
  SQL.Append('insert into ' + Table + ' (');

  for Index := 0 to Pred(Fields.Count) do
    SQL.Append(IfThen(Index > 0, ', ') + Fields[Index].Field);

  SQL.Append(') values (');

  for Index := 0 to Pred(Fields.Count) do
    SQL.Append(IfThen(Index > 0, ', ') + ValueToSQL(Fields[Index].Value));

  SQL.Append(')');

  Result := SQL.ToString;
end;

function TInsert.Field(const AField: string): IInsert;
begin
  Fields.Add(TFields.Create(AField, EmptyStr));

  Result := Self;
end;

function TInsert.Value(const AValue: TValue): IInsert;
begin
  Fields.Last.Value := AValue;

  Result := Self;
end;

{ TInsert.TFields }

constructor TInsert.TFields.Create(const AField: string; const AValue: TValue);
begin
  Field := AField;
  Value := AValue;
end;

end.

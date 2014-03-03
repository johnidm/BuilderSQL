unit TestDMLSQL.Insert;

interface

uses
  DUnitX.TestFramework, DSL.Core.Builder, DSL.Core.SQL.DML.Insert;

type

  [TestFixture]
  TTestDMLInsert = class(TObject)
  public

    [Test]
    procedure Should_Insert_Basic();
    [Test]
    procedure Should_Insert_Basic_Ceneric();
    [Test]
    procedure Should_Insert_Two_Fields();
    [Test]
    procedure Should_Insert_Tree_Fields();

  end;

implementation

procedure TTestDMLInsert.Should_Insert_Basic;
var
  Ret, SQL: string;

begin
  SQL := 'insert into CUSTOMERS (ID) values (1)';
  Ret := TBuild<TInsert>.Instance.Into('CUSTOMERS').Field('ID').Value(1).ToSQL;

  Assert.AreEqual(SQL, Ret);
end;

procedure TTestDMLInsert.Should_Insert_Basic_Ceneric;
var
  Ret, SQL: string;
begin
  SQL := 'insert into PAYMENT (ID) values (1)';
  Ret := TBuilder.Insert.Into('PAYMENT').Field('ID').Value(1).ToSQL;

  Assert.AreEqual(SQL, Ret);
end;

procedure TTestDMLInsert.Should_Insert_Tree_Fields;
var
  Ret, SQL: string;
  Insert: TBuild<TInsert>;
begin
  SQL := 'insert into ORDER (ID, NUMBER, FLAG) values (1, 59847, ''C'')';
  Ret := TBuild<TInsert>.Instance.Into('ORDER').Field('ID').Value(1)
    .Field('NUMBER').Value(59847).Field('FLAG').Value('C').ToSQL;

  Assert.AreEqual(SQL, Ret);
end;

procedure TTestDMLInsert.Should_Insert_Two_Fields;
var
  Ret, SQL: string;

begin
  SQL := 'insert into CUSTOMERS (ID, NAME) values (1, ''Fulano de Tal'')';

  Ret := TBuild<TInsert>.Instance.Into('CUSTOMERS').Field('ID').Value(1)
    .Field('NAME').Value('Fulano de Tal').ToSQL;

  Assert.AreEqual(SQL, Ret);
end;

initialization

TDUnitX.RegisterTestFixture(TTestDMLInsert);

end.

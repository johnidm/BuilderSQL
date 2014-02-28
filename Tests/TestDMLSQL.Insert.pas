unit TestDMLSQL.Insert;

interface
uses
  DUnitX.TestFramework, DSL.Core.Builder, DSL.Core.SQL.DML.Insert;

type

  [TestFixture]
  TTestDMLInsert = class(TObject) 
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure ShouldInsertBasic();
    [Test]
    procedure ShouldInsertTwoFields();

  end;

implementation

procedure TTestDMLInsert.Setup;
begin
end;

procedure TTestDMLInsert.TearDown;
begin
end;

procedure TTestDMLInsert.ShouldInsertBasic;
var
  I_SQL, SQL: string;

  Insert: TBuild<TInsert>;
begin
  SQL:= 'insert into CUSTOMERS (ID) values (1)';

  I_SQL:= Insert.Instance.Into('CUSTOMERS').Field('ID').Value(1).ToSQL;

  Assert.AreEqual( SQL, I_SQL );
end;


procedure TTestDMLInsert.ShouldInsertTwoFields;
var
  I_SQL, SQL: string;

  Insert: TBuild<TInsert>;
begin
  SQL:= 'insert into CUSTOMERS (ID, NAME) values (1, ''Fulano de Tal'')';

  I_SQL:= Insert.Instance.Into('CUSTOMERS').Field('ID').Value(1).
                                            Field('NAME').Value('Fulano de Tal').ToSQL;

  Assert.AreEqual( SQL, I_SQL );
end;

initialization
  TDUnitX.RegisterTestFixture(TTestDMLInsert);
end.
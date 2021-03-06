unit Base.BuilderSQL;

interface

uses
  Base.Collections, System.SysUtils, Base.Utils;

type
  IBuilderSQL = interface ['{164FDB1F-5365-4AE7-8253-8D6789C395DE}']
    function Table( const ATable: string ): IBuilderSQL;

    function AddField( const AField: string; const AValue: Variant ): IBuilderSQL;

    function AddWhere( const AField: string; const AValue: Variant;
      const AOperatorComparison: TOperatorComparison ): IBuilderSQL;

    function AddWhereAnd( const AField: string; const AValue: Variant;
      const AOperatorComparison: TOperatorComparison ): IBuilderSQL;

    function AddWhereOr( const AField: string; const AValue: Variant;
      const AOperatorComparison: TOperatorComparison ): IBuilderSQL;


    function ToSQL(): string;
  end;

  TBuilderSQL = class ( TInterfacedObject, IBuilderSQL )
  strict protected
    FTable: string;
    Fields: TCollectionsSQL;

    Wheres: TCollectionsSQL;
  public
    function Table( const ATable: string ): IBuilderSQL;

    function AddField( const AField: string; const AValue: Variant ): IBuilderSQL;

    function AddWhere( const AField: string; const AValue: Variant;
      const AOperatorComparison: TOperatorComparison ): IBuilderSQL;

    function AddWhereAnd( const AField: string; const AValue: Variant;
      const AOperatorComparison: TOperatorComparison ): IBuilderSQL;

    function AddWhereOr( const AField: string; const AValue: Variant;
      const AOperatorComparison: TOperatorComparison ): IBuilderSQL;
   
    function ToSQL(): string; virtual;
  end;

implementation

function TBuilderSQL.Table(const ATable: string): IBuilderSQL;
begin
  FTable:= ATable;

  Result:= Self ;
end;



function TBuilderSQL.AddWhere(const AField: string;
  const AValue: Variant;
  const AOperatorComparison: TOperatorComparison ): IBuilderSQL;
begin
  Wheres.Add( EmptyStr, AField, AValue, AOperatorComparison, toplogEmpty );

  Result:= Self;
end;

function TBuilderSQL.AddWhereAnd(const AField: string; const AValue: Variant;
  const AOperatorComparison: TOperatorComparison): IBuilderSQL;
begin
  Wheres.Add( EmptyStr, AField, AValue, AOperatorComparison, toplogAnd );

  Result:= Self;

end;

function TBuilderSQL.AddWhereOr(const AField: string; const AValue: Variant;
  const AOperatorComparison: TOperatorComparison): IBuilderSQL;
begin
  Wheres.Add( EmptyStr, AField, AValue, AOperatorComparison, toplogOr );

  Result:= Self;
end;

function TBuilderSQL.AddField(const AField: string;
  const AValue: Variant): IBuilderSQL;
begin
 Fields.Add( EmptyStr, AField, AValue );

 Result:= Self;
end;



function TBuilderSQL.ToSQL: string;
begin
  //raise Exception.Create('Fun��o n�o implementada');
end;



end.

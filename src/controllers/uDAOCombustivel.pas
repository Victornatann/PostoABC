unit uDAOCombustivel;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  Data.DB,
  FireDAC.Comp.Client,
  uConexao,
  uCombustivel,
  FireDAC.Stan.Param;

type
  TDAOCombustivel = class
  public
    class function Listar: TList<TCombustivel>;
    class function BuscarPorId(const AId: Integer): TCombustivel;
  end;

implementation

{ TDAOCombustivel }

class function TDAOCombustivel.BuscarPorId(const AId: Integer): TCombustivel;
var
  Query: TFDQuery;
begin
  Result := nil;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := TConexao.Connection;
    Query.SQL.Text := 'SELECT ID, TIPO_COMBUSTIVEL, PRECO_LITRO FROM COMBUSTIVEIS WHERE ID = :ID';
    Query.ParamByName('ID').AsInteger := AId;
    Query.Open;

    if not Query.Eof then
    begin
      Result := TCombustivel.Create;
      Result.Id := Query.FieldByName('ID').AsInteger;
      Result.TipoCombustivel := Query.FieldByName('TIPO_COMBUSTIVEL').AsString;
      Result.PrecoLitro := Query.FieldByName('PRECO_LITRO').AsFloat;
    end;
  finally
    Query.Free;
  end;
end;

class function TDAOCombustivel.Listar: TList<TCombustivel>;
var
  Query: TFDQuery;
  Combustivel: TCombustivel;
begin
  Result := TList<TCombustivel>.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := TConexao.Connection;
    Query.SQL.Text := 'SELECT ID, TIPO_COMBUSTIVEL, PRECO_LITRO FROM COMBUSTIVEIS ORDER BY ID';
    Query.Open;

    while not Query.Eof do
    begin
      Combustivel := TCombustivel.Create;
      Combustivel.Id := Query.FieldByName('ID').AsInteger;
      Combustivel.TipoCombustivel := Query.FieldByName('TIPO_COMBUSTIVEL').AsString;
      Combustivel.PrecoLitro := Query.FieldByName('PRECO_LITRO').AsFloat;
      Result.Add(Combustivel);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

end.


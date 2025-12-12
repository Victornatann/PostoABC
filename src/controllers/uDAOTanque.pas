unit uDAOTanque;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  uConexao,
  uTanque,
  uDAOCombustivel;

type
  TDAOTanque = class
  public
    class function Listar: TList<TTanque>;
    class function BuscarPorId(const AId: Integer): TTanque;
  end;

implementation

{ TDAOTanque }

class function TDAOTanque.BuscarPorId(const AId: Integer): TTanque;
var
  Query: TFDQuery;
begin
  Result := nil;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := TConexao.Connection;
    Query.SQL.Text := 'SELECT T.ID, T.ID_COMBUSTIVEL, C.TIPO_COMBUSTIVEL, C.PRECO_LITRO ' +
                      'FROM TANQUES T ' +
                      'INNER JOIN COMBUSTIVEIS C ON T.ID_COMBUSTIVEL = C.ID ' +
                      'WHERE T.ID = :ID';
    Query.ParamByName('ID').AsInteger := AId;
    Query.Open;

    if not Query.Eof then
    begin
      Result := TTanque.Create;
      Result.Id := Query.FieldByName('ID').AsInteger;
      Result.IdCombustivel := Query.FieldByName('ID_COMBUSTIVEL').AsInteger;
      Result.Combustivel := TDAOCombustivel.BuscarPorId(Result.IdCombustivel);
    end;
  finally
    Query.Free;
  end;
end;

class function TDAOTanque.Listar: TList<TTanque>;
var
  Query: TFDQuery;
  Tanque: TTanque;
begin
  Result := TList<TTanque>.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := TConexao.Connection;
    Query.SQL.Text := 'SELECT T.ID, T.ID_COMBUSTIVEL, C.TIPO_COMBUSTIVEL, C.PRECO_LITRO ' +
                      'FROM TANQUES T ' +
                      'INNER JOIN COMBUSTIVEIS C ON T.ID_COMBUSTIVEL = C.ID ' +
                      'ORDER BY T.ID';
    Query.Open;

    while not Query.Eof do
    begin
      Tanque := TTanque.Create;
      Tanque.Id := Query.FieldByName('ID').AsInteger;
      Tanque.IdCombustivel := Query.FieldByName('ID_COMBUSTIVEL').AsInteger;
      Tanque.Combustivel := TDAOCombustivel.BuscarPorId(Tanque.IdCombustivel);
      Result.Add(Tanque);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

end.


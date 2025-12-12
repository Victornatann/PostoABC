unit uDAOBomba;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  Data.DB,
  FireDAC.Comp.Client,
  uConexao,
  uBomba,
  uDAOTanque,
  FireDAC.Stan.Param;

type
  TDAOBomba = class
  public
    class function Listar: TList<TBomba>;
    class function BuscarPorId(const AId: Integer): TBomba;
  end;

implementation

{ TDAOBomba }

class function TDAOBomba.BuscarPorId(const AId: Integer): TBomba;
var
  Query: TFDQuery;
begin
  Result := nil;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := TConexao.Connection;
    Query.SQL.Text := 'SELECT ID, ID_TANQUE, NUMERO, NOME FROM BOMBAS WHERE ID = :ID';
    Query.ParamByName('ID').AsInteger := AId;
    Query.Open;

    if not Query.Eof then
    begin
      Result := TBomba.Create;
      Result.Id := Query.FieldByName('ID').AsInteger;
      Result.IdTanque := Query.FieldByName('ID_TANQUE').AsInteger;
      Result.Numero := Query.FieldByName('NUMERO').AsInteger;
      Result.Nome := Query.FieldByName('NOME').AsString;
      Result.Tanque := TDAOTanque.BuscarPorId(Result.IdTanque);
    end;
  finally
    Query.Free;
  end;
end;

class function TDAOBomba.Listar: TList<TBomba>;
var
  Query: TFDQuery;
  Bomba: TBomba;
begin
  Result := TList<TBomba>.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := TConexao.Connection;
    Query.SQL.Text := 'SELECT ID, ID_TANQUE, NUMERO, NOME FROM BOMBAS ORDER BY NUMERO';
    Query.Open;

    while not Query.Eof do
    begin
      Bomba := TBomba.Create;
      Bomba.Id := Query.FieldByName('ID').AsInteger;
      Bomba.IdTanque := Query.FieldByName('ID_TANQUE').AsInteger;
      Bomba.Numero := Query.FieldByName('NUMERO').AsInteger;
      Bomba.Nome := Query.FieldByName('NOME').AsString;
      Bomba.Tanque := TDAOTanque.BuscarPorId(Bomba.IdTanque);
      Result.Add(Bomba);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

end.


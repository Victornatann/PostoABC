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
  FireDAC.Stan.Param;

type
  TDAOBomba = class
  public
    class function Listar: TObjectList<TBomba>;
    class function BuscarPorId(const AId: Integer): TBomba;
  end;

implementation

{ TDAOBomba }

uses uTanque, uCombustivel;

class function TDAOBomba.BuscarPorId(const AId: Integer): TBomba;
var
  Query: TFDQuery;
  Bomba: TBomba;
  Tanque: TTanque;
  Comb: TCombustivel;
begin
  Result := nil;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := TConexao.Connection;

    Query.SQL.Text :=
      'SELECT '+
      '   B.ID, ID_TANQUE, NUMERO, NOME ,' +
      '   C.ID AS IDCOMB, TIPO_COMBUSTIVEL, C.PRECO_LITRO '+
      'FROM BOMBAS B ' +
      'INNER JOIN TANQUES T ON T.ID = B.ID_TANQUE ' +
      'INNER JOIN COMBUSTIVEIS C ON C.ID = T.ID_COMBUSTIVEL ' +
      'WHERE B.ID = :ID';

    Query.ParamByName('ID').AsInteger := AId;
    Query.Open;

    if not Query.Eof then
    begin
      Bomba := TBomba.Create;
      Bomba.Id := Query.FieldByName('ID').AsInteger;
      Bomba.Nome := Query.FieldByName('NOME').AsString;
      Bomba.Numero := Query.FieldByName('NUMERO').AsInteger;
      Bomba.IdTanque :=  Query.FieldByName('ID_TANQUE').AsInteger;

      Tanque := TTanque.Create;
      Tanque.Id := Query.FieldByName('ID_TANQUE').AsInteger;


      Comb := TCombustivel.Create;
      Comb.Id := Query.FieldByName('IDCOMB').AsInteger;
      Comb.TipoCombustivel := Query.FieldByName('TIPO_COMBUSTIVEL').AsString;
      Comb.PrecoLitro := Query.FieldByName('PRECO_LITRO').AsFloat;

      Tanque.Combustivel := Comb;
      Bomba.Tanque := Tanque;

      Result := Bomba;
    end;

  finally
    Query.Free;
  end;
end;

class function TDAOBomba.Listar: TObjectList<TBomba>;
var
  Query: TFDQuery;
  Bomba: TBomba;
  Tanque: TTanque;
  Comb: TCombustivel;
begin
  // A lista retornada NÃO deve ser dona dos objetos
  // quem irá destruir será o controller
  Result := TObjectList<TBomba>.Create(False);

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := TConexao.Connection;

    Query.SQL.Text :=
      'SELECT ' +
      '   B.ID, B.ID_TANQUE, B.NUMERO, B.NOME, ' +
      '   T.ID AS TANQUE_ID,  ' +
      '   C.ID AS COMB_ID, C.TIPO_COMBUSTIVEL, C.PRECO_LITRO ' +
      'FROM BOMBAS B ' +
      'INNER JOIN TANQUES T ON T.ID = B.ID_TANQUE ' +
      'INNER JOIN COMBUSTIVEIS C ON C.ID = T.ID_COMBUSTIVEL ' +
      'ORDER BY B.NUMERO';

    Query.Open;

    while not Query.Eof do
    begin
      Bomba := TBomba.Create;
      Bomba.Id := Query.FieldByName('ID').AsInteger;
      Bomba.IdTanque := Query.FieldByName('ID_TANQUE').AsInteger;
      Bomba.Numero := Query.FieldByName('NUMERO').AsInteger;
      Bomba.Nome := Query.FieldByName('NOME').AsString;

      Tanque := TTanque.Create;
      Tanque.Id := Query.FieldByName('TANQUE_ID').AsInteger;

      Comb := TCombustivel.Create;
      Comb.Id := Query.FieldByName('COMB_ID').AsInteger;
      Comb.TipoCombustivel := Query.FieldByName('TIPO_COMBUSTIVEL').AsString;
      Comb.PrecoLitro := Query.FieldByName('PRECO_LITRO').AsFloat;

      // monta a hierarquia
      Tanque.Combustivel := Comb;
      Bomba.Tanque := Tanque;

      Result.Add(Bomba);

      Query.Next;
    end;

  finally
    Query.Free;
  end;
end;


end.


unit uDAOAbastecimento;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  System.DateUtils,
  Data.DB,
  FireDAC.Comp.Client,
  uConexao,
  uAbastecimento,
  uDAOBomba,
  FireDAC.Stan.Param;

type
  TDAOAbastecimento = class
  public
    class function Inserir(const AAbastecimento: TAbastecimento): Boolean;
    class function Listar: TList<TAbastecimento>;
    class function BuscarPorPeriodo(const DataIni, DataFim: TDate): TFDQuery;
  end;

implementation

{ TDAOAbastecimento }

class function TDAOAbastecimento.BuscarPorPeriodo(
  const DataIni,
  DataFim: TDate
): TFDQuery;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := TConexao.Connection;

  Query.SQL.Text :=
    'SELECT ' +
    '   CAST(A.DATA_ABASTECIMENTO AS DATE) AS DATA, ' +
    '   CAST(A.DATA_ABASTECIMENTO AS TIME) AS HORA, ' +
    '   C.TIPO_COMBUSTIVEL AS TANQUE, ' +
    '   B.NOME AS BOMBA, ' +
    '   A.VALOR, ' +
    '   A.LITROS, ' +
    '   C.PRECO_LITRO, ' +
    '   A.IMPOSTO ' +
    'FROM ABASTECIMENTOS A ' +
    'INNER JOIN BOMBAS B ON A.ID_BOMBA = B.ID ' +
    'INNER JOIN TANQUES T ON B.ID_TANQUE = T.ID ' +
    'INNER JOIN COMBUSTIVEIS C ON T.ID_COMBUSTIVEL = C.ID ' +
    'WHERE CAST(A.DATA_ABASTECIMENTO AS DATE) BETWEEN :DATA_INICIO AND :DATA_FIM ' +
    'ORDER BY DATA, TANQUE, BOMBA, HORA';

  Query.ParamByName('DATA_INICIO').AsDate := DataIni;
  Query.ParamByName('DATA_FIM').AsDate := DataFim;

  Query.Open;
  Result := Query;
end;

class function TDAOAbastecimento.Inserir(
  const AAbastecimento: TAbastecimento
): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := TConexao.Connection;
    Query.SQL.Text :=
      'INSERT INTO ABASTECIMENTOS (ID_BOMBA, DATA_ABASTECIMENTO, LITROS, VALOR, IMPOSTO) ' +
      'VALUES (:ID_BOMBA, :DATA_ABASTECIMENTO, :LITROS, :VALOR, :IMPOSTO)';
    Query.ParamByName('ID_BOMBA').AsInteger := AAbastecimento.IdBomba;
    Query.ParamByName('DATA_ABASTECIMENTO').AsDateTime := AAbastecimento.DataAbastecimento;
    Query.ParamByName('LITROS').AsFloat := AAbastecimento.Litros;
    Query.ParamByName('VALOR').AsFloat := AAbastecimento.Valor;
    Query.ParamByName('IMPOSTO').AsFloat := AAbastecimento.Imposto;
    Query.ExecSQL;
    Result := True;
  except
    on E: Exception do
      raise Exception.Create('Erro ao inserir abastecimento: ' + E.Message);
  end;
  Query.Free;
end;

class function TDAOAbastecimento.Listar: TList<TAbastecimento>;
var
  Query: TFDQuery;
  Abastecimento: TAbastecimento;
begin
  Result := TList<TAbastecimento>.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := TConexao.Connection;
    Query.SQL.Text := 'SELECT A.ID, A.ID_BOMBA, A.DATA_ABASTECIMENTO,'+
                      'A.LITROS, A.VALOR, A.IMPOSTO, ' +
                      'B.NUMERO, C.TIPO_COMBUSTIVEL ' +
                      'FROM ABASTECIMENTOS A ' +
                      'INNER JOIN BOMBAS B ON A.ID_BOMBA = B.ID ' +
                      'INNER JOIN TANQUES T ON B.ID_TANQUE = T.ID ' +
                      'INNER JOIN COMBUSTIVEIS C ON T.ID_COMBUSTIVEL = C.ID ' +
                      'ORDER BY A.DATA_ABASTECIMENTO DESC';
    Query.Open;

    while not Query.Eof do
    begin
      Abastecimento := TAbastecimento.Create;
      Abastecimento.Id := Query.FieldByName('ID').AsInteger;
      Abastecimento.IdBomba := Query.FieldByName('ID_BOMBA').AsInteger;
      Abastecimento.DataAbastecimento := Query.FieldByName('DATA_ABASTECIMENTO').AsDateTime;
      Abastecimento.Litros := Query.FieldByName('LITROS').AsFloat;
      Abastecimento.Valor := Query.FieldByName('VALOR').AsFloat;
      Abastecimento.Imposto := Query.FieldByName('IMPOSTO').AsFloat;
      Abastecimento.Bomba := TDAOBomba.BuscarPorId(Abastecimento.IdBomba);
      Result.Add(Abastecimento);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;




end.


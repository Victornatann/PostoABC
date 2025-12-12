unit uControllerRelAbastecimento;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.SysUtils;

type
  TControllerRelAbastecimento = class
  public
    class function GerarRelatorioAbastecimentos(
      DataIni, DataFim: TDate
    ): TFDQuery;
  end;

implementation

uses uConexao;

{ TControllerRelAbastecimento }

class function TControllerRelAbastecimento.GerarRelatorioAbastecimentos(
  DataIni,
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

end.


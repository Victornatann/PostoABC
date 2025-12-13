unit uControllerRelAbastecimento;

interface

uses
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  System.SysUtils;

type
  TControllerRelAbastecimento = class
  public
    class function GerarRelatorioAbastecimentos(
      DataIni,
      DataFim: TDate
    ): TFDQuery;
  end;

implementation

uses uDAOAbastecimento;

{ TControllerRelAbastecimento }

class function TControllerRelAbastecimento.GerarRelatorioAbastecimentos(
  DataIni,
  DataFim: TDate
): TFDQuery;
begin
  Result := TDAOAbastecimento.
    BuscarPorPeriodo(
      DataIni,
      DataFim
    );
end;

end.


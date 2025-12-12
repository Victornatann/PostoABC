unit uIAbastecimentoView;

interface

uses
  uBomba,
  System.Generics.Collections;

type
  IAbastecimentoView = interface
    ['{2C742385-3B7D-4058-8B1A-A1BAE13F0711}']
    procedure MostrarMensagem(const AMsg: string);
    procedure LimparCampos;
    procedure CarregarBombas(ABombas: TObjectList<TBomba>);

    procedure ExibirInfoBomba(const ATipoCombustivel: string; const APreco: Double);
    procedure LimparInfoBomba;
    procedure AtualizarValorEImposto(const AValor, AImposto: Double);
    function ObterLitros: string;
  end;

implementation

end.


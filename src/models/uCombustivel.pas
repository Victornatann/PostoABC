unit uCombustivel;

interface

type
  TCombustivel = class
  private
    FId: Integer;
    FTipoCombustivel: string;
    FPrecoLitro: Double;
  public
    property Id: Integer read FId write FId;
    property TipoCombustivel: string read FTipoCombustivel write FTipoCombustivel;
    property PrecoLitro: Double read FPrecoLitro write FPrecoLitro;
  end;

implementation

end.


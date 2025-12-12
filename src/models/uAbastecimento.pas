unit uAbastecimento;

interface

uses
  System.SysUtils, uBomba;

type
  TAbastecimento = class
  private
    FId: Integer;
    FIdBomba: Integer;
    FDataAbastecimento: TDateTime;
    FLitros: Double;
    FValor: Double;
    FImposto: Double;
    FBomba: TBomba;
  public
    property Id: Integer read FId write FId;
    property IdBomba: Integer read FIdBomba write FIdBomba;
    property DataAbastecimento: TDateTime read FDataAbastecimento write FDataAbastecimento;
    property Litros: Double read FLitros write FLitros;
    property Valor: Double read FValor write FValor;
    property Imposto: Double read FImposto write FImposto;
    property Bomba: TBomba read FBomba write FBomba;
    destructor Destroy; override;
    class function CalcularImposto(const AValor: Double): Double;
  end;

implementation

{ TAbastecimento }

destructor TAbastecimento.Destroy;
begin
  if Assigned(FBomba) then
    FBomba.Free;
  inherited;
end;

class function TAbastecimento.CalcularImposto(const AValor: Double): Double;
begin
  Result := AValor * 0.13; // 13% de imposto
end;

end.


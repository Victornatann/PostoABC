unit uBomba;

interface

uses
  uTanque;

type
  TBomba = class
  private
    FId: Integer;
    FIdTanque: Integer;
    FNumero: Integer;
    FNome: string;
    FTanque: TTanque;
  public
    property Id: Integer read FId write FId;
    property IdTanque: Integer read FIdTanque write FIdTanque;
    property Numero: Integer read FNumero write FNumero;
    property Nome: string read FNome write FNome;
    property Tanque: TTanque read FTanque write FTanque;
    destructor Destroy; override;
  end;

implementation

{ TBomba }

destructor TBomba.Destroy;
begin
  if Assigned(FTanque) then
    FTanque.Free;
  inherited;
end;

end.


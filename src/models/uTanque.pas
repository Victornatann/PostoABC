unit uTanque;

interface

uses
  uCombustivel;

type
  TTanque = class
  private
    FId: Integer;
    FIdCombustivel: Integer;
    FCombustivel: TCombustivel;
  public
    property Id: Integer read FId write FId;
    property IdCombustivel: Integer read FIdCombustivel write FIdCombustivel;
    property Combustivel: TCombustivel read FCombustivel write FCombustivel;
    destructor Destroy; override;
  end;

implementation

{ TTanque }

destructor TTanque.Destroy;
begin
  if Assigned(FCombustivel) then
    FCombustivel.Free;
  inherited;
end;

end.


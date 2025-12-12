unit uControllerAbastecimento;

interface

uses
  System.Generics.Collections, System.SysUtils,
  uIAbastecimentoView, uBomba, uAbastecimento,
  uDAOBomba;

type
  TControllerAbastecimento = class
  private
    FView: IAbastecimentoView;
    FBombas: TObjectList<TBomba>;

    procedure CarregarBombas;
  public
    constructor Create(AView: IAbastecimentoView);
    destructor Destroy; override;

    procedure Inicializar;
    procedure Lancar(
      IdxBomba: Integer;
      Data: TDateTime;
      Litros,
      Valor,
      Imposto: string
    );
    procedure BombaSelecionada(IdxBomba: Integer);
    procedure CalcularValor(IdxBomba: Integer; const SLitros: string);
  end;

implementation

{ TControllerAbastecimento }

uses uDAOAbastecimento;

constructor TControllerAbastecimento.Create(AView: IAbastecimentoView);
begin
  FView := AView;
  FBombas := TObjectList<TBomba>.Create(True);
end;

destructor TControllerAbastecimento.Destroy;
begin
  FBombas.Free;
  inherited;
end;

procedure TControllerAbastecimento.Inicializar;
begin
  CarregarBombas();
end;

procedure TControllerAbastecimento.BombaSelecionada(IdxBomba: Integer);
var
  Bomba: TBomba;
  Preco: Double;
  Tipo: string;
begin
  if (IdxBomba < 0) or (IdxBomba >= FBombas.Count) then
  begin
    FView.LimparInfoBomba;
    Exit;
  end;

  Bomba := FBombas[IdxBomba];

  if Assigned(Bomba.Tanque) and Assigned(Bomba.Tanque.Combustivel) then
  begin
    Tipo := Bomba.Tanque.Combustivel.TipoCombustivel;
    Preco := Bomba.Tanque.Combustivel.PrecoLitro;

    FView.ExibirInfoBomba(Tipo, Preco);
  end
  else
  begin
    FView.LimparInfoBomba;
  end;

  CalcularValor(IdxBomba, FView.ObterLitros);
end;

procedure TControllerAbastecimento.CalcularValor(
  IdxBomba: Integer;
  const SLitros: string
);
var
  Bomba: TBomba;
  PrecoLitro, Litros, Valor, Imposto: Double;
begin
  if (IdxBomba < 0) or (IdxBomba >= FBombas.Count) then
  begin
    FView.AtualizarValorEImposto(0, 0);
    Exit;
  end;

  Litros := StrToFloatDef(SLitros, 0);
  if Litros <= 0 then
  begin
    FView.AtualizarValorEImposto(0, 0);
    Exit;
  end;

  Bomba := FBombas[IdxBomba];

  if Assigned(Bomba.Tanque) and Assigned(Bomba.Tanque.Combustivel) then
  begin
    PrecoLitro := Bomba.Tanque.Combustivel.PrecoLitro;

    Valor := Litros * PrecoLitro;
    Imposto := TAbastecimento.CalcularImposto(Valor);

    FView.AtualizarValorEImposto(Valor, Imposto);
  end
  else
  begin
    FView.AtualizarValorEImposto(0, 0);
  end;
end;

procedure TControllerAbastecimento.CarregarBombas;
var
  ListaTemp: TObjectList<TBomba>;
  Bomba: TBomba;
begin
  ListaTemp := TDAOBomba.Listar;
  try
    FBombas.Clear;
    for Bomba in ListaTemp do
      FBombas.Add(Bomba);

    FView.CarregarBombas(FBombas);
  finally
    ListaTemp.Free;
  end;
end;

procedure TControllerAbastecimento.Lancar(IdxBomba: Integer; Data: TDateTime;
  Litros, Valor, Imposto: string);
var
  Abastecimento: TAbastecimento;
begin
  try
    Abastecimento := TAbastecimento.Create;
    try
      Abastecimento.IdBomba := FBombas[IdxBomba].Id;
      Abastecimento.DataAbastecimento := Data;
      Abastecimento.Litros := StrToFloatDef(Litros, 0);
      Abastecimento.Valor := StrToFloatDef(Valor, 0);
      Abastecimento.Imposto := StrToFloatDef(Imposto, 0);

      if TDAOAbastecimento.Inserir(Abastecimento) then
      begin
        FView.MostrarMensagem('Abastecimento registrado com sucesso!');
        FView.LimparCampos;
      end
      else
        FView.MostrarMensagem('Falha ao registrar abastecimento.');
    finally
      Abastecimento.Free;
    end;

  except
    on E: Exception do
      FView.MostrarMensagem('Erro ao lançar: ' + E.Message);
  end;
end;

end.


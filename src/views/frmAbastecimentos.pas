unit frmAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, System.Generics.Collections, 
  uCombustivel, uTanque, uBomba, uAbastecimento, uDAOBomba, uDAOAbastecimento, Firedac.DApt;

type
  TFormAbastecimentos = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblPrecoLitro: TLabel;
    lblTanqueInfo: TLabel;
    cmbBomba: TComboBox;
    edtLitros: TEdit;
    edtValor: TEdit;
    edtImposto: TEdit;
    btnLancar: TButton;
    btnCancelar: TButton;
    Label3: TLabel;
    dtpData: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmbBombaChange(Sender: TObject);
    procedure btnLancarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtLitrosChange(Sender: TObject);
    procedure edtLitrosExit(Sender: TObject);
    procedure CalcularValor;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FBombas: TList<TBomba>;
    procedure CarregarBombas;
    procedure LimparCampos;
    function ValidarCampos: Boolean;
  public
    { Public declarations }
  end;

var
  FormAbastecimentos: TFormAbastecimentos;

implementation

{$R *.dfm}

procedure TFormAbastecimentos.btnCancelarClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure TFormAbastecimentos.btnLancarClick(Sender: TObject);
var
  Abastecimento: TAbastecimento;
  Bomba: TBomba;
begin
  if not ValidarCampos() then Exit();

  try
    Bomba := FBombas[cmbBomba.ItemIndex];
    
    Abastecimento := TAbastecimento.Create;
    try
      Abastecimento.IdBomba := Bomba.Id;
      Abastecimento.DataAbastecimento := dtpData.DateTime;
      Abastecimento.Litros := StrToFloatDef(edtLitros.Text, 0);
      Abastecimento.Valor := StrToFloatDef(edtValor.Text, 0);
      Abastecimento.Imposto := StrToFloatDef(edtImposto.Text, 0);

      if TDAOAbastecimento.Inserir(Abastecimento) then
      begin
        ShowMessage('Abastecimento registrado com sucesso!');
        LimparCampos;
      end;
    finally
      Abastecimento.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao salvar abastecimento: ' + E.Message);
  end;
end;

procedure TFormAbastecimentos.CarregarBombas;
var
  I: Integer;
  Bomba: TBomba;
  ListaBombas: TList<TBomba>;
begin
  cmbBomba.Items.Clear;
  
  // Limpar lista anterior de bombas
  if Assigned(FBombas) then
  begin
    for I := 0 to FBombas.Count - 1 do
      FBombas[I].Free;
    FBombas.Free;
  end;

  // Carregar todas as bombas
  ListaBombas := TDAOBomba.Listar;
  FBombas := ListaBombas;
  
  for Bomba in FBombas do
    cmbBomba.Items.Add(
      Format('%s - %s',
        [Bomba.Nome, Bomba.Tanque.Combustivel.TipoCombustivel]
      )
    );
end;

procedure TFormAbastecimentos.cmbBombaChange(Sender: TObject);
var
  Bomba: TBomba;
begin
  if cmbBomba.ItemIndex >= 0 then
  begin
    Bomba := FBombas[cmbBomba.ItemIndex];
    if Assigned(Bomba.Tanque) and Assigned(Bomba.Tanque.Combustivel) then
    begin
      lblTanqueInfo.Caption := 'Tanque: ' + Bomba.Tanque.Combustivel.TipoCombustivel;
      lblPrecoLitro.Caption := 'R$ ' + FormatFloat('#,##0.000', Bomba.Tanque.Combustivel.PrecoLitro);
    end
    else
    begin
      lblTanqueInfo.Caption := 'Tanque: -';
      lblPrecoLitro.Caption := 'R$ 0,00';
    end;

    CalcularValor;
  end
  else
  begin
    lblTanqueInfo.Caption := 'Tanque: -';
    lblPrecoLitro.Caption := 'R$ 0,00';
    edtValor.Text := '';
    edtImposto.Text := '';
  end;
end;

procedure TFormAbastecimentos.CalcularValor;
var
  Litros, Valor, PrecoLitro: Double;
  Bomba: TBomba;
begin
  if (cmbBomba.ItemIndex >= 0) and (edtLitros.Text <> '') then
  begin
    Bomba := FBombas[cmbBomba.ItemIndex];
    if Assigned(Bomba.Tanque) and Assigned(Bomba.Tanque.Combustivel) then
    begin
      PrecoLitro := Bomba.Tanque.Combustivel.PrecoLitro;
      Litros := StrToFloatDef(edtLitros.Text, 0);
      Valor := Litros * PrecoLitro;
      
      edtValor.Text := FormatFloat('#,##0.00', Valor);
      edtImposto.Text := FormatFloat('#,##0.00', TAbastecimento.CalcularImposto(Valor));
    end;
  end
  else
  begin
    edtValor.Text := '';
    edtImposto.Text := '';
  end;
end;

procedure TFormAbastecimentos.edtLitrosChange(Sender: TObject);
begin
  CalcularValor;
end;

procedure TFormAbastecimentos.edtLitrosExit(Sender: TObject);
begin
  CalcularValor;
end;

procedure TFormAbastecimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  FormAbastecimentos := nil;
end;

procedure TFormAbastecimentos.FormCreate(Sender: TObject);
begin
  FBombas := TList<TBomba>.Create;
  dtpData.DateTime := Now;
  CarregarBombas;
  LimparCampos();
end;

procedure TFormAbastecimentos.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  if Assigned(FBombas) then
  begin
    for I := 0 to FBombas.Count - 1 do
      FBombas[I].Free;
    FBombas.Free;
  end;
end;

procedure TFormAbastecimentos.LimparCampos;
begin
  cmbBomba.ItemIndex := -1;
  edtLitros.Text := '';
  edtValor.Text := '';
  edtImposto.Text := '';
  dtpData.DateTime := Now;
  lblTanqueInfo.Caption := 'Tanque: -';
  lblPrecoLitro.Caption := 'R$ 0,00';
end;

function TFormAbastecimentos.ValidarCampos: Boolean;
begin
  if cmbBomba.ItemIndex < 0 then
  begin
    ShowMessage('Selecione uma bomba.');
    cmbBomba.SetFocus;
    Exit(False);
  end;

  if StrToFloatDef(edtLitros.Text, 0) <= 0 then
  begin
    ShowMessage('Informe a quantidade de litros.');
    edtLitros.SetFocus;
    Exit(False);
  end;

  Result := True;
end;

end.


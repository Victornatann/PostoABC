unit frmAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, System.Generics.Collections, 
  uCombustivel, uTanque, uBomba, uAbastecimento, uDAOBomba,
  uIAbastecimentoView,
  uControllerAbastecimento,
  Firedac.DApt;

type
  TFormAbastecimentos = class(TForm, IAbastecimentoView)
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
    procedure cmbBombaChange(Sender: TObject);
    procedure btnLancarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtLitrosChange(Sender: TObject);
    procedure edtLitrosExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FController: TControllerAbastecimento;
    procedure CarregarBombas(ABombas: TObjectList<TBomba>);
    procedure LimparCampos;
    function ValidarCampos: Boolean;
    procedure MostrarMensagem(const AMsg: string);

    procedure ExibirInfoBomba(const ATipoCombustivel: string; const APreco: Double);
    procedure LimparInfoBomba;
    procedure AtualizarValorEImposto(const AValor: Double; const AImposto: Double);
    function ObterLitros: string;
  public
    { Public declarations }
  end;

var
  FormAbastecimentos: TFormAbastecimentos;

implementation

{$R *.dfm}


procedure TFormAbastecimentos.AtualizarValorEImposto(
  const AValor,
  AImposto: Double
);
begin
  edtValor.Text := FormatFloat('#,##0.00', AValor);
  edtImposto.Text := FormatFloat('#,##0.00', AImposto);
end;

procedure TFormAbastecimentos.btnCancelarClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure TFormAbastecimentos.btnLancarClick(Sender: TObject);
begin

  if not ValidarCampos() then Exit;

  FController.Lancar(
    cmbBomba.ItemIndex,
    dtpData.DateTime,
    edtLitros.Text,
    edtValor.Text,
    edtImposto.Text
  );
end;

procedure TFormAbastecimentos.CarregarBombas(
  ABombas: TObjectList<TBomba>
);
var
  Bomba: TBomba;
begin
  cmbBomba.Items.Clear;
  for Bomba in ABombas do
    cmbBomba.Items.Add(Bomba.Nome);
end;

procedure TFormAbastecimentos.cmbBombaChange(Sender: TObject);
begin
  FController.BombaSelecionada(cmbBomba.ItemIndex);
end;

procedure TFormAbastecimentos.edtLitrosChange(Sender: TObject);
begin
  FController.CalcularValor(cmbBomba.ItemIndex, edtLitros.Text);
end;

procedure TFormAbastecimentos.edtLitrosExit(Sender: TObject);
begin
  FController.CalcularValor(cmbBomba.ItemIndex, edtLitros.Text);
end;

procedure TFormAbastecimentos.ExibirInfoBomba(
  const ATipoCombustivel: string;
  const APreco: Double
);
begin
  lblTanqueInfo.Caption := 'Tanque: ' + ATipoCombustivel;
  lblPrecoLitro.Caption := 'R$ ' + FormatFloat('#,##0.000', APreco);
end;

procedure TFormAbastecimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  FormAbastecimentos := nil;
end;

procedure TFormAbastecimentos.FormCreate(Sender: TObject);
begin
  FController := TControllerAbastecimento.Create(Self);
  FController.Inicializar
end;

procedure TFormAbastecimentos.FormDestroy(Sender: TObject);
begin
  FController.Free;
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

procedure TFormAbastecimentos.LimparInfoBomba;
begin
  lblTanqueInfo.Caption := 'Tanque: -';
  lblPrecoLitro.Caption := 'R$ 0,00';
  edtValor.Clear;
  edtImposto.Clear;
end;

procedure TFormAbastecimentos.MostrarMensagem(const AMsg: string);
begin
  ShowMessage(AMsg);
end;

function TFormAbastecimentos.ObterLitros: string;
begin
  Result := edtLitros.Text;
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


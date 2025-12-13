unit RelAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, FireDAC.Comp.Client,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, RLReport,
  uControllerAbastecimento;

type
  TFrmRelAbastecimento = class(TForm)
    DataSource1: TDataSource;
    RLReport1: TRLReport;
    RLBandTitle: TRLBand;
    RLLabelTitulo: TRLLabel;
    lblPeriodo: TRLLabel;
    lblHora: TRLLabel;
    lblLitros: TRLLabel;
    lblValorLitro: TRLLabel;
    lblImposto: TRLLabel;
    lblValor: TRLLabel;
    RLDraw1: TRLDraw;
    RLGroupDia: TRLGroup;
    RLBandDiaHeader: TRLBand;
    RLPanelDia: TRLPanel;
    RLDBTextDia: TRLDBText;
    RLGroupTanque: TRLGroup;
    RLBandTanqueHeader: TRLBand;
    RLLabelTanque: TRLLabel;
    RLDBTextTanque: TRLDBText;
    RLGroupBomba: TRLGroup;
    RLBandBombaHeader: TRLBand;
    RLDBTextBomba: TRLDBText;
    RLBandDetail: TRLBand;
    RLDBTextHora: TRLDBText;
    RLDBTextLitros: TRLDBText;
    RLDBTextValorLitro: TRLDBText;
    RLDBTextImposto: TRLDBText;
    RLDBTextValor: TRLDBText;
    RLBandSummary: TRLBand;
    RLLabelTotal: TRLLabel;
    RLDBResultTotal: TRLDBResult;
    RLDraw2: TRLDraw;
    RLBand1: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLDBResult2: TRLDBResult;
    RLLabel2: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLDraw5: TRLDraw;
    RLLabel4: TRLLabel;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FDataInicial: TDate;
    FDataFinal: TDate;
    procedure PrepararDadosRelatorio;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ADataIni, ADataFim: TDate); reintroduce;

  end;

var
  FrmRelAbastecimento: TFrmRelAbastecimento;

implementation

{$R *.dfm}

uses uConexao, uControllerRelAbastecimento;

{ TFrmRelAbastecimento }

constructor TFrmRelAbastecimento.Create(
  AOwner: TComponent;
  ADataIni,
  ADataFim: TDate
);
begin
  inherited Create(AOwner);

  FDataInicial := ADataIni;
  FDataFinal := ADataFim;

  PrepararDadosRelatorio();
  RLReport1.Prepare;
  RLReport1.Preview;
end;

procedure TFrmRelAbastecimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  FrmRelAbastecimento := nil;
end;

procedure TFrmRelAbastecimento.FormDestroy(Sender: TObject);
begin
   // Liberar query se existir
  if Assigned(DataSource1.DataSet) then
  begin
    TFDQuery(DataSource1.DataSet).Close;
    DataSource1.DataSet.Free;
  end;
end;

procedure TFrmRelAbastecimento.PrepararDadosRelatorio;
begin
  // Criar query para o relatório
  if Assigned(DataSource1.DataSet) then
  begin
    TFDQuery(DataSource1.DataSet).Close;
    DataSource1.DataSet.Free;
  end;

  DataSource1.DataSet :=
    TControllerRelAbastecimento.
      GerarRelatorioAbastecimentos(
        FDataInicial, FDataFinal
      );

  lblPeriodo.Caption := 'Período: ' + FormatDateTime('dd/mm/yyyy', FDataInicial) +
                      ' a ' + FormatDateTime('dd/mm/yyyy', FDataFinal);
end;

end.

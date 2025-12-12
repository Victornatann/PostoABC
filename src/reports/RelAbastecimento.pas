unit RelAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, RLReport, FireDAC.Stan.Param,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    RLLabelDia: TRLLabel;
    RLGroupTanque: TRLGroup;
    RLBandTanqueHeader: TRLBand;
    RLLabelTanque: TRLLabel;
    RLDBTextTanque: TRLDBText;
    RLGroupBomba: TRLGroup;
    RLBandBombaHeader: TRLBand;
    RLLabelBomba: TRLLabel;
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
    RLLabel1: TRLLabel;
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

uses uConexao;

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
var
  Query: TFDQuery;
begin
  // Criar query para o relatório
  if Assigned(DataSource1.DataSet) then
  begin
    TFDQuery(DataSource1.DataSet).Close;
    DataSource1.DataSet.Free;
  end;

  Query := TFDQuery.Create(Self);
  Query.Connection := TConexao.Connection;
  Query.SQL.Text := 'SELECT ' +
                    '   CAST(A.DATA_ABASTECIMENTO AS DATE) AS DATA, ' +
                    '   CAST(A.DATA_ABASTECIMENTO AS TIME) AS HORA, '+
                    '   C.TIPO_COMBUSTIVEL AS TANQUE, ' +
                    '   B.NOME AS BOMBA, ' +
                    '   A.VALOR, ' +
                    '   A.LITROS, '+
                    '   C.PRECO_LITRO, '+
                    '   A.IMPOSTO '+
                    'FROM ABASTECIMENTOS A ' +
                    'INNER JOIN BOMBAS B '+
                    '   ON A.ID_BOMBA = B.ID ' +
                    'INNER JOIN TANQUES T  '+
                    '   ON B.ID_TANQUE = T.ID ' +
                    'INNER JOIN COMBUSTIVEIS C '+
                    '   ON T.ID_COMBUSTIVEL = C.ID ' +
                    'WHERE CAST(A.DATA_ABASTECIMENTO AS DATE) '+
                    '      BETWEEN :DATA_INICIO AND :DATA_FIM ' +
                    'ORDER BY '+
                    '   DATA, '+
                    '   TANQUE, '+
                    '   BOMBA, HORA';
  Query.ParamByName('DATA_INICIO').AsDate := FDataInicial;
  Query.ParamByName('DATA_FIM').AsDate := FDataFinal;
  Query.Open();
  DataSource1.DataSet := Query;

  lblPeriodo.Caption := 'Período: ' + FormatDateTime('dd/mm/yyyy', FDataInicial) +
                      ' a ' + FormatDateTime('dd/mm/yyyy', FDataFinal);
end;

end.

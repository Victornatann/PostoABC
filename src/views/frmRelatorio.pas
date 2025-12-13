unit frmRelatorio;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Mask, Vcl.ComCtrls,
  Data.DB,  Vcl.Buttons;

type
  TFormRelatorio = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dtpDataInicio: TDateTimePicker;
    dtpDataFim: TDateTimePicker;
    btnGerarRelatorio: TBitBtn;
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function ValidarCampos: Boolean;
  public
    { Public declarations }
  end;

var
  FormRelatorio: TFormRelatorio;

implementation

{$R *.dfm}

uses
  FireDAC.Comp.Client, uConexao, System.DateUtils, frmAbastecimentos,
  RelAbastecimento;

procedure TFormRelatorio.btnGerarRelatorioClick(Sender: TObject);
begin

  if not ValidarCampos() then Exit();

  try
    FrmRelAbastecimento := TFrmRelAbastecimento.Create(
      Self,
      dtpDataInicio.Date,
      dtpDataFim.Date
    );
  finally
    FrmRelAbastecimento.Close;
  end;

end;

procedure TFormRelatorio.FormCreate(Sender: TObject);
begin
  dtpDataInicio.Date := Date;
  dtpDataFim.Date := Date;
end;

function TFormRelatorio.ValidarCampos: Boolean;
begin
  if dtpDataInicio.Date > dtpDataFim.Date then
  begin
    ShowMessage('A data de início deve ser menor ou igual à data de fim.');
    Exit(False);
  end;

  Result := True;
end;

end.


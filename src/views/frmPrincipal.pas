unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ExtCtrls, frmAbastecimentos, frmRelatorio, uConexao, dxGDIPlusClasses;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Abastecimentos1: TMenuItem;
    Relatrios1: TMenuItem;
    RelatriodeAbastecimentos1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    procedure Abastecimentos1Click(Sender: TObject);
    procedure RelatriodeAbastecimentos1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure ConectarBanco;
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

procedure TFormPrincipal.Abastecimentos1Click(Sender: TObject);
begin
  if not Assigned(FormAbastecimentos) then
    FormAbastecimentos := TFormAbastecimentos.Create(Self);
  FormAbastecimentos.ShowModal;
end;

procedure TFormPrincipal.ConectarBanco;
var
  CaminhoBanco: string;
begin
  // Ajuste o caminho do banco de dados conforme necessário
  CaminhoBanco := ExtractFilePath(Application.ExeName) + 'database/POSTOABC.FDB';
  
  if not FileExists(CaminhoBanco) then
  begin
    ShowMessage('Banco de dados não encontrado em: ' + CaminhoBanco);
    Application.Terminate;
    Exit;
  end;

  if not TConexao.Conectar(CaminhoBanco) then
  begin
    ShowMessage('Erro ao conectar ao banco de dados.');
    Application.Terminate;
  end;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  ConectarBanco;
end;

procedure TFormPrincipal.FormDestroy(Sender: TObject);
begin
  TConexao.Desconectar;
end;

procedure TFormPrincipal.RelatriodeAbastecimentos1Click(Sender: TObject);
begin
  if not Assigned(FormRelatorio) then
    FormRelatorio := TFormRelatorio.Create(Self);
  FormRelatorio.ShowModal;
end;

procedure TFormPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

end.


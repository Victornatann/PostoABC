program PostoABC;

uses
  Vcl.Forms,
  frmPrincipal in 'src\views\frmPrincipal.pas' {FormPrincipal},
  frmAbastecimentos in 'src\views\frmAbastecimentos.pas' {FormAbastecimentos},
  frmRelatorio in 'src\views\frmRelatorio.pas' {FormRelatorio},
  uCombustivel in 'src\models\uCombustivel.pas',
  uTanque in 'src\models\uTanque.pas',
  uBomba in 'src\models\uBomba.pas',
  uAbastecimento in 'src\models\uAbastecimento.pas',
  RelAbastecimento in 'src\reports\RelAbastecimento.pas' {FrmRelAbastecimento},
  uIAbastecimentoView in 'src\interface\uIAbastecimentoView.pas',
  uConexao in 'src\repositories\uConexao.pas',
  uDAOBomba in 'src\repositories\uDAOBomba.pas',
  uControllerAbastecimento in 'src\controller\uControllerAbastecimento.pas',
  uDAOAbastecimento in 'src\repositories\uDAOAbastecimento.pas',
  uControllerRelAbastecimento in 'src\controller\uControllerRelAbastecimento.pas';

{$R *.res}

begin
  {$IFDEF DEBUG}
     ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Posto ABC - Sistema de Gerenciamento';
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.

program PostoABC;

uses
  Vcl.Forms,
  frmPrincipal in 'src\views\frmPrincipal.pas' {FormPrincipal},
  frmAbastecimentos in 'src\views\frmAbastecimentos.pas' {FormAbastecimentos},
  frmRelatorio in 'src\views\frmRelatorio.pas' {FormRelatorio},
  uConexao in 'src\controllers\uConexao.pas',
  uCombustivel in 'src\models\uCombustivel.pas',
  uTanque in 'src\models\uTanque.pas',
  uBomba in 'src\models\uBomba.pas',
  uAbastecimento in 'src\models\uAbastecimento.pas',
  uDAOAbastecimento in 'src\controllers\uDAOAbastecimento.pas',
  uDAOBomba in 'src\controllers\uDAOBomba.pas',
  uDAOCombustivel in 'src\controllers\uDAOCombustivel.pas',
  uDAOTanque in 'src\controllers\uDAOTanque.pas',
  RelAbastecimento in 'src\reports\RelAbastecimento.pas' {FrmRelAbastecimento};

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

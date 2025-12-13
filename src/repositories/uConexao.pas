unit uConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Login, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.UI;

type
  TConexao = class
  private
    class var FConnection: TFDConnection;
    class function GetConnection: TFDConnection; static;
  public
    class function Conectar(
        const ACaminhoBanco: string;
        const AUsuario: string = 'SYSDBA';
        const ASenha: string = 'masterkey'
    ): Boolean;
    class procedure Desconectar;
    class property Connection: TFDConnection read GetConnection;
  end;

implementation

{ TConexao }

class function TConexao.GetConnection: TFDConnection;
begin
  if not Assigned(FConnection) then
  begin
    FConnection := TFDConnection.Create(nil);
  end;
  Result := FConnection;
end;

class function TConexao.Conectar(
    const ACaminhoBanco: string;
    const AUsuario: string;
    const ASenha: string
): Boolean;
begin
  try
    GetConnection();
    
    if FConnection.Connected then
      FConnection.Connected := False;

    FConnection.DriverName := 'FB';
    FConnection.Params.Database := ACaminhoBanco;
    FConnection.Params.UserName := AUsuario;
    FConnection.Params.Password := ASenha;
    FConnection.Params.Add('CharacterSet=UTF8');
    FConnection.LoginPrompt := False;
    FConnection.Connected := True;
    Exit(True);
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao conectar ao banco de dados: ' + E.Message);
    end;
  end;
end;

class procedure TConexao.Desconectar;
begin
  if Assigned(FConnection) then
  begin
    if FConnection.Connected then
      FConnection.Connected := False;
    FConnection.Free;
    FConnection := nil;
  end;
end;

end.


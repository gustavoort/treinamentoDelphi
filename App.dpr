program App;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {viewPrincipal},
  uTelaBase in 'uTelaBase.pas' {viewBase},
  uFuncoes in 'uFuncoes.pas',
  uCliente in 'uCliente.pas' {viewCliente},
  uPacote in 'uPacote.pas' {viewPacote};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TviewPrincipal, viewPrincipal);
  Application.Run;
end.

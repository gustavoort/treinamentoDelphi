program App;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {viewPrincipal},
  uTelaBase in 'uTelaBase.pas' {viewBase},
  uPacote in 'uPacote.pas' {viewPacote},
  uFuncoes in 'uFuncoes.pas',
  uCliente in 'uCliente.pas' {viewCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TviewPrincipal, viewPrincipal);
  Application.Run;
end.

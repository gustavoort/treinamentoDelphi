program AppWilliam;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {viewPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TviewPrincipal, viewPrincipal);
  Application.Run;
end.

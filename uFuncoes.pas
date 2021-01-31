unit uFuncoes;

interface

uses
  Vcl.Forms, System.SysUtils;

procedure MostrarFormulario(AClass: TFormClass; var AForm);
procedure Pergunta(APergunta: String);

implementation

uses
  Winapi.Windows;

procedure Pergunta(APergunta: String);
begin
  if MessageBox(
    Application.Handle,
    PWideChar(APergunta),
    'Confirmação de Procedimento',
    MB_ICONQUESTION  + MB_YESNO + MB_DEFBUTTON2 + MB_SYSTEMMODAL) = IDNO
  then
    Abort;
end;

procedure MostrarFormulario(AClass: TFormClass; var AForm);
begin
  try
    if not Assigned(TForm(AForm)) then
      Application.CreateForm(AClass, AForm);

    TForm(AForm).ShowModal;
  finally
    FreeAndNil(AForm);
  end;
end;

end.

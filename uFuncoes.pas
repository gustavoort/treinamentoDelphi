unit uFuncoes;

interface

uses
  Vcl.Forms, System.SysUtils;

procedure MostrarFormulario(AClass: TFormClass; var AForm);

implementation

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

unit uCliente;

interface

uses
  uTelaBase, Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.Controls, Vcl.Buttons, System.Classes,
  Vcl.ExtCtrls;

type
  TviewCliente = class(TviewBase)
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  viewCliente: TviewCliente;

implementation

{$R *.dfm}


procedure TviewCliente.FormCreate(Sender: TObject);
begin
  inherited;
  Titulo := 'Cadastro de Clientes';
end;

end.

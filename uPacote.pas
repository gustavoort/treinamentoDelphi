unit uPacote;

interface

uses
  uTelaBase, Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.Controls, Vcl.Buttons, System.Classes,
  Vcl.ExtCtrls;

type
  TviewPacote = class(TviewBase)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  viewPacote: TviewPacote;

implementation

{$R *.dfm}

procedure TviewPacote.FormCreate(Sender: TObject);
begin
  inherited;
  Titulo := 'Cadastro de Pacotes';
end;

end.

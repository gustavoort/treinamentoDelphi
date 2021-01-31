unit uCliente;

interface

uses
  uTelaBase, Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.Controls, Vcl.Buttons, System.Classes,
  Vcl.ExtCtrls, DBAccess, Uni, MemDS, UniProvider, InterBaseUniProvider;

type
  TviewCliente = class(TviewBase)
    qrClientes: TUniQuery;
    qrClientesID: TIntegerField;
    qrClientesNOME: TStringField;
    qrClientesEMAIL: TStringField;
    qrClientesCPF_CNPJ: TStringField;
    qrClientesENDERECO: TStringField;
    dsCliente: TUniDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
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
  Tabela := qrClientes;
  Chave := 'ID';
end;

end.

unit uCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TviewCliente = class(TForm)
    pnCabecalho: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Edit1: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Panel1: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  viewCliente: TviewCliente;

implementation

{$R *.dfm}

procedure TviewCliente.SpeedButton7Click(Sender: TObject);
begin
  Close;
end;

end.

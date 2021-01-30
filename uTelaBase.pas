unit uTelaBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TviewBase = class(TForm)
    pnCabecalho: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
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
    lblTitulo: TLabel;
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FTitulo: String;
  public
    property Titulo: String read FTitulo write FTitulo;
  end;

var
  viewBase: TviewBase;

implementation

{$R *.dfm}

procedure TviewBase.FormCreate(Sender: TObject);
begin
  Width := 1024;
  Height := 648;
end;

procedure TviewBase.FormShow(Sender: TObject);
begin
  lblTitulo.Caption := Titulo;
end;

procedure TviewBase.SpeedButton7Click(Sender: TObject);
begin
  Close;
end;

end.

unit uTelaBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Uni,
  DBAccess, UniProvider, InterBaseUniProvider;

type
  TviewBase = class(TForm)
    pnCabecalho: TPanel;
    btnAdicionar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnApagar: TSpeedButton;
    SpeedButton5: TSpeedButton;
    btnSair: TSpeedButton;
    pgPrincipal: TPageControl;
    tsPesquisa: TTabSheet;
    tsFormulario: TTabSheet;
    gDados: TDBGrid;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    lblTitulo: TLabel;
    btnPesquisar: TSpeedButton;
    btnImprimir: TSpeedButton;
    cnPadrao: TUniConnection;
    InterBaseUniProvider1: TInterBaseUniProvider;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesquisarClick(Sender: TObject);
  private
    FTitulo: String;
    FTabela: TUniQuery;
    FChave: String;
    function getConfigDBFile: String;
    procedure setTabela(const Value: TUniQuery);
  public
    property Titulo: String read FTitulo write FTitulo;
    property Tabela: TUniQuery read FTabela write setTabela;
    property Chave: String read FChave Write FChave;
    property ConfigDBFile: String read getConfigDBFile;
    procedure ConectarBanco;
    procedure ControlaEstado;
    procedure PreparaTabela;
    procedure AtualizaDados;
  end;

var
  viewBase: TviewBase;

implementation

uses
  IniFiles, uFuncoes;

{$R *.dfm}

procedure TviewBase.ConectarBanco;
begin
  with TIniFile.Create(ConfigDBFile) do
  begin
    cnPadrao.ProviderName := ReadString('database', 'provider', 'Interbase');
    cnPadrao.Server := ReadString('database', 'servidor', '127.0.0.1');
    cnPadrao.Username := ReadString('database', 'ususario', 'SYSDBA');
    cnPadrao.Password := ReadString('database', 'senha', 'masterkey');
    cnPadrao.Database := ReadString('database', 'banco', ExtractFilePath(Application.ExeName) + 'Data\Dados.fdb');
    cnPadrao.SpecificOptions.Values['ClientLibrary'] := ReadString('database', 'dll', 'fbclient.dll');
  end;

  try
    cnPadrao.AutoCommit := False;
    cnPadrao.Connect;
  except
    on e: Exception do
    begin
      raise Exception.Create('Falha ao conectar no banco de dados.' + #13 + e.Message);
      Application.Terminate;
    end;
  end;
end;

procedure TviewBase.ControlaEstado;
var
  i: integer;
  AEdit: Boolean;
begin
  AEdit := Tabela.State in dsEditModes;

  btnAdicionar.Visible := not AEdit;
  btnEditar.Visible := ((not AEdit) and (Tabela.RecordCount > 0));
  btnApagar.Visible := ((not AEdit) and (Tabela.RecordCount > 0));
  btnSalvar.Visible := AEdit;
  btnCancelar.Visible := AEdit;
  tsPesquisa.Visible := not AEdit;
  tsFormulario.Visible := AEdit;
  pgPrincipal.ActivePageIndex := Integer(AEdit);

  if AEdit then
  begin
    for i := 0 to tsFormulario.ControlCount -1 do
    begin
      if tsFormulario.Controls[i] is TDBEdit then
      begin
        TDBEdit(tsFormulario.Controls[i]).SetFocus;
        Exit;
      end;
    end;
  end;

end;

procedure TviewBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(ConfigDBFile) do
  begin
    WriteString('database', 'provider', cnPadrao.ProviderName);
    WriteString('database', 'servidor', cnPadrao.Server);
    WriteString('database', 'ususario', cnPadrao.Username);
    WriteString('database', 'senha', cnPadrao.Password);
    WriteString('database', 'banco', cnPadrao.Database);
    WriteString('database', 'dll', cnPadrao.SpecificOptions.Values['ClientLibrary']);
  end;
end;

procedure TviewBase.FormCreate(Sender: TObject);
begin
  ConectarBanco;
  Width := 1024;
  Height := 648;
end;

procedure TviewBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    key := #0;
    PERFORM(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TviewBase.FormShow(Sender: TObject);
begin
  lblTitulo.Caption := Titulo;
  PreparaTabela;
  ControlaEstado;
end;

function TviewBase.getConfigDBFile: String;
begin
  Result := ExtractFilePath(Application.ExeName) + 'db.ini';
end;

procedure TviewBase.PreparaTabela;
begin
  with FTabela do
  begin
    Close;
    Open;

    FieldByName(Chave).Required := False;
    FieldByName(Chave).AutoGenerateValue := arAutoInc;
    KeyFields := Chave;
  end;
end;

procedure TviewBase.setTabela(const Value: TUniQuery);
begin
  FTabela := Value;
  with FTabela do
  begin
    DMLRefresh := True;
  end;
end;

procedure TviewBase.AtualizaDados;
begin
  with Tabela do
  begin
    if Active then
      Refresh;

    Open;
  end;
end;

procedure TviewBase.btnAdicionarClick(Sender: TObject);
begin
  Tabela.Insert;
  ControlaEstado;
end;

procedure TviewBase.btnApagarClick(Sender: TObject);
begin
  Pergunta('Tem certeza que deseja apagar o registro?');

  with Tabela do
  begin
    try
      if not Connection.InTransaction then
        Connection.StartTransaction;

      Tabela.Delete;
      if CachedUpdates then
        ApplyUpdates();

      Connection.Commit;
      AtualizaDados;
      ControlaEstado;
    except
      on e: Exception do
      begin
        Connection.Rollback;
        ShowMessage('Erro ao apagar o registro.' + #13 + e.Message);
        ControlaEstado;
      end;
    end;
  end;
end;

procedure TviewBase.btnCancelarClick(Sender: TObject);
begin
  Tabela.Cancel;
  ControlaEstado;
  AtualizaDados;
end;

procedure TviewBase.btnEditarClick(Sender: TObject);
begin
  Tabela.Edit;
  ControlaEstado;
end;

procedure TviewBase.btnPesquisarClick(Sender: TObject);
begin
  AtualizaDados;
  ControlaEstado;
end;

procedure TviewBase.btnSairClick(Sender: TObject);
begin
  if Tabela.State in dsEditModes then
  begin
    Pergunta('Existe um registro em edição. Tem certeza que deseja sair.');
    Tabela.Cancel;
  end;

  Close;
end;

procedure TviewBase.btnSalvarClick(Sender: TObject);
begin
  with Tabela do
  begin
    try
      if not Connection.InTransaction then
        Connection.StartTransaction;

      Tabela.Post;
      if CachedUpdates then
        ApplyUpdates();

      Connection.Commit;
      AtualizaDados;
      ControlaEstado;
    except
      on e: Exception do
      begin
        Connection.Rollback;
        ShowMessage('Erro ao salvar o registro.' + #13 + e.Message);
        ControlaEstado;
      end;
    end;
  end;

end;

end.

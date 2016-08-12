unit untTesteGeralApp;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseToolBar, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  untDMStyles, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, MultiDetailAppearanceU, FMX.ListView,
  untDmGetServer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, smMensagensFMX,
  untLibDevicePortable,
  smDBFireDac, Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, untDmSaveServer, System.Classes, untDM,smNetworkState,
  FMX.TabControl, FMX.ScrollBox, FMX.Memo, FMX.Edit;

type
  TfrmTesteGeralApp = class(TfrmBaseToolBar)
    LayTestar: TLayout;
    btnTesteGeral: TSpeedButton;
    lstTeste: TListView;
    fdmTeste: TFDMemTable;
    fdmTesteDescricao: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    layMetodosOK: TLayout;
    lblMetodosOK: TLabel;
    lblMetodosOKValor: TLabel;
    Layout1: TLayout;
    lblMetodosErro: TLabel;
    lblMetodosErroValor: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Layout2: TLayout;
    btnMetodosSyncGeral: TSpeedButton;
    Layout3: TLayout;
    btnMetodosSyncBasico: TSpeedButton;
    Layout4: TLayout;
    btnMetodosGetAlunos: TSpeedButton;
    Layout5: TLayout;
    btnMetodosGetAgenda: TSpeedButton;
    TabItem3: TTabItem;
    Layout6: TLayout;
    SpeedButton1: TSpeedButton;
    Layout7: TLayout;
    SpeedButton2: TSpeedButton;
    Layout8: TLayout;
    lblPropriedades: TLabel;
    TabItem4: TTabItem;
    Edit1: TEdit;
    Memo1: TMemo;
    Layout9: TLayout;
    SpeedButton3: TSpeedButton;
    Layout10: TLayout;
    btnGetResponsaveis: TSpeedButton;
    Layout11: TLayout;
    SpeedButton4: TSpeedButton;
    procedure btnTesteGeralClick(Sender: TObject);
    procedure btnMetodosSyncGeralClick(Sender: TObject);
    procedure btnMetodosSyncBasicoClick(Sender: TObject);
    procedure btnMetodosGetAlunosClick(Sender: TObject);
    procedure btnMetodosGetAgendaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnGetResponsaveisClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    Metodo: String;
    MetodosOK: Integer;
    MetodosErro: Integer;
    procedure SetLogTeste(Descricao: String);
    procedure SetLogTesteOk(Metodo: String);
    procedure SetLogTesteErro(Metodo: String; Erro: String);
    procedure SetLabelsTotais;
    procedure TesteMetodosDmGetServer;
    procedure TesteMetodosDmSaveServer;

  public
    { Public declarations }
  end;

var
  frmTesteGeralApp: TfrmTesteGeralApp;

implementation

{$R *.fmx}

uses untRestClient;

procedure TfrmTesteGeralApp.btnMetodosSyncGeralClick(Sender: TObject);
begin
  inherited;
  if not smNetworkState.ValidarConexao then
    Exit;
  Dm.IsTesteApp:= True;
  Dm.SyncronizarDadosServerGeral;
  Dm.IsTesteApp:= False;
end;

procedure TfrmTesteGeralApp.btnTesteGeralClick(Sender: TObject);
begin
  inherited;

  MetodosOK := 0;
  MetodosErro := 0;

  fdmTeste.Close;
  fdmTeste.Open;
  Dm.IsTesteApp:= True;
  DataSetDelete(fdmTeste);

  // Metodos GetServerBasico

  if not DM.fgActivityDialog.IsShown then
  begin
    FActivityDialogThread := TThread.CreateAnonymousThread(
      procedure
      begin
        try
          TThread.Synchronize(nil,
            procedure
            begin
              DM.fgActivityDialog.Message := 'Iniciando Testes';
              DM.fgActivityDialog.Show;
            end);

          if TThread.CheckTerminated then
            Exit;

          TesteMetodosDmGetServer;
          TesteMetodosDmSaveServer;

        finally
          if not TThread.CheckTerminated then
            TThread.Synchronize(nil,
              procedure
              begin
                DM.fgActivityDialog.Hide;
                SetLabelsTotais;
                Dm.IsTesteApp:= False;
              end);
        end;
      end);
    FActivityDialogThread.FreeOnTerminate := False;
    FActivityDialogThread.Start;
  end;

  Exit;
  // Metodos OK
  // Olds
  try
    Metodo := 'DmGetServer.GetAgenda(7d)';
    DmGetServer.GetAgenda(Now - 1, Now + 7);
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  // Metodos GetDadosServerGeral
  try
    Metodo := 'DmGetServer.GetProcessoAtualizacao';
    DmGetServer.GetProcessoAtualizacao;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  try
    Metodo := 'DmGetServer.GetAlunos';
    DmGetServer.GetAlunos;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  try
    Metodo := 'DmGetServer.GetTurmas';
    DmGetServer.GetTurmas;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  try
    Metodo := 'DmGetServer.GetResponsaveis';
    DmGetServer.GetResponsaveis;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  try
    Metodo := 'DmGetServer.GetFuncionarios';
    DmGetServer.GetFuncionarios;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  try
    Metodo := 'DmGetServer.GetEscola';
    DmGetServer.GetEscola;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  try
    Metodo := 'DmGetServer.GetPeriodoTipo';
    DmGetServer.GetPeriodoTipo;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  try
    Metodo := 'DmGetServer.GetResponsavelTipo';
    DmGetServer.GetResponsavelTipo;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  try
    Metodo := 'DmGetServer.GetFuncionarioTipo';
    DmGetServer.GetFuncionarioTipo;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  try
    Metodo := 'DmGetServer.GetTelefoneTipo';
    DmGetServer.GetTelefoneTipo;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  try
    Metodo := 'DmGetServer.GetAgendaTipo';
    DmGetServer.GetAgendaTipo;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  try
    Metodo := 'DmGetServer.GetAgenda(30d)';
    DmGetServer.GetAgenda(Now - 30, Now + 1);
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  // Metodos GetServer Gerais e Basico
  try
    Metodo := 'DmGetServer.GetDadosServerBasico';
    DmGetServer.GetDadosServerBasico;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  try
    Metodo := 'DmGetServer.GetDadosServerGeral';
    DmGetServer.GetDadosServerGeral;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  // Metodos SaveServer
  try
    Metodo := 'DmSaveServer.SaveAgenda';
    DmSaveServer.SaveAgenda;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  try
    Metodo := 'DmSaveServer.SaveLogError';
    DmSaveServer.SaveLogError;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  try
    Metodo := 'DmSaveServer.SaveDadosServerBasico';
    DmSaveServer.SaveDadosServerBasico;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

  try
    Metodo := 'DmSaveServer.SaveDadosServerGeral';
    DmSaveServer.SaveDadosServerGeral;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;

   //Metodos DM
   try
    Metodo := 'Dm.PrimeiroAcessoExecutar';
    Dm.PrimeiroAcessoExecutar;
    SetLogTesteOk(Metodo);
  except
    on E: Exception do
      SetLogTesteErro(Metodo, E.Message);
  end;
end;

procedure TfrmTesteGeralApp.FormCreate(Sender: TObject);
begin
  inherited;
  TabControl1.ActiveTab:= TabItem1;
end;

procedure TfrmTesteGeralApp.FormShow(Sender: TObject);
begin
  inherited;
  lblPropriedades.Text:= 'RestClient.DSRestConnection1.UrlPath:' +
                          RestClient.DSRestConnection1.UrlPath;

end;

procedure TfrmTesteGeralApp.SetLabelsTotais;
begin
  lblMetodosOKValor.Text := IntToStr(MetodosOK);
  lblMetodosErroValor.Text := IntToStr(MetodosErro);
end;

procedure TfrmTesteGeralApp.SetLogTeste(Descricao: String);
begin
  fdmTeste.Append;
  fdmTeste.FieldByName('descricao').AsString := Descricao;
  fdmTeste.Post;
end;

procedure TfrmTesteGeralApp.SetLogTesteErro(Metodo: String; Erro: String);
begin
  SetLogTeste(Metodo + ' Erro:' + Erro);
  Inc(MetodosErro);
end;

procedure TfrmTesteGeralApp.SetLogTesteOk(Metodo: String);
begin
  SetLogTeste(Metodo + ' OK');
  Inc(MetodosOK);
end;

procedure TfrmTesteGeralApp.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  RestClient.DSRestConnection1.UrlPath := '';
  lblPropriedades.Text:= 'RestClient.DSRestConnection1.UrlPath:' +
                          RestClient.DSRestConnection1.UrlPath;

end;

procedure TfrmTesteGeralApp.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  RestClient.DSRestConnection1.UrlPath := 'lapis_verde';
  lblPropriedades.Text:= 'RestClient.DSRestConnection1.UrlPath:' +
                          RestClient.DSRestConnection1.UrlPath;
end;

procedure TfrmTesteGeralApp.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  Dm.IsTesteApp:= True;
  Dm.PrimeiroAcessoExecutar;
  Dm.IsTesteApp:= False;
end;

procedure TfrmTesteGeralApp.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  Dm.IsTesteApp:= True;
  Dm.DeleteAllTabels;
  Dm.IsTesteApp:= False;
end;

procedure TfrmTesteGeralApp.btnGetResponsaveisClick(Sender: TObject);
begin
  inherited;
  if not smNetworkState.ValidarConexao then
    Exit;

  try
    Dm.IsTesteApp:= True;
    DmGetServer.GetResponsaveis;
    Dm.IsTesteApp:= False;

    MsgPoupUp('DmGetServer.GetResponsaveis OK');
  except on E:Exception do
    MsgPoupUp('DmGetServer.GetResponsaveis Erro:' + e.Message);
  end;

end;

procedure TfrmTesteGeralApp.btnMetodosGetAgendaClick(Sender: TObject);
begin
  inherited;
  try
    Dm.IsTesteApp:= True;
    DmGetServer.GetAgenda(Now - 1, Now + 7);
    Dm.IsTesteApp:= False;
    //MsgPoupUpTeste('DmGetServer.GetAgenda OK');
  except on E:Exception do
    MsgPoupUp('DmGetServer.GetAgenda Erro:' + e.Message);
  end;
end;

procedure TfrmTesteGeralApp.btnMetodosGetAlunosClick(Sender: TObject);
begin
  inherited;
  if not smNetworkState.ValidarConexao then
    Exit;

  try
    Dm.IsTesteApp:= True;
    DmGetServer.GetAlunos;
    Dm.IsTesteApp:= False;
    MsgPoupUpTeste('DmGetServer.GetAlunos OK');
  except on E:Exception do
    MsgPoupUp('DmGetServer.GetAlunos Erro:' + e.Message);
  end;

end;

procedure TfrmTesteGeralApp.btnMetodosSyncBasicoClick(Sender: TObject);
begin
  inherited;
  if not smNetworkState.ValidarConexao then
    Exit;

  Dm.IsTesteApp:= True;
  Dm.SyncronizarDadosServerBasico;
  Dm.IsTesteApp:= False;
end;

procedure TfrmTesteGeralApp.TesteMetodosDmGetServer;
begin
  TThread.Synchronize(nil,
    procedure
    begin
      DM.fgActivityDialog.Message := 'Testando Métodos DmGetServer';
      DM.fgActivityDialog.Show;
    end);

  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmGetServer.GetAgenda(7d)';
        DM.fgActivityDialog.Message := Metodo;
        DmGetServer.GetAgenda(Now - 1, Now + 7);
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

  // Metodos GetDadosServerGeral
  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmGetServer.GetProcessoAtualizacao';
        DM.fgActivityDialog.Message := Metodo;
        DmGetServer.GetProcessoAtualizacao;
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmGetServer.GetAlunos';
        DM.fgActivityDialog.Message := Metodo;
        DmGetServer.GetAlunos;
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmGetServer.GetTurmas';
        DM.fgActivityDialog.Message := Metodo;
        DmGetServer.GetTurmas;
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmGetServer.GetResponsaveis';
        DM.fgActivityDialog.Message := Metodo;
        DmGetServer.GetResponsaveis;
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmGetServer.GetFuncionarios';
        DM.fgActivityDialog.Message := Metodo;
        DmGetServer.GetFuncionarios;
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmGetServer.GetEscola';
        DM.fgActivityDialog.Message := Metodo;
        DmGetServer.GetEscola;
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmGetServer.GetPeriodoTipo';
        DM.fgActivityDialog.Message := Metodo;
        DmGetServer.GetPeriodoTipo;
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmGetServer.GetResponsavelTipo';
        DM.fgActivityDialog.Message := Metodo;
        DmGetServer.GetResponsavelTipo;
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmGetServer.GetFuncionarioTipo';
        DM.fgActivityDialog.Message := Metodo;
        DmGetServer.GetFuncionarioTipo;
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmGetServer.GetTelefoneTipo';
        DM.fgActivityDialog.Message := Metodo;
        DmGetServer.GetTelefoneTipo;
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmGetServer.GetAgendaTipo';
        DM.fgActivityDialog.Message := Metodo;
        DmGetServer.GetAgendaTipo;
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmGetServer.GetAgenda(30d)';
        DM.fgActivityDialog.Message := Metodo;
        DmGetServer.GetAgenda(Now - 30, Now + 1);
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

  // Metodos GetServer Gerais e Basico
  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmGetServer.GetDadosServerBasico';
        DM.fgActivityDialog.Message := Metodo;
        DmGetServer.GetDadosServerBasico;
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmGetServer.GetDadosServerGeral';
        DM.fgActivityDialog.Message := Metodo;
        DmGetServer.GetDadosServerGeral;
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

end;

procedure TfrmTesteGeralApp.TesteMetodosDmSaveServer;
begin
  TThread.Synchronize(nil,
    procedure
    begin
      DM.fgActivityDialog.Message := 'Testando Métodos DmSaveServer';
      DM.fgActivityDialog.Show;
    end);

  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmSaveServer.SaveAgenda';
        DM.fgActivityDialog.Message := Metodo;
        DmSaveServer.SaveAgenda;
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmSaveServer.SaveLogError';
        DM.fgActivityDialog.Message := Metodo;
        DmSaveServer.SaveLogError;
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmSaveServer.SaveDadosServerBasico';
        DM.fgActivityDialog.Message := Metodo;
        DmSaveServer.SaveDadosServerBasico;
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);

  TThread.Synchronize(nil,
    procedure
    begin
      try
        Metodo := 'DmSaveServer.SaveDadosServerGeral';
        DM.fgActivityDialog.Message := Metodo;
        DmSaveServer.SaveDadosServerGeral;
        SetLogTesteOk(Metodo);
      except
        on E: Exception do
          SetLogTesteErro(Metodo, E.Message);
      end;
    end);
end;

end.


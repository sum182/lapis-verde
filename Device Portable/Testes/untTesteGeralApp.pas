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
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, smMensagensFMX, untFuncoes,
  smDBFireDac, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, untDmSaveServer,System.Classes, untDM;

type
  TfrmTesteGeralApp = class(TfrmBaseToolBar)
    Layout1: TLayout;
    btnTestar: TSpeedButton;
    lstTeste: TListView;
    fdmTeste: TFDMemTable;
    fdmTesteDescricao: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    procedure btnTestarClick(Sender: TObject);
  private
    FActivityDialogThread: TThread;
    procedure SetLogTeste(Descricao:String);

  public
    { Public declarations }
  end;

var
  frmTesteGeralApp: TfrmTesteGeralApp;

implementation


{$R *.fmx}

procedure TfrmTesteGeralApp.btnTestarClick(Sender: TObject);
begin
  inherited;

  fdmTeste.Close;
  fdmTeste.Open;

  DataSetDelete(fdmTeste);

  //Metodos GetServerBasico

 if not DM.fgActivityDialog.IsShown then
  begin
    FActivityDialogThread := TThread.CreateAnonymousThread(procedure
     begin
        try
          TThread.Synchronize(nil, procedure
          begin
            DM.fgActivityDialog.Message := 'Iniciando Testes';
            DM.fgActivityDialog.Show;
          end);

          if TThread.CheckTerminated then
            Exit;


          TThread.Synchronize(nil, procedure
          begin
            try
              DM.fgActivityDialog.Message := 'DmGetServer.GetAgenda(7d)';
              DmGetServer.GetAgenda(Now - 1, Now + 7);
              SetLogTeste('DmGetServer.GetAgenda(7d) OK');
            except on E:Exception do
              SetLogTeste('DmGetServer.GetAgenda(7d) Erro:' + e.Message);
            end;
          end);


          TThread.Synchronize(nil, procedure
          begin
            try
              DM.fgActivityDialog.Message := 'DmGetServer.GetTabelaAtualizacao';
            DmGetServer.GetProcessoAtualizacao;
            SetLogTeste('DmGetServer.GetTabelaAtualizacao OK');
          except on E:Exception do
            SetLogTeste('DmGetServer.GetTabelaAtualizacao Erro:' + e.Message);
          end;

          end);


          TThread.Synchronize(nil, procedure
          begin
            try
              DM.fgActivityDialog.Message := 'DmGetServer.GetAlunos';
             DmGetServer.GetAlunos;;
            SetLogTeste('DmGetServer.GetAlunos OK');
          except on E:Exception do
            SetLogTeste('DmGetServer.GetAlunos Erro:' + e.Message);
          end;

          end);







          TThread.Synchronize(nil, procedure
          begin
            DM.fgActivityDialog.Message := 'Downloading file info.txt';
          end);

          if TThread.CheckTerminated then
            Exit;



          if TThread.CheckTerminated then
            Exit;
        finally
          if not TThread.CheckTerminated then
            TThread.Synchronize(nil, procedure
            begin
              DM.fgActivityDialog.Hide;
            end);
        end;
      end);
    FActivityDialogThread.FreeOnTerminate := False;
    FActivityDialogThread.Start;
  end;

  //Olds
  try
    DmGetServer.GetAgenda(Now - 1, Now + 7);
    SetLogTeste('DmGetServer.GetAgenda(7d) OK');
  except on E:Exception do
    SetLogTeste('DmGetServer.GetAgenda(7d) Erro:' + e.Message);
  end;


  //Metodos GetDadosServerGeral
  try
    DmGetServer.GetProcessoAtualizacao;
    SetLogTeste('DmGetServer.GetTabelaAtualizacao OK');
  except on E:Exception do
    SetLogTeste('DmGetServer.GetTabelaAtualizacao Erro:' + e.Message);
  end;

  try
     DmGetServer.GetAlunos;;
    SetLogTeste('DmGetServer.GetAlunos OK');
  except on E:Exception do
    SetLogTeste('DmGetServer.GetAlunos Erro:' + e.Message);
  end;

  try
     DmGetServer.GetTurmas;
    SetLogTeste('DmGetServer.GetTurmas OK');
  except on E:Exception do
    SetLogTeste('DmGetServer.GetTurmas Erro:' + e.Message);
  end;

  try
     DmGetServer.GetResponsaveis;
    SetLogTeste('DmGetServer.GetResponsaveis OK');
  except on E:Exception do
    SetLogTeste('DmGetServer.GetResponsaveis Erro:' + e.Message);
  end;

  try
     DmGetServer.GetFuncionarios;
    SetLogTeste('DmGetServer.GetFuncionarios OK');
  except on E:Exception do
    SetLogTeste('DmGetServer.GetFuncionarios Erro:' + e.Message);
  end;

  try
     DmGetServer.GetEscola;
    SetLogTeste('DmGetServer.GetEscola OK');
  except on E:Exception do
    SetLogTeste('DmGetServer.GetEscola Erro:' + e.Message);
  end;

  try
    DmGetServer.GetPeriodoTipo;
    SetLogTeste('DmGetServer.PeriodoTipo OK');
  except on E:Exception do
    SetLogTeste('DmGetServer.PeriodoTipo Erro:' + e.Message);
  end;

  try
    DmGetServer.GetResponsavelTipo;
    SetLogTeste('DmGetServer.ResponsavelTipo OK');
  except on E:Exception do
    SetLogTeste('DmGetServer.ResponsavelTipo Erro:' + e.Message);
  end;

  try
    DmGetServer.GetFuncionarioTipo;
    SetLogTeste('DmGetServer.FuncionarioTipo OK');
  except on E:Exception do
    SetLogTeste('DmGetServer.FuncionarioTipo Erro:' + e.Message);
  end;

  try
    DmGetServer.GetTelefoneTipo;
    SetLogTeste('DmGetServer.TelefoneTipo OK');
  except on E:Exception do
    SetLogTeste('DmGetServer.TelefoneTipo Erro:' + e.Message);
  end;

  try
    DmGetServer.GetAgendaTipo;
    SetLogTeste('DmGetServer.AgendaTipo OK');
  except on E:Exception do
    SetLogTeste('DmGetServer.AgendaTipo Erro:' + e.Message);
  end;

  try
    DmGetServer.GetAgenda(Now - 30, Now + 1);
    SetLogTeste('DmGetServer.GetAgenda(30d) OK');
  except on E:Exception do
    SetLogTeste('DmGetServer.GetAgenda(30d) Erro:' + e.Message);
  end;

  //Metodos GetServer Gerais e Basico
  try
    DmGetServer.GetDadosServerBasico;
    SetLogTeste('DmGetServer.GetDadosServerBasico OK');
  except on E:Exception do
    SetLogTeste('DmGetServer.GetDadosServerBasico Erro:' + e.Message);
  end;

  try
    DmGetServer.GetDadosServerGeral;
    SetLogTeste('DmGetServer.GetDadosServerGeral OK');
  except on E:Exception do
    SetLogTeste('DmGetServer.GetDadosServerGeral Erro:' + e.Message);
  end;

  //Metodos SaveServer
  try
    DmSaveServer.SaveAgenda;
    SetLogTeste('DmSaveServer.SalvarAgenda OK');
  except on E:Exception do
    MsgPoupUp('DmSaveServer.SalvarAgenda Erro:' + e.Message);
  end;

  try
    DmSaveServer.SaveLogError;
    SetLogTeste('DmSaveServer.SalvarLogError OK');
  except on E:Exception do
    MsgPoupUp('DmSaveServer.SalvarLogError Erro:' + e.Message);
  end;

  try
    DmSaveServer.SaveDadosServerBasico;
    SetLogTeste('DmSaveServer.SaveDadosServerBasico OK');
  except on E:Exception do
    MsgPoupUp('DmSaveServer.SaveDadosServerBasico Erro:' + e.Message);
  end;

  try
    DmSaveServer.SaveDadosServerGeral;
    SetLogTeste('DmSaveServer.SaveDadosServerGeral OK');
  except on E:Exception do
    SetLogTeste('DmSaveServer.SaveDadosServerGeral Erro:' + e.Message);
  end;
end;

procedure TfrmTesteGeralApp.SetLogTeste(Descricao: String);
begin
  fdmTeste.Append;
  fdmTeste.FieldByName('descricao').AsString :=Descricao;
  fdmTeste.Post;
end;

end.

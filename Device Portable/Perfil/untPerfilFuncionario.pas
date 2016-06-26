unit untPerfilFuncionario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseToolBar, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  FMX.Edit, FMX.ListBox;

type
  TfrmPerfilFuncionario = class(TfrmBaseToolBar)
    fdqFunc: TFDQuery;
    fdmPerfil: TFDMemTable;
    fdqFuncfuncionario_id: TIntegerField;
    fdqFuncnome: TStringField;
    fdqFuncsobrenome: TStringField;
    fdqFuncsexo: TStringField;
    fdqFuncrg: TStringField;
    fdqFunccpf: TLargeintField;
    fdqFuncativo: TStringField;
    fdqFuncemail: TStringField;
    fdqFuncsenha: TStringField;
    fdqFuncinformacoes_gerais: TBlobField;
    fdqFuncfuncionario_tipo_id: TSmallintField;
    fdqFuncescola_id: TIntegerField;
    fdmPerfilfuncionario_id: TIntegerField;
    fdmPerfilnome: TStringField;
    fdmPerfilsobrenome: TStringField;
    fdmPerfilsexo: TStringField;
    fdmPerfilrg: TStringField;
    fdmPerfilcpf: TLargeintField;
    fdmPerfilativo: TStringField;
    fdmPerfilemail: TStringField;
    fdmPerfilsenha: TStringField;
    fdmPerfilinformacoes_gerais: TBlobField;
    fdmPerfilfuncionario_tipo_id: TSmallintField;
    fdmPerfilescola_id: TIntegerField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    VertScrollBox1: TVertScrollBox;
    layNome: TLayout;
    edtNome: TEdit;
    Layout1: TLayout;
    edtSobrenome: TEdit;
    layEmail: TLayout;
    edtEmail: TEdit;
    layCriarSenha: TLayout;
    edtSenha: TEdit;
    laySexo: TLayout;
    cmbSexo: TComboBox;
    lblSexo: TLabel;
    layRG: TLayout;
    edtRG: TEdit;
    layCPF: TLayout;
    edtCPF: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkFillControlToField1: TLinkFillControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    procedure FormCreate(Sender: TObject);
  private
    FActivityDialogThread: TThread;
    procedure GetPerfil;
  public
    { Public declarations }
  end;

var
  frmPerfilFuncionario: TfrmPerfilFuncionario;

implementation

{$R *.fmx}

uses untDMStyles, untDmGetServer, untDM, untTypes;

{ TfrmPerfilFuncionario }

procedure TfrmPerfilFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
if not DM.fgActivityDialog.IsShown then
  begin
    FActivityDialogThread := TThread.CreateAnonymousThread(procedure
      begin
        try
          TThread.Synchronize(nil, procedure
          begin
            layBase.Enabled:=False;
            DM.fgActivityDialog.Message := 'Buscando Dados';
            DM.fgActivityDialog.Show;
          end);

          GetPerfil;

          if TThread.CheckTerminated then
            Exit;


        finally
          if not TThread.CheckTerminated then
            TThread.Synchronize(nil, procedure
            begin
               DM.fgActivityDialog.Hide;
               layBase.Enabled:=True;
               Application.ProcessMessages;
            end);
        end;
      end);
    FActivityDialogThread.FreeOnTerminate := False;
    FActivityDialogThread.Start;
  end;

end;

procedure TfrmPerfilFuncionario.GetPerfil;
var
  DataSet:TFDDataSet;
begin
  DataSet:= DmGetServer.GetFuncionario(Usuario.Id);

  fdmPerfil.Close;
  fdmPerfil.AppendData(DataSet);
end;

end.

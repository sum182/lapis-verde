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
    edtNome: TEdit;
    edtSobrenome: TEdit;
    edtEmail: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkFillControlToField1: TLinkFillControlToField;
    LinkControlToField5: TLinkControlToField;
    lblNome: TLabel;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    Label1: TLabel;
    ListBoxItem3: TListBoxItem;
    Label2: TLabel;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    Label6: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    edtSenha: TEdit;
    Label3: TLabel;
    edtCPF: TEdit;
    edtRG: TEdit;
    cmbSexo: TComboBox;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
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

uses untDMStyles, untDmGetServer, untDM, untTypes, smCrypt;

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
            DM.fgActivityDialog.Message := 'Carregando Perfil';
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

  fdmPerfil.Edit;
  fdmPerfil.FieldByName('senha').AsString := Decrypt(fdmPerfil.FieldByName('senha').AsString);

  if (fdmPerfil.FieldByName('sexo').AsString ='M')then
    cmbSexo.ItemIndex := 0
  else if (fdmPerfil.FieldByName('sexo').AsString ='F')then
    cmbSexo.ItemIndex := 1
  else
    cmbSexo.ItemIndex := -1;

  fdmPerfil.Post;
end;


end.

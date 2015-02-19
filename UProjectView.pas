unit UProjectView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.DBLookup, Data.DB, Data.Win.ADODB, UData, UClass;

type
  TformProjectView = class(TForm)
    editProjectName: TEdit;
    mmProjectView: TMainMenu;
    mmClose: TMenuItem;
    lblProjectName: TLabel;
    lblClient: TLabel;
    buttonCreateProject: TButton;
    datasourceClient: TDataSource;
    datasetClient: TADODataSet;
    commandProject: TADOCommand;
    dbcomboClient: TDBLookupComboBox;
    procedure mmCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buttonCreateProjectClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CreateProject(Project: TProject);
  end;

var
  formProjectView: TformProjectView;

implementation

{$R *.dfm}

uses UMain;

procedure TformProjectView.buttonCreateProjectClick(Sender: TObject);
var
  Project: TProject;
begin
  Project := TProject.Create(0,dbcomboClient.KeyValue,editProjectName.Text);
  CreateProject(Project);
end;

procedure TformProjectView.CreateProject(Project: TProject);
begin
  // push project to database via command
  with commandProject do
  begin
    Parameters.ParamByName('cid').Value := Project.ClientID;
    Parameters.ParamByName('name').Value := Project.Name;
    Execute;
  end;
  formMain.DisplayProjectOnTree(Project);
  Self.Free;
end;

procedure TformProjectView.FormCreate(Sender: TObject);
begin
  // blank dbcombo
  dbcomboClient.KeyValue := 0;
end;

procedure TformProjectView.mmCloseClick(Sender: TObject);
begin
  self.Free;
end;

end.
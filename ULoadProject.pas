unit ULoadProject;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Data.Win.ADODB;

type
  TformLoadProject = class(TForm)
    loadButton: TButton;
    lookupboxProjectSelect: TDBLookupComboBox;
    procedure loadButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLoadProject: TformLoadProject;

implementation

{$R *.dfm}

uses UDataModule, USiteManagerMain;

var
  ProjectDataSet: TADODataSet;

procedure TformLoadProject.FormCreate(Sender: TObject);
begin
  ProjectDataSet := datamodulemain.dataSetProject;
  ProjectDataSet.Close;
  ProjectDataSet.CommandText := 'SELECT * FROM project';
  ProjectDataSet.Open;
end;

procedure TformLoadProject.loadButtonClick(Sender: TObject);
var
  projectName: string;
  pID, cID: integer;
begin
  // get selected project from combobox
  projectName := lookupboxProjectSelect.Text;
  // get the active project and add details from query
  with ProjectDataSet do
  begin
    Close;
    CommandText := 'SELECT * FROM `project` WHERE `ProjectName` = "' +
      projectName+'"';
    Open;
    pID := FieldValues['ProjectID'];
    cID := FieldValues['ClientID'];
    CurrentProject := TProject.Create(pID,cID,projectName);
  end;
end;

end.

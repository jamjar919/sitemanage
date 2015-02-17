unit UMain;

interface

// icons http://www.fatcow.com/free-icons

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ImgList, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  UClass, UData, UDomainView;

type
  TformMain = class(TForm)
    coolbarMain: TCoolBar;
    toolbarMain: TToolBar;
    imglistToolbar: TImageList;
    tbNew: TToolButton;
    tbLoad: TToolButton;
    tbTools: TToolButton;
    tbReport: TToolButton;
    tpSecurity: TToolButton;
    treeMain: TTreeView;
    panelWelcome: TPanel;
    labelWelcomeTitle: TLabel;
    imageLogo: TImage;
    buttonWelcomeOpenProject: TButton;
    buttonWelcomeGenerateReport: TButton;
    buttonWelcomeSearchData: TButton;
    imageButtonClose: TImage;
    imglistTree: TImageList;
    procedure imageButtonCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buttonWelcomeOpenProjectClick(Sender: TObject);
    procedure treeMainChange(Sender: TObject; Node: TTreeNode);
    procedure treeMainDblClick(Sender: TObject);
    procedure tbLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    SelectedNode: TTreeNode;
    procedure OpenProject;
    procedure OpenHosting(Host: THosting);
    procedure OpenDomain(Domain: TDomain);
    procedure DeleteDomain(DomainID: integer);
    procedure displayProjectOnTree(Project: TProject);
    procedure closeWelcomeForm;
    procedure showLoadProjectForm;
  end;

var
  formMain: TformMain;

implementation

{$R *.dfm}

uses ULoadProject;

procedure TformMain.DeleteDomain(DomainID: integer);
begin
  // delete the domain from the domains table
  // we can't use a dataset as the query won't return a result  so we use a tadocommand
  datamoduleMain.datasetDelete.CommandText :=
    'DELETE FROM domain WHERE DomainID = ' + inttostr(DomainID);
  datamoduleMain.datasetDelete.Open;
  // resolve dependencies in other tables
  datamoduleMain.datasetDelete.Close;
  datamoduleMain.datasetDelete.CommandText :=
    'SELECT * FROM hosting WHERE DomainID = ' + inttostr(DomainID);
  datamoduleMain.datasetDelete.Open;
  while not datamoduleMain.datasetDelete.EOF do
  begin
    datamoduleMain.datasetDelete.FieldValues['DomainID'] := 0;
    datamoduleMain.datasetDelete.Next;
  end; // END EOF
  datamoduleMain.datasetDelete.Close;
  datamoduleMain.datasetDelete.CommandText := '';
end;

procedure TformMain.OpenProject;
begin
  closeWelcomeForm;
  CurrentProject := TProject.Create(0, 0, 'Project 1');
  showLoadProjectForm;
end;

procedure TformMain.OpenHosting(Host: THosting);
begin
  ShowMessage(Host.FTPServer);
end;

procedure TformMain.OpenDomain(Domain: TDomain);
var
  openDomainForm: TFormDomainView;
begin
  openDomainForm := TFormDomainView.Create(formMain);
  openDomainForm.Domain := Domain;
  openDomainForm.doOpen(Domain);
  openDomainForm.Show;
end;

procedure TformMain.showLoadProjectForm;
begin
  // show the form
  formLoadProject.Show;
end;

procedure TformMain.tbLoadClick(Sender: TObject);
begin
  OpenProject;
end;

procedure TformMain.treeMainChange(Sender: TObject; Node: TTreeNode);
begin
  SelectedNode := Node;
end;

procedure TformMain.treeMainDblClick(Sender: TObject);
var
  Node: TTreeNode;
  UnknownObject: TObject;
begin
  if Assigned(treeMain.Selected) then
  begin
    treeMain.Selected.Expanded := not treeMain.Selected.Expanded;
    Node := treeMain.Selected;
    UnknownObject := Node.Data;
    if UnknownObject is TDomain then
    begin
      OpenDomain(UnknownObject as TDomain);
    end
    else if UnknownObject is THosting then
    begin
      OpenHosting(UnknownObject as THosting);
    end;
  end;
end;

procedure TformMain.buttonWelcomeOpenProjectClick(Sender: TObject);
begin
  OpenProject;
end;

procedure TformMain.closeWelcomeForm;
begin
  // unfreeze toolbar
  toolbarMain.Enabled := true;
  // free components
  imageLogo.Free;
  buttonWelcomeOpenProject.Free;
  buttonWelcomeGenerateReport.Free;
  buttonWelcomeSearchData.Free;
  imageButtonClose.Free;
  panelWelcome.Free;
end;

procedure TformMain.FormCreate(Sender: TObject);
begin
  // disable toolbar
  toolbarMain.Enabled := false;
end;

procedure TformMain.imageButtonCloseClick(Sender: TObject);
begin
  closeWelcomeForm;
end;

procedure TformMain.displayProjectOnTree(Project: TProject);
var
  ProjectNode, CurrentNode, HostNode, URegNode: TTreeNode;
  Host: THosting;
  Domain: TDomain;
  CMS: TCMS;
  Database: TDatabase;
begin
  // display the project on the tree
  ProjectNode := treeMain.Items.AddFirst(nil, Project.Name);
  ProjectNode.ImageIndex := 0;
  ProjectNode.SelectedIndex := ProjectNode.ImageIndex;
  URegNode := treeMain.Items.AddChild(ProjectNode, 'Unassigned');
  for Domain in Project.DomainList do
  begin
    CurrentNode := treeMain.Items.AddChildObject(ProjectNode,
      Domain.DomainName + '.' + Domain.DomainExtension, Domain);
    CurrentNode.ImageIndex := 1;
    CurrentNode.SelectedIndex := CurrentNode.ImageIndex;
    for Host in Project.HostingList do
    begin
      if Domain.DomainID = Host.DomainID then
      begin
        HostNode := treeMain.Items.AddChildObject(CurrentNode,
          Host.FTPServer, Host);
        HostNode.ImageIndex := 2;
        HostNode.SelectedIndex := HostNode.ImageIndex;
        for CMS in Project.CMSList do
          if CMS.HostingID = Host.HostingID then
          begin
            CurrentNode := treeMain.Items.AddChildObject(HostNode,
              CMS.Directory, CMS);
            CurrentNode.ImageIndex := 3;
            CurrentNode.SelectedIndex := CurrentNode.ImageIndex;
          end;
        for Database in Project.DatabaseList do
          if Database.HostingID = Host.HostingID then
          begin
            CurrentNode := treeMain.Items.AddChildObject(HostNode,
              Database.Name, Database);
            CurrentNode.ImageIndex := 4;
            CurrentNode.SelectedIndex := CurrentNode.ImageIndex;
          end;
      end;
    end; // ENDFORHOST
  end; // ENDFORDOMAIN
  for Host in Project.HostingList do
    if Host.DomainID = 0 then
    begin
      CurrentNode := treeMain.Items.AddChildObject(URegNode,
        Host.FTPServer, Host);
      CurrentNode.ImageIndex := 2;
      CurrentNode.SelectedIndex := CurrentNode.ImageIndex;
    end;
  for CMS in Project.CMSList do
    if CMS.HostingID = 0 then
    begin
      CurrentNode := treeMain.Items.AddChildObject(URegNode,
        CMS.Directory, CMS);
      CurrentNode.ImageIndex := 3;
      CurrentNode.SelectedIndex := CurrentNode.ImageIndex;
    end;
  treeMain.FullExpand;
end;

end.

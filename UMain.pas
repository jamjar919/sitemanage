unit UMain;

interface

// icons http://www.fatcow.com/free-icons

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ImgList, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  UClass, UData, UDomainView, UHostingView, UProjectView;

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
    treeViewProjectPopup: TPopupMenu;
    popRefreshProject: TMenuItem;
    popupNew: TPopupMenu;
    newProject: TMenuItem;
    newDomain: TMenuItem;
    newHosting: TMenuItem;
    procedure imageButtonCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buttonWelcomeOpenProjectClick(Sender: TObject);
    procedure treeMainChange(Sender: TObject; Node: TTreeNode);
    procedure treeMainDblClick(Sender: TObject);
    procedure tbLoadClick(Sender: TObject);
    procedure treeMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure newProjectClick(Sender: TObject);
  private
    { Private declarations }
  public
    SelectedNode: TTreeNode;
    procedure OpenProject;
    procedure RefreshProject(ProjectID: Integer);
    procedure OpenHosting(Host: THosting);
    procedure DeleteHosting(HostingID: Integer);
    procedure OpenDomain(Domain: TDomain);
    procedure DeleteDomain(DomainID: Integer);
    procedure displayProjectOnTree(Project: TProject);
    procedure closeWelcomeForm;
    procedure showLoadProjectForm;
  end;

var
  formMain: TformMain;

implementation

{$R *.dfm}

uses ULoadProject;

procedure TformMain.DeleteHosting(HostingID: Integer);
begin
  // delete the host from host table
  datamoduleMain.commandDelete.CommandText :=
    'DELETE FROM hosting WHERE HostingID = ' + inttostr(HostingID);
  datamoduleMain.commandDelete.Execute;
  // resolve dependencies in other tables
  // cms
  datamoduleMain.datasetDelete.Close;
  datamoduleMain.datasetDelete.CommandText :=
    'SELECT * FROM cms WHERE HostingID = ' + inttostr(HostingID);
  datamoduleMain.datasetDelete.Open;
  datamoduleMain.datasetDelete.First;
  while not datamoduleMain.datasetDelete.EOF do
  begin
    datamoduleMain.datasetDelete.Edit;
    datamoduleMain.datasetDelete.FieldValues['HostingID'] := 0;
    datamoduleMain.datasetDelete.Post;
    datamoduleMain.datasetDelete.Next;
  end; // END EOF
  // database
  datamoduleMain.datasetDelete.Close;
  datamoduleMain.datasetDelete.CommandText :=
    'SELECT * FROM dbase WHERE HostingID = ' + inttostr(HostingID);
  datamoduleMain.datasetDelete.Open;
  datamoduleMain.datasetDelete.First;
  while not datamoduleMain.datasetDelete.EOF do
  begin
    datamoduleMain.datasetDelete.Edit;
    datamoduleMain.datasetDelete.FieldValues['HostingID'] := 0;
    datamoduleMain.datasetDelete.Post;
    datamoduleMain.datasetDelete.Next;
  end; // END EOF
end;

procedure TformMain.RefreshProject(ProjectID: Integer);
var
  CurrentNode: TTreeNode;
  CurrentObject: TObject;
  CurrentProject: TProject;
begin
  // find the project
  CurrentNode := treeMain.TopItem;
  while Assigned(CurrentNode) do
  begin
    CurrentObject := CurrentNode.Data;
    if CurrentObject is TProject then
    begin
      CurrentProject := CurrentObject as TProject;
      if CurrentProject.ProjectID = ProjectID then
        CurrentNode.Delete;
    end;
    CurrentNode := CurrentNode.getNextSibling;
  end;
  // and reopen it again
  displayProjectOnTree(formLoadProject.LoadProject(ProjectID));
end;

procedure TformMain.DeleteDomain(DomainID: Integer);
begin
  // delete the domain from the domains table
  // we can't use a dataset as the query won't return a result so we use a tadocommand
  datamoduleMain.commandDelete.CommandText :=
    'DELETE FROM domain WHERE DomainID = ' + inttostr(DomainID);
  datamoduleMain.commandDelete.Execute;
  // resolve dependencies in other tables with dataset
  datamoduleMain.datasetDelete.Close;
  datamoduleMain.datasetDelete.CommandText :=
    'SELECT * FROM hosting WHERE DomainID = ' + inttostr(DomainID);
  datamoduleMain.datasetDelete.Open;
  datamoduleMain.datasetDelete.First;
  while not datamoduleMain.datasetDelete.EOF do
  begin
    datamoduleMain.datasetDelete.Edit;
    datamoduleMain.datasetDelete.FieldValues['DomainID'] := 0;
    datamoduleMain.datasetDelete.Post;
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
var
  openHostingForm: TFormHostingView;
begin
  openHostingForm := TFormHostingView.Create(formMain);
  openHostingForm.Hosting := Host;
  openHostingForm.doOpen(Host);
  openHostingForm.Show;
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

procedure TformMain.treeMainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Node: TTreeNode;
  UnknownObject: TObject;
begin
  if Button = mbRight then
  begin
    if Assigned(treeMain.Selected) then
    begin
      treeMain.Selected.Expanded := not treeMain.Selected.Expanded;
      Node := treeMain.Selected;
      UnknownObject := Node.Data;
      if UnknownObject is TProject then
      begin
        // show the popup
        treeViewProjectPopup.Popup(X, Y);
      end;
    end; // endif assigned
  end; // endif button
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

procedure TformMain.newProjectClick(Sender: TObject);
var
  ProjectForm: TformProjectView;
begin
  ProjectForm := TFormProjectView.Create(formMain);
  ProjectForm.Show;
end;

procedure TformMain.displayProjectOnTree(Project: TProject);
var
  ProjectNode, CurrentNode, HostNode, DomainNode, URegNode: TTreeNode;
  Host: THosting;
  Domain: TDomain;
  CMS: TCMS;
  Database: TDatabase;
begin
  // display the project on the tree
  ProjectNode := treeMain.Items.AddObject(nil, Project.Name, Project);
  ProjectNode.ImageIndex := 0;
  ProjectNode.SelectedIndex := ProjectNode.ImageIndex;
  URegNode := treeMain.Items.AddChild(ProjectNode, 'Unassigned');
  for Domain in Project.DomainList do
  begin
    DomainNode := treeMain.Items.AddChildObject(ProjectNode,
      Domain.DomainName + '.' + Domain.DomainExtension, Domain);
    DomainNode.ImageIndex := 1;
    DomainNode.SelectedIndex := DomainNode.ImageIndex;
    for Host in Project.HostingList do
    begin
      if Domain.DomainID = Host.DomainID then
      begin
        HostNode := treeMain.Items.AddChildObject(DomainNode,
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
          end; // ENDIFCMS
        for Database in Project.DatabaseList do
          if Database.HostingID = Host.HostingID then
          begin
            CurrentNode := treeMain.Items.AddChildObject(HostNode,
              Database.Name, Database);
            CurrentNode.ImageIndex := 4;
            CurrentNode.SelectedIndex := CurrentNode.ImageIndex;
          end; // ENDIFDB
      end; // ENDIFDOMAIN
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

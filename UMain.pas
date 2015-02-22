unit UMain;

interface

// icons http://www.fatcow.com/free-icons

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ImgList, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  UClass, UData, UDomainView, UHostingView, UProjectView, Vcl.ButtonGroup,
  UCMSView, UDatabaseView;

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
    butgrMain: TButtonGroup;
    imglistButtonGrp: TImageList;
    // events
    procedure imageButtonCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buttonWelcomeOpenProjectClick(Sender: TObject);
    procedure treeMainDblClick(Sender: TObject);
    procedure tbLoadClick(Sender: TObject);
    procedure treeMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure newProjectClick(Sender: TObject);
    procedure butgrMainButtonClicked(Sender: TObject; Index: Integer);
    procedure treeMainChange(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    // project
    procedure OpenProject;
    procedure RefreshProject(ProjectID: Integer);
    procedure showLoadProjectForm;
    procedure displayProjectOnTree(Project: TProject);
    // hosting
    procedure OpenHosting(Host: THosting);
    procedure DeleteHosting(HostingID: Integer);
    procedure AddHosting;
    // domain
    procedure OpenDomain(Domain: TDomain);
    procedure DeleteDomain(DomainID: Integer);
    // cms
    procedure OpenCMS(CMS: TCMS);
    procedure DeleteCMS(CMSID: Integer);
    // database
    procedure OpenDatabase(Database: TDatabase);
    procedure DeleteDatabase(DBID: Integer);
    // button group
    procedure ClearButtonGroup(ButtonGroup: TButtonGroup);
    procedure ChangeButtonGroup(DataType: TDataType; ButtonGroup: TButtonGroup);
    // misc
    procedure closeWelcomeForm;
  end;

var
  formMain: TformMain;

implementation

{$R *.dfm}

uses ULoadProject;

{ ****OPENING**** }

procedure TformMain.OpenDatabase(Database: TDatabase);
var
  OpenDBForm: TformDatabaseView;
begin
  OpenDBForm := TformDatabaseView.Create(formMain);
  OpenDBForm.Database := Database;
  OpenDBForm.doOpen(Database);
  OpenDBForm.Show;
end;

procedure TformMain.OpenCMS(CMS: TCMS);
var
  openCMSForm: TFormCMSView;
begin
  openCMSForm := TFormCMSView.Create(formMain);
  openCMSForm.CMS := CMS;
  openCMSForm.doOpen(CMS);
  openCMSForm.Show;
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

{ ****DELETION**** }

procedure TformMain.DeleteDatabase(DBID: Integer);
begin
  // delete the database from the database table
  datamoduleMain.commandDelete.CommandText :=
    'DELETE FROM dbase WHERE DatabaseID = ' + inttostr(DBID);
  datamoduleMain.commandDelete.Execute;
end;

procedure TformMain.DeleteCMS(CMSID: Integer);
begin
  // only need to delete form one table
  datamoduleMain.commandDelete.CommandText := 'DELETE FROM cms WHERE CMSID = ' +
    inttostr(CMSID);
  datamoduleMain.commandDelete.Execute;
end;

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

{ ****ADDING**** }
procedure TformMain.AddHosting;
var
  newHosting: THosting;
begin
  // we use the global commandtext to create a blank record
  datamoduleMain.commandcreate.CommandText :=
    'INSERT INTO hosting (`HostingID`, `ProjectID`, `DomainID`, `RenewalDate`, `RenewalCost`, `HostRegistrarID`, `FTPServer`, `FTPUsername`, `FTPPassword`, `FTPPort`) VALUES (NULL, ''0'', ''0'', ''2015-01-01'', ''0'', ''0'', '''', '''', '''', ''0'')';
  datamoduleMain.commandcreate.Execute;
  // now get the record and open it in a new window, it will be the one with the highest id
  with datamoduleMain.datasetCreate do
  begin
    Close;
    CommandText := 'SELECT * FROM `hosting` ORDER BY `HostingID` DESC LIMIT 1';
    Open;
    newHosting := THosting.Create(FieldValues['HostingID'],
      FieldValues['ProjectID'], FieldValues['DomainID'],
      FieldValues['HostRegistrarID'], FieldValues['RenewalDate'],
      FieldValues['RenewalCost'], FieldValues['FTPServer'],
      FieldValues['FTPUsername'], FieldValues['FTPPassword'],
      FieldValues['FTPPort']);
  end;
  OpenHosting(newHosting);
end;

{ ****TREEVIEW HANDLING**** }

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
              '/' + CMS.Directory, CMS);
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

{ ****WELCOME FORM**** }
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

{ ****BUTTON GROUP**** }

procedure TformMain.ClearButtonGroup(ButtonGroup: TButtonGroup);
begin
  ButtonGroup.Items.Clear;
end;

procedure TformMain.ChangeButtonGroup(DataType: TDataType;
  ButtonGroup: TButtonGroup);
var
  CurrentButton: TGrpButtonItem;
begin
  // modify button group items based on currently selected items
  ClearButtonGroup(ButtonGroup);
  case DataType of
    dtProject:
      begin
        CurrentButton := ButtonGroup.Items.Add;
        CurrentButton.ImageIndex := 0;
        CurrentButton.Caption := 'Edit Project';
        CurrentButton := ButtonGroup.Items.Add;
        CurrentButton.Caption := 'Delete Project';
        CurrentButton.ImageIndex := 1;
        CurrentButton := ButtonGroup.Items.Add;
        CurrentButton.Caption := 'Add New Domain';
        CurrentButton.ImageIndex := 2;
      end;
    dtDomain:
      begin
        CurrentButton := ButtonGroup.Items.Add;
        CurrentButton.ImageIndex := 0;
        CurrentButton.Caption := 'Edit Domain';
        CurrentButton := ButtonGroup.Items.Add;
        CurrentButton.Caption := 'Delete Domain';
        CurrentButton.ImageIndex := 1;
        CurrentButton := ButtonGroup.Items.Add;
        CurrentButton.Caption := 'Add New Hosting';
        CurrentButton.ImageIndex := 2;
      end;
    dtHosting:
      begin
        CurrentButton := ButtonGroup.Items.Add;
        CurrentButton.ImageIndex := 0;
        CurrentButton.Caption := 'Edit Hosting';
        CurrentButton := ButtonGroup.Items.Add;
        CurrentButton.Caption := 'Delete Hosting';
        CurrentButton.ImageIndex := 1;
        CurrentButton := ButtonGroup.Items.Add;
        CurrentButton.Caption := 'Add New CMS';
        CurrentButton.ImageIndex := 2;
        CurrentButton := ButtonGroup.Items.Add;
        CurrentButton.Caption := 'Add New Database';
        CurrentButton.ImageIndex := 2;
      end;
    dtCMS:
      begin
        CurrentButton := ButtonGroup.Items.Add;
        CurrentButton.ImageIndex := 0;
        CurrentButton.Caption := 'Edit CMS';
        CurrentButton := ButtonGroup.Items.Add;
        CurrentButton.Caption := 'Delete CMS';
        CurrentButton.ImageIndex := 1;
      end;
    dtDatabase:
      begin
        CurrentButton := ButtonGroup.Items.Add;
        CurrentButton.ImageIndex := 0;
        CurrentButton.Caption := 'Edit Database';
        CurrentButton := ButtonGroup.Items.Add;
        CurrentButton.Caption := 'Delete Database';
        CurrentButton.ImageIndex := 1;
      end;
  end;
end;

procedure TformMain.butgrMainButtonClicked(Sender: TObject; Index: Integer);
var
  Node: TTreeNode;
  UnknownObject: TObject;
begin
  // based on type of selected object we can determine what buttons do what from their item index
  if Assigned(treeMain.Selected) then
  begin
    Node := treeMain.Selected;
    UnknownObject := Node.Data;
    if UnknownObject is TDomain then
    begin
      case Index of
        0:
          OpenDomain(UnknownObject as TDomain); // edit
        1:
          ; // delete
        2:
          AddHosting; // add host
      end;
    end
    else if UnknownObject is THosting then
    begin
      case index of
        0:
          OpenHosting(UnknownObject as THosting); // edit
        1:
          ; // delete
        2:
          ; // add cms
        3:
          ; // add db
      end;
    end
    else if UnknownObject is TCMS then
    begin
      case index of
        0:
          OpenCMS(UnknownObject as TCMS); // edit
        1:
          ; // delete
      end;
    end
    else if UnknownObject is TDatabase then
    begin
      case index of
        0:
          OpenDatabase(UnknownObject as TDatabase); // edit
        1:
          ; // delete
      end;
    end;
  end;
end;

{ ****EVENTS**** }

procedure TformMain.tbLoadClick(Sender: TObject);
begin
  OpenProject;
end;

procedure TformMain.treeMainChange(Sender: TObject; Node: TTreeNode);
var
  UnknownObject: TObject;
  ButtonGroup: TButtonGroup;
begin
  ButtonGroup := butgrMain;
  if Assigned(treeMain.Selected) then
  begin
    Node := treeMain.Selected;
    UnknownObject := Node.Data;
    if UnknownObject is TDomain then
      ChangeButtonGroup(dtDomain, ButtonGroup)
    else if UnknownObject is THosting then
      ChangeButtonGroup(dtHosting, ButtonGroup)
    else if UnknownObject is TCMS then
      ChangeButtonGroup(dtCMS, ButtonGroup)
    else if UnknownObject is TDatabase then
      ChangeButtonGroup(dtDatabase, ButtonGroup)
    else if UnknownObject is TProject then
      ChangeButtonGroup(dtProject, ButtonGroup)
    else
      ClearButtonGroup(ButtonGroup);
  end;
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
      OpenDomain(UnknownObject as TDomain)
    else if UnknownObject is THosting then
      OpenHosting(UnknownObject as THosting)
    else if UnknownObject is TCMS then
      OpenCMS(UnknownObject as TCMS)
    else if UnknownObject is TDatabase then
      OpenDatabase(UnknownObject as TDatabase);
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

procedure TformMain.showLoadProjectForm;
begin
  formLoadProject.Show;
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
  ProjectForm := TformProjectView.Create(formMain);
  ProjectForm.Show;
end;

end.

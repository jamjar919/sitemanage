unit UMain;

interface

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
    procedure imageButtonCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buttonWelcomeOpenProjectClick(Sender: TObject);
    procedure treeMainChange(Sender: TObject; Node: TTreeNode);
    procedure treeMainDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    SelectedNode: TTreeNode;
    procedure displayProjectOnTree(Project: TProject);
    procedure closeWelcomeForm;
    procedure showLoadProjectForm;
  end;

var
  formMain: TformMain;

implementation

{$R *.dfm}

uses ULoadProject;

procedure TformMain.showLoadProjectForm;
begin
  // show the form
  formLoadProject.show;
end;

procedure TformMain.treeMainChange(Sender: TObject; Node: TTreeNode);
begin
  SelectedNode := Node;
end;

procedure TformMain.treeMainDblClick(Sender: TObject);
begin
  if Assigned(treeMain.Selected) then
  begin
    treeMain.Selected.Expanded := not treeMain.Selected.Expanded;
  end;
end;

procedure TformMain.buttonWelcomeOpenProjectClick(Sender: TObject);
begin
  closeWelcomeForm;
  CurrentProject := TProject.Create(0, 0, 'Project 1');
  showLoadProjectForm;
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
  ProjectNode, CurrentNode, URegDomainNode: TTreeNode;
  Host: THosting;
  Domain: TDomain;
begin
  // display the project on the tree
  // http://jedi.grizzlydev.com/www/art_usingtreeviews.html
  ProjectNode := treeMain.Items.AddFirst(treeMain.Selected, Project.Name);
  URegDomainNode := treeMain.Items.AddChild(ProjectNode, 'Unassigned Domains');
  for Host in Project.HostingList do
  begin
    CurrentNode := treeMain.Items.AddChildObject(ProjectNode,
      Host.FTPServer, Host);
    for Domain in Project.DomainList do
      if Domain.DomainID = Host.DomainID then
        treeMain.Items.AddChildObject(CurrentNode, Domain.DomainName + '.' +
          Domain.DomainExtension, Domain);
  end;
  for Domain in Project.DomainList do
    if not Domain.HasHosting then
      treeMain.Items.AddChildObject(URegDomainNode, Domain.DomainName + '.' +
        Domain.DomainExtension, Domain);
  treeMain.FullExpand;
end;

end.

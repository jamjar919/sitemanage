unit UMainSM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  System.Generics.Collections,
  Vcl.DBLookup, Vcl.DBCtrls,UDataStoresSM, Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TFMain = class(TForm)
    menuMain: TMainMenu;
    menuSites: TMenuItem;
    menuTools: TMenuItem;
    popupSiteTree: TPopupMenu;
    popupSiteRefresh: TMenuItem;
    popupAddNew: TMenuItem;
    panelSidebar: TPanel;
    panelFooter: TPanel;
    pagecontrolMain: TPageControl;
    tabWelcome: TTabSheet;
    labelConnectionStatus: TLabel;
    toolbarMain: TToolBar;
    openProject: TToolButton;
    tabProjectSelect: TTabSheet;
    DBLookupComboBox1: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    procedure openProjectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Project = class;

  TProjectList = TObjectList<Project>;

  Project = class
  private
    pid: integer;
    cid: integer;
    pname: string;
  public
    property ProjectID: integer read pid;
    property ClientID: integer read cid;
    property ProjectName: string read pname;
    constructor Create(ProjectID: integer; ClientID: integer;
      ProjectName: string; ProjectList: TProjectList);
  end;

  Domain = class
  private
  public
  end;

  Hosting = class
  private
  public
  end;

var
  FMain: TFMain;
  pagecontrol: TPageControl;

implementation

{$R *.dfm}

uses UFormElementCreators;

constructor Project.Create(ProjectID: integer; ClientID: integer;
  ProjectName: string; ProjectList: TProjectList);
begin
  self.pid := ProjectID;
  self.cid := ClientID;
  self.pname := ProjectName;
  ProjectList.Add(self);
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  // set default pagecontrol
  pagecontrol := pagecontrolMain;
end;

procedure TFMain.openProjectClick(Sender: TObject);
var
  projectSelectTab: TTabSheet;
  ProjectList: TProjectList;
  Query: string;
begin
  // create a new tab
  Query := 'SELECT project.ProjectID,project.ProjectName,client.FirstName,client.LastName FROM `project`,`client` WHERE client.ClientID = project.ClientID';
  ProjectList := TProjectList.Create;
  projectSelectTab := createTab('Project Select', pagecontrol);
  CreateLabel(FMain, 'Project Select', projectSelectTab, 100, 100, 0,
    0, [akTop, akLeft]);
   //CreateDBDropdown(FMain, projectSelectTab, 200,25,0,25,[akTop, akLeft],datamoduleMain.datasourceProjects,'2');
end;

end.

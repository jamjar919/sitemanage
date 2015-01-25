unit USiteManagerMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.Menus, Vcl.ImgList, Generics.Collections,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids;

type

  TProject = class
  private
    PID: integer;
    CID: integer;
    PName: string;
  public
    Children: TList;
    constructor Create(ProjectID: integer; ClientID: integer; Name: string);
    property ID: integer read PID;
    property ClientID: integer read CID;
    property Name: string read PName;
  end;

  TformMain = class(TForm)
    coolbarMain: TCoolBar;
    toolbarMain: TToolBar;
    toolbutNewProject: TToolButton;
    toolbutOpenProject: TToolButton;
    toolbarMainImages: TImageList;
    pagecontrolMain: TPageControl;
    tabshInitial: TTabSheet;
    tabshProject: TTabSheet;
    lblProjectName: TLabel;
    lblDomainHead: TLabel;
    lblHostingHeader: TLabel;
    buttonImages: TImageList;
    imgbutAddDomain: TImage;
    imgbutAddHosting: TImage;
    strgrDomainList: TStringGrid;
    strgrHostingList: TStringGrid;
    procedure toolbutOpenProjectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure openProject(project: TProject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;
  currentProject: TProject;
  currentProjectTab: TTabSheet;

implementation

{$R *.dfm}

uses UDataModule, ULoadProject;

procedure TformMain.FormCreate(Sender: TObject);
begin
  // initialise program defaults
  currentProjectTab := tabshProject;
  currentProjectTab.Hide;
  currentProjectTab.TabVisible := false;
  pagecontrolMain.ActivePage := tabshInitial;
end;

constructor TProject.Create(ProjectID: integer; ClientID: integer;
  Name: string);
begin
  PID := ProjectID;
  CID := ClientID;
  PName := Name;
end;

procedure TformMain.openProject(project: TProject);
var
  currentRec: integer;
begin
  // show tab and write project name
  currentProjectTab.Show;
  currentProjectTab.TabVisible := true;
  currentProjectTab.Caption := project.Name;
  lblProjectName.Caption := project.Name;
  // initialise stringgrid column names
  strgrDomainList.Cells[0, 0] := 'Domain Name';
  strgrDomainList.Cells[1, 0] := '';
  strgrHostingList.Cells[0, 0] := 'Hosting Name';
  strgrDomainList.Cells[1, 0] := '';
  // query to get the list of domains
  with datamoduleMain.datasetDomain do
  begin
    Close;
    CommandText :=
      'SELECT `DomainName`,`DomainExtension` from `domain` WHERE `ProjectID` = '
      + inttostr(project.ID) + ';';
    Open;
    First;
    strgrDomainList.RowCount := RecNo+1;
    currentRec := 1;
    while (not Eof) do
    begin
      strgrDomainList.Cells[0, currentRec] := FieldValues['DomainName']+'.'+FieldValues['DomainExtension'];
      Next;
      ShowMessage(FieldValues['DomainName']+'.'+FieldValues['DomainExtension']);
      inc(currentRec);
    end; // END WHILE NOT EOF
  end; // END WITH DOMAIN DM
end; //ENDPROC

procedure TformMain.toolbutOpenProjectClick(Sender: TObject);
begin
  currentProject.Free;
  formLoadProject.Show;
end;

end.

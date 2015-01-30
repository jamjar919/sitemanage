unit USiteManagerMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.Menus, Vcl.ImgList, Generics.Collections,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.Mask, DBCtrls, Data.DB,
  Data.Win.ADODB;

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
    panelSide: TPanel;
    TabSheet1: TTabSheet;
    DBEdit1: TDBEdit;
    procedure toolbutOpenProjectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure openProject(project: TProject);
    procedure openDomain(dName, dExten: string);
    procedure strgrDomainListClick(Sender: TObject);
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

uses UDataModule, ULoadProject, UFormElementCreators;

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

procedure insertButton(stringGrid: TStringGrid; ACol: integer; ARow: integer);
var
  button: TButton;
begin
  button := TButton.Create(stringGrid);
  button.Parent := stringGrid;
  stringGrid.Cells[ACol, ARow] := '';
  stringGrid.Objects[ACol, ARow] := button;
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
  strgrDomainList.Cells[1, 0] := 'Expiration Date';
  strgrDomainList.Cells[2, 0] := 'View/Edit Details';
  strgrHostingList.Cells[0, 0] := 'Unique Hosting ID';
  strgrHostingList.Cells[1, 0] := 'FTP Server';
  strgrHostingList.Cells[2, 0] := 'Expiration Date';
  strgrHostingList.Cells[3, 0] := 'View/Edit Details';
  // query to get the list of domains
  with datamoduleMain.datasetDomain do
  begin
    Close;
    CommandText :=
      'SELECT `DomainName`,`DomainExtension`,`RenewalDate` from `domain` WHERE `ProjectID` = '
      + inttostr(project.ID) + ';';
    Open;
    First;
    currentRec := 1;
    while (not Eof) do
    begin
      strgrDomainList.Cells[0, currentRec] := FieldValues['DomainName'] + '.' +
        FieldValues['DomainExtension'];
      Next;
      strgrDomainList.Cells[1, currentRec] :=
        datetimetostr(FieldValues['RenewalDate']);
      // insertButton(strgrDomainList, 2, currentRec);
      strgrDomainList.RowCount := strgrDomainList.RowCount + 1;
      inc(currentRec);
    end; // END WHILE NOT EOF
  end; // END WITH DOMAIN DM
  // query to get list of hosting accounts
  with datamoduleMain.datasetHosting do
  begin
    Close;
    CommandText :=
      'SELECT `HostingID`,`FTPServer`,`RenewalDate` from `hosting` WHERE `ProjectID` = '
      + inttostr(project.ID) + ';';
    Open;
    First;
    currentRec := 1;
    while (not Eof) do
    begin
      strgrHostingList.Cells[0, currentRec] :=
        inttostr(FieldValues['HostingID']);
      strgrHostingList.Cells[1, currentRec] := FieldValues['FTPServer'];
      strgrHostingList.Cells[2, currentRec] :=
        datetimetostr(FieldValues['RenewalDate']);
      Next;
      strgrHostingList.RowCount := strgrHostingList.RowCount + 1;
      inc(currentRec);
    end; // END WHILE NOT EOF
  end; // END WITH HOSTING DM
end; // ENDPROC

procedure TformMain.openDomain(dName: string; dExten: string);
var
  Tab: TTabSheet;
  titleLabel: TLabel;
  domainDotLabel: TLabel;
  domainEdit: TDBEdit;
  DataSource: TDataSource;
begin
  // select only the needed domain
  with datamoduleMain.datasetSingleDomain do
  begin
    Close;
    Parameters.ParambyName('dname').Value := dName;
    Parameters.ParambyName('dexten').Value := dExten;
    Open;
  end;
  // create a new tab
  Tab := createTab(dName + '.' + dExten, pagecontrolMain);
  // make labels
  titleLabel := CreateLabel(formMain, dName + '.' + dExten, Tab, 0, 0, 3, 10,
    [akLeft, akTop]);
  titleLabel.Font.Size := 14;
  // make domain edit options
  domainEdit := CreateDBEdit(formMain, datamoduleMain.datasourceSingleDomain,
    'DomainName', Tab, 300, 30, 3, 40, [akLeft, akTop, akRight]);
  domainDotLabel := CreateLabel(formMain, '.', Tab, 0, 0, 305, 40,
    [akLeft, akTop]);
end;

procedure TformMain.strgrDomainListClick(Sender: TObject);
var
  domain, dName, dExtension: string;
  i, n: integer;
  foundDot: boolean;
begin
  // decide if a button cell was clicked
  if strgrDomainList.Col = 2 then
  begin
    // get the primary key
    domain := strgrDomainList.Cells[0, strgrDomainList.row];
    foundDot := false;
    i := 0;
    dName := '';
    dExtension := '';
    while (i <> length(domain)) and (not foundDot) do
    begin
      if domain[i] = '.' then
      begin
        foundDot := true;
        dName := Copy(domain, 1, i - 1);
        dExtension := Copy(domain, i + 1, length(domain));
      end;
      inc(i);
    end;
    openDomain(dName, dExtension);
  end;
end;

procedure TformMain.toolbutOpenProjectClick(Sender: TObject);
begin
  currentProject.Free;
  formLoadProject.Show;
end;

end.

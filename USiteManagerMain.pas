unit USiteManagerMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.Menus, Vcl.ImgList, Generics.Collections,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.Mask, DBCtrls, Data.DB,
  Data.Win.ADODB, shellAPI;

type

  TDomainDetails = class
  private
  public

  end;

  TProject = class
  private
    PID: integer;
    CID: integer;
    PName: string;
  public
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
    popupTabMenu: TPopupMenu;
    moCloseTab: TMenuItem;
    procedure toolbutOpenProjectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure openProject(project: TProject);
    procedure openDomain(dId: integer);
    procedure saveDomain(dName:string);
    procedure strgrDomainListClick(Sender: TObject);
    procedure moCloseTabClick(Sender: TObject);
    procedure buttonUpdateDBClick(Sender: TObject);
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

procedure TformMain.buttonUpdateDBClick(Sender: TObject);
begin
  SaveDomain(dNameEdit.text);
end;


procedure TformMain.FormCreate(Sender: TObject);
begin
  // initialise program defaults
  currentProjectTab := tabshProject;
  currentProjectTab.Hide;
  currentProjectTab.TabVisible := false;
  pagecontrolMain.ActivePage := tabshInitial;
end;

procedure OpenLink(URL: string);
begin
  ShellExecute(Application.Handle, PChar('open'), PChar(URL), nil, nil,
    SW_SHOW);
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
  strgrDomainList.Cells[0, 0] := 'ID';
  strgrDomainList.Cells[1, 0] := 'Domain Name';
  strgrDomainList.Cells[2, 0] := 'Expiration Date';
  strgrDomainList.Cells[3, 0] := 'View/Edit Details';
  strgrHostingList.Cells[0, 0] := 'ID';
  strgrHostingList.Cells[1, 0] := 'FTP Server';
  strgrHostingList.Cells[2, 0] := 'Expiration Date';
  strgrHostingList.Cells[3, 0] := 'View/Edit Details';
  // query to get the list of domains
  with datamoduleMain.datasetDomain do
  begin
    Close;
    CommandText :=
      'SELECT `DomainID`,`DomainName`,`DomainExtension`,`RenewalDate` from `domain` WHERE `ProjectID` = '
      + inttostr(project.ID) + ';';
    Open;
    First;
    currentRec := 1;
    while (not Eof) do
    begin
      strgrDomainList.RowCount := strgrDomainList.RowCount + 1;
      strgrDomainList.Cells[0, currentRec] := inttostr(FieldValues['DomainID']);
      strgrDomainList.Cells[1, currentRec] := FieldValues['DomainName'] + '.' +
        FieldValues['DomainExtension'];
      Next;
      strgrDomainList.Cells[2, currentRec] :=
        datetimetostr(FieldValues['RenewalDate']);
      inc(currentRec);
    end; // END WHILE NOT EOF
    strgrDomainList.RowCount := strgrDomainList.RowCount - 1;
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
      strgrHostingList.RowCount := strgrHostingList.RowCount + 1;
      strgrHostingList.Cells[0, currentRec] :=
        inttostr(FieldValues['HostingID']);
      strgrHostingList.Cells[1, currentRec] := FieldValues['FTPServer'];
      strgrHostingList.Cells[2, currentRec] :=
        datetimetostr(FieldValues['RenewalDate']);
      Next;
      inc(currentRec);
    end; // END WHILE NOT EOF
    strgrHostingList.RowCount := strgrHostingList.RowCount - 1;
  end; // END WITH HOSTING DM
end; // ENDPROC

procedure TformMain.moCloseTabClick(Sender: TObject);
begin
  pagecontrolMain.ActivePage.Free;
end;

procedure TformMain.saveDomain;
begin
  // save domain
  // placeholder...
end;

procedure TformMain.openDomain(dId: integer);
var
  dName, dExten, PName, rName: string;
  expireDate: TDate;
  PID, drID: integer;
  Tab: TTabSheet;
  dnameEdit: TDBEdit;
  titleLabel: TLabel;
begin
  // query the different tables
  // get basic domain details
  with datamoduleMain.datasetSingleDomain do
  begin
    Close;
    Parameters.ParambyName('did').Value := dId;
    Open;
    PID := FieldValues['ProjectID'];
    dName := FieldValues['DomainName'];
    dExten := FieldValues['DomainExtension'];
    drID := FieldValues['DomainRegistrarID'];
    expireDate := FieldValues['RenewalDate'];
  end;
  // get project and registrar names
  with datamoduleMain.datasetSingleProject do
  begin
    Close;
    Parameters.ParambyName('pid').Value := PID;
    Open;
    PName := FieldValues['ProjectName'];
  end;
  with datamoduleMain.datasetSingleDomainReg do
  begin
    Close;
    Parameters.ParambyName('rid').Value := drID;
    Open;
    rName := FieldValues['Name'];
  end;
  // prepare datasets for combobox read
  with datamoduleMain.datasetProject do
  begin
    Close;
    CommandText := 'SELECT * FROM project;';
    Open;
  end;
  with datamoduleMain.datasetDomainReg do
  begin
    Close;
    CommandText := 'SELECT * FROM domainregistrar;';
    Open;
  end;
  // create a new tab
  Tab := createTab(dName + '.' + dExten, pagecontrolMain);
  // make labels
  titleLabel := CreateLabel(formMain, dName + '.' + dExten, Tab, 0, 0, 3, 10,
    [akLeft, akTop]);
  titleLabel.Font.Size := 14;
  // titleLabel.OnClick := OpenLink('http://'+dname+'.'+dexten);
  // make domain edit options
  CreateLabel(formMain, 'Domain Name:', Tab, 0, 0, 5, 40, [akLeft, akTop]);
  CreateDBEdit(formMain, datamoduleMain.datasourceSingleDomain, 'DomainName',
    Tab, 120, 30, 5, 60, [akLeft, akTop]);
  CreateLabel(formMain, '.', Tab, 0, 0, 130, 60, [akLeft, akTop]);
  CreateDBEdit(formMain, datamoduleMain.datasourceSingleDomain,
    'DomainExtension', Tab, 60, 30, 135, 60, [akLeft, akTop]);
  // project options
  CreateLabel(formMain, 'Currently Assigned To Project:', Tab, 0, 0, 5, 95,
    [akLeft, akTop]);
  CreateDBDropdown(formMain, datamoduleMain.datasourceProject, 'ProjectName',
    PName, Tab, 130, 30, 160, 90, [akLeft, akTop]);
  // domain registrar options
  CreateLabel(formMain, 'Registered with:', Tab, 0, 0, 5, 120, [akLeft, akTop]);
  CreateDBDropdown(formMain, datamoduleMain.datasourceDomainReg, 'Name', rName,
    Tab, 130, 30, 160, 117, [akLeft, akTop]);
  CreateButton(formMain, 'View Details', buttonUpdateDBClick, Tab, 100, 30, 290, 117,
    [akLeft, akTop]);
  // domain expiration
  CreateLabel(formMain, 'Expires on:', Tab, 0, 0, 5, 145, [akLeft, akTop]);
  CreateDateTimePicker(formMain, expireDate, Tab, 130, 30, 160, 145,
    [akLeft, akTop]);
end;

procedure TformMain.strgrDomainListClick(Sender: TObject);
var
  domainID: integer;
begin
  // decide if a button cell was clicked
  if strgrDomainList.Col = 3 then
  begin
    // get the primary key
    domainID := strtoint(strgrDomainList.Cells[0, strgrDomainList.row]);
    openDomain(domainID);
  end;
end;

procedure TformMain.toolbutOpenProjectClick(Sender: TObject);
begin
  currentProject.Free;
  formLoadProject.Show;
end;

end.

unit UDatabaseView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, UClass, UData, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, Data.Win.ADODB, System.UITypes;

type
  TformDatabaseView = class(TForm)
    mmDatabaseView: TMainMenu;
    mmClose: TMenuItem;
    llabelTitle: TLinkLabel;
    gboxHostingDetails: TGroupBox;
    gboxDatabaseDetails: TGroupBox;
    gboxControls: TGroupBox;
    buttonUpdate: TButton;
    buttonDelete: TButton;
    lblHostname: TLabel;
    lblDatabaseName: TLabel;
    dbeditHostname: TDBEdit;
    dbeditDatabaseName: TDBEdit;
    gboxClientCredentials: TGroupBox;
    lblUsername: TLabel;
    lblPassword: TLabel;
    dbeditUsername: TDBEdit;
    dbeditPassword: TDBEdit;
    dbcomboHosting: TDBLookupComboBox;
    dbcomboHostReg: TDBLookupComboBox;
    lblHosting: TLabel;
    lblHostReg: TLabel;
    datasetSingleDatabase: TADODataSet;
    datasourceSingleDatabase: TDataSource;
    datasetHosting: TADODataSet;
    datasetHostReg: TADODataSet;
    datasourceHosting: TDataSource;
    datasourceHostReg: TDataSource;
    procedure mmCloseClick(Sender: TObject);
    procedure buttonDeleteClick(Sender: TObject);
    procedure buttonUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    Database: TDatabase;
    procedure doOpen(Database: TDatabase);
    procedure doUpdate(DBID: integer);
  end;

var
  formDatabaseView: TformDatabaseView;

implementation

{$R *.dfm}

uses UMain;

procedure TformDatabaseView.doUpdate(DBID: integer);
var
  NewDB: TDatabase;
  ProjectID: integer;
begin
  // make new db object
  NewDB := TDatabase.Create(DBID, dbcomboHostReg.KeyValue,
    dbcomboHosting.KeyValue, dbeditDatabaseName.Text, dbeditUsername.Text,
    dbeditPassword.Text, dbeditHostname.Text);
  // push to mysql db
  with datasetSingleDatabase do
  begin
    Close;
    Parameters.ParamByName('dbid').Value := DBID;
    Open;
    Edit;
    FieldValues['HostRegistrarID'] := NewDB.HostRegistrarID;
    FieldValues['HostingID'] := NewDB.HostingID;
    FieldValues['Name'] := NewDB.Name;
    FieldValues['Username'] := NewDB.Username;
    FieldValues['Password'] := NewDB.Password;
    FieldValues['Hostname'] := NewDB.Hostname;
    Post;
  end;
  NewDB.Free;
  dbcomboHosting.ListSource := nil;
  with datasetHosting do
  begin
    Close;
    CommandText := 'SELECT `ProjectID` FROM `hosting` WHERE `HostingID` = ' +
      inttostr(Database.HostingID);
    Open;
    ProjectID := FieldValues['ProjectID'];
  end;
  formmain.RefreshProject(ProjectID);
  Self.Free;
end;

procedure TformDatabaseView.buttonDeleteClick(Sender: TObject);
var
  butSelected, ProjectID: integer;
begin
  // show a messagebox confirming delete
  butSelected := MessageDlg('Are you sure you want to delete ' + Database.Name +
    '? This operation cannot be undone.', mtConfirmation, mbOKCancel, 0);
  case butSelected of
    mrOk:
      begin
        // get project id
        dbcomboHosting.ListSource := nil;
        if Database.HostingID <> 0 then
        begin
          with datasetHosting do
          begin
            Close;
            CommandText :=
              'SELECT `ProjectID` FROM `hosting` WHERE `HostingID` = ' +
              inttostr(Database.HostingID);
            Open;
            ProjectID := FieldValues['ProjectID'];
          end;
        end;
        formmain.DeleteDatabase(Database.DatabaseID);
        if Database.HostingID <> 0 then
          formmain.RefreshProject(ProjectID);
        Self.Free;
      end;
    mrCancel:
      MessageDlg('Database not deleted.', mtInformation, [mbOK], 0);
  end;
end;

procedure TformDatabaseView.buttonUpdateClick(Sender: TObject);
begin
  doUpdate(Database.DatabaseID);
end;

procedure TformDatabaseView.doOpen(Database: TDatabase);
begin
  // title label
  llabelTitle.Caption := Database.Name;
  // parameters
  with datasetSingleDatabase do
  begin
    Close;
    Parameters.ParamByName('dbid').Value := Database.DatabaseID;
    Open;
  end;
  // comboboxes
  dbcomboHosting.KeyValue := Database.HostingID;
  dbcomboHostReg.KeyValue := Database.HostRegistrarID;
end;

procedure TformDatabaseView.mmCloseClick(Sender: TObject);
begin
  Self.Free;
end;

end.

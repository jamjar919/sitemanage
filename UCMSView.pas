unit UCMSView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, UClass, Data.DB, Data.Win.ADODB, UData;

type
  TformCMSView = class(TForm)
    mmCMSView: TMainMenu;
    mmClose: TMenuItem;
    llabelTitle: TLinkLabel;
    gboxInstallationDetails: TGroupBox;
    gboxAdminCredentials: TGroupBox;
    gboxOtherDetails: TGroupBox;
    gboxControls: TGroupBox;
    buttonUpdate: TButton;
    buttonDelete: TButton;
    lblInstallDirectory: TLabel;
    lblThemeName: TLabel;
    lblTablePrefix: TLabel;
    lblCMSType: TLabel;
    dbcomboCMSType: TDBLookupComboBox;
    dbeditThemeName: TDBEdit;
    dbeditInstallDirectory: TDBEdit;
    dbeditTablePrefix: TDBEdit;
    dbeditAdminUsername: TDBEdit;
    dbeditAdminPassword: TDBEdit;
    lblAdminUsername: TLabel;
    lblAdminPassword: TLabel;
    gboxClientCredentials: TGroupBox;
    lblClientUsername: TLabel;
    lblClientPassword: TLabel;
    dbeditClientUsername: TDBEdit;
    dbeditClientPassword: TDBEdit;
    lblDatabase: TLabel;
    lblHosting: TLabel;
    dbcomboHosting: TDBLookupComboBox;
    dbcomboDatabase: TDBLookupComboBox;
    datasetSingleCMS: TADODataSet;
    datasetCMSType: TADODataSet;
    datasetHosting: TADODataSet;
    datasetDatabase: TADODataSet;
    datasourceSingleCMS: TDataSource;
    datasourceCMSType: TDataSource;
    datasourceHosting: TDataSource;
    datasourceDatabase: TDataSource;
    lblSlash: TLabel;
    procedure dbcomboHostingClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    hostingChanged: boolean;
  public
    CMS: TCMS;
    procedure doOpen(CMS: TCMS);
    procedure doUpdate(CMSID: integer);
  end;

var
  formCMSView: TformCMSView;

implementation

{$R *.dfm}

procedure TformCMSView.doUpdate(CMSID:integer);
begin
  //update cms details
end;

procedure TformCMSView.dbcomboHostingClick(Sender: TObject);
begin
  if (dbcomboHosting.KeyValue <> CMS.HostingID) or (hostingChanged) then
  begin
    with datasetDatabase do
    begin
      close;
      parameters.ParamByName('hid').Value := dbcomboHosting.KeyValue;
      open;
    end;
    dbcomboDatabase.KeyValue := 0;
    hostingChanged := true;
  end;
end;

procedure TformCMSView.doOpen(CMS: TCMS);
begin
  // title lable
  llabelTitle.caption := '/' + CMS.Directory;
  // set parameters
  with datasetSingleCMS do
  begin
    close;
    parameters.ParamByName('cmid').Value := CMS.CMSID;
    open;
  end;
  with datasetDatabase do
  begin
    close;
    parameters.ParamByName('hid').Value := CMS.HostingID;
    open;
  end;
  dbcomboCMSType.KeyValue := CMS.CMSTypeID;
  dbcomboHosting.KeyValue := CMS.HostingID;
  dbcomboDatabase.KeyValue := CMS.DatabaseID;
end;

procedure TformCMSView.FormCreate(Sender: TObject);
begin
  hostingChanged := false;
end;

end.
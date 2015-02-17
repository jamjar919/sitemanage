unit UDomainView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, Data.Win.ADODB, UData, UClass, Vcl.ComCtrls,
  ShellAPI;

type
  TformDomainView = class(TForm)
    mmDomainView: TMainMenu;
    dbeditDomainName: TDBEdit;
    labelDomain: TLabel;
    llabelTitle: TLinkLabel;
    labelDot: TLabel;
    datasetSingleDomain: TADODataSet;
    datasourceSingleDomain: TDataSource;
    dbcomboDomainExtension: TDBComboBox;
    gboxDomainDetails: TGroupBox;
    dtpickDomainRenewal: TDateTimePicker;
    dbeditRenewalCost: TDBEdit;
    labelRenewalDate: TLabel;
    labelRenewalCost: TLabel;
    gboxOtherDetails: TGroupBox;
    datasetSingleDomainReg: TADODataSet;
    datasourceSingleDomainReg: TDataSource;
    mmClose: TMenuItem;
    datasetDomainReg: TADODataSet;
    labelDomainReg: TLabel;
    datasourceDomainReg: TDataSource;
    datasetSingleDomainDomainID: TAutoIncField;
    datasetSingleDomainDomainName: TStringField;
    datasetSingleDomainDomainExtension: TStringField;
    datasetSingleDomainProjectID: TIntegerField;
    datasetSingleDomainDomainRegistrarID: TIntegerField;
    datasetSingleDomainRenewalDate: TDateField;
    datasetSingleDomainRenewalCost: TFloatField;
    dbcomboDomainReg: TDBLookupComboBox;
    buttonDecrypt: TButton;
    buttonUpdate: TButton;
    gboxControls: TGroupBox;
    buttonDelete: TButton;
    labelProject: TLabel;
    dbcomboProject: TDBLookupComboBox;
    datasetproject: TADODataSet;
    datasourceProject: TDataSource;
    procedure llabelTitleClick(Sender: TObject);
    procedure buttonDeleteClick(Sender: TObject);
    procedure buttonUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    Domain: TDomain;
    procedure doOpen(Domain: TDomain);
  end;

var
  formDomainView: TformDomainView;

implementation

{$R *.dfm}

uses UMain;

procedure TformDomainView.buttonDeleteClick(Sender: TObject);
var
  butSelected: integer;
begin
  // show a messagebox confirming delete
  butSelected := MessageDlg('Are you sure you want to delete ' +
    Domain.DomainName + '.' + Domain.DomainExtension +
    '? This operation cannot be undone.', mtConfirmation, mbOKCancel, 0);
  case butSelected of
    mrOk:
      begin
        formmain.DeleteDomain(Domain.DomainID);
        self.free;
      end;
    mrCancel:
      MessageDlg('Domain not deleted', mtInformation, [mbOK], 0);
  end;
end;

procedure TformDomainView.buttonUpdateClick(Sender: TObject);
var
  DID: integer;
begin
  //change the domain object
  //Domain :=  tDomain.Create();
end;

procedure TformDomainView.doOpen(Domain: TDomain);
var
  fullDomain: string;
begin
  // make connection and select data
  datasetDomainReg.Active := true;
  with datasetSingleDomain do
  begin
    Close;
    parameters.ParamByName('did').Value := Domain.DomainID;
    Open;
    Active := true;
  end;
  with datasetSingleDomainReg do
  begin
    Close;
    parameters.ParamByName('rid').Value := Domain.DomainRegistrarID;
    Open;
    Active := true;
  end;
  fullDomain := datasetSingleDomain.FieldValues['DomainName'] + '.' +
    datasetSingleDomain.FieldValues['DomainExtension'];
  // most fields will get data some we have to change ourselves
  llabelTitle.Caption := '<a href="http://' + fullDomain + '">' +
    fullDomain + '</a>';
  dtpickDomainRenewal.Date := datasetSingleDomain.FieldValues['RenewalDate'];
  // dbcomboDomainReg.Align := datasetSingleDomainReg.FieldValues['Name'];
  datasetDomainReg.Locate('RegistrarID', datasetSingleDomain.FieldValues
    ['DomainRegistrarID'], []);
  dbcomboDomainReg.KeyValue := datasetSingleDomain.FieldValues
    ['DomainRegistrarID'];
  datasetProject.Active := true;
  datasetProject.Locate('ProjectID',Domain.ProjectID,[]);
  dbcomboProject.KeyValue := Domain.ProjectID;
end;

procedure TformDomainView.llabelTitleClick(Sender: TObject);
begin
  ShellAPI.ShellExecute(0, 'Open', PChar(llabelTitle.Caption), PChar(''), nil,
    SW_SHOWNORMAL);
end;

end.

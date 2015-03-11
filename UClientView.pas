unit UClientView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Data.Win.ADODB, UData, UClass;

type
  TformClientView = class(TForm)
    mmClientView: TMainMenu;
    mmClose: TMenuItem;
    gboxClientDetails: TGroupBox;
    llabelTitle: TLinkLabel;
    gboxContactDetails: TGroupBox;
    gboxSocialMedia: TGroupBox;
    lblName: TLabel;
    lblCompanyName: TLabel;
    dbeditFirstName: TDBEdit;
    dbeditCompanyName: TDBEdit;
    lblTelephone: TLabel;
    dbeditTelephone: TDBEdit;
    dbricheditAddress: TDBRichEdit;
    lblAddress: TLabel;
    dbeditPostcode: TDBEdit;
    lblPostcode: TLabel;
    dbeditEmail: TDBEdit;
    lblEmail: TLabel;
    dbeditLastName: TDBEdit;
    lblFacebook: TLabel;
    lblTwitter: TLabel;
    lblFacebookURL: TLabel;
    lblAt: TLabel;
    dbeditFacebook: TDBEdit;
    dbeditTwitter: TDBEdit;
    gboxMisc: TGroupBox;
    comboboxHowFound: TComboBox;
    lblHowFound: TLabel;
    lblNotes: TLabel;
    dbricheditNotes: TDBRichEdit;
    datasetSingleClient: TADODataSet;
    datasourceClient: TDataSource;
    gboxControls: TGroupBox;
    buttonUpdate: TButton;
    buttonDelete: TButton;
    procedure mmCloseClick(Sender: TObject);
    procedure buttonUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    Client: TClient;
    procedure doOpen(Client: TClient);
    procedure doUpdate(CLID: Integer);
  end;

var
  formClientView: TformClientView;

implementation

{$R *.dfm}

procedure TformClientView.mmCloseClick(Sender: TObject);
begin
  self.Free;
end;

procedure TformClientView.buttonUpdateClick(Sender: TObject);
begin
  doUpdate(Client.ClientID);
end;

procedure TformClientView.doOpen(Client: TClient);
begin
  // title label
  llabelTitle.Caption := Client.FirstName + ' ' + Client.LastName;
  // parameters
  with datasetSingleClient do
  begin
    Close;
    Parameters.ParamByName('clid').Value := Client.ClientID;
    Open;
    Active := True;
  end;
end;

procedure TformClientView.doUpdate(CLID: Integer);
var
  NewClient: TClient;
begin
  // make new client object
  NewClient := TClient.Create(CLID, dbeditFirstName.Text, dbeditLastName.Text,
    dbeditCompanyName.Text, dbeditTelephone.Text, dbricheditAddress.Text,
    dbeditPostcode.Text, dbeditEmail.Text, comboboxHowFound.ItemIndex,
    dbeditTwitter.Text, dbeditFacebook.Text, dbricheditNotes.Text);
  // push to db
  with datasetSingleClient do
  begin
    Close;
    Parameters.ParamByName('clid').Value := NewClient.ClientID;
    Open;
    Edit;
    FieldValues['FirstName'] := NewClient.FirstName;
    FieldValues['LastName'] := NewClient.LastName;
    FieldValues['CompanyName'] := NewClient.CompanyName;
    FieldValues['Telephone'] := NewClient.Telephone;
    FieldValues['Address'] := NewClient.Address;
    FieldValues['Postcode'] := NewClient.Postcode;
    FieldValues['Email'] := NewClient.Email;
    FieldValues['HowFound'] := NewClient.HowFound;
    FieldValues['TwitterPage'] := NewClient.TwitterPage;
    FieldValues['FacebookPage'] := NewClient.FacebookPage;
    FieldValues['Notes'] := NewClient.Notes;
    Post;
  end;
  NewClient.Free;
  Self.Free;
end;

end.

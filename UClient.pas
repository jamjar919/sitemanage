unit UClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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
    dbeditEmailAddress: TDBEdit;
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
    procedure mmCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    Client: TClient;
  end;

var
  formClientView: TformClientView;

implementation

{$R *.dfm}

procedure TformClientView.mmCloseClick(Sender: TObject);
begin
  self.Free;
end;

end.

unit ULoadClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, UData ;

type
  TformLoadClient = class(TForm)
    dbcomboClient: TDBLookupComboBox;
    buttonLoad: TButton;
    datasetClient: TADODataSet;
    datasourceClient: TDataSource;
    procedure buttonLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLoadClient: TformLoadClient;

implementation

{$R *.dfm}

uses UMain;

procedure TformLoadClient.buttonLoadClick(Sender: TObject);
begin
  //load client
  formMain.OpenClient(dbcomboClient.KeyValue);
  self.free;
end;

end.

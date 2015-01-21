unit UDataStoresSM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Bde.DBTables;

type
  TdatamoduleMain = class(TDataModule)
    connectionMain: TADOConnection;
    datasetProjects: TADODataSet;
    datasourceProjects: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datamoduleMain: TdatamoduleMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UMainSM;

{$R *.dfm}

end.

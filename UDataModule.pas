unit UDataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdatamoduleMain = class(TDataModule)
    ADOCmain: TADOConnection;
    datasetProject: TADODataSet;
    datasourceProject: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datamoduleMain: TdatamoduleMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

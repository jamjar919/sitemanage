unit UData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdatamoduleMain = class(TDataModule)
    ADONextnorth: TADOConnection;
    datasetDelete: TADODataSet;
    commandDelete: TADOCommand;
    datasetCreate: TADODataSet;
    commandCreate: TADOCommand;
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

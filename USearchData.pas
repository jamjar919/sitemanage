unit USearchData;

interface

uses
  System.SysUtils, System.Classes, UData, Data.DB, Data.Win.ADODB;

type
  TdatamoduleSearch = class(TDataModule)
    datasourceSearch: TDataSource;
    datasetSearchProject: TADODataSet;
    datasetSearchDomain: TADODataSet;
    datasetSearchHosting: TADODataSet;
    datasetSearchCMS: TADODataSet;
    datasetSearchDatabase: TADODataSet;
    datasetSearchClient: TADODataSet;
    datasetSearchTask: TADODataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datamoduleSearch: TdatamoduleSearch;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

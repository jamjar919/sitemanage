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
    datasetSearchDomainDomainID: TAutoIncField;
    datasetSearchDomainDomainName: TStringField;
    datasetSearchDomainDomainExtension: TStringField;
    datasetSearchDomainRenewalDate: TDateField;
    datasetSearchDomainRenewalCost: TFloatField;
    datasetSearchDomainProjectName: TStringField;
    datasetSearchDomainName: TStringField;
    datasetSearchHostingFTPServer: TStringField;
    datasetSearchHostingFTPPort: TIntegerField;
    datasetSearchHostingRenewalDate: TDateField;
    datasetSearchHostingRenewalCost: TFloatField;
    datasetSearchHostingProjectName: TStringField;
    datasetSearchHostingDomainName: TStringField;
    datasetSearchHostingDomainExtension: TStringField;
    datasetSearchHostingName: TStringField;
    datasetSearchProjectProjectID: TAutoIncField;
    datasetSearchProjectProjectName: TStringField;
    datasetSearchProjectCompanyName: TStringField;
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

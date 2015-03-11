unit USearchData;

interface

uses
  System.SysUtils, System.Classes, UData, Data.DB, Data.Win.ADODB;

type
  TdatamoduleSearch = class(TDataModule)
    datasourceSearch: TDataSource;
    datasetSearchProject: TADODataSet;
    datasetSearchCMS: TADODataSet;
    datasetSearchClient: TADODataSet;
    datasetSearchTask: TADODataSet;
    datasetSearchProjectProjectID: TAutoIncField;
    datasetSearchProjectProjectName: TStringField;
    datasetSearchProjectCompanyName: TStringField;
    datasetSearchHosting: TADODataSet;
    datasetSearchDomain: TADODataSet;
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
    datasetSearchCMSCMSID: TAutoIncField;
    datasetSearchCMSDirectory: TStringField;
    datasetSearchCMSTablePrefix: TStringField;
    datasetSearchCMSThemeName: TStringField;
    datasetSearchCMSFTPServer: TStringField;
    datasetSearchCMSName: TStringField;
    datasetSearchCMSName_1: TStringField;
    datasetSearchHostingHostingID: TAutoIncField;
    datasetSearchDatabase: TADODataSet;
    datasetSearchDatabaseName: TStringField;
    datasetSearchDatabaseHostname: TStringField;
    datasetSearchDatabaseFTPServer: TStringField;
    datasetSearchDatabaseName_1: TStringField;
    datasetSearchDatabaseDatabaseID: TAutoIncField;
    datasetSearchClientClientID: TAutoIncField;
    datasetSearchClientFirstName: TStringField;
    datasetSearchClientLastName: TStringField;
    datasetSearchClientCompanyName: TStringField;
    datasetSearchClientTelephone: TStringField;
    datasetSearchClientEmail: TStringField;
    datasetSearchTaskTaskID: TAutoIncField;
    datasetSearchTaskProjectName: TStringField;
    datasetSearchTaskTaskDescription: TStringField;
    datasetSearchTaskMinutesWorked: TIntegerField;
    datasetSearchTaskRatePerHour: TFloatField;
    datasetSearchTaskCompleted: TBooleanField;
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

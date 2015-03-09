unit USearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.StdCtrls,
  UClass, USearchData, Vcl.DBGrids, Data.DB, Data.Win.ADODB, UData;

Const
  TABLES_TO_SEARCH = 7;
  CLIENT_FIELDS = 11;
  CMS_FIELDS = 4;
  DATABASE_FIELDS = 3;
  DOMAIN_FIELDS = 5;
  HOSTING_FIELDS = 5;
  PROJECT_FIELDS = 2;
  TASK_FIELDS = 2;

type
  TTypeArray = Array [0 .. 6] of TSingleDatatype;

  TformSearch = class(TForm)
    mmSearch: TMainMenu;
    mmClose: TMenuItem;
    editSearch: TEdit;
    butttonSearch: TButton;
    lblSearchFor: TLabel;
    lblIn: TLabel;
    comboboxData: TComboBox;
    dbgridDisplaySearch: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure butttonSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    typeArray: TTypeArray;
    procedure fillComboBox(var ComboBox: TComboBox; var typeArray: TTypeArray);
    procedure changeDataset(Datatype: TSingleDatatype);
    procedure SearchDatabase(SearchText: string; Datatype: TSingleDatatype);
  end;

var
  formSearch: TformSearch;

implementation

{$R *.dfm}

procedure TformSearch.SearchDatabase(SearchText: string;
  Datatype: TSingleDatatype);
begin
  changeDataset(Datatype);
  // insert parameter
  with (datamoduleSearch.datasourceSearch.DataSet as TADODataSet) do
  begin
    Close;
    Parameters.ParamByName('search').value := SearchText;
    Open;
    Active := True;
  end;
end;

procedure TformSearch.butttonSearchClick(Sender: TObject);
begin
  SearchDatabase(editSearch.Text, typeArray[comboboxData.ItemIndex]);
end;

procedure TformSearch.changeDataset(Datatype: TSingleDatatype);
begin
  // change the data set dependent on the selected datatype
  datamoduleSearch.datasourceSearch.DataSet.Close;
  case Datatype.Datatype of
    dtProject:
      begin
        datamoduleSearch.datasourceSearch.DataSet :=
          datamoduleSearch.datasetsearchProject;
      end;
    dtDomain:
      begin
        datamoduleSearch.datasourceSearch.DataSet :=
          datamoduleSearch.datasetsearchDomain;
      end;
    dtHosting:
      begin
        datamoduleSearch.datasetSearchHosting.Close;
        datamoduleSearch.datasourceSearch.DataSet :=
          datamoduleSearch.datasetsearchHosting;
      end;
    dtCMS:
      begin
        datamoduleSearch.datasourceSearch.DataSet :=
          datamoduleSearch.datasetsearchCMS;
      end;
    dtDatabase:
      begin
        datamoduleSearch.datasourceSearch.DataSet :=
          datamoduleSearch.datasetsearchDatabase;
      end;
    dtClient:
      begin
        datamoduleSearch.datasourceSearch.DataSet :=
          datamoduleSearch.datasetsearchClient;
      end;
    dtTask:
      begin
        datamoduleSearch.datasourceSearch.DataSet :=
          datamoduleSearch.datasetsearchTask;
      end;
  end;
  datamoduleSearch.datasourceSearch.DataSet.Open;
end;

procedure TformSearch.fillComboBox(var ComboBox: TComboBox;
  var typeArray: TTypeArray);
begin
  // fill the combo box with data types
  ComboBox.Clear;
  ComboBox.Items.Add('Domain');
  typeArray[0] := TSingleDatatype.Create(dtDomain);
  ComboBox.Items.Add('Hosting');
  typeArray[1] := TSingleDatatype.Create(dtHosting);
  ComboBox.Items.Add('CMS');
  typeArray[2] := TSingleDatatype.Create(dtCMS);
  ComboBox.Items.Add('Database');
  typeArray[3] := TSingleDatatype.Create(dtDatabase);
  ComboBox.Items.Add('Client');
  typeArray[4] := TSingleDatatype.Create(dtClient);
  ComboBox.Items.Add('Project');
  typeArray[5] := TSingleDatatype.Create(dtProject);
  ComboBox.Items.Add('Task');
  typeArray[6] := TSingleDatatype.Create(dtTask);
end;

procedure TformSearch.FormCreate(Sender: TObject);
begin
  fillComboBox(comboboxData, typeArray);
end;

end.

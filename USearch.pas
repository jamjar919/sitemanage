unit USearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.StdCtrls,
  UClass, USearchData, Vcl.DBGrids, Data.DB, Data.Win.ADODB, UData;

type
  TTypeArray = Array [0 .. 6] of TSingleDatatype;

  TformSearch = class(TForm)
    mmSearch: TMainMenu;
    mmClose: TMenuItem;
    editSearch: TEdit;
    buttonSearch: TButton;
    lblSearchFor: TLabel;
    lblIn: TLabel;
    comboboxData: TComboBox;
    dbgridDisplaySearch: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure buttonSearchClick(Sender: TObject);
    procedure dbgridDisplaySearchDblClick(Sender: TObject);
    procedure comboboxDataChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    typeArray: TTypeArray;
    procedure fillComboBox(var ComboBox: TComboBox; var typeArray: TTypeArray);
    procedure changeDataset(Datatype: TSingleDatatype);
    procedure SearchDatabase(SearchText: string; Datatype: TSingleDatatype);
    procedure ClearDbGrid(dbGrid: TDBGrid);
    procedure openData(Datatype: TSingleDatatype; dbGrid: TDBGrid);
  end;

var
  formSearch: TformSearch;

implementation

{$R *.dfm}

uses UMain;

procedure TformSearch.openData(Datatype: TSingleDatatype; dbGrid: TDBGrid);
begin
  // perform different actions based on datatype
  case Datatype.Datatype of
    dtProject:
      ;
    dtDomain:
      formMain.OpenDomain(TDomain.Create(dbgridDisplaySearch.Fields[0]
        .AsInteger, 0, 0, dbgridDisplaySearch.Fields[1].AsString, DBGridDisplaySearch.Fields[2].AsString,
        DBGridDisplaySearch.Fields[3].AsDateTime, DBGridDisplaySearch.Fields[4].AsFloat));
    dtHosting:
      ;
    dtCMS:
      ;
    dtDatabase:
      ;
    dtClient:
      ;
    dtTask:
      ;
  end;
end;

procedure TformSearch.ClearDbGrid(dbGrid: TDBGrid);
begin
  dbGrid.DataSource := nil;
end;

procedure TformSearch.comboboxDataChange(Sender: TObject);
begin
  // ClearDbGrid(dbgridDisplaySearch);
end;

procedure TformSearch.SearchDatabase(SearchText: string;
  Datatype: TSingleDatatype);
var
  i: integer;
begin
  changeDataset(Datatype);
  // insert parameter
  with (datamoduleSearch.datasourceSearch.DataSet as TADODataSet) do
  begin
    Close;
    for i := 0 to Parameters.Count - 1 do
      Parameters[i].Value := SearchText;
    Open;
    Active := True;
  end;
end;

procedure TformSearch.buttonSearchClick(Sender: TObject);
begin
  SearchDatabase(editSearch.Text, typeArray[comboboxData.ItemIndex]);
end;

procedure TformSearch.changeDataset(Datatype: TSingleDatatype);
begin
  // change the data set dependent on the selected datatype
  if datamoduleSearch.datasourceSearch.DataSet <> nil then
  begin
    datamoduleSearch.datasourceSearch.DataSet.Close;
    datamoduleSearch.datasourceSearch.DataSet.Active := False;
  end;
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
  datamoduleSearch.datasourceSearch.DataSet.Active := True;
  datamoduleSearch.datasourceSearch.DataSet.Open;
end;

procedure TformSearch.dbgridDisplaySearchDblClick(Sender: TObject);
begin
  openData(typeArray[comboboxData.ItemIndex], dbgridDisplaySearch);
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

procedure TformSearch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearDbGrid(dbgridDisplaySearch);
end;

procedure TformSearch.FormCreate(Sender: TObject);
begin
  fillComboBox(comboboxData, typeArray);
end;

end.

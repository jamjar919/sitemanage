unit UFormElementCreators;

//unit for creating different components at runtime through the use of one function call

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Data.DB, Data.Win.ADODB, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, System.Generics.Collections, Vcl.DBLookup, DBCtrls;

function CreateLabel(form: TForm; caption: string; parent: TWinControl;
  width: integer; height: integer; left: integer; top: integer;
  anchors: TAnchors): TLabel;

function CreateDBEdit(form: TForm; dataSource: TDataSource; dataField: string;
  parent: TWinControl; width: integer; height: integer; left: integer;
  top: integer; anchors: TAnchors): TDBEdit;

function CreateDBDropdown(form: TForm; listSource: TDataSource;
  listField: string; parent: TWinControl; width: integer; height: integer;
  left: integer; top: integer; anchors: TAnchors): TDBLookupComboBox; overload;

function CreateDBDropdown(form: TForm; listSource: TDataSource;
  listField: string; currentValue: string; parent: TWinControl; width: integer;
  height: integer; left: integer; top: integer; anchors: TAnchors)
  : TDBLookupComboBox; overload;
// overload with option for current value of box

function CreateDateTimePicker(form: TForm; Date: TDate; parent: TWinControl;
  width: integer; height: integer; left: integer; top: integer;
  anchors: TAnchors): TDateTimePicker;

function CreateButton(form: TForm; caption: string; onClickEvent: TNotifyEvent; parent: TWinControl;
  width: integer; height: integer; left: integer; top: integer;
  anchors: TAnchors): TButton;

function CreateTab(caption: string; pagecontrol: TPageControl): TTabSheet;

implementation

function CreateTab(caption: string; pagecontrol: TPageControl): TTabSheet;
var
  Tab: TTabSheet;
begin
  Tab := TTabSheet.Create(pagecontrol);
  Tab.caption := caption;
  Tab.pagecontrol := pagecontrol;
  result := Tab;
end;

function CreateLabel(form: TForm; caption: string; parent: TWinControl;
  width: integer; height: integer; left: integer; top: integer;
  anchors: TAnchors): TLabel;
var
  Lb: TLabel;
begin
  Lb := TLabel.Create(form);
  Lb.left := left;
  Lb.top := top;
  Lb.width := width;
  Lb.height := height;
  Lb.Visible := True;
  Lb.parent := parent; // Any container: form, panel, ...
  Lb.caption := caption;
  Lb.anchors := anchors;
  result := Lb;
end;

function CreateDBEdit(form: TForm; dataSource: TDataSource; dataField: string;
  parent: TWinControl; width: integer; height: integer; left: integer;
  top: integer; anchors: TAnchors): TDBEdit;
var
  DBE: TDBEdit;
begin
  DBE := TDBEdit.Create(form);
  DBE.left := left;
  DBE.top := top;
  DBE.width := width;
  DBE.height := height;
  DBE.Visible := True;
  DBE.parent := parent;
  DBE.anchors := anchors;
  DBE.dataSource := dataSource;
  DBE.dataField := dataField;
  result := DBE;
end;

function CreateDBDropdown(form: TForm; listSource: TDataSource;
  listField: string; parent: TWinControl; width: integer; height: integer;
  left: integer; top: integer; anchors: TAnchors): TDBLookupComboBox; overload;
var
  DBD: TDBLookupComboBox;
begin
  DBD := TDBLookupComboBox.Create(form);
  DBD.left := left;
  DBD.top := top;
  DBD.width := width;
  DBD.height := height;
  DBD.Visible := True;
  DBD.parent := parent;
  DBD.listSource := listSource;
  DBD.listField := listField;
  DBD.KeyField := listField;
  DBD.anchors := anchors;
  result := DBD;
end;

function CreateDBDropdown(form: TForm; listSource: TDataSource;
  listField: string; currentValue: string; parent: TWinControl; width: integer;
  height: integer; left: integer; top: integer; anchors: TAnchors)
  : TDBLookupComboBox; overload;
var
  DBD: TDBLookupComboBox;
begin
  DBD := TDBLookupComboBox.Create(form);
  DBD.left := left;
  DBD.top := top;
  DBD.width := width;
  DBD.height := height;
  DBD.Visible := True;
  DBD.parent := parent;
  DBD.listSource := listSource;
  DBD.listField := listField;
  DBD.KeyField := listField;
  DBD.KeyValue := currentValue;
  DBD.anchors := anchors;
  result := DBD;
end;

function CreateDateTimePicker(form: TForm; Date: TDate; parent: TWinControl;
  width: integer; height: integer; left: integer; top: integer;
  anchors: TAnchors): TDateTimePicker;
var
  DTP: TDateTimePicker;
begin
  DTP := TDateTimePicker.Create(form);
  DTP.left := left;
  DTP.top := top;
  DTP.width := width;
  DTP.height := height;
  DTP.Visible := True;
  DTP.parent := parent;
  DTP.anchors := anchors;
  DTP.Date := Date;
  DTP.dateFormat := dfLong;
  result := DTP;
end;

function CreateButton(form: TForm; caption: string; onClickEvent: TNotifyEvent; parent: TWinControl;
  width: integer; height: integer; left: integer; top: integer;
  anchors: TAnchors): TButton;
var
  BUT: TButton;
begin
  BUT := TButton.Create(form);
  BUT.left := left;
  BUT.top := top;
  BUT.width := width;
  BUT.height := height;
  BUT.Visible := True;
  BUT.parent := parent;
  BUT.anchors := anchors;
  //BUT.OnClick := onClickEvent;
  BUT.Caption := caption;
  result := BUT;
end;

end.

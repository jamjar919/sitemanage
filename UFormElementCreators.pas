unit UFormElementCreators;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Data.DB, Data.Win.ADODB, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, System.Generics.Collections, Vcl.DBLookup,DBCtrls;

function CreateLabel(form: TForm; caption: string; parent: TWinControl;
  width: integer; height: integer; left: integer; top: integer;
  anchors: TAnchors): TLabel;

function CreateDBEdit(form: TForm; dataSource: TDataSource; dataField:string; parent: TWinControl;
  width: integer; height: integer; left: integer; top: integer;
  anchors: TAnchors): TDBEdit;

procedure CreateDBDropdown(form: TForm; parent: TWinControl; width: integer;
  height: integer; left: integer; top: integer; anchors: TAnchors;
  listSource, listField: string);

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

function CreateDBEdit(form: TForm; dataSource: TDataSource; dataField:string; parent: TWinControl;
  width: integer; height: integer; left: integer; top: integer;
  anchors: TAnchors): TDBEdit;
var
  DBE: TDBEdit;
begin
  DBE := TDBEdit.Create(form);
  DBE.left := left;
  DBE.top := top;
  DBE.width := width;
  DBE.height := height;
  DBE.Visible := True;
  DBE.parent := parent; // Any container: form, panel, ...
  DBE.anchors := anchors;
  DBE.DataSource := dataSource;
  DBE.DataField := datafield;
  result := DBE;
end;

procedure CreateDBDropdown(form: TForm; parent: TWinControl; width: integer;
  height: integer; left: integer; top: integer; anchors: TAnchors;
  listSource, listField: string);
var
  DBD: TDBLookupCombo;
begin
  DBD := TDBLookupCombo.Create(form);
  DBD.left := left;
  DBD.top := top;
  DBD.width := width;
  DBD.height := height;
  DBD.Visible := True;
  DBD.parent := parent; // Any container: form, panel, ...
  DBD.anchors := anchors;
end;

end.

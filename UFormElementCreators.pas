unit UFormElementCreators;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,System.Generics.Collections,Vcl.DBLookup;

procedure CreateLabel(form: TForm; caption: string; parent: TWinControl;
  width: integer; height: integer; left: integer; top: integer;
  anchors: TAnchors);

procedure CreateDBDropdown(form: TForm; parent: TWinControl;
  width: integer; height: integer; left: integer; top: integer;
  anchors: TAnchors; listSource,listField: string);

function CreateTab(caption: string; pagecontrol: TPageControl):TTabSheet;

implementation

function CreateTab(caption: string; pagecontrol: TPageControl):TTabSheet;
var
  Tab: TTabSheet;
begin
  Tab := TTabSheet.Create(pagecontrol);
  Tab.Caption := 'Project Select';
  Tab.PageControl := pagecontrol;
  result := tab;
end;

procedure CreateLabel(form: TForm; caption: string; parent: TWinControl;
  width: integer; height: integer; left: integer; top: integer;
  anchors: TAnchors);
var
  Lb : TLabel;
begin
  Lb := TLabel.Create(form);
  Lb.Left := left;
  Lb.Top := top;
  Lb.Width := width;
  Lb.Height := height;
  Lb.Visible := True;
  Lb.Parent := parent; //Any container: form, panel, ...
  Lb.caption := caption;
  Lb.Anchors := anchors;
end;

procedure CreateDBDropdown(form: TForm; parent: TWinControl;
  width: integer; height: integer; left: integer; top: integer;
  anchors: TAnchors; listSource,listField: string);
var
  DBD : TDBLookupCombo;
begin
  DBD := TDBLookupCombo.Create(form);
  DBD.Left := left;
  DBD.Top := top;
  DBD.Width := width;
  DBD.Height := height;
  DBD.Visible := True;
  DBD.Parent := parent; //Any container: form, panel, ...
  DBD.Anchors := anchors;
end;
end.

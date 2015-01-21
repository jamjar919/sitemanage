unit USiteManagerMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.Menus, Vcl.ImgList, Generics.Collections;

type
  TformMain = class(TForm)
    coolbarMain: TCoolBar;
    toolbarMain: TToolBar;
    toolbutNewProject: TToolButton;
    toolbutOpenProject: TToolButton;
    toolbarMainImages: TImageList;
    pagecontrolMain: TPageControl;
    tabshInitial: TTabSheet;
    tabsh: TTabSheet;
    procedure toolbutOpenProjectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TProject = class
  private
    PID: integer;
    CID: integer;
    PName: string;
  public
    Children: TList;
    constructor Create(ProjectID:integer; ClientID:integer; Name:string);
    property ID :integer read PID;
    property ClientID:integer read CID;
    property Name:string read PName;
  end;

var
  formMain: TformMain;
  currentProject: TProject;

implementation

{$R *.dfm}

uses UDataModule, ULoadProject;

constructor TProject.Create(ProjectID: Integer; ClientID: Integer; Name: string);
begin
  PID := ProjectID;
  CID := ClientID;
  PName := Name;
end;

procedure TformMain.toolbutOpenProjectClick(Sender: TObject);
begin
  currentProject := TProject.Create(1,1,'test');
  formLoadProject.Show;
end;

end.

unit USiteManagerMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.Menus, Vcl.ImgList;

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
    ProjectID: integer;


  end;

var
  formMain: TformMain;

implementation

{$R *.dfm}

uses UDataModule, ULoadProject;



procedure TformMain.toolbutOpenProjectClick(Sender: TObject);
begin
  formLoadProject.Show;
end;

end.

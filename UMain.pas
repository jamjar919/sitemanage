unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ImgList, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TformMain = class(TForm)
    coolbarMain: TCoolBar;
    toolbarMain: TToolBar;
    imglistToolbar: TImageList;
    tbNew: TToolButton;
    tbLoad: TToolButton;
    tbTools: TToolButton;
    tbReport: TToolButton;
    tpSecurity: TToolButton;
    treeMain: TTreeView;
    panelWelcome: TPanel;
    labelWelcomeTitle: TLabel;
    imageLogo: TImage;
    buttonWelcomeOpenProject: TButton;
    buttonWelcomeGenerateReport: TButton;
    buttonWelcomeSearchData: TButton;
    imageButtonClose: TImage;
    procedure imageButtonCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure closeWelcomeForm;
  end;

var
  formMain: TformMain;

implementation

{$R *.dfm}

procedure TformMain.closeWelcomeForm;
begin
  //unfreeze toolbar
  toolbarMain.Enabled := true;
  //free components
  imageLogo.Free;
  buttonWelcomeOpenProject.Free;
  buttonWelcomeGenerateReport.Free;
  buttonWelcomeSearchData.Free;
  imageButtonClose.Free;
  panelWelcome.Free;
end;

procedure TformMain.FormCreate(Sender: TObject);
begin
  //disable toolbar
  toolbarMain.Enabled := false;
end;

procedure TformMain.imageButtonCloseClick(Sender: TObject);
begin
  closeWelcomeForm;
end;

end.

unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ImgList, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  UClass, UData, UDomainView;

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
    procedure buttonWelcomeOpenProjectClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure displayProjectOnTree(Project:TProject);
    procedure closeWelcomeForm;
    procedure showLoadProjectForm;
  end;

var
  formMain: TformMain;

implementation

{$R *.dfm}

uses ULoadProject;

procedure TFormMain.showLoadProjectForm;
begin
  //show the form
  formLoadProject.show;
end;

procedure TformMain.buttonWelcomeOpenProjectClick(Sender: TObject);
begin
  closeWelcomeForm;
  CurrentProject := TProject.Create(0,0,'Project 1');
  showLoadProjectForm;
end;

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

procedure TformMain.displayProjectOnTree(Project: TProject);
begin
  //display the project on the tree
  //http://jedi.grizzlydev.com/www/art_usingtreeviews.html
  treeMain.Items.AddFirst(TreeMain.Selected,Project.Name);
end;

end.

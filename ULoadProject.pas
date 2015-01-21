unit ULoadProject;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TformLoadProject = class(TForm)
    loadButton: TButton;
    lookupboxProjectSelect: TDBLookupComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLoadProject: TformLoadProject;

implementation

{$R *.dfm}

uses UDataModule;

end.

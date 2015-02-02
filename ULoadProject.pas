unit ULoadProject;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls;

type
  TformLoadProject = class(TForm)
    dbcomboProject: TDBLookupComboBox;
    buttonLoadProject: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLoadProject: TformLoadProject;

implementation

{$R *.dfm}

end.

unit UReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TformReportGenerator = class(TForm)
    dbcomboProject: TDBLookupComboBox;
    gboxProjectReportGen: TGroupBox;
    buttonGenerateProjectReport: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formReportGenerator: TformReportGenerator;

implementation

{$R *.dfm}

end.

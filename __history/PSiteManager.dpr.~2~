program PSiteManager;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {formMain},
  UDomainView in 'UDomainView.pas' {formDomainView},
  UData in 'UData.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TformDomainView, formDomainView);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.

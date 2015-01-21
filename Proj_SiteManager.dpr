program Proj_SiteManager;

uses
  Vcl.Forms,
  USiteManagerMain in 'USiteManagerMain.pas' {formMain},
  UDataModule in 'UDataModule.pas' {datamoduleMain: TDataModule},
  ULoadProject in 'ULoadProject.pas' {formLoadProject};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TdatamoduleMain, datamoduleMain);
  Application.CreateForm(TformLoadProject, formLoadProject);
  Application.Run;
end.

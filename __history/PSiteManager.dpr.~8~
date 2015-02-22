program PSiteManager;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {formMain},
  UDomainView in 'UDomainView.pas' {formDomainView},
  UData in 'UData.pas' {datamoduleMain: TDataModule},
  ULoadProject in 'ULoadProject.pas' {formLoadProject},
  UClass in 'UClass.pas',
  UHostingView in 'UHostingView.pas' {formHostingView},
  UProjectView in 'UProjectView.pas' {formProjectView},
  UCMSView in 'UCMSView.pas' {formCMSView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformMain, formMain);
  //Application.CreateForm(TformDomainView, formDomainView);
  Application.CreateForm(TdatamoduleMain, datamoduleMain);
  Application.CreateForm(TformLoadProject, formLoadProject);
  //Application.CreateForm(TformHostingView, formHostingView);
  //Application.CreateForm(TformProjectView, formProjectView);
  //Application.CreateForm(TformCMSView, formCMSView);
  Application.Run;
end.

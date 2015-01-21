program PSiteManager;

uses
  Vcl.Forms,
  UMainSM in 'UMainSM.pas' {FMain},
  UFormElementCreators in 'UFormElementCreators.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.

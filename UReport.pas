unit UReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, UClass,
  Data.DB, Data.Win.ADODB, UData, DateUtils, SHellApi;

type
  TformReportGenerator = class(TForm)
    dbcomboProject: TDBLookupComboBox;
    gboxProjectReportGen: TGroupBox;
    buttonGenerateProjectReport: TButton;
    datasetProject: TADODataSet;
    datasourceProject: TDataSource;
    procedure buttonGenerateProjectReportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function GetSavePath: string;
    procedure al(var s: string; t: string); // add line procedure
    procedure MakeProjectReport(ProjectID: integer; Directory: string);
    function GenerateProjectReportText(Project: TProject): string;
  end;

var
  formReportGenerator: TformReportGenerator;

implementation

uses
  ULoadProject;

{$R *.dfm}

function TformReportGenerator.GetSavePath: string;
var
  sDialog: TSaveDialog;
begin
  sDialog := TSaveDialog.Create(self);
  sDialog.Title := 'Save Report';
  sDialog.InitialDir := GetCurrentDir;
  sDialog.Filter := 'HTML File|*.html';
  sDialog.DefaultExt := 'html';
  sDialog.FilterIndex := 1;
  if sDialog.Execute then
    result := sDialog.FileName
  else
    result := '';
  sDialog.Free;
end;

procedure TformReportGenerator.al(var s: string; t: string);
begin
  s := s + t + chr(10);
end;

procedure TformReportGenerator.MakeProjectReport(ProjectID: integer;
  Directory: string);
var
  Project: TProject;
  OutputFile: textfile;
begin
  Project := FormLoadProject.LoadProject(ProjectID);
  AssignFile(OutputFile, Directory);
  Rewrite(OutputFile);
  Write(OutputFile, GenerateProjectReportText(Project));
  CloseFile(OutputFile);
end;

procedure TformReportGenerator.buttonGenerateProjectReportClick
  (Sender: TObject);
var
  SavePath: string;
  Choice: integer;
begin
  SavePath := GetSavePath;
  if SavePath <> '' then
  begin
    MakeProjectReport(dbcomboProject.KeyValue, SavePath);
    dbcomboProject.ListSource := nil;
    Choice := MessageDlg('Open report?', mtCustom, [mbYes, mbNo], 0);
    if Choice = mrYes then
      ShellExecute(Handle, pchar('open'), pchar(SavePath), nil, nil,
        SW_SHOWNORMAL);
    self.Free;
  end
  else
    MessageDlg('No save location selected, no file created.', mtCustom,
      [mbOK], 0);
end;

procedure TformReportGenerator.FormCreate(Sender: TObject);
begin
  datasetProject.Active := True;
end;

function TformReportGenerator.GenerateProjectReportText
  (Project: TProject): string;
var
  Domain: TDomain;
  Host: THosting;
  CMS: TCMS;
  Database: TDatabase;
  CurrentDate: TDate;
  i: integer;
  MonthCost: real;
  AllCost: real;
begin
  CurrentDate := Date;
  result := '<!doctype html><html><head>';
  al(result, '<title>Project Report - ' + Project.Name + '</title>');
  al(result, '<link href="style.css" rel="stylesheet" type="text/css">');
  al(result, '</head><body>');
  al(result, '<h1>' + Project.Name + '</h1>');
  al(result, 'Domains: ' + inttostr(Project.DomainList.Count) + ', Hosting: ' +
    inttostr(Project.HostingList.Count) + ', CMS:' +
    inttostr(Project.CMSList.Count) + ', Databases:' +
    inttostr(Project.DatabaseList.Count) + '.<br>');
  al(result, '<hr><h2>All Linked Components</h2> <h3>Domains</h3> <table>');
  al(result,
    '<tr><td>Domain Name</td><td>Registrar</td><td>Renewal Date</td><td>Renewal Cost</td></tr>');
  for Domain in Project.DomainList do
    al(result, '<tr><td>' + Domain.DomainName + '.' + Domain.DomainExtension +
      '</td><td>Registrar</td><td>' + datetostr(Domain.RenewalDate) +
      '</td><td>�' + floattostr((round(Domain.RenewalCost * 100) / 100)) +
      '</td></tr>');
  al(result,
    '</table><h3>Hosting</h3><table><tr><td>FTP Server</td><td>FTP Username</td>');
  al(result,
    '<td>FTP Password</td><td>Registrar</td><td>Renewal Date</td><td>Renewal Cost</td></tr>');
  for Host in Project.HostingList do
    al(result, '<tr><td>' + Host.FtpServer + '</td><td>' + Host.FTPUsername +
      '</td><td>' + Host.FTPPassword + '</td><td>Registrar</td><td>' +
      datetostr(Host.RenewalDate) + '</td><td>�' +
      floattostr((round(Host.RenewalCost * 100) / 100)) + '</td></tr>');
  al(result,
    '</table><h3>CMS</h3><table><tr><td>Directory</td><td>Table Prefix</td><td>Theme Name</td><td>Admin Username</td><td>Admin Password</td><td>Client Username</td><td>Client Password</td></tr>');
  for CMS in Project.CMSList do
    al(result, '<tr><td>' + CMS.Directory + '</td><td>' + CMS.TablePrefix +
      '</td><td>' + CMS.ThemeName + '</td><td>' + CMS.AdminUsername +
      '</td><td>' + CMS.AdminPassword + '</td><td>' + CMS.ClientUsername +
      '</td><td>' + CMS.ClientPassword + '</td></tr>');
  al(result,
    '</table><h3>Databases</h3><table><tr><td>Name</td><td>Username</td><td>Password</td><td>Hostname</td></tr>');
  for Database in Project.DatabaseList do
    al(result, '<tr><td>' + Database.Name + '</td><td>' + Database.Username +
      '</td><td>' + Database.Password + '</td><td>' + Database.Hostname +
      '</td></tr>');
  al(result, '</table><h2>Accounts due for renewal</h2><h3>Domains</h3>');
  i := 0;
  MonthCost := 0;
  AllCost := 0;
  for Domain in Project.DomainList do
  begin
    inc(i);
    if CompareDateTime(Domain.RenewalDate, IncDay(CurrentDate, 31)) = -1 then
    begin
      dec(i);
      case CompareDateTime(CurrentDate, Domain.RenewalDate) of
        - 1:
          begin
            al(result, '<em>' + Domain.DomainName + '.' + Domain.DomainExtension
              + '</em> is due for renewal on ' + datetostr(Domain.RenewalDate) +
              ' and will cost �' +
              floattostr((round(Domain.RenewalCost * 100) / 100)));
            MonthCost := MonthCost + Domain.RenewalCost;
          end;
        0:
          begin
            al(result, '<em>' + Domain.DomainName + '.' + Domain.DomainExtension
              + '</em> is due for renewal today! It will cost �' +
              floattostr((round(Domain.RenewalCost * 100) / 100)));
            MonthCost := MonthCost + Domain.RenewalCost;
          end;
        1:
          al(result, '<em>' + Domain.DomainName + '.' + Domain.DomainExtension +
            '</em> expired on ' + datetostr(Domain.RenewalDate) +
            '. Please update the domain record or delete the domain entry');
      end; // endcase
      al(result, '<br>');
    end; // endif
    AllCost := AllCost + Domain.RenewalCost;
  end; // endfor domain
  al(result, 'There were ' + inttostr(i) +
    ' domains not due for renewal in the next month');
  al(result, '<h3>Hosting</h3>');
  i := 0;
  for Host in Project.HostingList do
  begin
    inc(i);
    if CompareDateTime(Host.RenewalDate, IncDay(CurrentDate, 31)) = -1 then
    begin
      dec(i);
      case CompareDateTime(CurrentDate, Host.RenewalDate) of
        - 1:
          begin
            al(result, '<em>' + Host.FtpServer + '</em> is due for renewal on '
              + datetostr(Host.RenewalDate) + ' and will cost �' +
              floattostr((round(Host.RenewalCost * 100) / 100)));
            MonthCost := MonthCost + Host.RenewalCost;
          end;
        0:
          begin
            al(result, '<em>' + Host.FtpServer +
              '</em> is due for renewal today! It will cost �' +
              floattostr((round(Host.RenewalCost * 100) / 100)));
            MonthCost := MonthCost + Host.RenewalCost;
          end;
        1:
          al(result, '<em>' + Host.FtpServer + '</em> expired on ' +
            datetostr(Host.RenewalDate) +
            '. Please update the domain record or delete the domain entry');
      end;
      al(result, '<br>');
    end; // endif
    AllCost := AllCost + Host.RenewalCost;
  end; // endfor host
  al(result, 'There were ' + inttostr(i) +
    ' hosting accounts not due for renewal in the next month.<br>');
  al(result, 'Renewing all accounts for the next month will cost �' +
    floattostr(round(MonthCost * 100) / 100) +
    ' and renewing all accounts associated with this project now would cost �' +
    floattostr(round(AllCost * 100) / 100));
  AllCost := 0;
  al(result, '<h2>Tasks</h2>');
  al(result,
    '<table><tr><td>Task Description</td><td>Time Worked</td><td>Cost</td><td>Completed?</td><td>Date Completed</td></tr>');
  // get task description from dataset
  with datasetProject do
  begin
    Close;
    CommandText := 'SELECT * FROM task WHERE ProjectID = ' +
      inttostr(Project.ProjectID);
    Open;
    while not EOF do
    begin
      al(result, '<tr><td>' + FieldValues['TaskDescription'] + '</td><td>' +
        inttostr(FieldValues['MinutesWorked'] div 60) + ' Hrs, ' +
        (FieldValues['MinutesWorked'] mod 60) + 'Mins</td><td>' +
        floattostr(round(FieldValues['RatePerHour'] *
        (FieldValues['MinutesWorked'] / 60) * 100) / 100) + '</td>');
      if FieldValues['Completed'] then
        al(result, '<td>Completed</td><td>'+datetostr(FieldValues['DateCompleted'])+'</td>')
      else
        al(result, '<td>Not Completed</td><td>-</td>');
      al(result, '</tr>');
    end;
  end;
  al(result, '</body></html>');
end;

end.
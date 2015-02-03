unit UClass;

interface

uses Generics.Collections;
{ This unit contains all the class definitions that are used across multiple units }

type

  TDomain = class
  private
    DID, PID, DRID: integer;
    // id's for domain, project and domain registrar
    dName, dExten: string;
    rDate: TDate;
    rCost: real;
  public
    HasHosting:boolean;
    property DomainID: integer read DID;
    property ProjectID: integer read PID;
    property DomainRegistrarID: integer read DRID;
    property DomainName: string read dName;
    property DomainExtension: string read dExten;
    property RenewalDate: TDate read rDate;
    property RenewalCost: real read rCost;
    constructor Create(DID, PID, DRID: integer; dName, dExten: string;
      rDate: TDate; rCost: real);
  end;

  THosting = class
  private
    HID, PID, DID, HRID: integer;
    // id's for hosting, project, domain and hosting registrar
    rDate: TDate;
    rCost: real;
    Server, EncUser, EncPass: string; // encuser and encpass are encrypted
    Port: integer;
  public
    property HostingID: integer read HID;
    property ProjectID: integer read PID;
    property DomainID: integer read DID;
    property HostRegistrarID: integer read HRID;
    property RenewalDate: TDate read rDate;
    property RenewalCost: real read rCost;
    property FTPServer: string read Server;
    property FTPUsername: String read EncUser;
    property FTPPassword: string read EncPass;
    property FTPPort: integer read Port;
    constructor Create(HID, PID, DID, HRID: integer; rDate: TDate; rCost: real;
      Server, User, Pass: string; Port: integer);
  end;

  TProject = class
  private
    PID, CID: integer;
    pName: string;
  public
    DomainList: TObjectList<TDomain>;
    HostingList: TObjectList<THosting>;
    property ClientID: integer read CID;
    property ProjectID: integer read PID;
    property Name: string read pName;
    constructor Create(PID, CID: integer; pName: string);
  end;

var
  CurrentProject: TProject;

implementation

constructor THosting.Create(HID: integer; PID: integer; DID: integer;
  HRID: integer; rDate: TDate; rCost: real; Server: string; User: string;
  Pass: string; Port: integer);
begin
  Self.HID := HID;
  Self.PID := PID;
  Self.DID := DID;
  Self.HRID := HRID;
  Self.rDate := rDate;
  Self.rCost := rCost;
  Self.Server := Server;
  Self.EncUser := User;
  Self.EncPass := Pass;
  Self.Port := Port;
end;

constructor TDomain.Create(DID: integer; PID: integer; DRID: integer;
  dName: string; dExten: string; rDate: TDate; rCost: real);
begin
  Self.DID := DID;
  Self.PID := PID;
  Self.DRID := DRID;
  Self.dName := dName;
  Self.dExten := dExten;
  Self.rDate := rDate;
  Self.rCost := rCost;
  Self.HasHosting := False;
end;

constructor TProject.Create(PID: integer; CID: integer; pName: string);
begin
  Self.PID := PID;
  Self.CID := CID;
  Self.pName := pName;
  DomainList := TObjectList<TDomain>.Create;
  HostingList := TObjectList<THosting>.Create;
end;

end.
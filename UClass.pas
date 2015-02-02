unit UClass;

interface

{ This unit contains all the class definitions that are used across multiple units }

implementation

type

  TDomain = class
  private
    DID, PID, DRID: integer;
    // id's for domain, project and domain registrar
    dName, dExten: string;
    rDate: TDate;
    rCost: real;
  public
    property DomainID: integer read DID;
    property ProjectID: integer read PID;
    property DomainRegistrarID: integer read DRID;
    property DomainName: string read dName;
    property DomainExtension: string read dExten;
    property RenewalDate: TDate read rDate;
    property RenewalCost: real read rCost;
  end;

  THosting = class
  private
    HID, PID, DID, HRID: integer;
    // id's for hosting, project, domain and hosting registrar
    rDate: TDate;
    rCost: real;
    Domain: TDomain;
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
  end;

  TProject = class
  private
    PID, CID: integer;
    pName: string;
  public
    property ClientID: integer read CID;
    property ProjectID: integer read PID;
    property Name: string read pName;
  end;

end.
